using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;

using System.Data.SqlClient;
using System.Xml;
using System.Collections;

namespace hansung
{
    public class FormManager
    {
        // output 없는 int 노드
        public void icnitMakeNode(XmlDocument xmldoc, XmlNode nodeset, string coltype, string nodenm, string nodeval)
        {
            icnitMakeNode(xmldoc, nodeset, coltype, nodenm.Replace(" ", ""), nodeval, "", "");
        }
        // output 없는 노드
        public void icnitMakeNode(XmlDocument xmldoc, XmlNode nodeset, string coltype, string nodenm, string nodeval, string size)
        {
            icnitMakeNode(xmldoc, nodeset, coltype, nodenm.Replace(" ", ""), nodeval, size, "");
        }
        public void icnitMakeNode(XmlDocument xmldoc, XmlNode nodeset, string coltype, string nodenm, string nodeval, string size, string output)
        {
            try
            {
                XmlNode node = xmldoc.CreateNode(XmlNodeType.Element, nodenm.Replace(" ", ""), "");
                /*
                 * if (coltype == "int" && nodeval == "")
                {
                    node.InnerText = "";
                }
                else
                {
               
                }
                 * */
                if (coltype.ToLower() == "varchar" && nodeval == null)
                {
                    nodeval = "";
                }
                node.InnerText = nodeval.Trim();
                XmlAttribute attr1 = xmldoc.CreateAttribute("coltype");
                attr1.Value = coltype;
                node.Attributes.Append(attr1);
                XmlAttribute attr2 = xmldoc.CreateAttribute("output");
                attr2.Value = output;
                node.Attributes.Append(attr2);
                XmlAttribute attr3 = xmldoc.CreateAttribute("size");
                attr3.Value = size;
                node.Attributes.Append(attr3);
                nodeset.AppendChild(node);
            }
            catch
            {
            }
        }

    }
}
