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

namespace hansung.page6 {
    /// <summary>
    /// page61_svc의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class page61_svc:System.Web.Services.WebService {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //선택된 발주전표 내역
        public string search(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";

            string stno = JObject.Parse(param)["stno"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "stno", stno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE61_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string selone(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";

            string stno = JObject.Parse(param)["stno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "stno", stno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE61_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string detail_search(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";

            string stno = JObject.Parse(param)["stno"].ToString();

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "stno", stno, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE61_DETAIL_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }
       [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string del(string param)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";

            string stno     = JObject.Parse(param)["stno"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "stno"    , stno    , "20");	
            fm.icnitMakeNode(dom, node, "varchar", "inuser"  , inuser  , "20");	
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE61_DEL";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            return JsonConvert.SerializeObject(result);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string save(string param, string param2)
        {
            if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";

            //===========================================================================master
            string stno     = JObject.Parse(param)["stno"].ToString();
            string iccd     = JObject.Parse(param)["iccd"].ToString();
            string gucd     = JObject.Parse(param)["gucd"].ToString();
            string stdt     = JObject.Parse(param)["stdt"].ToString();
            string apprdt     = JObject.Parse(param)["apprdt"].ToString();
            string userid     = JObject.Parse(param)["userid"].ToString();
            string userid2     = JObject.Parse(param)["userid2"].ToString();
            string inwhcd     = JObject.Parse(param)["inwhcd"].ToString();
            string outwhcd     = JObject.Parse(param)["outwhcd"].ToString();
            string custcd     = JObject.Parse(param)["custcd"].ToString();
            string carnm     = JObject.Parse(param)["carnm"].ToString();
            string bccd     = JObject.Parse(param)["bccd"].ToString();
            string stno2     = JObject.Parse(param)["stno2"].ToString();
            string rmk     = JObject.Parse(param)["rmk"].ToString();
            string useyn     = JObject.Parse(param)["useyn"].ToString();
            string inuser   = "100";

            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "stno", stno, "20");
            fm.icnitMakeNode(dom, node, "varchar", "iccd", iccd, "10");
            fm.icnitMakeNode(dom, node, "varchar", "gucd", gucd, "1");
            fm.icnitMakeNode(dom, node, "varchar", "stdt", stdt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "apprdt", apprdt, "10");
            fm.icnitMakeNode(dom, node, "varchar", "userid", userid, "20");
            fm.icnitMakeNode(dom, node, "varchar", "userid2", userid2, "20");
            fm.icnitMakeNode(dom, node, "varchar", "inwhcd", inwhcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "outwhcd", outwhcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "custcd", custcd, "20");
            fm.icnitMakeNode(dom, node, "varchar", "carnm", carnm, "100");
            fm.icnitMakeNode(dom, node, "varchar", "bccd", bccd, "10");
            fm.icnitMakeNode(dom, node, "varchar", "stno2", stno2, "20");
            fm.icnitMakeNode(dom, node, "varchar", "rmk", rmk, "2000");
            fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
            fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"PAGE61_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result result = CallDB.getXmlTrans(dom);
            //return JsonConvert.SerializeObject(result);
            //===========================================================================detail
            fm = new FormManager();
            dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            //JObject json = JObject.Parse(param2);
            //JObject json = new JObject();//  JObject.Parse(param2);
            dynamic dynJson = JsonConvert.DeserializeObject(param2);
            if(dynJson == null || dynJson.Count == 0) {
                return JsonConvert.SerializeObject(result);
            }
            foreach(var item in dynJson) {
                string mode     = item.mode    .ToString();
                stno     = result.val;
                string stseq    = item.stseq   .ToString();
                string itemcd   = item.itemcd  .ToString();
                string iqty     = item.iqty    .ToString();
                string cqty     = item.cqty    .ToString();
                string sno      = item.sno     .ToString();
                string statuscd = item.statuscd.ToString();
                string falsecd  = item.falsecd .ToString();
                string filepath = item.filepath.ToString();
                rmk      = item.rmk     .ToString();
                useyn    = item.useyn   .ToString();
                inuser = "100";  

                node = dom.CreateNode(XmlNodeType.Element,"zrow","");
                fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
                fm.icnitMakeNode(dom, node, "varchar", "stno", stno, "20");
                fm.icnitMakeNode(dom, node, "numeric", "stseq", stseq, "20");
                fm.icnitMakeNode(dom, node, "varchar", "itemcd", itemcd, "20");
                fm.icnitMakeNode(dom, node, "numeric", "iqty", iqty, "20");
                fm.icnitMakeNode(dom, node, "numeric", "cqty", cqty, "20");
                fm.icnitMakeNode(dom, node, "varchar", "sno", sno, "50");
                fm.icnitMakeNode(dom, node, "varchar", "statuscd", statuscd, "10");
                fm.icnitMakeNode(dom, node, "varchar", "falsecd", falsecd, "10");
                fm.icnitMakeNode(dom, node, "varchar", "filepath", filepath, "100");
                fm.icnitMakeNode(dom, node, "varchar", "rmk", rmk, "2000");
                fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
                fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

                dom.SelectSingleNode("//xmldata").AppendChild(node);
            }
            query = @"PAGE61_DETAIL_SAVE";
            dom.SelectSingleNode("//proc").InnerText = query;
            result = CallDB.getXmlTrans(dom);

            return JsonConvert.SerializeObject(result);
        }
    }
}
