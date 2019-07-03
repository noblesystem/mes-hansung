using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3
{
    public partial class page3_8 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public List<string> tdright = new List<string>();
        public double sumbox, pricesupply, vat, totalamount,total;
        public string[] clname = new string[] { "전표 번호", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "합계 금액", "수수료/기타 할인", "수금 합계", "잔액", "수금 적요" };
        public string[] clumn = new string[] {"orderdate","itemname","standard","qltincase","qltcase","price","pricesupply","vat","totalamount","feesmoney","sumofpayments","total","remark"};
        public string login;
        protected void Page_Load(object sender, EventArgs e)
        {
            tdright = cm.tdright.ToList();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            cm.clgetdata = clumn;
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            Warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            string ctmsearch = Request.Form["ctmsearch"].ToString().Trim();
            string id = cm.getdatainlistname(customer, "name", ctmsearch, "id");
            mainData = cm.objOrderpayment("where orderslips.customercompany='"+id+"'", employer, customer, litem);
            sumbox = mainData.Sum(s => cm.parse(s["qltcase"].ToString()));
            pricesupply = mainData.Sum(s => cm.parse(s["pricesupply"].ToString()));
            vat = mainData.Sum(s => cm.parse(s["vat"].ToString()));
            totalamount = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
            total = mainData.Sum(s => cm.parse(s["total"].ToString()));
        }
    }
}