<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page6-4.aspx.cs" Inherits="hansung.page6.page6_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button">
            <li class="li-right" style="float: right; padding-right: 0">
                <div>

                    <div class="div-btn-header"><span class="span-title">인쇄</span></div>
                    <div class="div-btn-header"><span class="span-title">선택 삭제</span></div>

                </div>
            </li>

        </ul>
         <table id="table"  class="table1 table-striped table-bordered" style="width:100%">

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <th scope="col">전표 번호
                    </th>
                    <th scope="col">대체처리담당
                    </th>
                    <th scope="col">대체처리창고
                    </th>
                    <th scope="col" style="text-align: center">대체처리 승인
                    </th>
                    <th scope="col" style="text-align: center">품목코드</th>

                    <th scope="col" style="text-align: center">품목명</th>
                    <th scope="col" style="text-align: center">규격</th>

                    <th scope="col" style="text-align: center">매수</th>
                    <th scope="col" style="text-align: center">수량(B)</th>
                    <th scope="col" style="text-align: center">시리얼 No</th>

                    <th scope="col" style="text-align: center">대체품목 항목비고

                    </th>
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
                <!--
                <tr class="tr-total">
                    <td colspan="9" class="td-null">합계</td>
                    <td><%=sumbox %></td>
                    <td colspan="4" class="td-null"></td>
                </tr>
                -->
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
