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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Login"] != null)
            {
                Response.Redirect("Default.aspx");
            }
            txtUS.Focus();
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if (KTDangNhap() > 0)
            {
                Session["Login"] = txtUS.Text;
                //lblModal.Text = "Đăng Nhập Thành Công";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblModal.Text = "Đăng Nhập Thất Bại";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RedictMe", "alert('Lỗi, Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng');", true);
            }
        }
        protected int KTDangNhap()
        {
            string sName = txtUS.Text.Trim();
            string sPass = StringProc.MD5Hash(txtPassword.Text.Trim());
            string sQuery = "SELECT COUNT(*) FROM member WHERE username = @us and pass = @pass";
            SqlParameter[] pars =
            {
                new SqlParameter("@us",SqlDbType.VarChar,50){Value = sName},
                new SqlParameter("@pass",SqlDbType.VarChar,255){Value = sPass},
            };
            return DataProvider.executeScalar(sQuery, pars);
        }
    }
}