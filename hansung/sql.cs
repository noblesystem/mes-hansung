using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace hansung
{
    public class sql
    {
        public Dictionary<string, object> finddatasql(string tb, string substr)
        {

            Dictionary<string, object> results = new Dictionary<string, object>();
            List<string> namecl = new List<string>();
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            string str = "SELECT * FROM " + tb + " " + substr;
            SqlCommand sqlCommand = new SqlCommand(str, con);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            for (var i = 0; i < reader.FieldCount; i++)
                namecl.Add(reader.GetName(i));
            while (reader.Read())
            {

                results = SerializeRow(namecl, reader);
            }
            con.Close();

            return results;
        }
        public string getuserlogin()
        {
            HttpCookie login = HttpContext.Current.Request.Cookies["Memberston"];
            if (login != null)
                return login.Value.ToString();
            return "";
        }
        public string convertdate(string fm,string vl)
        {
            try
            {
                return DateTime.Parse(vl).ToString(fm);
            }
            catch
            {
                return "";
            }
        }
     
        public bool Executesql(string str)
        {
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection conn = new SqlConnection(cnn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(str, conn);
            cmd.ExecuteNonQuery();
            // Execute the command
            conn.Close();
            return true;
        }
 
        public int ExecutesqlAndgetId(string str,string table)
        {
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection conn = new SqlConnection(cnn);
            conn.Open();
            SqlCommand cmd = new SqlCommand(str, conn);
            cmd.ExecuteNonQuery();
            var newdata =getcolumndatatableSQL(table, "top 1 id", "order by id desc");
            int newrecord =int.Parse(newdata[0]["id"].ToString());
            // Execute the command
            conn.Close();
            return newrecord;
        }
        public Dictionary<string, object> SerializeRow(IEnumerable<string> cols, SqlDataReader reader)
        {
            var result = new Dictionary<string, object>();
            foreach (var col in cols)
            {
                try { result.Add(col, reader[col]); } catch { };
            }
            string rs = JsonConvert.SerializeObject(result);
            return result;
        }
        public List<Dictionary<string, object>> getdatatableSQL(string table, string where)
        {
            try
            {
                List<Dictionary<string, object>> results = new List<Dictionary<string, object>>();

                List<string> namecl = new List<string>();
                string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
                SqlConnection con = new SqlConnection(cnn);
                con.Open();
                string str = "select * from " + table + " " + where;
                SqlCommand sqlCommand = new SqlCommand(str, con);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                for (var i = 0; i < reader.FieldCount; i++)
                    namecl.Add(reader.GetName(i));
                while (reader.Read())
                {

                    results.Add(SerializeRow(namecl, reader));
                }
                con.Close();

                return results;
            }
            catch
            {
                return null;
            }

        }
        public List<Dictionary<string, object>> getdatatablejoinSQL(string sql)
        {

            List<Dictionary<string, object>> results = new List<Dictionary<string, object>>();

            List<string> namecl = new List<string>();
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
 
            SqlCommand sqlCommand = new SqlCommand(sql, con);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            for (var i = 0; i < reader.FieldCount; i++)
                namecl.Add(reader.GetName(i));
            while (reader.Read())
            {

                results.Add(SerializeRow(namecl, reader));
            }
            con.Close();

            return results;

        }
        public string countitem(string table,string where)
        {
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection conn = new SqlConnection(cnn);
            conn.Open();
            string str = "SELECT COUNT(id) FROM " + table + " " + where;
            SqlCommand sqlCommand = new SqlCommand(str, conn);
            Int32 count = Int32.Parse(sqlCommand.ExecuteScalar().ToString());
            conn.Close();
            return count.ToString();

        }
        public List<Dictionary<string, object>> getcolumndatatableSQL(string table, string column, string where)
        {

            List<Dictionary<string, object>> results = new List<Dictionary<string, object>>();

            List<string> namecl = new List<string>();
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection con = new SqlConnection(cnn);
            con.Open();
            string str = "select " + column + " from " + table + " " + where;
            SqlCommand sqlCommand = new SqlCommand(str, con);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            for (var i = 0; i < reader.FieldCount; i++)
                namecl.Add(reader.GetName(i));
            while (reader.Read())
            {

                results.Add(SerializeRow(namecl, reader));
            }
            con.Close();

            return results;

        }
        public string insertstr(string table,List<string> column,List<string> value)
        {
            column.Add("datecreate"); value.Add(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            column.Add("usercreate"); value.Add(getuserlogin());
            string str = "INSERT INTO";
            str += " " + table + "(";
            str += string.Join(",", column);
            str += ") values(";
            for (int i = 0; i < value.Count; i++)
            {
                if (value[i] == "")
                {
                    value[i] = "null";
                }
                else if (value[i].ToLower() == "true" || value[i].ToLower() == "false")
                {
                    value[i] = value[i];
                }
                else
                {
                    try
                    {
                        int.Parse(value[i]);
                    }
                    catch
                    {

                        value[i] = "N'" + value[i] + "'";
                    }
                }
            }
            str += string.Join(",", value) + ")";
            return str;
        }
        public string updatesqlOneItemstrfollowkey(string table, List<string> cl, List<string> vls,string key, string vl)
        {
            int idex = cl.IndexOf("id");
            if (idex > -1)
            {
                cl.RemoveAt(idex);
                vls.RemoveAt(idex);
            }
            for (var i = 0; i < vls.Count(); i++)
            {
                if (vls[i] == "")
                {
                    vls[i] = "null";
                }
                else if (vls[i].ToLower() == "true" || vls[i].ToLower() == "false")
                {
                    vls[i] = vls[i];
                }
                else
                {
                    try
                    {
                        int.Parse(vls[i]);
                    }
                    catch
                    {

                        vls[i] = "N'" + vls[i] + "'";
                    }
                }
            }
            string str = "Update " + table;
            str += " Set ";
            List<string> vlpass = new List<string>();
            for (int i = 0; i < cl.Count; i++)
            {
                string a = cl[i] + "=" + vls[i];
                vlpass.Add(a);
            }
            str += string.Join(",", vlpass);
            str += " where "+ key + "='" + vl + "'";
            return str;
        }
        public string updatesqlOneItemstr(string table, List<string> cl, List<string> vls, int id)
        {
            int idex = cl.IndexOf("id");
            if (idex > -1)
            {
                cl.RemoveAt(idex);
                vls.RemoveAt(idex);
            }
            for (var i = 0; i < vls.Count(); i++)
            {
                if (vls[i] == "")
                {
                    vls[i] = "null";
                }
                else if (vls[i].ToLower() == "true" || vls[i].ToLower() == "false")
                {
                    vls[i] = vls[i];
                }
                else
                {
                    try
                    {
                        int.Parse(vls[i]);
                    }
                    catch
                    {

                        vls[i] = "N'" + vls[i] + "'";
                    }
                }
            }
            string str = "Update " + table;
            str += " Set ";
            List<string> vlpass = new List<string>();
            for (int i = 0; i < cl.Count; i++)
            {
                string a = cl[i] + "=" + vls[i];
                vlpass.Add(a);
            }
            str += string.Join(",", vlpass);
            str += " where id='" + id + "'";
            return str;
        }
        public string getNewcode(string tb, string clselect, string ext, int minnumberzero, string where)
        {

            string rs = "";
            string s = ext;
            string cnn = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            SqlConnection conn = new SqlConnection(cnn);
            conn.Open();
            string str = "SELECT COUNT(" + clselect + ") FROM " + tb + " " + where;
            SqlCommand sqlCommand = new SqlCommand(str, conn);
            Int32 count = Int32.Parse(sqlCommand.ExecuteScalar().ToString());
            conn.Close();
            if (count <= 0)
            {

                for (int i = 0; i < minnumberzero - 1; i++)
                    s += "0";
                s = s + "1";
                rs = s;
            }
            else
            {
                int c = 0;
                count++;
                if (minnumberzero > count.ToString().Length)
                    c = minnumberzero - count.ToString().Length;
                for (int i = 0; i < minnumberzero - 1; i++)
                    s += "0";
                s = s + count.ToString();
                rs = s;

            }

            return rs;
        }
    }
}