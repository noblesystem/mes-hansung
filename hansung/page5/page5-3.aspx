<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page5-3.aspx.cs" Inherits="hansung.page5.page5_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button">
            <li class="li-right" style="float: right; padding-right: 0">
                <div>
                    <div class="div-btn-header"><span class="span-title">인쇄</span></div>
                </div>
            </li>

        </ul>
        <table id="table"  class="table1 table-striped table-bordered" style="width:100%">

            <thead>
                <tr>
                    <th scope="col" style="width: 60px; text-align: center">연번</th>
                    <th scope="col">전표 번호</th>
                    <th scope="col">이고 담당</th>

                    <th scope="col">출고창고</th>
                    <th scope="col">입고창고</th>
                    <th scope="col">이고입고확인</th>

                    <th scope="col">품목코드</th>
                    <th scope="col">품목명</th>
                    <th scope="col">규격</th>

                    <th scope="col">매수</th>
                    <th scope="col">수량(B)</th>
                    <th scope="col">시리얼 No</th>
                    <th scope="col">정상/문제</th>
                    <th scope="col">운송사</th>
                    <th scope="col">차량번호</th>
                    <th scope="col">운임</th>
                    <th scope="col">이고 비고</th>


                </tr>
            </thead>

            <tbody>
 <%
                    int ordr = 1;
                    foreach (var i in mainData)
                    {%>
                <tr codeid="<%=i["codeid"].ToString() %>">
                    <td><%=ordr%></td>
                    <td class="time"><%=i["codedate"].ToString()%></td>
               
                     <td class="money"><%=i["worker"].ToString()%></td>
                      <td><%=i["sendwarehouse"].ToString()%></td>
                     <td><%=i["rcvwarehouse"].ToString()%></td>
                     <td><%=i["verificatio"].ToString()%></td>
                     <td><%=i["itemcode"].ToString()%></td>
                     <td><%=i["nameitem"].ToString()%></td>
                     <td><%=i["standard"].ToString()%></td>
                     <td><%=i["qltincase"].ToString()%></td>
                     <td><%=i["qltbox"].ToString()%></td>
                     <td><%=i["serinum"].ToString()%></td>
                     <td><%=i["proplem"].ToString()%></td>
                     <td><%=i["company"].ToString()%></td>

                      <td><%=i["carnum"].ToString()%></td>
                     <td><%=i["transportfee"].ToString()%></td>
                     <td><%=i["remark"].ToString()%></td>
                  
                </tr>
                <%ordr++;
                    } %>
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
