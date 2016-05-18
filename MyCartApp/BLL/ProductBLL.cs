using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyCartApp.DAL;
using MyCartApp.BAL;
using System.Data;
using System.Data.SqlClient;

namespace MyCartApp.BLL
{
    public class ProductBLL
    {
        public static List<Product> products = null;
        DbCore core = new DbCore();
        public void GetAllProducts()
        {
            
            DataTable dt = core.GetTable("spGetAllProducts");
            if (dt != null)
            {
                products = new List<Product>();
                foreach (DataRow dr in dt.Rows)
                {
                    products.Add(new Product
                    {
                        ProductId = int.Parse(dr["prod_id"].ToString()),
                        CategoryId = int.Parse(dr["cat_id"].ToString()),
                        Description = dr["prod_desc"].ToString(),
                        Name = dr["prod_name"].ToString(),
                        Cost=double.Parse(dr["prod_cost"].ToString()),
                        MinStock = int.Parse(dr["min_stock"].ToString()),
                        ActualStock = int.Parse(dr["actual_stock"].ToString()),
                    });
                }
            }
        }
        public Product GetProduct(int id)
        {
            Product prod = null;
            prod = products.FirstOrDefault(p => p.ProductId == id);
            return prod;
        }
        public int InsertProduct(Product po)
        {
            SqlParameter[] par ={
                                   new SqlParameter("id",po.Name),
                                   new SqlParameter("cat_name",po.Name)
                               };
            return core.CoreOps("spInsertProduct", par);
        }

        public int UpdateProduct(Product po)
        {
            SqlParameter[] par ={
                                   new SqlParameter("id",cat.Id),
                                   new SqlParameter("cat_name",cat.Name)
                               };
            return core.CoreOps("spUpdateProduct", par);
        }
    }
}