<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page8-3.aspx.cs" Inherits="hansung.page8.page8_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tbdata {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        <ul class="ul-button" style="float: left">
            <li>
                <div style="margin-right: 10px;">
                    <asp:DropDownList ID="dropType" CssClass="select_search" runat="server">
                        <asp:ListItem disabled Selected hidden Value="-1">현황</asp:ListItem>
                        <asp:ListItem Value="1">판매현황</asp:ListItem>
                        <asp:ListItem Value="2">수금현황</asp:ListItem>
                        <asp:ListItem Value="3">구매현황</asp:ListItem>
                        <asp:ListItem Value="4">지급현황</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="영업 담당">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="창고명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="거래조건">
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

            <li>
                <div>
                    <div class="div-btn-header">
                        <asp:Button ID="Search" CssClass="btn-submit" runat="server" Text="검색" OnClick="Search_Click" />
                    </div>
                </div>
            </li>
        </ul>
        <ul class="ul-button" style="float: right">

            <li>
                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
            </li>
        </ul>

        <table class="responsive-table tabledata1" id="table1" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <%foreach (var i in clname1)
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
                        <%foreach (var i in clumn1)
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
            </tbody>
        </table>
        <table class="responsive-table tbdata tabledata2" id="table2" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <th scope="col" style="text-align: center">수금일자</th>
                    <th scope="col" style="text-align: center">영업 담당</th>
                    <th scope="col" style="text-align: center">고객사명</th>
                    <th scope="col" style="text-align: center">현금 수금액</th>
                    <th scope="col" style="text-align: center">어음 수금액</th>
                    <th scope="col" style="text-align: center">수수료/기타 할인</th>
                    <th scope="col" style="text-align: center">수금 합계</th>
                    <th scope="col" style="text-align: center">입금계좌/현금</th>
                    <th scope="col" style="text-align: center">수금 적요</th>

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

                </tr>

            </tbody>
        </table>
        <table class="responsive-table tbdata tabledata3" id="table3" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <th scope="col" style="text-align: center">전표 번호</th>
                    <th scope="col" style="text-align: center">발주 담당</th>
                    <th scope="col" style="text-align: center">거래사명</th>
                    <th scope="col" style="text-align: center">입고창고</th>
                    <th scope="col" style="text-align: center">품목명</th>
                    <th scope="col" style="text-align: center">규격</th>
                    <th scope="col" style="text-align: center">매수</th>
                    <th scope="col" style="text-align: center">수량(B)</th>
                    <th scope="col" style="text-align: center">단가</th>
                    <th scope="col" style="text-align: center">공급가액</th>
                    <th scope="col" style="text-align: center">부가세</th>
                    <th scope="col" style="text-align: center">합계 금액</th>
                    <th scope="col" style="text-align: center">TERMS</th>
                    <th scope="col" style="text-align: center">발주 비고</th>
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
                    <td></td>
                </tr>

            </tbody>
        </table>
        <table class="responsive-table tbdata tabledata4" id="table4" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <th scope="col" style="text-align: center">지급 일자</th>
                    <th scope="col" style="text-align: center">발주 담당</th>
                    <th scope="col" style="text-align: center">거래사명 </th>
                    <th scope="col" style="text-align: center">현금 지급액</th>
                    <th scope="col" style="text-align: center">어음 지급액</th>
                    <th scope="col" style="text-align: center">수수료/기타 할인</th>
                    <th scope="col" style="text-align: center">지급금 합계</th>
                    <th scope="col" style="text-align: center">지급계좌/현금</th>
                    <th scope="col" style="text-align: center">지급 적요</th>

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

                </tr>

            </tbody>
        </table>
    </div>
</asp:Content>
