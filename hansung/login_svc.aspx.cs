using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using hansung.datamoder;
using System.Xml;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;

namespace hansung {
    public partial class login_svc:System.Web.UI.Page {
        protected void Page_Load(object sender,EventArgs e) {
            string json;
            using(var reader = new StreamReader(Request.InputStream)){
                json = reader.ReadToEnd();
            }
            var param = JsonConvert.SerializeObject(json);
            string userid = JObject.Parse(param)["userid"].ToString();
            string pwd = JObject.Parse(param)["pwd"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "20");
            fm.icnitMakeNode(dom, node, "varchar", "pwd", pwd, "50");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"SYS_LOGIN";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);

            result result = new result();
            if(dt != null && dt.Rows.Count == 1) {
                //======================================Cookie User
                HttpCookie myCookie = new HttpCookie("user");
                myCookie["userid"] = dt.Rows[0]["userid"].ToString();
                myCookie["usernm"] = dt.Rows[0]["usernm"].ToString();
                myCookie.Expires = DateTime.Now.AddHours(2d); 
                Response.Cookies.Add(myCookie);
                result.code = "OK";
                result.msg = "";
                result.val = "";
            } else {
                result.code = "NO";
                result.msg = "";
                result.val = "";
            }
            Response.Write(JsonConvert.SerializeObject(result));
        }
    }
}