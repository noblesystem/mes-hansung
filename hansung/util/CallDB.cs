using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Xml;
using System.Data.SqlClient;
using System.Transactions;
using System.Collections.Generic;


namespace hansung
{
    /// <summary>
    /// ARPCallDB - DB 액세스용 클래스
    /// </summary>
    public class result 
    {
        public string code { get; set; }
        public string msg { get; set; }
        public string val { get; set; }
    }
    public class CallDB
    {
        public CallDB() { }


        #region//연결문자열
        private static string DBCONORASTR = "";
        private static string DBCONORASTR9 = "";
        private static string constr()
        {
            //연결문자열 설정
            DBCONORASTR = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            return DBCONORASTR;
        }
        private static string constr9() //테스트서버일 경우, 본서버아이피로 이동
        {
            //연결문자열 설정
            DBCONORASTR9 = System.Configuration.ConfigurationManager.ConnectionStrings["dataconnect"].ConnectionString;
            return DBCONORASTR9;
        }
        #endregion

        #region DataSet 함수
        public static bool ExistData(DataSet ds)
        {
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion
        /// ==========================================================================
        /// 
        /// + XML WITH QUERY
        /// 
        /// ==========================================================================
        #region width xml - getXmlTrans
        public static object getExcuteScalar(XmlDocument dom)
        {
            /*DB 처리*/
            DataSet ds = null;
            object obj = null;
            try
            {
                /*파라메터 생성*/
                int ParamCnt = dom.SelectSingleNode("//xmldata").ChildNodes[0].ChildNodes.Count;	//IN 파라메터 총갯수			
                string pPackageName = dom.SelectSingleNode("//xml/proc").InnerText;          //패키지명
                SqlParameter[] lac_Params = get_SqlParams(ParamCnt + 1);

                for (int i = 0; i < ParamCnt; i++)
                {
                    XmlNode node = dom.SelectSingleNode("//xml/xmldata").ChildNodes[0].ChildNodes[i];
                    string ItemName = node.Name;			//IN 파라메터 명
                    string ItemValue = node.InnerText;		//IN 파라메터 값
                    int ItemSize = ItemValue.Length;		//IN 파라메터 길이
                    if (ItemSize == 0) ItemSize = 1;

                    if (node.Attributes["coltype"].Value == "varchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "narchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.NVarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "char") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "int") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Int);
                    else if (node.Attributes["coltype"].Value == "numeric") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Float);
                    else if (node.Attributes["coltype"].Value == "datetime") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.DateTime);

                    if (node.Attributes["coltype"].Value == "int") ItemValue = ItemValue.Replace(",", "");
                    if (node.Attributes["coltype"].Value == "numeric") ItemValue = ItemValue.Replace(",", "");

