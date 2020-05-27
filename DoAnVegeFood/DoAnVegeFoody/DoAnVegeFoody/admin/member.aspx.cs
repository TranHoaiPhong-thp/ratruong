using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAnVegeFoody.App_Code;


namespace DoAnVegeFoody.admin
{
    public partial class member : System.Web.UI.Page
    {
        private static SqlConnection conn = new SqlConnection(@"Data Source=PHONG-PC;Initial Catalog=vegefoods;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            string sQuery = "Select * From member";
            SqlDataAdapter da = new SqlDataAdapter(sQuery, conn);
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
        protected void btnTim_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            string squery = "select * from member where username like '%" + txtTim.Text.Trim() + "%'";
            SqlDataAdapter sqlDA = new SqlDataAdapter(squery, conn);
            DataTable dt = new DataTable();

            sqlDA.Fill(dt);
            conn.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }
        protected void register_Click(object sender, EventArgs e)
        {
            string sUsername = exampleUserName.Text;
            string sName = exampleName.Text;
            string sPass = exampleInputPassword.Text;
            string sRepeatPage = exampleRepeatPassword.Text;
            string sPhone = examplePhone.Text;
            string sEmail = exampleInputEmail.Text;
            int iRole = Convert.ToInt32(exampleRole.SelectedValue);
            int iStatus = Convert.ToInt32(exampleStatus.SelectedValue);

           

            Account acc = new Account(sUsername, sName, sPass, sPhone, iRole, iStatus, sEmail);

            if (acc.AddMember() == true)
            {
                txtResult.InnerHtml = "THÊM THÀNH CÔNG TÀI KHOẢN " + sUsername;
                Clear();
            }
            else
            {
                txtResult.InnerHtml = "USERNAME ĐÃ TỒN TẠI";
            }
            if(register.Text == "Update")
            {
                if(acc.UpdateMember() == true)
                {
                    txtResult.InnerHtml = "Update thành công " + sUsername;
                    Clear();
                }
                else
                {
                    txtResult.InnerHtml = "Update Thất Bại";
                }
            }
            
            FillGridView();
        }
        void FillGridView()
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("VIEWALL",conn);
            sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            
            sqlDA.Fill(dt);
            conn.Close();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();


        }
        protected void Huy_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            exampleUserName.Text = "";
            exampleName.Text = "";
            exampleInputEmail.Text = "";
            examplePhone.Text = "";
            exampleRepeatPassword.Text = "";
            exampleInputPassword.Text = "";
            exampleRole.SelectedValue = "";
            exampleStatus.SelectedValue = "";
            register.Text = "Đăng ký";
            Huy.Enabled = false;
        }

        protected void Linkedit_Click(object sender, EventArgs e)
        {
            string chfID = Convert.ToString((sender as LinkButton).CommandArgument);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlDataAdapter sqlDA = new SqlDataAdapter("ViewbyUsername", conn);
            sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDA.SelectCommand.Parameters.AddWithValue("@username", chfID);
            DataTable dt = new DataTable();
            sqlDA.Fill(dt); 
            conn.Close();
            hfID.Value = chfID.ToString();
            exampleUserName.Text = dt.Rows[0]["username"].ToString();
            exampleInputPassword.Text = dt.Rows[0]["pass"].ToString();
            
            exampleName.Text = dt.Rows[0]["name"].ToString();
            examplePhone.Text = dt.Rows[0]["phone"].ToString();
            exampleStatus.Text = dt.Rows[0]["status"].ToString();
            exampleRole.Text = dt.Rows[0]["role"].ToString();
            exampleInputEmail.Text = dt.Rows[0]["email"].ToString();
            register.Text = "Update";
            exampleUserName.Enabled = false;
            
            Huy.Enabled = true;
        }

        protected void LinkDelete_Click(object sender, EventArgs e)
        {
            string chfID = Convert.ToString((sender as LinkButton).CommandArgument);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            
            SqlCommand sqlDA = new SqlCommand("DELETEbyUsername", conn);
            sqlDA.CommandType = CommandType.StoredProcedure;
            sqlDA.Parameters.AddWithValue("@username", chfID);
            
            sqlDA.ExecuteNonQuery();
            conn.Close();
            Clear();
            FillGridView();
            txtResult.InnerHtml = "Xóa Thành Công!";

        }

        
    }
}