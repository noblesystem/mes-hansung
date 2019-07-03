<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page8-5.aspx.cs" Inherits="hansung.page8.page8_5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">

        <ul class="ul-button" style="float:left">

                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="고객사명">
                            </div>
                        </li>
                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="담당자">
                            </div>
                        </li>
                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="기간">
                            </div>
                        </li>
                        
                        <li>
                            <div>
                                <div class="div-btn-header"><span class="span-title">검색</span></div>

                            </div>
                        </li>
                    </ul>
        <ul class="ul-button" style="float:right">

                            <li>
                                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
                            </li>
                         
                            <li style="padding-right:0">
                                <div class="div-btn-header"><span class="span-title">Excel</span></div>
                            </li>
                      
                    </ul>
        <table class="responsive-table tabledata" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
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
                        <td td-type="<%=i%>"><%=i %></td>
                        <%} %>
                        <%} %>
                    </tr>
                    <%
                            order++;
                        } %>
                <tr>
                    <td colspan="2">합계	</td>
                    
                    <td></td>
                    <td></td>
                    <td></td>

                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>

                </tr>
               
            </tbody>
        </table>
    </div>
</asp:Content>
