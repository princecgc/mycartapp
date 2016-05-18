using MyCartApplication.BAL;
using MyCartApp.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace MyCartApp.BLL
{
    public class CategoryBLL
    {
        public static List<Category> categories = null;
        DbCore core = new DbCore();
        public void GetAllCategories()
        {
            
            DataTable dt = core.GetTable("spGetAllCategory");
            if (dt != null)
            {
                categories = new List<Category>();
                foreach (DataRow dr in dt.Rows)
                {
                    categories.Add(new Category
                    {
                        Id = int.Parse(dr["id"].ToString()),
                        Name = dr["category_name"].ToString()
                    });
                }
            }
        }
        public Category GetCategory(int id)
        {
            Category disc = null;
            disc = categories.FirstOrDefault(p => p.Id == id);
            return disc;
        }

        public int DeleteCategory(int id)
        {
             SqlParameter[] par ={
                                   new SqlParameter("id",id)
                               };
             return core.CoreOps("spDeleteCategory", par);
            
        }

        internal int UpdateCategory(Category cat)
        {
            SqlParameter[] par ={
                                   new SqlParameter("id",cat.Id),
                                   new SqlParameter("cat_name",cat.Name)
                               };
            return core.CoreOps("spUpdateCategory", par);
        }
    }
}