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
    /// page13_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
     [System.Web.Script.Services.ScriptService]
    public class page13_svc:System.Web.Services.WebService {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search(string param)
        {
            string whnm = JObject.Parse(param)["whnm"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "whnm", whnm, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE13_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            string whcd = JObject.Parse(param)["whcd"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "whcd", whcd, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE13_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param)
        {
            string mode     = JObject.Parse(param)["mode"].ToString();
            string whcd     = JObject.Parse(param)["whcd"].ToString();
            string whnm     = JObject.Parse(param)["whnm"].ToString();
            //string whnm2     = JObject.Parse(param)["whnm2"].ToString();
            string brief     = JObject.Parse(param)["brief"].ToString();
            string tel     = JObject.Parse(param)["tel"].ToString();
            string addr     = JObject.Parse(param)["addr"].ToString();
            string useyn     = JObject.Parse(param)["useyn"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
            fm.icnitMakeNode(dom, node, "varchar", "whcd", whcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "whnm", whnm, "50");
            //fm.icnitMakeNode(dom, node, "varchar", "whnm2", whnm2, "200");
            fm.icnitMakeNode(dom, node, "varchar", "brief", brief, "200");
            fm.icnitMakeNode(dom, node, "varchar", "tel", tel, "50");
            fm.icnitMakeNode(dom, node, "varchar", "addr", addr, "200");
            fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE13_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
    }
}
