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
    public partial class regi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from regiTB where uname=' " + uname.Text + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (temp == 1)
                {
                    Response.Write("Already Exist");
                }
                conn.Close();
            }
        }
        protected void register_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                conn.Open();
                string insertQ = "insert into regiTB(uname,fname,lname,pnum,email,gender,bday,pswd)values (@uname,@fname,@lname,@pnum,@email,@gender,@bday,@pswd)";
                SqlCommand cmd = new SqlCommand(insertQ, conn);
                cmd.Parameters.AddWithValue("@uname", uname.Text);
                cmd.Parameters.AddWithValue("@fname", fname.Text);
                cmd.Parameters.AddWithValue("@lname", lname.Text);
                cmd.Parameters.AddWithValue("@pnum", pnum.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                cmd.Parameters.AddWithValue("@bday", bday.Text);
                cmd.Parameters.AddWithValue("@pswd", pswd.Text);
                cmd.ExecuteNonQuery();

                Response.Write("Registration Success!!");

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error");
            }
        }
    }
}