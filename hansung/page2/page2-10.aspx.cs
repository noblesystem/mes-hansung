using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_10 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public double qltcase, totalamount, cashT_T, billL_C, sumofpayments, total;

        public string[] clname = new string[] { "전표 번호", "지급 일자", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "구매 합계 금액", "어음 지급액","수수료/기타", "지급금 합계", "지급 잔액", "지급 적요" };
        public string[] clumn = new string[] {"ordernumber","paymentdate","nameitem","standard","quantityincase","qltcase","price","pricesupply","vat","totalamount","cashT_T","billL_C","feesmoney","sumofpayments","total","remark"};
        public string login;
        protected void Page_Load(object sender, EventArgs e)
        {

            
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            cm.clgetdata = clumn;
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            Warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            string ctmsearch = Request.Form["ctmsearch"].ToString().Trim();
            string id = cm.getdatainlistname(customer,"name", ctmsearch, "id");
            try
            {
                mainData = cm.objpayment("where billbuy.tradingmission='" + id + "'", employer, customer, litem);
                qltcase = mainData.Sum(s => cm.parse(s["qltcase"].ToString()));
                totalamount = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
                cashT_T = mainData.Sum(s => cm.parse(s["cashT_T"].ToString()));
                billL_C = mainData.Sum(s => cm.parse(s["billL_C"].ToString()));
                sumofpayments = mainData.Sum(s => cm.parse(s["sumofpayments"].ToString()));
                total = mainData.Sum(s => cm.parse(s["total"].ToString()));
            }
            catch { }
        }
    }
}