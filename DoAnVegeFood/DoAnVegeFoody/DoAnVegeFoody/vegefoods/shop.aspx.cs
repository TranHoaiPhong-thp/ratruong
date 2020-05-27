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
    public partial class shop : System.Web.UI.Page
    {
        private static SqlConnection con = new SqlConnection(@"Data Source=PHONG-PC;Initial Catalog=vegefoods;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string sQuery = "Select * From food";
            SqlDataAdapter da = new SqlDataAdapter(sQuery, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int so_item_1trang = 8;
            int sotrang = dt.Rows.Count / so_item_1trang + (dt.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            int page = Request["page"] == null ? 1 : Convert.ToInt32(Request["page"]);
            int from = (page - 1) * 8;
            int to = page * 8 - 1;
            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                if (i < from || i > to)
                {
                    dt.Rows.RemoveAt(i);
                }
            }
            if (IsPostBack == false)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }

            DataTable dtpage = new DataTable();
            dtpage.Columns.Add("index");
            dtpage.Columns.Add("active");
            for (int i = 1; i <= sotrang; i++)
            {
                DataRow dr = dtpage.NewRow();
                dr["index"] = i;
                if ((Request["page"] == null && i == 1) || (Request["page"] != null && Convert.ToInt32(Request["page"]) == i))
                {
                    dr["active"] = 1;
                }
                else
                    dr["active"] = 0;
                dtpage.Rows.Add(dr);
            }
            Repeater2.DataSource = dtpage;
            Repeater2.DataBind();
        }
        void ShowRepeater()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            
            string squery = "select * from food where status != 0";
            SqlDataAdapter da = new SqlDataAdapter(squery, con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add_to_cart")
            {
                HiddenField hf_img = (HiddenField)e.Item.FindControl("hf_img");
                HiddenField hf_price = (HiddenField)e.Item.FindControl("hf_price");
                HiddenField hf_price_promo = (HiddenField)e.Item.FindControl("hf_price_promo");
                HiddenField hf_id = (HiddenField)e.Item.FindControl("hf_id");
                HiddenField hf_name = (HiddenField)e.Item.FindControl("hf_name");
                DataTable dt = new DataTable();
                if (Session["cart"] == null)
                {
                    dt.Columns.Add("id");
                    dt.Columns.Add("name");
                    dt.Columns.Add("img");
                    dt.Columns.Add("price");
                    dt.Columns.Add("price_promo");
                    dt.Columns.Add("quan");
                }
                else
                {
                    dt = (DataTable)Session["cart"];
                }
                int irow = checkExited(dt, hf_id.Value);
                if (irow != -1)
                {
                    dt.Rows[irow]["quan"] = Convert.ToInt32(dt.Rows[irow]["quan"]) + 1;
                }
                else
                {
                    DataRow dr = dt.NewRow();
                    dr["id"] = hf_id.Value;
                    dr["name"] = hf_name.Value;
                    dr["img"] = hf_img.Value;
                    dr["price"] = hf_price.Value;
                    dr["price_promo"] = hf_price_promo.Value;
                    dr["quan"] = 1;
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

        protected void showVegetables_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string squery = "select * from food where type = 6";
            SqlDataAdapter da = new SqlDataAdapter(squery, con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
        protected void showFruits_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string squery = "select * from food where type = 1";
            SqlDataAdapter da = new SqlDataAdapter(squery, con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            
        }
        protected void showDried_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string squery = "select * from food where type = 2";
            SqlDataAdapter da = new SqlDataAdapter(squery, con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
        protected void showJuice_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string squery = "select * from food where type = 5";
            SqlDataAdapter da = new SqlDataAdapter(squery, con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            
        }
        protected void showAll_Click(object sender, EventArgs e)
        {
            ShowRepeater();

        }
    }
}