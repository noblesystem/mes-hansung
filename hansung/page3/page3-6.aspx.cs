using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3
{
    public partial class page3_6 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public List<string> tdright = new List<string>();
        public double cashT_T, billL_C, feesmoney, sumofpayments;
        public string[] clname = new string[] { "수금일자", "영업 담당", "고객사명", "현금 수금액", "어음 수금액", "수수료/기타 할인", "수금 합계", "입금계좌/현금", "수금 적요" };
        public string[] clumn = new string[] {"paymentdate","salesrepresentative","customercompany","cashT_T","billL_C","feesmoney", "sumofpayments", "paymentaccount","remark"};
        public string login;
        protected void Page_Load(object sender, EventArgs e)
        {
            tdright = cm.tdright.ToList();
            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            cm.clgetdata = clumn;
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            Warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            mainData = cm.objOrderpayment("", employer, customer, litem);
            cashT_T = mainData.Sum(s => cm.parse(s["cashT_T"].ToString()));
            billL_C = mainData.Sum(s => cm.parse(s["billL_C"].ToString()));
            feesmoney = mainData.Sum(s => cm.parse(s["feesmoney"].ToString()));
            sumofpayments = mainData.Sum(s => cm.parse(s["sumofpayments"].ToString()));
        }
    }
}