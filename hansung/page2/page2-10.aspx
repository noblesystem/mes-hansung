<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-10.aspx.cs" Inherits="hansung.page2.page2_10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button" style="float: left">
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="발주 담당">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" name="ctmsearch" placeholder="거래사명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="거래조건">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder=" 품목 코드">
                </div>
            </li>

            <li>
                <div>

                    <input type="text" class="input-search" placeholder="기간">
                </div>
            </li>

            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">
                        <asp:Button ID="Button1" runat="server" CssClass="span-title btn-submit" Text="검색" OnClick="Button1_Click" /></span></div>

                </div>
            </li>
        </ul>
        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>

            <li style="padding-right: 0">
                <div class="div-btn-header"><span class="span-title">Excel</span></div>
            </li>

        </ul>

        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>

        </ul>
        <div class="clear">

            <table class="responsive-table tabledata2">
                <thead>
                    <tr>
                        <th scope="col" style="text-align: center">연번</th>
                       <%foreach (var i in clname)
                           {%>
                               <th scope="col" style="text-align: center"><%=i %></th>
                            <%}%>
                        <th></th>
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
                            <td><%=o[i].ToString()%></td>
                        <%}
                        catch
                        { %>
                       
                        <%} %>
                        <%} %>
                    </tr>
                    <%
                            order++;
                        } %>
                    <tr class="it-insert">
                        <td>합계</td>
                        
                        <td colspan="5"></td>
                         <td><%=qltcase %></td>
                        
                        <td colspan="3"></td>
             
                        <td><%=String.Format("{0:0,0}", totalamount) %></td>
                        
                        <td><%=String.Format("{0:0,0}", cashT_T) %></td>
                        
                        <td><%=String.Format("{0:0,0}", billL_C) %></td>
                        
                        <td td-type="feesmoney"></td>
                        
                        <td td-type="sumofpayments">0</td>
                        
                        <td td-type="total"><%=String.Format("{0:0,0}", total) %></td>
                        
                        <td td-type="remark"></td>
                        
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <script>
        $(document).ready(function () {

        });

    </script>
</asp:Content>
