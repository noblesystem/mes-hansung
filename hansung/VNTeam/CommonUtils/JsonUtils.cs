using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

//added by William 2019.06.06
namespace hansung
{
    public static class JsonUtils<T> where T : class
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            Formatting = Formatting.None,
            NullValueHandling = NullValueHandling.Ignore,
            //MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            //DateParseHandling = DateParseHandling.None,
            PreserveReferencesHandling = PreserveReferencesHandling.Objects,
            ReferenceLoopHandling = ReferenceLoopHandling.Serialize
        };

        public static List<T> ToObject(string json) => JsonConvert.DeserializeObject<List<T>>(json, Settings);
        public static string ToJson(List<T> lst) => JsonConvert.SerializeObject(lst, Settings);
        public static string ToJson(T obj) => JsonConvert.SerializeObject(obj, Settings);
    }
}
