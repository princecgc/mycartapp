using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyCartApp.DAL;
using System.Data;
using System.Data.SqlClient;
using MyCartApp.BLL;
using MyCartApplication.BAL;

namespace MyCartApp
{
    public partial class Categories : System.Web.UI.Page
    {
        CategoryBLL pb = new CategoryBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pb.GetAllCategories();
                grdalldata.DataSource = CategoryBLL.categories;
                grdalldata.DataBind();

            }
        }

        protected void grdalldata_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdalldata.EditIndex = -1;
            pb.GetAllCategories();
            grdalldata.DataSource = CategoryBLL.categories;
            grdalldata.DataBind();

        }

        protected void grdalldata_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id=int.Parse(grdalldata.DataKeys[e.RowIndex].Value.ToString());
          
           
            if(pb.DeleteCategory(id)>0)
            
            {
                pb.GetAllCategories();
                grdalldata.DataSource = CategoryBLL.categories;
                grdalldata.DataBind();
            }

        }

        protected void grdalldata_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = int.Parse(grdalldata.DataKeys[e.RowIndex].Value.ToString());
            TextBox name = (TextBox)grdalldata.Rows[e.RowIndex].FindControl("TextBox1");
            Category cat = new Category
            {
                Id = id,
                Name = name.Text
            };
          

            if (pb.UpdateCategory(cat) > 0)
            {
                pb.GetAllCategories();
                grdalldata.DataSource = CategoryBLL.categories;
                grdalldata.DataBind();
            }
           
        }

        protected void grdalldata_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdalldata.EditIndex = e.NewEditIndex;

            pb.GetAllCategories();
            grdalldata.DataSource = CategoryBLL.categories;
            grdalldata.DataBind();
        }

        
    }
}