<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-8.aspx.cs" Inherits="hansung.page2.page2_8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">

        <ul class="ul-button" style="float: left">
            <li>
                <div>
                    <asp:DropDownList ID="dropType" CssClass="select_search" runat="server">

                        <asp:ListItem  class="op-default">내수</asp:ListItem>
                        <asp:ListItem>외수</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </li>

            <!--
            <li style="margin-left: 10px">
                <div>
                    <input type="text" class="input-search" placeholder="발주 담당">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="입고 창고">
                </div>
            </li>
            <li>
                <div>

                    <input type="text" class="input-search" placeholder="고객사명">
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
            -->
            <li style="margin-left: 10px">

                <div class="div-btn-header">
                    <asp:Button ID="Search" CssClass="btn-submit" runat="server" Text="검색" OnClick="Search_Click" />
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
        <div class="clear" style="display:<%=dl1%>">
          
            <table class="responsive-table tabledata" >

                <thead>
                    <tr>
                        <th>연번</th>
                        <%foreach (var i in clname1)
                            {%>
                        <th scope="col"><%=i %></th>
                        <%} %>
                    </tr>
                </thead>

                <tbody>
                    <%
                        int od = 1;
                        foreach (var o in mainData1)
                        {%>
                    <tr class="it-insert">
                        <td><%=od%></td>
                        <%foreach (var i in clumn1)
                            {%>
                        <%try
                            { %>
                        <td td-type="<%=i%>"><%=o[i].ToString()%></td>
                        <%}
                            catch
                            { %>
                        <td td-type="<%=i%>"><%=i%></td>
                        <%} %>
                        <%} %>
                    </tr>
                    <%
                            od++;
                        } %>
                </tbody>
            </table>
        </div>

        <div class="clear" style="display:<%=dl2%>">

        <table class="responsive-table tabledata2" style="font-size: 14px;">

            <thead>

                <tr>
                    <%foreach (var i in clname)
                        {%>
                    <th scope="col" class="class180"><%=i %></th>
                    <%}%>
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
            </tbody>
        </table>
            </div>
    </div>
</asp:Content>
