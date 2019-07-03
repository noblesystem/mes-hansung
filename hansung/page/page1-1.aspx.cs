using hansung.Molder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;


namespace hansung.page
{
    public partial class page1_1 : System.Web.UI.Page
    {
        //sql cmdsql = new sql();
        //common cm = new common();
        //moldes md = new moldes();
        //public List<Dictionary<string, object>> mainObj = new List<Dictionary<string, object>>();
        //public List<Dictionary<string, object>> employer = new List<Dictionary<string, object>>();
        //public List<codecuctomer> lcode = new List<codecuctomer>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ////added by William 2019.06.06
            //((Mtpage)Master).ActiveMenuCode = MenuCode.Page11.ToString().ToUpper();

            //mainObj = cmdsql.getdatatableSQL("customer", "where isdelete is null");
            //employer = cmdsql.getdatatableSQL("employee", "where isdelete is null");
            //lcode = md.codectm();
            //foreach (var i in mainObj)
            //{
            //    string namewk= cm.getdatainlist(employer, i["salesemployee"].ToString(), "name");
            //    i["salesemployee"] = cm.getdatainlist(employer, i["salesemployee"].ToString(), "name");
 
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string[] title = new string[] { "연번", "거래처코드", "영업 담당", "더존코드", "고객사명", "사업자등록번호", "대표자", "전화번호", "팩스번호", "이동전화", "E-mail", "본사주소", "도착지 전화", "도착지주소", "거래 계좌 번호", "여신한도", "거래 잔액" };
            //string[] query = new string[] { "order", "code", "salesemployee", "zonecode", "name", "registrationnumber", "representative", "phonenumber", "fax", "mobilephone", "email", "headofficeaddress", "destinationphone", "destinationaddress", "transactionaccountnumber", "creditlimit", "transactionbalance" };
            //List<string> clnumber = new List<string>() { "order" };
            //cm.exceldata(title, query, clnumber,"datacustomer", "customer");
        }

        protected void btnImport_Click(object sender, EventArgs e)
        {
            
        }



    }
}