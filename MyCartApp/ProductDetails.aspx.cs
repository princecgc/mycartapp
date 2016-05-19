using MyCartApp.BAL;
using MyCartApp.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCartApp
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        static Product pri = null;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = int.Parse(Request.QueryString["s"].ToString());
                ProductBLL pro = new ProductBLL();
                pri = pro.GetProduct(id);
                Product_name_lbl.Text = pri.Name;
                Descrip_lbl.Text = pri.Description;
                Price_lbl.Text = pri.Cost.ToString();

                if (pri.ActualStock <= pri.MinStock)
                {
                    Add_to_Cart_btn.Visible = false;
                    Qty_textbox.Visible = false;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OrderBLL ord = new OrderBLL();
            Orders order = new Orders
            {
                ProductId = id,
                Quantity = int.Parse(Qty_textbox.Text),
                Name = Product_name_lbl.Text,
                Cost=double.Parse(Price_lbl.Text),
                Total_cost = double.Parse(Price_lbl.Text) * int.Parse(Qty_textbox.Text)
            };
            if (order.Quantity<(pri.ActualStock - pri.MinStock))
            { ord.AddOrder(order); 
                Response.Write("<script>alert('added to cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {
                Response.Write("<script>alert('No stock available')</script>");
            }
           
           
        }

    }
}
