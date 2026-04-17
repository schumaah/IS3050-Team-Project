using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team_Project.Pages
{
    public partial class Movies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ValidateUniqueID(object source, ServerValidateEventArgs args)
        {
            string inputID = args.Value;

            string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\movies.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string query = "SELECT COUNT(*) FROM Movie WHERE MOV_code = @ID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", inputID);

                    int count = (int)cmd.ExecuteScalar();

                    args.IsValid = (count == 0);
                }
            }
        }

        protected void SqlDataSource1_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            string movieCode = e.Command.Parameters["@MOV_code"].Value.ToString();
            string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\movies.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string query = "SELECT COUNT(*) FROM rental WHERE RENT_movie = @MOV_code";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MOV_code", movieCode);

                    int rentalCount = (int)cmd.ExecuteScalar();

                    if (rentalCount > 0)
                    {
                        e.Cancel = true;
                        lblDeleteMessage.Text = "Cannot delete this movie because it is associated with one or more rental records.";
                    }
                    else
                    {
                        lblDeleteMessage.Text = "";
                    }
                }
            }
        }
    }
}