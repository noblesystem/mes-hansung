<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page7-3.aspx.cs" Inherits="hansung.page7.page7_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $(".sl-option").change(function () {
                var a = $(this).find(":selected");
                var ep1 = $(a).attr("epl1");
                var ep2 = $(a).attr("epl2");
           
                $(".eplone").html(ep1);
                $(".epltwo").html(ep2);
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">

        <ul class="ul-button" style="float: left">
            <li>
                <div class="div-btn-header"><span class="span-title">재고실사 전표</span></div>

            </li>
            <li>
                <select style="width: 100px; margin: 0 10px 10px 0; height: 34px; color: black;" class="sl-option">
                    <option></option>
                    <%foreach (var i in mainData)
                        {%>
                    <option epl1="<%=i["employeeone"].ToString() %>" epl2="<%=i["employeetwo"].ToString() %>"><%=i["inspnumber"].ToString() %></option>
                    <%} %>
                </select>

            </li>
            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">실사 담당1</span></div>
                    <div class="div-btn-header dv-text"><span class="eplone"></span></div>
                </div>
            </li>
            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">실사 담당1</span></div>
                    <div class="div-btn-header dv-text"><span class="epltwo"></span></div>
                </div>
            </li>
        </ul>

        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>
            <li>
                <div class="div-btn-header"><span class="span-title">선택 삭제</span></div>
            </li>

            <li style="padding-right: 0">
                <div class="div-btn-header"><span class="span-title">Excel</span></div>
            </li>

        </ul>
        <table id="table"  class="table1 table-striped table-bordered" style="width:100%">

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">번호</th>
                    <th scope="col">품목코드</th>
                    <th scope="col">품목명</th>
                    <th scope="col">규격
                    </th>
                    <th scope="col" style="text-align: center">매수</th>
                    <th scope="col" style="text-align: center">수량(B)</th>
                    <th scope="col" style="text-align: center">장부수량(B)</th>
                    <th scope="col" style="text-align: center">시리얼 No</th>
                    <th scope="col" style="text-align: center">정상/문제</th>
                    <th scope="col" style="text-align: center">불량 유형</th>
                    <th scope="col" style="text-align: center">항목 비고</th>
                    <th scope="col" style="text-align: center">위치</th>
                    <th scope="col" style="text-align: center">제조사</th>
                    <th scope="col" style="text-align: center">실사 비고</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
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
