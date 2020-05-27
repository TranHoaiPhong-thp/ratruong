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
    public partial class _default : System.Web.UI.Page
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
        protected void tim_Click(object sender, EventArgs e)
        {
            TimKiem();
        }
        
    }
}