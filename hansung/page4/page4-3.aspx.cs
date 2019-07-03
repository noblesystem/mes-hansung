using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page4
{
    public partial class page4_3 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();

        protected void Page_Load(object sender, EventArgs e)
        {

            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            string str = "select plans.codeid as code,plans.worker,plans.time,plans.money,plans.remark,orderslips.codeid as codebill,sum(detailorder.totalamount) as totalamount " +
                         "from plans left join orderslips  on plans.worker = orderslips.salesrepresentative " +
                         "left join detailorder on orderslips.codeid = detailorder.codebill " +
                         "group by  plans.codeid,plans.worker,plans.time,plans.money,plans.remark,orderslips.codeid";
           var mData = sql.getdatatablejoinSQL(str);
            mainData = sql.getdatatableSQL("plans", "");

            foreach(var i in mainData)
            {
                i["worker"] = cm.getdatainlist(employer, i["worker"].ToString(), "name");
                i["time"] = cm.converdate("yyyy.MM", i["time"].ToString());
                i["totalamount"] = mData.Where(s => s["code"].ToString() == i["codeid"].ToString()).Sum(s => cm.parse(s["totalamount"].ToString()));
                i["different"] = cm.parse(i["totalamount"].ToString()) - cm.parse(i["money"].ToString());
                i["ratio"] =Math.Floor((cm.parse(i["totalamount"].ToString()) * 100) / cm.parse(i["money"].ToString()));

            }
           

        }
    }
}