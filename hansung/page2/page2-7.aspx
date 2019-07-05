﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-7.aspx.cs" Inherits="hansung.page2.page2_7" %>

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
                    <input type="text" class="input-search" placeholder="고객사명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="입고 창고">
                </div>
            </li>
            <li>
                <div>

                    <input type="text" class="input-search" placeholder="품목코드">
                </div>
            </li>
            <li>
                <div>

                    <input type="text" class="input-search" placeholder="거래조건">
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
                    <th scope="col" style="text-align: center">연번
                    </th>
                    <th scope="col">전표 번호
                    </th>
                    <th scope="col">입고창고
                    </th>
                    <th scope="col">발주 담당
                    </th>

                    <th scope="col">거래사명
                    </th>
                    <th scope="col">품목명
                    </th>

                    <th scope="col">규격
                    </th>
                    <th scope="col">매수
                    </th>
                    <th scope="col">매출재고
                    </th>
                    <th scope="col">실재고
                    </th>

                    <th scope="col">수량(B)
                    </th>
                    <th scope="col">수량(C)
                    </th>
                    <th scope="col">TERMS
                    </th>

                    <th scope="col">B/L no
                    </th>

                    <th scope="col">ETA
                    </th>
                    <th scope="col">통관 확인
                    </th>


                    <th scope="col">F/T
                    </th>
                    <th scope="col">PORT
                    </th>
                    <th scope="col">C/K
                    </th>
                    <th scope="col">선사
                    </th>

                    <th scope="col">입고확인
                    </th>
                    <th scope="col">발주 비고
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
                        {
                            try
                            {%>
                    
                            <td><%=o[i].ToString()%></td>
                    <%}
    catch
    { %>
                                <td><%=i%></td>
                       <% }
    }%>

                </tr>
                <%
                        order++;
                    } %>
          
            </tbody>
        </table>
    </div>
</asp:Content>