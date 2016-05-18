using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyCartApplication.BAL
{
    public class Discount
    {
        public int Id { get; set; }
        public string Coupon { get; set; }
        public int Count { get; set; }
        public int Discounts { get; set; }
        public int CouponUsed { get; set; }
        public DateTime Validity { get; set; }
    }
}