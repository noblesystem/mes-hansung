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
    /// page11_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class page11_svc:System.Web.Services.WebService {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search(string param)
        {
            string custnm = JObject.Parse(param)["custnm"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "custnm", custnm, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE11_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            string custcd = JObject.Parse(param)["custcd"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "custcd", custcd, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE11_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param)
        {
            string mode     = JObject.Parse(param)["mode"].ToString();
            string custcd     = JObject.Parse(param)["custcd"].ToString();
            string custnm     = JObject.Parse(param)["custnm"].ToString();
            string dcustcd     = JObject.Parse(param)["dcustcd"].ToString();
            string userid     = JObject.Parse(param)["userid"].ToString();
            string bizno     = JObject.Parse(param)["bizno"].ToString();
            string ceo     = JObject.Parse(param)["ceo"].ToString();
            string tel     = JObject.Parse(param)["tel"].ToString();
            string fax     = JObject.Parse(param)["fax"].ToString();
            string hp     = JObject.Parse(param)["hp"].ToString();
            string email     = JObject.Parse(param)["email"].ToString();
            string addr     = JObject.Parse(param)["addr"].ToString();
            string dotel     = JObject.Parse(param)["dotel"].ToString();
            string doaddr     = JObject.Parse(param)["doaddr"].ToString();
            string curcd     = JObject.Parse(param)["curcd"].ToString();
            string janamt     = JObject.Parse(param)["janamt"].ToString();
            string creditamt     = JObject.Parse(param)["creditamt"].ToString();
            string acctno     = JObject.Parse(param)["acctno"].ToString();
            string useyn     = JObject.Parse(param)["useyn"].ToString();

            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
            fm.icnitMakeNode(dom, node, "varchar", "custcd", custcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "custnm", custnm, "100");
            fm.icnitMakeNode(dom, node, "varchar", "dcustcd", dcustcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "20");
            fm.icnitMakeNode(dom, node, "varchar", "bizno", bizno, "50");
            fm.icnitMakeNode(dom, node, "varchar", "ceo", ceo, "100");
            fm.icnitMakeNode(dom, node, "varchar", "tel", tel, "50");
            fm.icnitMakeNode(dom, node, "varchar", "fax", fax, "50");
            fm.icnitMakeNode(dom, node, "varchar", "hp", hp, "50");
            fm.icnitMakeNode(dom, node, "varchar", "email", email, "100");
            fm.icnitMakeNode(dom, node, "varchar", "addr", addr, "200");
            fm.icnitMakeNode(dom, node, "varchar", "dotel", dotel, "20");
            fm.icnitMakeNode(dom, node, "varchar", "doaddr", doaddr, "200");
            fm.icnitMakeNode(dom, node, "varchar", "curcd", curcd, "10");
            fm.icnitMakeNode(dom, node, "numeric", "janamt", janamt, "20");
            fm.icnitMakeNode(dom, node, "numeric", "creditamt", creditamt, "20");
            fm.icnitMakeNode(dom, node, "varchar", "acctno", acctno, "50");
            fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE11_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }





    }
}
