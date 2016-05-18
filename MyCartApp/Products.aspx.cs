using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyCartApp.DAL;
using System.Data;
using MyCartApp.BLL;
using MyCartApp.BAL;

namespace MyCartApp
{
    public partial class Products : System.Web.UI.Page
    {
        ProductBLL pb = new ProductBLL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoryBLL catb = new CategoryBLL();
                catb.GetAllCategories();
                cat_list.DataSource = CategoryBLL.categories;
                cat_list.DataTextField = "Name";
                cat_list.DataValueField = "Id";
                cat_list.DataBind();

             pb.GetAllProducts();
                prod_gridview.DataSource = ProductBLL.products;
                prod_gridview.DataBind();

            }
        }

        

       

        protected void prod_gridview_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int id = int.Parse(prod_gridview.SelectedDataKey.Value.ToString());
            Product pro = pb.GetProduct(id);
            name_text.Text = pro.Name;
            desc_text.Text = pro.Description;
            cost_text.Text = pro.Cost.ToString();
            minstock_text.Text = pro.MinStock.ToString();
            actualstock_text.Text = pro.ActualStock.ToString();
            final_btn.Text = "Update";
        }

        protected void final_btn_Click(object sender, EventArgs e)
        {
            Product po = new Product();
            po.Name = name_text.Text;
            if (final_btn.Text == "Update")
            {
                pb.UpdateProduct(po);
            }
            else
            {
                pb.InsertProduct(po);
            }
            pb.GetAllProducts();
            prod_gridview.DataSource = ProductBLL.products;
            prod_gridview.DataBind();
        }
    }

        

    }
