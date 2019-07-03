﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page7-2.aspx.cs" Inherits="hansung.page7.page7_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">신규전표</span></div>
            </li>
            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>
            <li>
                <div class="div-btn-header"><span class="span-title">선택 삭제</span></div>
            </li>

        </ul>
        <table id="table"  class="table1 table-striped table-bordered" style="width:100%">

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <th scope="col">전표 번호</th>
                    <th scope="col">실사 담당1</th>
                    <th scope="col">실사 담당2
                    </th>
                    <th scope="col" style="text-align: center">실사 창고</th>
                    <th scope="col" style="text-align: center">실사 적요</th>

                </tr>
            </thead>

            <tbody>
               <%
                   int order = 1;
                   foreach (var i in mainData)
                   {%>
                    <tr>
                        <td><%=order %></td>
                        <td><%=i["inspnumber"].ToString() %></td>
                        <td><%=i["employeeone"].ToString() %></td>
                        <td><%=i["employeetwo"].ToString() %></td>
                        <td><%=i["warehousename"].ToString() %></td>
                        <td><%=i["remarks"].ToString() %></td>
                    </tr>
                <%}%>
            </tbody>
        </table>
    </div>
    <script>
         $(document).ready(function () {
             $('#table').DataTable({
                 "language": {
                     "search": ""
                 },
                 "order": [[1, "asc"]],
                 "scrollX": true,
                 "initComplete": function (settings, json) {
                     $('#table_filter input').addClass('form-control');
                     $("#table_filter input").attr("placeholder", "검색");
                 }
             });
         });

    </script>
</asp:Content>
