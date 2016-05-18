using MyCartApp.BAL;
using MyCartApp.DAL;
using MyCartApplication.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MyCartApp.BLL
{
    public class DiscountBLL
    {
        public static List<Discount> discounts = null;
        public void GetAllDiscounts()
        {
            DbCore core = new DbCore();
            DataTable dt = core.GetTable("spGetAllDiscounts");
            if (dt != null)
            {
                discounts = new List<Discount>();
                foreach (DataRow dr in dt.Rows)
                {
                    discounts.Add(new Discount
                    {
                        Id = int.Parse(dr["coupon_id"].ToString()),
                        Count = int.Parse(dr["coupon_quantity"].ToString()),
                        Discounts = int.Parse(dr["coupon_discount"].ToString()),
                        Coupon = dr["coupon_code"].ToString(),
                        Validity = DateTime.Parse(dr["coupon_validity"].ToString()),
                        CouponUsed = int.Parse(dr["coupon_used"].ToString())
                    });
                }
            }
        }
        public Discount GetDiscount(int id)
        {
            Discount disc = null;
            disc = discounts.FirstOrDefault(p => p.Id == id);
            return disc;
        }
    }
}
