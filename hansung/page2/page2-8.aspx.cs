using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_8 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public string dl1 = "none", dl2 = "none";
        public string[] clname1 = new string[] { "전표 번호", "발주 담당", "거래사명", "입고창고", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "합계 금액", "TERMS", "발주 비고"};
        public string[] clumn1 = new string[] { "ordernumber", "namewk", "namectm", "namewarehouse", "itemname", "standard", "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "terms", "remark"};
                                                                               
        public List<Dictionary<string, object>> mainData1 = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public string[] clname = new string[] { "연번", "전표번호", "L/C T/T date", "Payment", "품목명", "규격", "매수", "수량(B)", "구매 합계 금액", "P/I no", "L/C no", "B/L no", "PORT", "S/D", "E/D", "ETD", "ETA", "통관일", "T/T 지급금", "L/C 지급금", "지급금 합계", "지급 잔액	지급 적요" };
        public string[] clumn = new string[] { "ordernumber", "datebeginpayment", "paymentoption", "itemname", "standard", "quantityincase", "qltcase", "totalamount", "notebill", "note", "numbership","port", "duedate", "creditduedate", "departuredate", "dateofarrival", "customsday", "cashT_T", "billL_C", "sumofpayments", "total" };
        public string login;
        public string[] cvdate = new string[] { };
        public List<string> cvmoney = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            cvmoney = cm.moneycl;
            string tp = dropType.SelectedItem.Text;
            if (tp == "내수")
            {
                mainData1 = cm.s_obj_buy_in_contry("where billbuy.terms=N'" + tp + "'");
                dl1 = "block";
                cm.clgetdata = clumn;
                foreach (var i in mainData1)
                {
                    foreach (var j in clumn1)
                    {
                        if (cvmoney.IndexOf(j) > -1)
                        {
                            i[j] = cm.convernumbertostring(i[j].ToString());
                        }
                    }
                }
            }
            else
            {
                dl2 = "block";
                cm.clgetdata = clumn;
                mainData = cm.s_objpayment("where billbuy.terms!=N'내수'");

            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string tp = dropType.SelectedItem.Text;
            if (tp == "내수")
            {
                mainData1 = cm.s_obj_buy_in_contry("where billbuy.terms=N'" + tp + "'");
                dl1 = "block";
                cm.clgetdata = clumn;
                foreach (var i in mainData1)
                {
                    foreach (var j in clumn1)
                    {
                        if (cvmoney.IndexOf(j) > -1)
                        {
                            i[j] = cm.convernumbertostring(i[j].ToString());
                        }
                    }
                }
            }
            else
            {
                dl2 = "block";
                cm.clgetdata = clumn;
                mainData = cm.s_objpayment("where billbuy.terms!=N'내수'");

            }
        

        }
    }
}