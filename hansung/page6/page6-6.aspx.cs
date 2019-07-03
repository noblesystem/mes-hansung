using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hansung.page6
{
    public partial class page6_6 : System.Web.UI.Page
    {
       
             public List<Dictionary<string, object>> mainData = new List<Dictionary<string, object>>();
        public double sumbox;
        public string[] clumn = new string[] {"numbercode","itemcode","itemname","standard","qltincase","qltbox","warehouse_id","defective_processing_type","Defect_type","remark1"};
        common cm = new common();
        sql sql = new sql();
        protected void Page_Load(object sender, EventArgs e)
        {
            mainData = cm.objTable_Erorr("");
            sumbox = mainData.Sum(s => cm.parse(s["qltbox"].ToString()));
        }
    }
}