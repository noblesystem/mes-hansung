using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page5
{
    public partial class page5_3 : System.Web.UI.Page
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> warehouse = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> company = new List<Dictionary<string, object>>();
        public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public string[] clname = new string[] { "전표 번호", "이고 담당", "출고창고", "입고창고", "이고입고확인", "품목코드", "품목명", "규격", "매수", "수량(B)", "시리얼 No", "정상/문제", "운송사", "차량번호", "운임", "이고 비고" };

        protected void Page_Load(object sender, EventArgs e)
        {
            employer = sql.getdatatableSQL("employee", "where isdelete is null");
            company = sql.getdatatableSQL("customer", "where isdelete is null");
            warehouse = sql.getdatatableSQL("warehouse", "where isdelete is null");
            string str = "select changewarehouse.*,detailchangewarehouse.* from changewarehouse left join detailchangewarehouse on changewarehouse.codeid=detailchangewarehouse.codebill";

            mainData = sql.getdatatablejoinSQL(str);
            foreach (var i in mainData)
            {
                i["worker"] = cm.getdatainlist(employer, i["worker"].ToString(), "name");
                i["sendwarehouse"] = cm.getdatainlist(warehouse, i["sendwarehouse"].ToString(), "name");
                i["rcvwarehouse"] = cm.getdatainlist(warehouse, i["rcvwarehouse"].ToString(), "name");
                i["company"] = cm.getdatainlist(company, i["company"].ToString(), "name");
                i["company"] = cm.getdatainlist(company, i["company"].ToString(), "name");
                i["verificatio"] = cm.converdate("yyyy.MM.dd", i["verificatio"].ToString());

            }
        }
    }
}