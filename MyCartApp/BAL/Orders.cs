using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyCartApp.BAL
{
    public class Orders
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public string Name { get; set; }
        public double Cost { get; set; }
        public double Total_cost { get; set; }

    }
}