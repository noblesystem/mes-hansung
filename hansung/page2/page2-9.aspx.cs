using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_9 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData1 = new List<Dictionary<string, object>>();
        public string dl1 = "none", dl2 = "none";
        public double totalamount, tolerancemoney, billL_C, total;
        public string[] clumn1 = new string[] { "ordernumber", "paymentdate", "namewk", "namectm", "cashT_T", "billL_C", "feesmoney", "sumofpayments", "total", "paymentaccount", "remark" };
        public string[] clname1 = new string[] { "전표번호", "지급 일자", "발주 담당", "거래사명", "현금 지급액", "어음 지급액", "수수료/기타 할인", "지급금 합계", "지급 잔액", "지급계좌/현금", "지급 적요" };

        public string[] clname = new string[] { "전표번호", "Payment", "L/C T/T date", "거래사명", "USANCE", "품목", "지급할금액", "TOLERANCE", "TOTAL AMT", "P/I no", "L/C no", "B/L no", "PORT", "S/D", "E/D", "ETD", "ETA", "통관일", "지급 금액", "잔액"};
        public string[] clumn = new string[] { "ordernumber", "paymentoption", "datebeginpayment", "namectm", "usance", "itemname","totalamount","tolerancepercent", "tolerancemoney", "notebill","note","numbership","port","duedate","creditduedate","departuredate","dateofarrival","customsday","billL_C","total"};
        protected void Page_Load(object sender, EventArgs e)
        {
            string tp = dropType.SelectedItem.Text;
            if (tp == "내수")
            {
                mainData1 = cm.s_objpayment2_9("where billbuy.terms=N'내수' AND payment.codebill is not null");
                dl1 = "block";
                cm.clgetdata = clumn1;

            }
            else
            {
                dl2 = "block";
                cm.clgetdata = clumn;
                mainData = cm.s_objpayment("where billbuy.terms!=N'내수' AND payment.codebill is not null");
                totalamount = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
                tolerancemoney = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
                billL_C = mainData.Sum(s => cm.parse(s["billL_C"].ToString()));
                total = mainData.Sum(s => cm.parse(s["total"].ToString())); ;
            }

        }
        protected void Search_Click(object sender, EventArgs e)
        {
            string tp = dropType.SelectedItem.Text;
            if (tp == "내수")
            {
                mainData1 = cm.s_objpayment2_9("where billbuy.terms=N'내수' AND payment.codebill is not null");
                dl1 = "block";
                cm.clgetdata = clumn1;

            }
            else
            {
                dl2 = "block";
                cm.clgetdata = clumn;
                mainData = cm.s_objpayment("where billbuy.terms!=N'내수' AND payment.codebill is not null");
                totalamount = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
                tolerancemoney = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
                billL_C = mainData.Sum(s => cm.parse(s["billL_C"].ToString()));
                total = mainData.Sum(s => cm.parse(s["total"].ToString())); ;
            }

        }

       
    }
}