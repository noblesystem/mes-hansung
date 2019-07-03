using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page3
{
    public partial class page3_5 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public List<string> tdright = new List<string>();
        public double sumbox, sumspprice, sumvat, sumtotal;
        public string[] cl = new string[] { "shippingtime", "salesrepresentative", "codeid", "customercompany", "warehouse", "itemcode", "itemname", "standard", "qltincase", "qltcase", "price", "pricesupply", "vat", "totalamount" };
                                                                  

        protected void Page_Load(object sender, EventArgs e)
        {
            tdright = cm.tdright.ToList();
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            string strcar = cm.stringCarship();
            string stringordedt = cm.stringordedt();
            mainData = cm.objOrder("where carship.codebill is not null", employer, customer, litem);
            sumbox = mainData.Sum(s =>double.Parse(s["qltcase"].ToString()));
            
            sumspprice = mainData.Sum(s => cm.parse(s["pricesupply"].ToString().Replace(",","")));
            sumvat = mainData.Sum(s => cm.parse(s["vat"].ToString().Replace(",", "")));
            sumtotal = mainData.Sum(s => cm.parse(s["totalamount"].ToString().Replace(",", "")));
        }
    }
}