<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page8-4.aspx.cs" Inherits="hansung.page8.page8_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button" style="float: left">






            <li>
                <div>
                    <input type="text" class="input-search" placeholder="창고명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="품목명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="규격">
                </div>
            </li>
            <li>
                <div>

                    <input type="text" class="input-search" placeholder="정상/문제">
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
        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>

            <li style="padding-right: 0">
                <div class="div-btn-header"><span class="span-title">Excel</span></div>
            </li>

        </ul>
        <table class="responsive-table tabledata" >

            <thead>
                <tr>
                    <th rowspan="2" style="text-align: center">번호</th>
                    <th rowspan="2" style="text-align: center">전표번호</th>
                    <th rowspan="2" style="text-align: center">거래처</th>
                    <th rowspan="2" style="text-align: center">품목명</th>
                    <th rowspan="2" style="text-align: center">규격</th>
                    <th rowspan="2" style="text-align: center">매수</th>

                    <th colspan="3" style="text-align: center">인천 (I)</th>
                    <th colspan="3" style="text-align: center">김해 (B)</th>
                    <th colspan="3" style="text-align: center">전체	</th>

                </tr>

                <tr>
                    <th scope="col" style="text-align: center">입고 </th>
                    <th scope="col" style="text-align: center">출고 </th>
                    <th scope="col" style="text-align: center">재고 </th>

                    <th scope="col" style="text-align: center">입고</th>
                    <th scope="col" style="text-align: center">출고</th>
                    <th scope="col" style="text-align: center">재고</th>

                    <th scope="col" style="text-align: center">입고</th>
                    <th scope="col" style="text-align: center">출고</th>
                    <th scope="col" style="text-align: center">재고</th>
                </tr>


            </thead>

            <tbody>
                <%foreach (var i in mainDatabuy)
                    {
                        string wh = i["warehouse"].ToString();
                %>
                <tr wh="<%=wh %>">
                     <td></td>
                    <%foreach (var j in subcolumn)
                        {%>
                    <td><%=i[j].ToString() %></td>
                    <%} %>
                    <%for (var m = 1; m < 4; m++)
                        {
                            string vlrcv = "";
                            string inventory = "";
                            int kho = 1;
                            if (m > 1)
                                kho = 2;
                            if (wh == m.ToString())
                            {

                                vlrcv = i["quantityincase"].ToString();
                                inventory = i["inventory"+kho].ToString();
                            }
                            %>
                            <td><%=vlrcv %></td>
                            <td></td>
                            <td><%=inventory %></td>
                    <%} %>
                </tr>
                <%} %>
                 <%foreach (var i in mainDatasale)
                    {
                        string wh = i["warehouse"].ToString();
                %>
                <tr wh="<%=wh %>">
                    <td></td>
                    <%foreach (var j in subcolumnsale)
                        {%>
                    <td><%=i[j].ToString() %></td>
                    <%} %>
                    <%for (var m = 1; m < 4; m++)
                        {
                            string vlrcv = "";
                            if (wh == m.ToString())
                                vlrcv = i["qltincase"].ToString();
                            %>
                            <td></td>
                            <td><%=vlrcv %></td>
                            <td></td>
                    <%} %>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
