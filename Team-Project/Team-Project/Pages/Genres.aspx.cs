using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team_Project.Pages
{
    public partial class Genres : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ValidateUniqueCode(object source, ServerValidateEventArgs args)
        {
            string inputCode = args.Value == null ? string.Empty : args.Value.Trim();

            if (string.IsNullOrWhiteSpace(inputCode))
            {
                args.IsValid = false;
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["Customers"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT COUNT(*) FROM [genre] WHERE [GEN_code] = @GEN_code";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@GEN_code", inputCode);

                    conn.Open();

                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    args.IsValid = (count == 0);
                }
            }
        }

        protected void SqlDataSource1_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            lblDeleteMessage.Text = "";

            string genreCode = e.Command.Parameters["@GEN_code"].Value.ToString();
            string connString = ConfigurationManager.ConnectionStrings["Customers"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT COUNT(*) FROM [movie] WHERE [MOV_genre] = @GEN_code";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@GEN_code", genreCode);

                    conn.Open();

                    int movieCount = Convert.ToInt32(cmd.ExecuteScalar());

                    if (movieCount > 0)
                    {
                        e.Cancel = true;
                        lblDeleteMessage.Text = "Cannot delete this genre because it is associated with one or more movies.";
                    }
                }
            }
        }
    }
}