using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GrocerySite.pages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updRes.Visible = false;
            //GridView Code DO NOT TOUCH!!!!
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                string stringQ = " SELECT * FROM contTB";
                SqlCommand cmd = new SqlCommand(stringQ, conn);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                CardView.DataSource = dt;
                CardView.DataBind();

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write(" Error : " + ex);
            }
        }
        //Shows Images in Gridview DO NOT TOUCH
        protected void CardView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DataRowView dr = (DataRowView)e.Row.DataItem;
                    string imgUrl = Convert.ToString(dr["Ppic"]);
                    (e.Row.FindControl("img") as Image).ImageUrl = imgUrl;
                }
            }
            catch (Exception ex)
            {
                Response.Write("error " + ex);
            }
        }

        protected void updItm_Click(object sender, EventArgs e)
        {
            try
            {
                if (Pid.Text != "")
                {

                    //file uploading code
                    string strFolder = Server.MapPath("~/Content/imgs/");
                    string strFileName = FileU.PostedFile.FileName;
                    string strFilepath;

                    if (strFileName != "")
                    {
                        if (!Directory.Exists(strFolder))
                        {
                            Directory.CreateDirectory(strFolder);
                        }
                        strFilepath = strFolder + strFileName;
                        updRes.Text = "Please Select A Image if You Want to Update It.";
                        updRes.Visible = true;
                        if (File.Exists(strFilepath))
                        {
                            //code with updating same file
                            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                            conn.Open();
                            string updateQ = "UPDATE contTB SET Pname = @pname, Pdisc = @pdisc, Pprice = @pprice WHERE Pid = @pid ";
                            SqlCommand cmd = new SqlCommand(updateQ, conn);
                            cmd.Parameters.AddWithValue("@pname", Pname.Text);
                            cmd.Parameters.AddWithValue("@pdisc", Pdisc.Text);                            
                            cmd.Parameters.AddWithValue("@pprice", Pprice.Text);
                            cmd.Parameters.AddWithValue("@pid", Convert.ToDouble(Pid.Text));
                            cmd.ExecuteNonQuery();

                            updRes.Text = "Update Successful...";
                            updRes.CssClass = "text-success";
                            updRes.Visible = true;
                            conn.Close();
                        }
                        else
                        {
                            //code for new file
                            FileU.PostedFile.SaveAs(strFilepath);
                            string strDbPath = "/Content/imgs/" + strFileName;
                            //saving in DB
                            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                            conn.Open();
                            string updateQ = "UPDATE contTB SET Pname = @pname, Pdisc = @pdisc, Ppic = @ppic, Pprice = @pprice WHERE Pid = @pid ";
                            SqlCommand cmd = new SqlCommand(updateQ, conn);
                            cmd.Parameters.AddWithValue("@pname", Pname.Text);
                            cmd.Parameters.AddWithValue("@pdisc", Pdisc.Text);
                            cmd.Parameters.AddWithValue("@ppic", strDbPath);
                            cmd.Parameters.AddWithValue("@pprice", Pprice.Text);
                            cmd.Parameters.AddWithValue("@pid", Convert.ToDouble(Pid.Text));
                            cmd.ExecuteNonQuery();

                            updRes.Text = "Update Successful...";
                            updRes.CssClass = "text-success";
                            updRes.Visible = true;
                            conn.Close();
                        }
                    }
                    else
                    {
                        //code without updating file
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                        conn.Open();
                        string updateQ = "UPDATE contTB SET Pname = @pname, Pdisc = @pdisc, Pprice = @pprice WHERE Pid = @pid ";
                        SqlCommand cmd = new SqlCommand(updateQ, conn);
                        cmd.Parameters.AddWithValue("@pname", Pname.Text);
                        cmd.Parameters.AddWithValue("@pdisc", Pdisc.Text);
                        cmd.Parameters.AddWithValue("@pprice", Pprice.Text);
                        cmd.Parameters.AddWithValue("@pid", Convert.ToDouble(Pid.Text));
                        cmd.ExecuteNonQuery();

                        updRes.Text = "Update Successful...";
                        updRes.CssClass = "text-success";
                        updRes.Visible = true;
                        conn.Close();

                        
                    }
                    //file uplaod complete

                                                        
                }
                else
                {
                    updRes.Text = "Please Enter Pid...";
                    updRes.CssClass = "text-danger";
                    updRes.Visible = true;
                }
            }
            catch(Exception ex)
            {
                Response.Write("Error :" + ex);
            }
        }

        protected void Pid_TextChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
            conn.Open();
            string selectQ = "SELECT * FROM contTB WHERE Pid = @pid ";
            SqlCommand cmd = new SqlCommand(selectQ, conn);

            cmd.Parameters.AddWithValue("@pid", Pid.Text);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Pname.Text = reader.GetString(1);
                Pdisc.Text = reader.GetString(2);                
                Pprice.Text = reader.GetDouble(4).ToString();               
            }
            else
            {
                Pname.Text = "";
                Pdisc.Text = "";
                Pprice.Text = "";
                updRes.Visible = true;
                updRes.Text = "Pid Not Found";
                updRes.CssClass = "txt-danger";
                
            }
            conn.Close();
        }
    }
}