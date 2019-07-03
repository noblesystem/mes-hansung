using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page8
{
    public partial class page8_5 : System.Web.UI.Page
    {
        getdatapage8 gdata = new getdatapage8();
        public string[] clname = new string[] { "고객사명", "영업 담당", "미청구금액", "미수 합계", "미지급 금액", "미청구 지급금액", "미지급 합계", "미지급 합계", "차잔액" };
        public string[] clumn= new string[] { "namectm", "namewk", "sum_amount_order", "Unpaid_order", "total_order", "sum_amount_buy", "Unpaid_buy", "total_buy", "balance" };
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        protected void Page_Load(object sender, EventArgs e)
        {
            mainData = gdata.objpage8_5("");
        }
    }
}