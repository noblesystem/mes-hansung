<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page4-3.aspx.cs" Inherits="hansung.page4.page4_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">

        <ul class="ul-button" style="float: left">
            <!--<li>
                <div>
                    <input type="text" class="input-search" placeholder="발주 담당">
                </div>
            </li>
            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">검색</span></div>

                </div>
            </li>-->
        </ul>

        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>

            <li style="padding-right: 0">
                <div class="div-btn-header"><span class="span-title">Excel</span></div>
            </li>

        </ul>
         <table id="table"  class="table1 table-striped table-bordered" style="width:100%">

                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align:center">번호</th>
                                        <th scope="col">기간</th>
                                        <th scope="col">영업 담당</th>
                                        <th scope="col">
                                            계획 금액

                                        </th>
                                        <th scope="col">
                                            매출금액
                                        </th>
                                        <th scope="col">
                                            차액

                                        </th>
                                        <th scope="col">
                                            비율

                                        </th>
                                      
                                        <th scope="col">
                                            계획 적요

                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                      <%
                    int ordr = 1;
                    foreach (var i in mainData)
                    {%>
                <tr>
                    <td><%=ordr%></td>
                    <td class="time"><%=i["time"].ToString()%></td>
                    <td class="worker"><%=i["worker"].ToString()%></td>
                     <td class="money"><%=i["money"].ToString()%></td>
              <td class="totalamount"><%=String.Format("{0:0,0}", i["totalamount"])%></td>
                     <td class="different"><%=String.Format("{0:0,0}", i["different"])%></td>
                      <td class="ratio"><%=i["ratio"].ToString()%>%</td>
                      <td class="ratio"><%=i["remark"].ToString()%></td>
                </tr>
                <%} %>
                                </tbody>
                            </table>
    </div>

    <script>
         $(document).ready(function () {
             $('#table').DataTable({
                 "language": {
                     "search": ""
                 },
                 "pageLength": 25,
                 "order": [[1, "desc"]],
                 "scrollX": true,
                 "initComplete": function (settings, json) {
                     $('#table_filter input').addClass('form-control');
                     $("#table_filter input").attr("placeholder", "검색");
                 }
             });
         });

    </script>
</asp:Content>
