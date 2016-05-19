using MyCartApp.BLL;
using MyCartApplication.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCartApp
{
    public partial class Cart : System.Web.UI.Page
    {
        OrderBLL o = new OrderBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridcart.DataSource = OrderBLL.orders;
                gridcart.DataBind();
                lbltotal.Text = o.TotalCost().ToString();
                lbldisc.Text ="0.00";
                lblsubt.Text = Convert.ToString(o.TotalCost() - Convert.ToDouble(lbldisc.Text));
            }
        }

        protected void gridcart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = int.Parse(gridcart.DataKeys[e.RowIndex].Value.ToString());
            TextBox quan=(TextBox)gridcart.Rows[e.RowIndex].FindControl("Textquan");
            int qty = Convert.ToInt32(quan.Text);
            o.UpdateOrder(id, qty);
            gridcart.DataSource = OrderBLL.orders;
            gridcart.DataBind();
            lbltotal.Text = o.TotalCost().ToString();
            lblsubt.Text = Convert.ToString(o.TotalCost() - Convert.ToDouble(lbldisc.Text));
        }

        protected void gridcart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gridcart.DataKeys[e.RowIndex].Value.ToString());
          
            o.DeleteOrder(id);
            gridcart.DataSource = OrderBLL.orders;
            gridcart.DataBind();
            lbltotal.Text = o.TotalCost().ToString();
            lblsubt.Text = Convert.ToString(o.TotalCost() - Convert.ToDouble(lbldisc.Text));
        }

        protected void btnapplyc_Click(object sender, EventArgs e)
        {
            DiscountBLL dl = new DiscountBLL();
            dl.GetAllDiscounts();
            string coupon=TextBox1.Text;
           Discount d=dl.GetDiscount(coupon);
           if (d.Count > 0)
           {
               float de = (float)d.Discounts / 100;
               lbldisc.Text=Decimal.Multiply((decimal)o.TotalCost(), (decimal)de).ToString();           
           }
            //coupons load
            // overloaded
            // null
            // couponcount 0
            // discount
            
            lbltotal.Text = o.TotalCost().ToString();
            //lblsubt.Text = Convert.ToString(o.TotalCost() - Convert.ToDouble(lbldisc.Text));
            lblsubt.Text = Convert.ToString(o.TotalCost()-(Convert.ToDouble(lbldisc.Text)));
        }

        
      

       

        
    }
}