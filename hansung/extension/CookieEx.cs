using System;
using System.IO;
using System.Text;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Net;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Security.Cryptography;

namespace hansung {
    public static class CookieEx
    {

        // string USER_ID = Request.GetCookie(USER_ID);
        /*
            Session["USER_CD"].ToString() ==> Request.GetUserCookie("USER_CD")
            Session["USER_ID"].ToString() ==> Request.GetUserCookie("USER_ID")
            Session["USER_NM"].ToString() ==> Request.GetUserCookie("USER_NM")
            Session["AUTH_ID"].ToString() ==> Request.GetUserCookie("AUTH_ID")
            Session["DEPT_NM"].ToString() ==> Request.GetUserCookie("DEPT_NM")
        */
        // HttpCookie cookie = tRequest.GetCookie();
        public static HttpCookie GetCookie(this HttpRequest Request)
        {
            if (Request.Cookies["user"] != null) { return Request.Cookies["user"]; }
            else { return null; }
        }
        public static string GetUserCookie(this HttpRequest Request, string cookieName)
        {
            string result = string.Empty;
            if (Request == null) {
                if (System.Web.HttpContext.Current.Request.Cookies["user"][cookieName] == null)
                {
                    result = "";
                }
                else {
                    result = System.Web.HttpContext.Current.Request.Cookies["user"][cookieName].ToString();
                }
                return result;
            }
            else {
                return GetCookie(Request, "user", cookieName);
            }
        }
        public static string GetCookie(this HttpRequest Request, string gu, string cookieName)
        {
            //USER_CD, USER_ID, USER_NM, AUTH_ID, DEPT_NM
            string result = string.Empty;
            if (Request.Cookies[gu] != null)
            {
                if (Request.Cookies[gu][cookieName] != null)
                {
                    result = Request.Cookies[gu][cookieName].ToString();
                }
            }
            return result;
        }


        //public static string GetUserCookie(this System.Web.HttpContext.Current request, string cookieName)
        //{
        //    return GetCookie(request, "user", cookieName);
        //}
        //public static string GetCookie(this System.Web.HttpContext request request, string gu, string cookieName)
        //{
        //    //USER_CD, USER_ID, USER_NM, AUTH_ID, DEPT_NM
        //    string result = string.Empty;
        //    if (request.Cookies[gu] != null)
        //    {
        //        if (request.Cookies[gu][cookieName] != null)
        //        {
        //            result = request.Cookies[gu][cookieName].ToString();
        //        }
        //    }
        //    return result;
        //}


    }
}