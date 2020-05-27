using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DoAnVegeFoody.App_Code;

namespace DoAnVegeFoody.admin
{
    public partial class food1 : System.Web.UI.Page
    {
        private static SqlConnection con = new SqlConnection(@"Data Source=PHONG-PC;Initial Catalog=vegefoods;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            string sQuery = "Select * From food";
            SqlDataAdapter da = new SqlDataAdapter(sQuery, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int so_item_1trang = 5;
            int sotrang = dt.Rows.Count / so_item_1trang + (dt.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            int page = Request["page"] == null ? 1 : Convert.ToInt32(Request["page"]);
            int from = (page - 1) * 5;
            int to = page * 5 - 1;
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

        

        protected void Addfood_Click(object sender, EventArgs e)
        {
            string sfoodname = exeFood_Name.Text;
            string sDec = exeDecription.Text;
            int ipri = Convert.ToInt32(exePrice.Text);
            int ipri_promo = Convert.ToInt32(exePrice_promo.Text);
            string sthum = exethumb.Text;
            string simg = exefood_img.Text;
            int ipersen_promo = Convert.ToInt32(exepercent_promo.Text);
            string sunit = exefood_unit.Text;
            int irating = Convert.ToInt32(exampleRating.SelectedValue);
            int isold = Convert.ToInt32(exampleSold.SelectedValue);
            int istatus = Convert.ToInt32(exempleStatus.SelectedValue);
            int itype = Convert.ToInt32(exampleType.SelectedValue);
            int spoin = Convert.ToInt32(exePoint.Text);
            string susername = exeUsername.Text;
            DateTime dModified = Convert.ToDateTime(exeModified.Text);

            Food acfood = new Food(sfoodname, sDec, ipri, ipri_promo, sthum, simg, sunit, ipersen_promo, irating, isold, spoin, itype, istatus, susername, dModified);

            if (Addfood.Text == "Update Food")
            {
                if (acfood.UpdateFood() == true)
                {
                    txtResult.InnerHtml = "Update thành Công " + sfoodname;
                }
                else
                    txtResult.InnerHtml = "Update Thất Bại ";
            }
            else
            {
                if (acfood.AddFoods() == true)
                {
                    txtResult.InnerHtml = "Add thành Công " + sfoodname;
                    Clear();
                }
                else
                    txtResult.InnerHtml = "Add Thất Bại ";
            }
            ShowRepeater();
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
        void TimKiem()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            string squery = "select * from food where name like '%" + txtTim.Text.Trim() + "%'";
            SqlDataAdapter sqlDA = new SqlDataAdapter(squery, con);
            DataTable dt = new DataTable();

            sqlDA.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        void Clear()
        {
            exeFood_Name.Text = "";
            exeDecription.Text = "";
            exefood_img.Text = "";
            exefood_unit.Text = "";
            exeUsername.Text = "";
            exethumb.Text = "";
            exePrice.Text = "";
            exePrice_promo.Text = "";
            exepercent_promo.Text = "";
            exePoint.Text = "";
            exeModified.Text = "";
            Addfood.Text = "Add Food ";
        }
        protected void tim_Click(object sender, EventArgs e)
        {
            TimKiem();
        }

        protected void Linkedit_Click(object sender, EventArgs e)
        {
            string chfID = Convert.ToString((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("food_edit", con);
            sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDA.SelectCommand.Parameters.AddWithValue("@name", chfID);
            DataTable dt = new DataTable();
            sqlDA.Fill(dt);
            con.Close();
            exeDecription.Text = dt.Rows[0]["description"].ToString();
            exeFood_Name.Text = dt.Rows[0]["name"].ToString();
            exefood_unit.Text = dt.Rows[0]["unit"].ToString();
            exePrice.Text = dt.Rows[0]["price"].ToString();
            exePrice_promo.Text = dt.Rows[0]["price_promo"].ToString();
            exethumb.Text = dt.Rows[0]["thumb"].ToString();
            exefood_img.Text = dt.Rows[0]["img"].ToString();
            exepercent_promo.Text = dt.Rows[0]["percent_promo"].ToString();
            exampleRating.SelectedValue = dt.Rows[0]["rating"].ToString();
            exampleSold.SelectedValue = dt.Rows[0]["sold"].ToString();
            exePoint.Text = dt.Rows[0]["point"].ToString();
            exampleType.SelectedValue = dt.Rows[0]["type"].ToString();
            exempleStatus.SelectedValue = dt.Rows[0]["status"].ToString();
            exeUsername.Text = dt.Rows[0]["username"].ToString();
            exeModified.Text = dt.Rows[0]["modified"].ToString();
            Addfood.Text = "Update Food";
            exeFood_Name.Enabled = false;

        }

        protected void LinkDelete_Click(object sender, EventArgs e)
        {
            string chfID = Convert.ToString((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();
            //string squery = "update food set status = 0 where name 
            SqlCommand sqlDA = new SqlCommand("food_delete", con);
            sqlDA.CommandType = CommandType.StoredProcedure;
            sqlDA.Parameters.AddWithValue("@name", chfID);
            sqlDA.ExecuteNonQuery();
            con.Close();
            Clear();
            ShowRepeater();
            txtResult.InnerHtml = "Xóa Thành Công!";
        }
    }
}