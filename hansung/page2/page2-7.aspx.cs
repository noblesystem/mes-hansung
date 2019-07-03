using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page2
{
    public partial class page2_7 : System.Web.UI.Page
    {
        common cm = new common();
        datafrom2_1 data = new datafrom2_1();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public double sumbox, sumspprice, sumvat, sumtotal;
        public string[] clumn = new string[] { "ordernumber", "housename", "namewk", "namectm", "itemname", "standard", "quantityincase", "qltcase", "qltcase", "qltcase", "qltcontainer", "terms", "numbership", "dateofarrival", "customsday", "conDuedate", "port", "nameshipname", "sizefit", "requestday", "remark" };
        protected void Page_Load(object sender, EventArgs e)
        {
            mainData = data.s_obj_2_4("where ship.confirmreceiptday is not null");
            sumbox = mainData.Sum(s => cm.parse(s["qltcase"].ToString()));
            sumspprice = mainData.Sum(s => cm.parse(s["pricesupply"].ToString()));
            sumvat = mainData.Sum(s => cm.parse(s["vat"].ToString()));
            sumtotal = mainData.Sum(s => cm.parse(s["totalamount"].ToString()));
        }
    }
}