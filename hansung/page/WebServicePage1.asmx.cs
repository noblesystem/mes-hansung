using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

namespace hansung.page
{
    /// <summary>
    /// WebServicePage1의 요약 설명입니다.
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // ASP.NET AJAX를 사용하여 스크립트에서 이 웹 서비스를 호출하려면 다음 줄의 주석 처리를 제거합니다. 
    [System.Web.Script.Services.ScriptService]
    public class WebServicePage1 : System.Web.Services.WebService
    {
        common cm = new common();
        sql sql = new sql();
        public List<Dictionary<string, object>> notices = new List<Dictionary<string, object>>();

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld()
        {
            return new JavaScriptSerializer().Serialize("Hello World");
        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public string GetNoticeList()
        {
            notices = sql.getdatatableSQL("notice", "");
            return new JavaScriptSerializer().Serialize(notices);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string InsertNotice(string myjson)
        {
            return new JavaScriptSerializer().Serialize("Hello World");
        }
    }   
}
