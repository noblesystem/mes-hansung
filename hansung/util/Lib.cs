using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Xml;
using System.Data.SqlClient;
using System.Transactions;
using System.Collections.Generic;
using System.Text;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
namespace hansung
{
    /// <summary>
    /// ARPCallDB - DB 액세스용 클래스
    /// </summary>
    public static class Lib
    {
        // datatable 을 json으로 변경
        public static string ToJson(this DataTable value)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            serializer.MaxJsonLength = 2147483647;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in value.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in value.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return new JavaScriptSerializer().Serialize(rows);
            //return serializer.Serialize(rows);
        }

    }
}
