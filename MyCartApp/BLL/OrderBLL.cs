using MyCartApp.BAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MyCartApp.BLL
{
    public class OrderBLL
    {
        public static List<Orders> orders = null;

        public void AddOrder(Orders order)
        {
            if (orders == null)
            { orders = new List<Orders>(); }
            orders.Add(order);
        }

        public void DeleteOrder(int id)
        {
            Orders ord = null;
            ord = orders.FirstOrDefault(p => p.ProductId == id);
            orders.Remove(ord);
        
        }

        public void UpdateOrder(int id,int qty)
        {
         orders.FirstOrDefault(p => p.ProductId == id).Quantity=qty;
           orders.FirstOrDefault(p => p.ProductId == id).Total_cost = qty * orders.FirstOrDefault(p => p.ProductId == id).Cost;
            
        }
        public double TotalCost() {
          return (double)orders.Sum(p => p.Total_cost);
        }
    }
}