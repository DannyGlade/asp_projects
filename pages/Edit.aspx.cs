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
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}