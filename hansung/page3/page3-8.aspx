<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page3-8.aspx.cs" Inherits="hansung.page3.page3_8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button" style="float: left">
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="담당자">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" name="ctmsearch" placeholder="고객사명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="품목코드">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="기간">
                </div>
            </li>

            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title"><asp:Button ID="Button1" runat="server"   CssClass="span-title btn-submit" Text="검색" OnClick="Button1_Click" /></span></div>

                </div>
            </li>
        </ul>

        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>

        </ul>
        <table class="responsive-table tabledata" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번
                    </th>
                    <%foreach (var i in clname)
                        {%>
                    <th scope="col" style="text-align: center"><%=i %></th>
                    <%} %>
                </tr>
            </thead>

            <tbody>
                <%
                    int order = 1;
                    foreach (var o in mainData)
                    {%>
                <tr class="it-insert">
                    <td><%=order%></td>
                    <%foreach (var i in clumn)
                        {%>
                    <%try
                        { %>
                    <td td-type="<%=i%>"><%=o[i].ToString()%></td>
                    <%}
                        catch
                        { %>
                   
                    <%} %>
                    <%} %>
                </tr>
                <%
                        order++;
                    } %>
          
                <tr class="tr-total">
                    <td class="td-null">합계</td>
                    <td colspan="4"></td>
                    <td><%=String.Format("{0:0,0}", sumbox) %></td>
                    <td></td>
                     <td><%=String.Format("{0:0,0}", pricesupply) %></td>
                     <td><%=String.Format("{0:0,0}", vat) %></td>
                     <td><%=String.Format("{0:0,0}", totalamount) %></td>

                    <td colspan="2"></td>
                    <td><%=String.Format("{0:0,0}", total) %></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
