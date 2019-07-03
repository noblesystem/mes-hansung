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

namespace hansung.page {
    /// <summary>
    /// page14_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
     [System.Web.Script.Services.ScriptService]
    public class page14_svc:System.Web.Services.WebService {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search(string param)
        {
            string usernm = JObject.Parse(param)["usernm"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "usernm", usernm, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE14_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            string userid = JObject.Parse(param)["userid"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE14_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param)
        {
            string mode     = JObject.Parse(param)["mode"].ToString();
            string userid     = JObject.Parse(param)["userid"].ToString();
            string usernm     = JObject.Parse(param)["usernm"].ToString();
            string email     = JObject.Parse(param)["email"].ToString();
            string hp     = JObject.Parse(param)["hp"].ToString();
            string jkcd     = JObject.Parse(param)["jkcd"].ToString();
            string deptcd     = JObject.Parse(param)["deptcd"].ToString();
            string addr     = JObject.Parse(param)["addr"].ToString();
            string filepath     = JObject.Parse(param)["filepath"].ToString();
            string pwd     = JObject.Parse(param)["pwd"].ToString();
            string useyn     = JObject.Parse(param)["useyn"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
            fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "20");
            fm.icnitMakeNode(dom, node, "varchar", "usernm", usernm, "50");
            fm.icnitMakeNode(dom, node, "varchar", "email", email, "100");
            fm.icnitMakeNode(dom, node, "varchar", "hp", hp, "50");
            fm.icnitMakeNode(dom, node, "varchar", "jkcd", jkcd, "10");
            fm.icnitMakeNode(dom, node, "varchar", "deptcd", deptcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "addr", addr, "200");
            fm.icnitMakeNode(dom, node, "varchar", "filepath", filepath, "200");
            fm.icnitMakeNode(dom, node, "varchar", "pwd", pwd, "50");
            fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE14_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
    }
}