                    if (node.Attributes["output"].Value == "output") lac_Params[i].Direction = ParameterDirection.Output;
                    if (node.Attributes["coltype"].Value == "int" && ItemValue == "") lac_Params[i].Value = null;
                    else if (node.Attributes["coltype"].Value == "numeric" && ItemValue == "") lac_Params[i].Value = null;
                    else lac_Params[i].Value = ItemValue;
                }
                if (dom.SelectNodes("//act").Count == 1 && dom.SelectSingleNode("//act").InnerText.ToLower() == "proc")
                    obj = SqlHelper.ExecuteScalar(constr(), CommandType.StoredProcedure, pPackageName, lac_Params); //프로시저
                else
                    obj = SqlHelper.ExecuteScalar(constr(), CommandType.Text, pPackageName, lac_Params); //프로시저
            }
            catch (Exception ex)
            {
                string str = ex.Message;
                //p_LogWrite(this.GetType().FullName, ex);
            }
            return obj;
        }

        public static DataTable getExecuteDataTable(XmlDocument dom)
        {
            /*DB 처리*/
            DataTable dt = null;
            try
            {
                /*파라메터 생성*/
                int ParamCnt = dom.SelectSingleNode("//xmldata").ChildNodes[0].ChildNodes.Count;	//IN 파라메터 총갯수			
                string pPackageName = dom.SelectSingleNode("//xml/proc").InnerText;          //패키지명
                SqlParameter[] lac_Params = get_SqlParams(ParamCnt + 1);

                for (int i = 0; i < ParamCnt; i++)
                {
                    XmlNode node = dom.SelectSingleNode("//xml/xmldata").ChildNodes[0].ChildNodes[i];
                    string ItemName = node.Name;			//IN 파라메터 명
                    string ItemValue = node.InnerText;		//IN 파라메터 값
                    int ItemSize = ItemValue.Length;		//IN 파라메터 길이
                    if (ItemSize == 0) ItemSize = 1;

                    if (node.Attributes["coltype"].Value == "varchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "narchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.NVarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "char") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "int") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Int);
                    else if (node.Attributes["coltype"].Value == "numeric") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Float);
                    else if (node.Attributes["coltype"].Value == "datetime") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.DateTime);

                    if (node.Attributes["coltype"].Value == "int") ItemValue = ItemValue.Replace(",", "");
                    if (node.Attributes["coltype"].Value == "numeric") ItemValue = ItemValue.Replace(",", "");

                    if (node.Attributes["output"].Value == "output") lac_Params[i].Direction = ParameterDirection.Output;
                    if (node.Attributes["coltype"].Value == "int" && ItemValue == "") lac_Params[i].Value = null;
                    else if (node.Attributes["coltype"].Value == "numeric" && ItemValue == "") lac_Params[i].Value = null;
                    else lac_Params[i].Value = ItemValue;
                }
                if (dom.SelectNodes("//act").Count == 1 && dom.SelectSingleNode("//act").InnerText.ToLower() == "proc")
                    dt = SqlHelper.ExecuteDataTable(constr(), CommandType.StoredProcedure, pPackageName, lac_Params); //프로시저
                else
                    dt = SqlHelper.ExecuteDataTable(constr(), CommandType.Text, pPackageName, lac_Params); //sql문자열
            }
            catch (Exception ex)
            {
                string str = ex.Message;
                //p_LogWrite(this.GetType().FullName, ex);
            }
            return dt;
        }

        public static DataSet getExecuteDataSet(XmlDocument dom)
        {
            /*DB 처리*/
            DataSet ds = null;
            try
            {
                /*파라메터 생성*/
                int ParamCnt = dom.SelectSingleNode("//xmldata").ChildNodes[0].ChildNodes.Count;	//IN 파라메터 총갯수			
                string pPackageName = dom.SelectSingleNode("//xml/proc").InnerText;          //패키지명
                SqlParameter[] lac_Params = get_SqlParams(ParamCnt + 1);

                for (int i = 0; i < ParamCnt; i++)
                {
                    XmlNode node = dom.SelectSingleNode("//xml/xmldata").ChildNodes[0].ChildNodes[i];
                    string ItemName = node.Name;			//IN 파라메터 명
                    string ItemValue = node.InnerText;		//IN 파라메터 값
                    int ItemSize = ItemValue.Length;		//IN 파라메터 길이
                    if (ItemSize == 0) ItemSize = 1;

                    if (node.Attributes["coltype"].Value == "varchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "narchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.NVarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "char") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.Attributes["size"].Value));
                    else if (node.Attributes["coltype"].Value == "int") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Int);
                    else if (node.Attributes["coltype"].Value == "numeric") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Float);
                    else if (node.Attributes["coltype"].Value == "datetime") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.DateTime);

                    if (node.Attributes["coltype"].Value == "int") ItemValue = ItemValue.Replace(",", "");
                    if (node.Attributes["coltype"].Value == "numeric") ItemValue = ItemValue.Replace(",", "");

                    if (node.Attributes["output"].Value == "output") lac_Params[i].Direction = ParameterDirection.Output;
                    if (node.Attributes["coltype"].Value == "int" && ItemValue == "") lac_Params[i].Value = null;
                    else if (node.Attributes["coltype"].Value == "numeric" && ItemValue == "") lac_Params[i].Value = null;
                    else lac_Params[i].Value = ItemValue;
                }
                if (dom.SelectNodes("//act").Count == 1 && dom.SelectSingleNode("//act").InnerText.ToLower() == "proc")
                    ds = SqlHelper.ExecuteDataset(constr(), CommandType.StoredProcedure, pPackageName, lac_Params); //프로시저
                else
                    ds = SqlHelper.ExecuteDataset(constr(), CommandType.Text, pPackageName, lac_Params); //sql문자열
            }
            catch (Exception ex)
            {
                string str = ex.Message;
                //p_LogWrite(this.GetType().FullName, ex);
            }
            return ds;
        }

        public static result getXmlTrans(XmlDocument dom)
        {
            //지역변수
            result result = new result();
            string ItemName = string.Empty;
            string ItemValue = string.Empty;
            int ItemSize = 0;
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    string pPackageName = dom.SelectSingleNode("//xml/proc").InnerText;	//패키지명
                    int ParamCnt = dom.SelectSingleNode("//xmldata").ChildNodes[0].ChildNodes.Count;	//파라미터 카운트
                    int RowCnt = dom.SelectNodes("//xmldata/zrow").Count;									//행의 카운트

                    SqlParameter[] lac_Params = get_SqlParams(ParamCnt + 3);
                    for (int k = 0; k < RowCnt; k++)
                    {
                        XmlNode node = dom.SelectSingleNode("//xml/xmldata").ChildNodes[k];

                        for (int i = 0; i < ParamCnt; i++)
                        {
                            ItemName = node.ChildNodes[i].Name;			    //IN 파라메터 명
                            ItemValue = node.ChildNodes[i].InnerText;		//IN 파라메터 값
                            ItemSize = ItemValue.Length;					//IN 파라메터 길이
                            if (ItemSize == 0) ItemSize = 1;

                            if (node.ChildNodes[i].Attributes["coltype"].Value == "varchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                            else if (node.ChildNodes[i].Attributes["coltype"].Value == "nvarchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.NVarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                            else if (node.ChildNodes[i].Attributes["coltype"].Value == "char") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                            else if (node.ChildNodes[i].Attributes["coltype"].Value == "int") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Int);
                            else if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Float);
                            else if (node.ChildNodes[i].Attributes["coltype"].Value == "datetime") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.DateTime);

                            if (node.ChildNodes[i].Attributes["output"].Value == "output") lac_Params[i].Direction = ParameterDirection.Output;

                            if (node.ChildNodes[i].Attributes["coltype"].Value == "int") ItemValue = ItemValue.Replace(",", "");
                            if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric") ItemValue = ItemValue.Replace(",", "");

                            if (node.ChildNodes[i].Attributes["coltype"].Value == "int" && ItemValue == "") lac_Params[i].Value = 0;
                            else if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric" && ItemValue == "") lac_Params[i].Value = 0;
                            else lac_Params[i].Value = ItemValue;
                        }
                        lac_Params[ParamCnt] = new SqlParameter("@vo_code", SqlDbType.VarChar, 2);
                        lac_Params[ParamCnt].Direction = ParameterDirection.Output;

                        lac_Params[ParamCnt + 1] = new SqlParameter("@vo_msg", SqlDbType.VarChar, 200);
                        lac_Params[ParamCnt + 1].Direction = ParameterDirection.Output;

                        lac_Params[ParamCnt + 2] = new SqlParameter("@vo_val", SqlDbType.VarChar, 200);
                        lac_Params[ParamCnt + 2].Direction = ParameterDirection.Output;

                        if (dom.SelectNodes("//act").Count == 1 && dom.SelectSingleNode("//act").InnerText.ToLower() == "proc")
                            SqlHelper.ExecuteScalar(constr(), CommandType.StoredProcedure, pPackageName, lac_Params); //프로시저
                        else
                            SqlHelper.ExecuteScalar(constr(), CommandType.Text, pPackageName, lac_Params); //프로시저


                        result.code = (string)lac_Params[ParamCnt].Value;
                        result.msg = (string)lac_Params[ParamCnt + 1].Value;
                        result.val = (string)lac_Params[ParamCnt + 2].Value;
                        if (!result.code.Equals("OK"))
                        {
                            throw new NullReferenceException();
                        }
                    }
                    scope.Complete();
                    return result;
                }
            }
            catch (Exception ex)
            {
                result.code = "N";
                result.msg = ex.Message; // ex.Message;
                result.val = ex.Message;
            }
            return result;
        }
        public static result getXmlTransAll(List<XmlDocument> domList)
        {
            //지역변수
            result result = new result();
            string ItemName = string.Empty;
            string ItemValue = string.Empty;
            int ItemSize = 0;
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    //-------------------------------------------------------------
                    // start : XMLDOM LOOP
                    //-------------------------------------------------------------
                    for(int x = 0; x < domList.Count; x++) {
                        XmlDocument dom = domList[x];
                        string pPackageName = dom.SelectSingleNode("//xml/proc").InnerText;	//패키지명
                        int ParamCnt = dom.SelectSingleNode("//xmldata").ChildNodes[0].ChildNodes.Count;	//파라미터 카운트
                        int RowCnt = dom.SelectNodes("//xmldata/zrow").Count;									//행의 카운트

                        SqlParameter[] lac_Params = get_SqlParams(ParamCnt + 3);
                        for (int k = 0; k < RowCnt; k++)
                        {
                            XmlNode node = dom.SelectSingleNode("//xml/xmldata").ChildNodes[k];

                            for (int i = 0; i < ParamCnt; i++)
                            {
                                ItemName = node.ChildNodes[i].Name;			    //IN 파라메터 명
                                ItemValue = node.ChildNodes[i].InnerText;		//IN 파라메터 값
                                ItemSize = ItemValue.Length;					//IN 파라메터 길이
                                if (ItemSize == 0) ItemSize = 1;

                                if (node.ChildNodes[i].Attributes["coltype"].Value == "varchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "nvarchar") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.NVarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "char") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.VarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "int") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Int);
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.Float);
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "datetime") lac_Params[i] = new SqlParameter(ItemName, SqlDbType.DateTime);

                                if (node.ChildNodes[i].Attributes["output"].Value == "output") lac_Params[i].Direction = ParameterDirection.Output;

                                if (node.ChildNodes[i].Attributes["coltype"].Value == "int") ItemValue = ItemValue.Replace(",", "");
                                if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric") ItemValue = ItemValue.Replace(",", "");

                                if (node.ChildNodes[i].Attributes["coltype"].Value == "int" && ItemValue == "") lac_Params[i].Value = 0;
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric" && ItemValue == "") lac_Params[i].Value = 0;
                                else lac_Params[i].Value = ItemValue;
                            }
                            lac_Params[ParamCnt] = new SqlParameter("@vo_code", SqlDbType.VarChar, 2);
                            lac_Params[ParamCnt].Direction = ParameterDirection.Output;

                            lac_Params[ParamCnt + 1] = new SqlParameter("@vo_msg", SqlDbType.VarChar, 200);
                            lac_Params[ParamCnt + 1].Direction = ParameterDirection.Output;

                            lac_Params[ParamCnt + 2] = new SqlParameter("@vo_val", SqlDbType.VarChar, 200);
                            lac_Params[ParamCnt + 2].Direction = ParameterDirection.Output;

                            if (dom.SelectNodes("//act").Count == 1 && dom.SelectSingleNode("//act").InnerText.ToLower() == "proc")
                                SqlHelper.ExecuteScalar(constr(), CommandType.StoredProcedure, pPackageName, lac_Params); //프로시저
                            else
                                SqlHelper.ExecuteScalar(constr(), CommandType.Text, pPackageName, lac_Params); //프로시저

                            result.code = (string)lac_Params[ParamCnt].Value;
                            result.msg = (string)lac_Params[ParamCnt + 1].Value;
                            result.val = (string)lac_Params[ParamCnt + 2].Value;
                            if (!result.code.Equals("OK"))
                            {
                                throw new NullReferenceException();
                            }
                        }
                    }
                    scope.Complete();
                    //-------------------------------------------------------------
                    // end : XMLDOM LOOP
                    //-------------------------------------------------------------
                    return result;
                }
            }
            catch (Exception ex)
            {
                result.code = "N";
                result.msg  = ex.Message; // ex.Message;
                result.val  = ex.Message;
            }

            return result;
        }
        public static result getXmlTransMulti(XmlDocument dom)
        {
            //지역변수
            //string[] Result = new string[3];
            result result = new result();
            string ItemName = string.Empty;
            string ItemValue = string.Empty;
            string TBLKEY = "";

            int ItemSize = 0;
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    XmlNodeList nodeSet = dom.SelectNodes("//xmltable");
                    for (int nLoop = 0; nLoop < dom.SelectNodes("//xmltable").Count; nLoop++)
                    {
                        string pPackageName = nodeSet[nLoop].SelectSingleNode("proc").InnerText;					//패키지명
                        int ParamCnt = nodeSet[nLoop].SelectSingleNode("xmldata").ChildNodes[0].ChildNodes.Count;	//파라미터 카운트
                        int RowCnt = nodeSet[nLoop].SelectSingleNode("xmldata").ChildNodes.Count;					//행의 카운트

                        SqlParameter[] lac_Params = get_SqlParams(ParamCnt + 3);
                        for (int k = 0; k < RowCnt; k++)
                        {
                            XmlNode node = nodeSet[nLoop].SelectSingleNode("xmldata").ChildNodes[k];
                            for (int i = 0; i < ParamCnt; i++)
                            {
                                ItemName = node.ChildNodes[i].Name;			//IN 파라메터 명
                                ItemValue = node.ChildNodes[i].InnerText;	//IN 파라메터 값
                                ItemSize = ItemValue.Length;	            //IN 파라메터 길이
                                if (ItemSize == 0) ItemSize = 1;
                                if (node.ChildNodes[i].Attributes["coltype"].Value == "varchar") lac_Params[i] = new SqlParameter("@" + ItemName, SqlDbType.VarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "char") lac_Params[i] = new SqlParameter("@" + ItemName, SqlDbType.VarChar, Int32.Parse(node.ChildNodes[i].Attributes["size"].Value));
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "int") lac_Params[i] = new SqlParameter("@" + ItemName, SqlDbType.Int);
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric") lac_Params[i] = new SqlParameter("@" + ItemName, SqlDbType.Float);
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "datetime") lac_Params[i] = new SqlParameter("@" + ItemName, SqlDbType.DateTime);

                                if (node.ChildNodes[i].Attributes["coltype"].Value == "int") ItemValue = ItemValue.Replace(",", "");
                                if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric") ItemValue = ItemValue.Replace(",", "");
                                lac_Params[i].Value = ItemValue;

                                if (ItemValue == "@tblkey@") ItemValue = TBLKEY;
                                //if (ItemSize == 0) ItemSize = 1;

                                //lac_Params[i] = new SqlParameter("@" + ItemName, SqlDbType.VarChar, ItemSize);
                                if (node.ChildNodes[i].Attributes["coltype"].Value == "int" && ItemValue == "") lac_Params[i].Value = null;
                                else if (node.ChildNodes[i].Attributes["coltype"].Value == "numeric" && ItemValue == "") lac_Params[i].Value = null;
                                else lac_Params[i].Value = ItemValue;
                            }
                            lac_Params[ParamCnt] = new SqlParameter("@vo_code", SqlDbType.VarChar, 2);
                            lac_Params[ParamCnt].Direction = ParameterDirection.Output;

                            lac_Params[ParamCnt + 1] = new SqlParameter("@vo_msg", SqlDbType.VarChar, 200);
                            lac_Params[ParamCnt + 1].Direction = ParameterDirection.Output;

                            lac_Params[ParamCnt + 2] = new SqlParameter("@vo_val", SqlDbType.VarChar, 200);
                            lac_Params[ParamCnt + 2].Direction = ParameterDirection.Output;

                            SqlHelper.ExecuteNonQuery(constr(), CommandType.Text, pPackageName, lac_Params);

                            result.code = (string)lac_Params[ParamCnt].Value;
                            result.msg  = (string)lac_Params[ParamCnt + 1].Value;
                            result.val  = (string)lac_Params[ParamCnt + 2].Value;
                            if (nLoop == 0)
                            {
                                TBLKEY = result.val;
                            }

                            if (!result.code.Equals("OK"))
                            {
                                throw new NullReferenceException();
                            }
                        }
                    }
                    scope.Complete();
                    return result;
                }
            }
            catch (Exception ex)
            {
                result.code = "N";
                result.msg  = ex.Message; // ex.Message;
                result.val  = ex.Message;
            }

            return result;
        }

        public static SqlParameter[] get_SqlParams(int avi_Length)
        {
            SqlParameter[] lac_Params = new SqlParameter[avi_Length];
            return lac_Params;
        }
        #endregion
        /// ==========================================================================
        /// 
        /// - XML WITH QUERY
        /// 
        /// ==========================================================================
        #region ExecuteNonQuery
        public static int ExeSQLNonQuery(string strSql)
        {
            int val;
            SqlConnection conn = new SqlConnection(constr());
            SqlCommand cmd = new SqlCommand(strSql, conn);

            try
            {
                val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                conn.Close();
            }
            catch (Exception e)
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                throw e;
            }
            return val;
        }

        #endregion

        #region ExecuteDataset
        /// <summary>
        /// ExeOraDataset - 주어진 쿼리문을 사용하여 데이타를 조회, 결과를 저장한 데이타셋을 반환한다.
        /// </summary>
        /// <param name="strSql">조회용 쿼리문</param>
        /// <returns>조회결과를 저장한 DataSet 개체를 반환한다</returns>
        public static DataSet ExeSQLDataset(string strSql)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(constr());
            SqlCommand cmd = new SqlCommand(strSql, conn);

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds);
                conn.Close();
            }
            catch (Exception e)
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                //throw e;
            }

            return ds;
        }
        #endregion

        #region ExcuteScalar
        public static object ExcuteScalar(string sQuery)
        {
            SqlConnection conn = new SqlConnection(constr());
            object o = SqlHelper.ExecuteScalar(conn, CommandType.Text, sQuery);
            return o;
        }
        #endregion

        #region ExecuteTran//성공여부를 리턴함
        /// <summary>
        /// ExecuteTran - 트랜젝션이 발생하는 쿼리문을 실행한다.
        /// </summary>
        /// <param name="strSql">트랜젝션이 발생하는 쿼리문</param>
        /// <returns>성공여부를 true(성공)/false(실패) 값으로 반환한다</returns>
        public static bool ExecuteTran(string strSql)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(constr());
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            SqlTransaction trans = conn.BeginTransaction();
            comm.Transaction = trans;
            try
            {
                comm.CommandText = strSql;
                comm.ExecuteNonQuery();
                DataSet ds = new DataSet();
                trans.Commit();
                result = true;
            }
            catch (Exception ex)
            {
                //ARPLog.AddLog(ex);
                //FileAgent.gWriteLog("E", strSql + ":" + ex.Message);
                trans.Rollback();
            }
            finally
            {
                trans.Dispose();
                conn.Close();
            }
            return result;
        }

        public static DataSet ExecuteTran(string strSql, out string vo_code, out string vo_msg)
        {
            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(constr());
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            SqlTransaction trans = conn.BeginTransaction();
            try
            {

                SqlParameter[] Params = new SqlParameter[2];
                Params[0] = new SqlParameter("vo_code", SqlDbType.VarChar, 2);
                Params[0].Direction = ParameterDirection.Output;
                Params[1] = new SqlParameter("vo_msg", SqlDbType.VarChar, 200);
                Params[1].Direction = ParameterDirection.Output;

                ds = SqlHelper.ExecuteDataset(trans, CommandType.Text, strSql, Params);
                trans.Commit();
                vo_code = Params[0].Value.ToString();
                vo_msg = Params[1].Value.ToString();
            }
            catch (Exception ex)
            {
                trans.Rollback();
                string str = ex.Message;
                //FileAgent.gWriteLog("E", strSql + ":" + ex.Message);
                vo_code = "N";
                vo_msg = ex.Message;
            }
            finally
            {
                trans.Dispose();
                conn.Close();
            }
            return ds;
        }



        /// <summary>
        /// ExecuteTran - 여러개의 트랜젝션이 발생하는 쿼리문을 실행한다
        /// </summary>
        /// <param name="strSql">트랜젝션이 발생하는 쿼리문의 배열</param>
        /// <returns>성공여부를 true(성공)/false(실패) 값으로 반환한다</returns>
        public static bool ExecuteTran(string[] strSql)
        {
            bool result = false;
            SqlConnection conn = new SqlConnection(constr());
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            SqlTransaction trans = conn.BeginTransaction();
            comm.Transaction = trans;
            try
            {
                for (int i = 0; i < strSql.Length; i++)
                {
                    if (strSql[i] != null)
                    {
                        comm.CommandText = strSql[i];
                        comm.ExecuteNonQuery();
                    }
                }
                trans.Commit();
                result = true;
            }
            catch (Exception ex)
            {
                //ARPLog.AddLog(ex);
                //FileAgent.gWriteLog("E", strSql + ":" + ex.Message);
                trans.Rollback();
            }
            finally
            {
                trans.Dispose();
                conn.Close();
            }
            return result;
        }

        /// <summary>
        /// ExecuteTran - 트랜젝션이 발생하는 프로시져을 실행한다.
        /// </summary> 
        /// <param name="strSql">트랜젝션이 발생하는 쿼리문</param>
        /// <param name="paramName">필드명</param>
        /// <param name="paramValue">필드값</param>
        /// <param name="paramType">필드 데이타 타입</param>
        /// <returns>성공여부를 true(성공)/false(실패) 값으로 반환한다</returns>
        public static bool ExecuteTranProcedure(string spName, string[] paramName, string[] paramValue)
        {
            bool result = false;

            SqlConnection conn = new SqlConnection(constr());
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            SqlTransaction trans = conn.BeginTransaction();
            SqlParameter param = new SqlParameter();

            for (int cnt = 0; cnt < paramValue.Length; cnt++)
            {
                param = null;
                param = new SqlParameter(paramName[cnt], SqlDbType.VarChar);  // 데이타 Type을 VarChar로 고정(TYPE을 받는 함수 Overloading해서 쓰면 될것 임)
                param.Direction = ParameterDirection.Input;
                comm.Parameters.Add(param);
                comm.Parameters[paramName[cnt]].Value = paramValue[cnt];
            }

            try
            {
                comm.CommandText = spName;
                comm.CommandType = CommandType.StoredProcedure;
                comm.ExecuteNonQuery();
                //trans.Commit();
                result = true;
            }
            catch (Exception ex)
            {
                //ARPLog.AddLog(ex);
                //FileAgent.gWriteLog("E", spName + ":" + ex.Message);
                trans.Rollback();
            }
            finally
            {
                trans.Dispose();
                conn.Close();
            }
            return result;
        }
        #endregion



    }
}
