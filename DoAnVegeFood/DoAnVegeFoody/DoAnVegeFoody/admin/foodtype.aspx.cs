using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAnVegeFoody.App_Code;
using System.Data;
using System.Data.SqlClient;

namespace DoAnVegeFoody.admin 
{
    public partial class food : System.Web.UI.Page
    {
        
        private static SqlConnection con = new SqlConnection(@"Data Source=PHONG-PC;Initial Catalog=vegefoods;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Huy.Enabled = false;
                ShowRepeater();
            }
        }

        protected void Add_foodtype(object sender, EventArgs e)
        {

            //int stypeid = Convert.ToInt32(Type_id);
            String stypename = Type_name.Text;
            int stypepos = Convert.ToInt32(Type_Pos.Text);
            String stypeimg = Type_img.Text;
            DateTime smodified = Convert.ToDateTime(Modified.Text);
            int iStatus = Convert.ToInt32(exampleStatus.SelectedValue);
            String sUserName = UserName.Text;

            FoodTypes foodtypeadd = new FoodTypes(stypename, stypepos, stypeimg, iStatus, sUserName, smodified);

            

            if(Addfoodtype.Text == "Update FoodType")
            {
                if(foodtypeadd.UpdateFoodType() == true)
                {
                    txtResult.InnerHtml = "UPDATE THÀNH CÔNG" + stypename;
                }
                else
                {
                    txtResult.InnerHtml = "UPDATE THẤT BẠI";
                }
            }
            else
            {
                if (foodtypeadd.AddFoodType() == true)
                {
                    txtResult.InnerHtml = "THÊM THÀNH CÔNG" + stypename;
                }
                else
                {
                    txtResult.InnerHtml = "THÊM THẤT BẠI";
                }
            }
            
            
           
            ShowRepeater();
        }

        protected void Linkedit_Click(object sender, EventArgs e)
        {
            string chfID = Convert.ToString((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("tbfoodtype_edit", con);
            sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDA.SelectCommand.Parameters.AddWithValue("@Type_name", chfID);
            DataTable dt = new DataTable();
            sqlDA.Fill(dt);
            con.Close();
            hfID.Value = chfID.ToString();
            Type_name.Text = dt.Rows[0]["Type_name"].ToString();
            Type_Pos.Text = dt.Rows[0]["Type_pos"].ToString();
            Type_img.Text = dt.Rows[0]["Type_img"].ToString();
            UserName.Text = dt.Rows[0]["Username"].ToString();
            Modified.Text = dt.Rows[0]["Modified"].ToString();
            exampleStatus.Text = dt.Rows[0]["Status"].ToString();
            Addfoodtype.Text = "Update FoodType";
            Type_name.Enabled = false;
            Huy.Enabled = true;
            Modified.Enabled = false;
        }

        protected void LinkDelete_Click(object sender, EventArgs e)
        {
            int chfID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlDA = new SqlCommand("tbfoodtype_Delete", con);
            sqlDA.CommandType = CommandType.StoredProcedure;
            sqlDA.Parameters.AddWithValue("@type_id", chfID);
            sqlDA.ExecuteNonQuery();
            con.Close();
            Clear();
            ShowRepeater();
            txtResult.InnerHtml = "Xóa Thành Công!";
        }
        
        protected void btnTim_Click(object sender, EventArgs e)
        {
            TimKiem();
        }

        void Clear()
        {
            Type_img.Text = "";
            Type_name.Text = "";
            Type_Pos.Text = "";
            Modified.Text = "";
            UserName.Text = "";
            Addfoodtype.Text = "Thêm Food Type";

        }

        void ShowRepeater()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter da = new SqlDataAdapter("tbfoodtype_ViewAll", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
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
            string squery = "select * from food_type1 where Type_name like '%" + txtTim.Text.Trim() + "%'";
            SqlDataAdapter sqlDA = new SqlDataAdapter(squery, con);
            DataTable dt = new DataTable();

            sqlDA.Fill(dt);
            con.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void Huy_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}