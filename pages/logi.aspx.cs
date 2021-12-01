using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace GrocerySite
{
    public partial class logi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_login";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserId", userid.Text.ToString());
                cmd.Parameters.AddWithValue("@Password", password.Text.ToString());
                cmd.Connection = conn;
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    Session["UserId"] = userid.Text.ToString();
                    Session["Uname"] = reader.GetString(1);
                    logtxt.Text = "Login Success";

                    reader.Close();
                    conn.Close();

                    Response.Redirect("Homi.aspx", true);
                }
                else
                {
                    logtxt.Text = "Invalid UserId and Password!";
                }
                reader.Close();
                conn.Close();
            }

            catch(Exception ex)
            {

            }
        }
    }
}