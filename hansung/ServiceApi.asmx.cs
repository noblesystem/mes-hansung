using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using hansung.datamoder;
using System.Web.Script.Services;

namespace hansung
{
    /// <summary>
    /// Summary description for ServiceApi
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ServiceApi : System.Web.Services.WebService
    {
        private IEmployeeBus _employeeBus = null;
        private IEmployeeBus EmployeeBus => _employeeBus ?? (_employeeBus = new EmployeeBus());

        private IPermissionBus _permissionBus = null;
        private IPermissionBus PermissionBus => _permissionBus ?? (_permissionBus = new PermissionBus());

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public string countdata(string table, string code, string vl)
        {
            sql sql = new sql();
            string where = "";
            if (code != "")
                where = "where " + code + "=N'" + vl + "'";
            string count = sql.countitem(table, where);
            return count;
        }
        [WebMethod]
        public string savadatabill(string jsonbill, string jsondetail, string obj, string codeid)
        {
            common cm = new common();
            datacontext db = new datacontext();
            int status = -1;
            if (codeid == "")
                codeid = cm.getcodeId("order");
            else
                status = 1;
            List<string> strbill = db.buybill_str(jsonbill, codeid, status);
            List<string> strdetail = db.detailbuybill_str(jsondetail, codeid);
            List<string> lw = new List<string>();
            lw.AddRange(strbill);
            lw.AddRange(strdetail);
            sql sql = new sql();
            sql.Executesql(string.Join(";", lw));
            return "";
        }

        [WebMethod]
        public string savadatabill_ship(string jsondetail, string codebill, string inforbill)
        {
            common cm = new common();
            datacontext db = new datacontext();
            List<string> lw = db.ship_STR(jsondetail, codebill, inforbill);
            sql sql = new sql();
            sql.Executesql(string.Join(";", lw));
            return "";
        }
        [WebMethod]
        public string savadata_sale_ship(string jsonbill, string jsondetail, string codeid)
        {
            common cm = new common();
            datacontext db = new datacontext();
            int status = -1;
            if (codeid == "")
                codeid = cm.getcodeId("order");
            else
                status = 1;
            List<string> strbill = db.orderbill_str(jsonbill, codeid, status);
            List<string> strdetail = db.detailorder_str(jsondetail, codeid, status);
            List<string> lw = new List<string>();
            lw.AddRange(strbill);
            lw.AddRange(strdetail);
            sql sql = new sql();
            sql.Executesql(string.Join(";", lw));
            return "";
        }
        [WebMethod]
        public string savadatabill_ship_itn(string jsondetail, string codebill, string inforbill)
        {
            common cm = new common();
            datacontext db = new datacontext();
            List<string> lw = db.ship_STR_itn(jsondetail, codebill, inforbill);
            sql sql = new sql();
            sql.Executesql(string.Join(";", lw));
            return "";
        }
        [WebMethod]
        public string savadatabill_car_itn(string jsondetail, string codebill)
        {
            common cm = new common();
            datacontext db = new datacontext();
            List<string> lw = db.ship_car_itn(jsondetail, codebill);
            sql sql = new sql();
            sql.Executesql(string.Join(";", lw));
            return "";
        }
        [WebMethod]
        public string savadata(string json, string obj, string id)
        {

            string rs = "";
            datacontext db = new datacontext();
            if (obj == "customer")
                rs = db.customer(json, int.Parse(id));
            else if (obj == "styleitem")
                rs = db.styleItem(json, int.Parse(id));
            else if (obj == "standard")
                rs = db.standards(json, int.Parse(id));
            else if (obj == "itemlist")
                rs = db.itemlist(json, int.Parse(id));
            else if (obj == "house")
                rs = db.warehouse(json, int.Parse(id));
            else if (obj == "employer")
                rs = db.employee(json, int.Parse(id));
            else if (obj == "billbuy")
                rs = db.buybill(json, id);
            else if (obj == "detailbuy")
                rs = db.detailbuybill(json, id);
            else if (obj == "subdetailbuybill")
                rs = db.subdetailbuybill(json, id);
            else if (obj == "ship")
                rs = db.ship(json, id);
            else if (obj == "subship")
                rs = db.subship(json, int.Parse(id));
            else if (obj == "payment")
                rs = db.payment(json, id);
            else if (obj == "editpayment")
                rs = db.editpayment(json, id);
            else if (obj == "paymentorder")
                rs = db.paymentorder(json, id);
            else if (obj == "orderbill")
                rs = db.orderbill(json, id);
            else if (obj == "carship")
                rs = db.carship(json, id);
            else if (obj == "Editcarship")
                rs = db.Editcarship(json, id);
            else if (obj == "detailorder")
                rs = db.detailorder(json, id);
            else if (obj == "serienumber")
                rs = db.serinumber(json, id);
            else if (obj == "inspection")
                rs = db.inspection(json, id);
            else if (obj == "plans")
                rs = db.plans(json, id);
            else if (obj == "changehouse")
                rs = db.changehouse(json, id);
            else if (obj == "detailchange")
                rs = db.detailchange(json, id);
            else if (obj == "TableErorr")
                rs = db.tberorr(json, id);
            else if (obj == "Table_qlt_erorr")
                rs = db.table_detail_erorr_qlt(json, id);
            else if (obj == "up_Table_qlt_erorr")
                rs = db.update_table_detail_erorr_qlt(json, id);
            return rs;
        }
        [WebMethod]
        public string findata_ship(string value)
        {
            sql sql = new sql();
            common cm = new common();
            string[] table_bill = new string[] { "orderbill", "paymentoption", "note", "money", "tolerancepercent", "tolerancemoney", "usance", "datebeginpayment", "creditduedate" };
            string[] table_ship = new string[] { "numbership", "duedate", "departuredate", "dateofarrival", "conDuedate", "shipname", "remark", "nameshipname", "qltbox", "dateclearance", "customsday", "port", "containernumber", "daycertificate" };
            string tb_bill = cm.getclumn(table_bill, "billbuy");
            string sqlstr = "select " + tb_bill + ",ship.* from billbuy left join ship on billbuy.codeid=ship.codebill where billbuy.codeid='" + value + "'";
            var o = sql.getdatatablejoinSQL(sqlstr);
            if (o.Count > 1)
            {
                for (var i = 1; i < o.Count; i++)
                {
                    foreach (var j in table_bill)
                    {
                        o[i][j] = "";
                    }
                }
            }
            string rs = "";
            if (o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string findata(string obj, string column, string value)
        {
            sql sql = new sql();
            var o = sql.finddatasql(obj, "where " + column + "='" + value + "'");
            string rs = "";
            if (o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string historyship(string value)
        {
            sql sql = new sql();
            var str = "select historybillsale.contenold,historybillsale.subcode,historybillsale.inforbill from historybillsale where codeid='" + value + "' AND actions='Edit ship'";
            var o = sql.getdatatablejoinSQL(str);
            string rs = "";
            if (o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string historybill(string value)
        {
            sql sql = new sql();
            var str = "select historybillsale.contenold,historybillsale.subcode,historybillsale.inforbill from historybillsale where codeid='" + value + "' AND actions='edit detail buy'";
            var o = sql.getdatatablejoinSQL(str);
            string rs = "";
            if (o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string getdata(string obj, string column, string value)
        {
            sql sql = new sql();
            var o = sql.getdatatableSQL(obj, "where " + column + "='" + value + "' order by id desc");
            string rs = "";
            if (o != null && o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string getdatanosort(string obj, string column, string value)
        {
            sql sql = new sql();
            var o = sql.getdatatableSQL(obj, "where " + column + "='" + value + "'");
            string rs = "";
            if (o != null && o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string getdatadetailbillbuy(string value)
        {
            sql sql = new sql();
            string str = "select ItemList.itemname,ItemList.itemcode,ItemList.standard,detailbillbuy.* from detailbillbuy left join ItemList on detailbillbuy.iditem=ItemList.id where detailbillbuy.codebill='" + value + "'";
            var o = sql.getdatatablejoinSQL(str);
            string rs = "";
            if (o != null && o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string getdataship(string obj, string column, string value)
        {
            sql sql = new sql();
            string sqlstr = "select ship.*,subship.* from ship inner join subship on ship.idbill==subship.idbill where ship.idbill=" + value;
            var o = sql.getdatatablejoinSQL(sqlstr);
            string rs = "";
            if (o.Count > 0)
                rs = JsonConvert.SerializeObject(o);
            return rs;
        }
        [WebMethod]
        public string updatedelete(string id, string obj)
        {

            string rs = "";
            datacontext db = new datacontext();
            string table = "";
            if (obj == "customer")
                table = "customer";
            else if (obj == "ItemList")
                table = "ItemList";
            else if (obj == "house")
                table = "warehouse";
            else if (obj == "employer")
                table = "employee";
            rs = db.updatecolumndelete(id, table);
            return rs;
        }
        [WebMethod]
        public string ExportExcel(string json, string obj, string id)
        {
            string rs = "";
            datacontext db = new datacontext();
            if (obj == "customer")
                rs = db.customer(json, int.Parse(id));
            return rs;
        }

        [WebMethod(EnableSession = true)]
        public string EmployeeLogin(string username, string password)
        {
            employee emp = null;
            try
            {
                emp = EmployeeBus.Login(username, password) ?? new employee
                {
                    Message = new Message
                    {
                        MessageType = MessageType.Error,
                        MessageContent = "ERROR_LOGIN: An error happened while logging in into system."
                    }
                };
            }
            catch (Exception e)
            {
                emp = new employee
                {
                    Message = new Message { MessageType = MessageType.Error, MessageContent = $"ERROR_LOGIN: {e}." }
                };
            }


            if (emp.Message.MessageType == MessageType.Success)
            {
                HttpContext.Current.Session[GlobalSettings.UserSession] = emp;
                HttpContext.Current.Session.Timeout = 20;
            }

            //Remove all unnecessary information before return to UI
            //This is the trick to prevent developers view all security information from Browser console
            var returnEmp = new employee
            {
                Password = "",
                employeecode = emp.employeecode,
                Department = emp.Department,
                Position =   emp.Position,
                name = emp.name,
                Message = emp.Message
            };

            return JsonUtils<employee>.ToJson(returnEmp);
        }

        [WebMethod(EnableSession = true)]
        public void EmployeeLogout()
        {
            HttpContext.Current.Session.Contents.Clear();
        }

        [WebMethod]
        public List<MenuActionPermission> GetMenuActionPermissionsByEmpId(int empId)
        {
            return PermissionBus.GetMenuActionPermissionsByEmpId(empId);
        }

        [WebMethod]
        public List<ObjectPropertyPermission> GetObjectPropertyPermissionByEmpId(int empId)
        {
            return PermissionBus.GetObjectPropertyPermissionByEmpId(empId);
        }

        [WebMethod, ScriptMethod(UseHttpGet = true)]
        public List<employee> GetAvailableEmployees()
        {
            return EmployeeBus.GetAvailableEmployees();
        }

        [WebMethod, ScriptMethod(UseHttpGet = true)]
        public List<Menu> GetAvailableMenus()
        {
            return PermissionBus.GetAvailableMenus();
        }

        [WebMethod]
        public List<MenuActionPermission> SaveMenuActionPermission(MenuActionPermission menuActionPermission)
        {
            return PermissionBus.SaveMenuActionPermission(menuActionPermission);
        }

        [WebMethod]
        public List<MenuActionPermission> RemoveMenuActionPermission(int empId, int menuId)
        {
            return PermissionBus.RemoveMenuActionPermission(empId, menuId);
        }
    }
}
