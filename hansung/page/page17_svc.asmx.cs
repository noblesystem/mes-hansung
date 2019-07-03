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
    /// page17_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class page17_svc:System.Web.Services.WebService {


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search(string param)
        {
            string gbncd = JObject.Parse(param)["gbncd"].ToString();
            string codenm = JObject.Parse(param)["codenm"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "gbncd", gbncd, "100");    
            fm.icnitMakeNode(dom, node, "varchar", "codenm", codenm, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE17_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            string gbncd = JObject.Parse(param)["gbncd"].ToString();
            string code = JObject.Parse(param)["code"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "gbncd", gbncd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "code", code, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE17_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param)
        {
            string mode     = JObject.Parse(param)["mode"].ToString();
            string gbncd     = JObject.Parse(param)["gbncd"].ToString();
            string code     = JObject.Parse(param)["code"].ToString();
            string codenm     = JObject.Parse(param)["codenm"].ToString();
            string codeseq     = JObject.Parse(param)["codeseq"].ToString();
            string useyn     = JObject.Parse(param)["useyn"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
            fm.icnitMakeNode(dom, node, "varchar", "gbncd", gbncd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "code", code, "20");
            fm.icnitMakeNode(dom, node, "varchar", "codenm", codenm, "100");
            fm.icnitMakeNode(dom, node, "int", "codeseq", codeseq, "20");
            fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE17_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string notice_save(string param)
        {
            string seq = JObject.Parse(param)["seq"].ToString();
            string mode = JObject.Parse(param)["mode"].ToString();

            string subject = JObject.Parse(param)["subject"].ToString();
            string contents = JObject.Parse(param)["contents"].ToString();
            string inuser = JObject.Parse(param)["inuser"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
            fm.icnitMakeNode(dom, node, "int", "seq", seq, "20");
            fm.icnitMakeNode(dom, node, "varchar", "subject", subject, "20");
            fm.icnitMakeNode(dom, node, "varchar", "contents", contents, "200");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"NOTICE_TEST_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }


    }
}
