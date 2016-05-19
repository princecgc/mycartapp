using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MyCartApp.BLL
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductBLL pro = new ProductBLL();
                int s = int.Parse(Request.QueryString["id"].ToString());
                pro.GetProductByCategory(s);
                prod_list_rept.DataSource = ProductBLL.products;
                prod_list_rept.DataBind();
            }
        }

        protected void prod_list_rept_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}