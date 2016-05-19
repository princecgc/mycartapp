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
                                   new SqlParameter("cost",po.Cost),
                                   new SqlParameter("name",po.Name),
                                   new SqlParameter("desc",po.Description),
                                     new SqlParameter("cat_id",po.CategoryId),
                                    new SqlParameter("min_stock",po.MinStock),
                                     new SqlParameter("actual_stock",po.ActualStock)
                               };
            return core.CoreOps("spInsertProduct", par);
        }

        public int UpdateProduct(Product po)
        {
            SqlParameter[] par ={
                                    new SqlParameter("cost",po.Cost),
                                    new SqlParameter("prod_id",po.ProductId),
                                   new SqlParameter("prod_name",po.Name),
                                    new SqlParameter("prod_desc",po.Description),
                                   new SqlParameter("cat_id",po.CategoryId),
                                    new SqlParameter("min_stock",po.MinStock),
                                     new SqlParameter("actual_stock",po.ActualStock)
                               };
            return core.CoreOps("spUpdateProduct", par);
        }
        public void GetProductByCategory(int id)
        {
            SqlParameter[] par ={
                                    new SqlParameter("id",id),
                                };
            DataTable dt = core.GetTable("spGetProductsByCategory", par);
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
                        Cost = double.Parse(dr["prod_cost"].ToString()),
                        MinStock = int.Parse(dr["min_stock"].ToString()),
                        ActualStock = int.Parse(dr["actual_stock"].ToString()),
                    });
                }
            }
        }
    }
}