using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyCartApp.BAL
{
    public class Product
    {
        public int ProductId { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Cost { get; set; }
        public int MinStock { get; set; }
        public int ActualStock { get; set; }
    }
}