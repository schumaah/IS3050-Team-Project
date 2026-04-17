using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
    }
}