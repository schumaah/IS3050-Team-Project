using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team_Project.Pages
{
    public partial class Customers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ValidateUniqueSSN(object source, ServerValidateEventArgs args)
        {
            string inputSSN = args.Value == null ? string.Empty : args.Value.Trim();

            if (string.IsNullOrWhiteSpace(inputSSN))
            {
                args.IsValid = false;
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["Customers"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT COUNT(*) FROM [customer] WHERE [CUST_ssn] = @CUST_ssn";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CUST_ssn", inputSSN);

                    conn.Open();

                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    args.IsValid = (count == 0);
                }
            }
        }
    }
}