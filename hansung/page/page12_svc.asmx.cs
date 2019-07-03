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
    /// page12_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
     [System.Web.Script.Services.ScriptService]
    public class page12_svc:System.Web.Services.WebService {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search(string param)
        {
            string itemnm = JObject.Parse(param)["itemnm"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "itemnm", itemnm, "100");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE12_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            string itemcd = JObject.Parse(param)["itemcd"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "itemcd", itemcd, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE12_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param)
        {
            string mode     = JObject.Parse(param)["mode"].ToString();
            string itemcd     = JObject.Parse(param)["itemcd"].ToString();
            string itemnm     = JObject.Parse(param)["itemnm"].ToString();
            string sitemnm     = JObject.Parse(param)["sitemnm"].ToString();
            string eitemnm     = JObject.Parse(param)["eitemnm"].ToString();
            string ditemcd     = JObject.Parse(param)["ditemcd"].ToString();
            string spec     = JObject.Parse(param)["spec"].ToString();
            string width     = JObject.Parse(param)["width"].ToString();
            string height     = JObject.Parse(param)["height"].ToString();
            string qty     = JObject.Parse(param)["qty"].ToString();
            string sqm     = JObject.Parse(param)["sqm"].ToString();
            string unitprice     = JObject.Parse(param)["unitprice"].ToString();
            string safeqty     = JObject.Parse(param)["safeqty"].ToString();
            string comnm     = JObject.Parse(param)["comnm"].ToString();
            string statuscd     = JObject.Parse(param)["statuscd"].ToString();
            string rmk     = JObject.Parse(param)["rmk"].ToString();
            string useyn     = JObject.Parse(param)["useyn"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
            fm.icnitMakeNode(dom, node, "varchar", "itemcd", itemcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "itemnm", itemnm, "100");
            fm.icnitMakeNode(dom, node, "varchar", "sitemnm", sitemnm, "50");
            fm.icnitMakeNode(dom, node, "varchar", "eitemnm", eitemnm, "50");
            fm.icnitMakeNode(dom, node, "varchar", "ditemcd", ditemcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "spec", spec, "100");
            fm.icnitMakeNode(dom, node, "int", "width", width, "20");
            fm.icnitMakeNode(dom, node, "int", "height", height, "20");
            fm.icnitMakeNode(dom, node, "numeric", "qty", qty, "20");
            fm.icnitMakeNode(dom, node, "numeric", "sqm", sqm, "20");
            fm.icnitMakeNode(dom, node, "numeric", "unitprice", unitprice, "20");
            fm.icnitMakeNode(dom, node, "numeric", "safeqty", safeqty, "20");
            fm.icnitMakeNode(dom, node, "varchar", "comnm", comnm, "200");
            fm.icnitMakeNode(dom, node, "varchar", "statuscd", statuscd, "10");
            fm.icnitMakeNode(dom, node, "varchar", "rmk", rmk, "2000");
            fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE12_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
    }
}
