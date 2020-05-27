using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DoAnVegeFoody.App_Code;


namespace DoAnVegeFoody.vegefoods
{
   
    public partial class Product_single : System.Web.UI.Page
    {
        private static SqlConnection con = new SqlConnection(@"Data Source=PHONG-PC;Initial Catalog=vegefoods;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowRepeater();
            }
            
        }
        void ShowRepeater()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string squery = "select * from food where status != 0 ";
           
            
            SqlDataAdapter da = new SqlDataAdapter(squery, con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        //void showRepeater2()
        //{
        //    if (con.State == ConnectionState.Closed)
        //        con.Open();
        //    string squery = "select * from food where id = ";
        //    SqlDataAdapter da = new SqlDataAdapter(squery, con);

        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    con.Close();
        //    Repeater2.DataSource = dt;
        //    Repeater2.DataBind();
        //}

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
            if (e.CommandName == "Add_to_cart")
            {
                HiddenField hf_img = (HiddenField)e.Item.FindControl("hf_img");
                HiddenField hf_price = (HiddenField)e.Item.FindControl("hf_price");
                HiddenField hf_price_promo = (HiddenField)e.Item.FindControl("hf_price_promo");
                HiddenField hf_id = (HiddenField)e.Item.FindControl("hf_id");
                HiddenField hf_name = (HiddenField)e.Item.FindControl("hf_name");
                HiddenField hf_quan = (HiddenField)e.Item.FindControl("hf_quan");
                DataTable dt = new DataTable();
                if (Session["cart"] == null)
                {
                    dt.Columns.Add("id");
                    dt.Columns.Add("name");
                    dt.Columns.Add("img");
                    dt.Columns.Add("price");
                    dt.Columns.Add("price_promo");
                    dt.Columns.Add("quan");
                    dt.Columns.Add("total");
                }
                else
                {
                    dt = (DataTable)Session["cart"];
                }
                int irow = checkExited(dt, hf_id.Value);
                if (irow != -1)
                {
                    dt.Rows[irow]["quan"] = Convert.ToInt32(dt.Rows[irow]["quan"]) + 1;
                    dt.Rows[irow]["total"] = Convert.ToInt32(dt.Rows[irow]["quan"]) * Convert.ToInt32(dt.Rows[irow]["price_promo"]);
                }
                else
                {
                    DataRow dr = dt.NewRow();
                    dr["id"] = hf_id.Value;
                    dr["name"] = hf_name.Value;
                    dr["img"] = hf_img.Value;
                    dr["price"] = hf_price.Value;
                    dr["price_promo"] = hf_price_promo.Value;
                    dr["quan"] = hf_quan.Value;
                    dt.Rows.Add(dr);

                }
                Session["cart"] = dt;
            }
        }
        private int checkExited(DataTable dt, string id)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["id"].ToString() == id)
                    return i;
            }
            return -1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }
    }
}