using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using hansung.datamoder;

//added by William 2019.06.06
namespace hansung
{
    public static class ExtensionMethods
    {
        private const string SpecialCharacters = @"%!@#$%^&*()?/>.<,:;'\|}]{[_~`+=-";
      
        public static bool HasSpecialCharacters(this string s)
        {
            return s.IndexOfAny(SpecialCharacters.ToCharArray()) != -1;
        }
        public static string TrimEx(this string s)
        {
            return s?.Trim() ?? "";
        }
        public static string TrimEx(this object s)
        {
            return s?.ToStringEx().Trim() ?? "";
        }
        public static string ToStringEx(this object s)
        {
            return s?.ToString() ?? "";
        }
        public static string TrimAll(this string s, char character)
        {
            return s?.TrimEnd(character).TrimStart(character) ?? "";
        }
        public static string TrimAll(this string s, string character)
        {
            return s?.TrimEnd(character.ToArray()).TrimStart(character.ToArray()) ?? "";
        }
        public static string TrimAll(this string s, char[] characters)
        {
            return s?.TrimEnd(characters).TrimStart(characters) ?? "";
        }
        public static bool IsEmptyEx(this string s)
        {
            return string.IsNullOrEmpty(s.TrimEx());
        }
        public static decimal ToDecimal(this object value)
        {
            if (value == null)
                return (decimal)0.0;

            return decimal.TryParse(value.TrimEx(), out var retValue) ? retValue : 0;
        }
        public static int ToInt(this object value)
        {
            if (value == null)
                return 0;

            return int.TryParse(value.TrimEx(), out var retValue) ? retValue : 0;
        }
        public static bool ToBoolean(this object value)
        {
            if (value == null) return false;
            return bool.TryParse(value.ToStringEx(), out var retValue) && retValue;
        }
        public static double ToDouble(this object value)
        {
            if (value == null)
                return 0.0;

            return double.TryParse(value.TrimEx(), out var retValue) ? retValue : 0;
        }
        public static long ToLong(this object value)
        {
            if (value == null)
                return 0;

            return long.TryParse(value.TrimEx(), out var retValue) ? retValue : 0;
        }
        public static T ToEnum<T>(this object value) where T : new()
        {
            if (!typeof(T).IsEnum)
                throw new NotSupportedException("T must be an Enum");

            try
            {
                return (T)Enum.Parse(typeof(T), value.ToString());
            }
            catch
            {
                return default(T); // equivalent to (T)0
            }
        }
        public static string RemoveAllBlank(this string s)
        {
            if (s.IsEmptyEx()) return s;

            var strOutput = s.ToCharArray()
                                .Where(c => c != ' ' && c != '\t' && c != '\r' && c != '\n')
                                .Aggregate("", (current, c) => current + c);
            return strOutput.TrimEx();
        }
        public static bool HasData<T>(this IEnumerable<T> source) => source != null && source.Any();
        public static double GetFileSize(this string filePath, ref string size)
        {
            string[] sizes = { "B", "KB", "MB", "GB", "TB" };
            double len = new FileInfo(filePath).Length;
            var order = 0;
            while (len >= 1024 && order < sizes.Length - 1)
            {
                order++;
                len = len / 1024;
            }

            size = sizes[order];
            return len;
        }

        public static bool IsRenderHtml(this List<ObjectPropertyPermission> permissionsByObjectName, string propertyName)
        {
            var t = permissionsByObjectName.Find(p =>
                string.Equals(p.PropertyName, propertyName,
                    StringComparison.CurrentCultureIgnoreCase) && p.IsAllowView);

            return t != null;
        }
    }
}