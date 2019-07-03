using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page8
{
    public partial class page8_3 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public string[] clname1 = new string[] { };
        public string[] clumn1 = new string[] {  };
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sl = dropType.SelectedItem.Value;
            if (sl == "1")
            {

                clname1 = new string[] { "판매출고일", "영업 담당", "고객사명", "출고 창고", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "합계금액" };
                clumn1 = new string[] { "shippingtime", "namewk", "namectm", "store", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount" };
                cm.clgetdata = clumn1;
                mainData = cm.s_objOrder("where carship.shippingtime is not null");
            }
            else if (sl == "2")
            {

                clname1 = new string[] { "수금일자", "영업 담당", "고객사명", "현금 수금액", "어음 수금액", "수수료/기타 할인", "수금 합계", "입금계좌/현금", "수금 적요" };
                clumn1 = new string[] { "paymentdate", "salesrepresentative", "customercompany", "cashT_T", "billL_C", "feesmoney", "sumofpayments", "paymentaccount", "remark" };
                cm.clgetdata = clumn1;
                mainData = cm.s_paymentfrom3_1("");
            }
            else if (sl == "3")
            {

                clname1 = new string[] { "전표번호", "발주 담당", "거래사명", "입고창고", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "합계금액", "terms", "발주 비고" };
                clumn1 = new string[] { "ordernumber", "namewk", "namectm", "namewarehouse", "itemname", "standard", "quantityincase", "qltcase", "price", "pricesupply", "vat", "totalamount", "terms", "remark" };
                cm.clgetdata = clumn1;
                mainData = cm.s_obj_buy_in_contry("");
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string sl = dropType.SelectedItem.Value;
            if (sl == "1")
            {
                       
                clname1 = new string[] { "판매출고일", "영업 담당", "고객사명", "출고 창고", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "합계금액" };
                clumn1 = new string[] { "shippingtime", "namewk", "namectm", "store", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount" };
                cm.clgetdata = clumn1;
                mainData = cm.s_objOrder("where carship.shippingtime is not null");
            }
            else if (sl == "2")
            {

                clname1 = new string[] { "수금일자", "영업 담당", "고객사명", "현금 수금액", "어음 수금액", "수수료/기타 할인", "수금 합계", "입금계좌/현금", "수금 적요"};
                clumn1 = new string[] { "paymentdate", "salesrepresentative", "customercompany", "cashT_T", "billL_C", "feesmoney", "sumofpayments", "paymentaccount", "remark" };
                cm.clgetdata = clumn1;
                mainData = cm.s_paymentfrom3_1("");
            }
            else if (sl=="3")
            {
              
                clname1 = new string[] { "전표번호", "발주 담당", "거래사명", "입고창고", "품목명", "규격", "매수", "수량(B)", "단가", "공급가액", "부가세", "합계금액", "terms", "발주 비고" };
                clumn1= new string[] {"ordernumber", "namewk", "namectm", "namewarehouse", "itemname","standard","quantityincase","qltcase","price","pricesupply","vat","totalamount","terms","remark"};
                cm.clgetdata = clumn1;
                mainData = cm.s_obj_buy_in_contry("");
            }
        }
    }
}