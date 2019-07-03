using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3
{
    public partial class page3_7 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public string[] clname= new string[] { "고객사명", "영업 담당", "미수금액", "미청구금액", "합계" };
        public string[] clumn = new string[] { "customercompany", "salesrepresentative", "total", "colectmeny", "colectmeny" };
        public string login;
        public double colectmeny, total;
        protected void Page_Load(object sender, EventArgs e)
        {

            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            cm.clgetdata = clumn;
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            Warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            mainData = cm.objOrderpayment("", employer, customer, litem);
            total = mainData.Sum(s => cm.parse(s["total"].ToString()));
        }
    }
}