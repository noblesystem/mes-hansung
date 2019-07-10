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
	/// page19_svc의 요약 설명입니다.
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]
	// ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
	[System.Web.Script.Services.ScriptService]
	public class page19_svc:System.Web.Services.WebService {

		[WebMethod]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public string search(string param)
		{
			string typecd = JObject.Parse(param)["typecd"].ToString();
			FormManager fm  = new FormManager();
			XmlDocument dom = new XmlDocument();
			dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
			dom.SelectSingleNode("//act").InnerText = "proc";
			XmlNode node;
			node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
			fm.icnitMakeNode(dom, node, "varchar", "typecd", typecd, "10");
			dom.SelectSingleNode("//xmldata").AppendChild(node);

			string query = @"PAGE19_SEARCH";
			dom.SelectSingleNode("//proc").InnerText = query;
			DataTable dt = CallDB.getExecuteDataTable(dom);
			return dt.ToJson();
		}
		
		[WebMethod]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public string selone(string param)
		{
			string locno = JObject.Parse(param)["locno"].ToString();
			
			FormManager fm  = new FormManager();
			XmlDocument dom = new XmlDocument();
			dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
			dom.SelectSingleNode("//act").InnerText = "proc";
			
			XmlNode node;
			node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
			fm.icnitMakeNode(dom, node, "varchar", "locno", locno, "20");
			dom.SelectSingleNode("//xmldata").AppendChild(node);

			string query = @"PAGE19_SELONE";
			dom.SelectSingleNode("//proc").InnerText = query;
			DataTable dt = CallDB.getExecuteDataTable(dom);
			return dt.ToJson();
		}

		[WebMethod]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
		public string save(string param)
		{
			if(HttpContext.Current.Request.GetUserCookie("userid") == "") return "";
			string ss_userid = HttpContext.Current.Request.GetUserCookie("userid");

			string mode    = JObject.Parse(param)["mode"].ToString();
			string locno   = JObject.Parse(param)["locno"].ToString();
			string whcd    = JObject.Parse(param)["whcd"].ToString();
			string typecd  = JObject.Parse(param)["typecd"].ToString();
			string typeno  = JObject.Parse(param)["typeno"].ToString();
			string colno   = JObject.Parse(param)["colno"].ToString();
			string ordseq  = JObject.Parse(param)["ordseq"].ToString();
			string rmk     = JObject.Parse(param)["rmk"].ToString();
			string useyn   = JObject.Parse(param)["useyn"].ToString();
			string inuser  = ss_userid;
			
			FormManager fm  = new FormManager();
			XmlDocument dom = new XmlDocument();
			dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
			dom.SelectSingleNode("//act").InnerText = "proc";
			XmlNode node;
			node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
			
			fm.icnitMakeNode(dom, node, "varchar", "mode", mode, "10");
			fm.icnitMakeNode(dom, node, "varchar", "locno", locno, "20");
			fm.icnitMakeNode(dom, node, "varchar", "whcd", whcd, "20");
			fm.icnitMakeNode(dom, node, "varchar", "typecd", typecd, "10");
			fm.icnitMakeNode(dom, node, "varchar", "typeno", typeno, "20");
			fm.icnitMakeNode(dom, node, "varchar", "colno", colno, "20");
			fm.icnitMakeNode(dom, node, "numeric", "ordseq", ordseq, "20");
			fm.icnitMakeNode(dom, node, "varchar", "rmk", rmk, "500");
			fm.icnitMakeNode(dom, node, "varchar", "useyn", useyn, "1");
			fm.icnitMakeNode(dom, node, "varchar", "inuser", inuser, "20");

			dom.SelectSingleNode("//xmldata").AppendChild(node);

			string query = @"PAGE19_SAVE";
			dom.SelectSingleNode("//proc").InnerText = query;
			result result = CallDB.getXmlTrans(dom);
			return JsonConvert.SerializeObject(result);
		}

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string notice_search(string param)
        {
            string subject = JObject.Parse(param)["subject"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "varchar", "subject", subject, "100");

            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"NOTICE_TEST_SEARCH";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string notice_selone(string param)
        {
            string seq = JObject.Parse(param)["seq"].ToString();
            FormManager fm = new FormManager();
            XmlDocument dom = new XmlDocument();
            dom.LoadXml("<xml><proc/><act/><xmldata></xmldata><xmlclipdata/></xml>");
            dom.SelectSingleNode("//act").InnerText = "proc";
            XmlNode node;
            node = dom.CreateNode(XmlNodeType.Element, "zrow", "");
            fm.icnitMakeNode(dom, node, "int", "seq", seq, "20");
            dom.SelectSingleNode("//xmldata").AppendChild(node);

            string query = @"NOTICE_TEST_SELONE";
            dom.SelectSingleNode("//proc").InnerText = query;
            DataTable dt = CallDB.getExecuteDataTable(dom);
            return dt.ToJson();
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
