using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_3 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> customer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> Warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> litem = new List<Dictionary<string, object>>();
        public double sumsqm, sumbox, sumspprice, sumvat, sumtotal;
        public string[] cvdate = new string[] { };
        protected void Page_Load(object sender, EventArgs e)
        {
            cvdate = cm.cvdate;
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            Warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            customer = sql.getdatatableSQL("customer", "where isdelete is null");
            mainData = sql.getdatatableSQL("billbuy", "order by id desc");
            litem = sql.getdatatableSQL("ItemList", "where isdelete is null");
            string bill = "select billbuy.*,detailbillbuy.*,ship.* from billbuy left join detailbillbuy on billbuy.codeid=detailbillbuy.codebill left join ship on billbuy.codeid=ship.codebill";
            mainData = sql.getdatatablejoinSQL(bill);
         
            sumsqm = mainData.Sum(s => cm.parse(s["sqm"].ToString()));
            sumbox = mainData.Sum(s => cm.parse(s["qltcase"].ToString()));
            sumspprice = mainData.Sum(s => cm.parse(s["pricesupply"].ToString()));
            sumvat = mainData.Sum(s => cm.parse(s["vat"].ToString()));
            sumtotal = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
            foreach (var i in mainData)
            {
                i["nameitem"] = cm.getdatainlist(litem, i["iditem"].ToString(), "itemname");
                i["warehouse"] = cm.getdatainlist(customer, i["tradingmission"].ToString(), "transactionaccountnumber");
                i["customer"] = cm.getdatainlist(customer, i["tradingmission"].ToString(), "phonenumber");
                i["paymoney"] = cm.convernumbertostring(i["paymoney"].ToString());
                i["tradingmission"] = cm.getdatainlist(customer, i["tradingmission"].ToString(), "name");
                i["orderingemployer"] = cm.getdatainlist(employer, i["orderingemployer"].ToString(), "name");
                
                foreach (var j in cvdate)
                {
                    try
                    {
                        i[j] = cm.converdate("yy.MM.dd", i[j].ToString());
                    }
                    catch { }
                }
            }
       
        }
    }
}