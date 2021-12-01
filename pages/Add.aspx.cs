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
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            addRes.Visible = false;
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
        //Adds Item on click
        protected void addItm_Click(object sender, EventArgs e)
        {
            try
            {
                //file uploading code
                string strFolder = Server.MapPath("~/Content/imgs/");            
                string strFileName = FileU.PostedFile.FileName;
                string strFilepath;

                if(strFileName!= "")
                {
                    if (!Directory.Exists(strFolder))
                    {
                        Directory.CreateDirectory(strFolder);
                    }
                    strFilepath = strFolder + strFileName;                    
                    if (File.Exists(strFilepath))
                    {
                        addRes.Text = "File Already On Server...";
                        addRes.Visible = true;
                    }
                    else
                    {
                        FileU.PostedFile.SaveAs(strFilepath);
                        string strDbPath = "/Content/imgs/" + strFileName;
                        //saving in DB
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegiConnectionString"].ConnectionString);
                        conn.Open();
                        string insertQ = "INSERT INTO contTB(Pname,Pdisc,Ppic,Pprice) VALUES (@pname,@pdisc,@ppic,@pprice)";
                        SqlCommand cmd = new SqlCommand(insertQ, conn);
                        cmd.Parameters.AddWithValue("@pname", Pname.Text);
                        cmd.Parameters.AddWithValue("@pdisc", Pdisc.Text);
                        cmd.Parameters.AddWithValue("@ppic", strDbPath);
                        cmd.Parameters.AddWithValue("@pprice", Pprice.Text);
                        cmd.ExecuteNonQuery();

                        addRes.Visible = true;
                        conn.Close();
                    }
                }
                else
                {
                    addRes.Text = "Please Select A Iamge...";
                    addRes.Visible = true;
                }                
                //file uplaod complete
                

            }
            catch(Exception ex)
            {
                addRes.Visible = true;
                addRes.Text = "Error! : " + ex;
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
    }
}