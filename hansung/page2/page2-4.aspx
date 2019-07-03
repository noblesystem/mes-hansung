﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-4.aspx.cs" Inherits="hansung.page2.page2_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
        
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>조회</h2>
					
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
                        <table id="table" class=" table-striped table-bordered" >

                            <thead>
                                <tr>
                                    <th scope="col" style="text-align: center">연번</th>
                                    <th scope="col">전표 번호</th>
                                    <th scope="col">거래사명</th>
                                    <th scope="col">P/I date</th>

                                    <th scope="col">통관 예정일</th>
                                    <th scope="col">품목명</th>

                                    <th scope="col">규격</th>
                                    <th scope="col">매수</th>
                                    <th scope="col">수량(B)</th>
                                    <th scope="col">SQM</th>

                                    <th scope="col">수량(C)</th>
                                    <th scope="col">단가</th>
                                    <th scope="col">공급가액</th>

                                    <th scope="col">부가세</th>


                                    <th scope="col">합계 금액</th>
                                    <th scope="col">P/I no </th>
                                    <th scope="col">B/L no</th>
                                    <th scope="col">SD</th>


                                    <th scope="col">ETD</th>
                                    <th scope="col">ETA
                                    </th>
                                    <th scope="col">F/T</th>
                                    <th scope="col">PORT</th>

                                    <th scope="col">L/C NO</th>
                                    <th scope="col">TERMS</th>
                                    <th scope="col">Payment</th>
                                    <th scope="col">선사</th>

                                    <th scope="col">원산지 증명</th>
                                    <th scope="col">C/K</th>
                 
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    int order = 1;
                                    foreach (var o in mainData)
                                    {%>
                                <tr class="it-insert">
                                    <td><%=order%></td>
                                    <td><%=o["ordernumber"].ToString() %></td>
                                    <td><%=o["namectm"].ToString() %></td>
                                    <td><%=o["contractdate"].ToString() %></td>
                                    <td><%=o["dateclearance"].ToString() %></td>
                                    <td><%=o["itemname"].ToString() %></td>
                                    <td><%=o["standard"].ToString() %></td>
                                    <td><%=o["quantityincase"].ToString() %></td>
                                    <td><%=o["qltcase"].ToString() %></td>
                                    <td><%=o["sqm"].ToString() %></td>
                                   <td><%=o["qltcontainer"].ToString() %></td>
                                     <td><%=String.Format("{0:0,0}",o["price"]) %></td>
                                    <td><%=String.Format("{0:0,0}",o["pricesupply"]) %></td>
                                    <td><%=String.Format("{0:0,0}",o["vat"]) %></td>
                                    <td><%=String.Format("{0:0,0}",o["totalamount"]) %></td>

                                    <td><%=o["remark"].ToString() %></td>

                                    <td><%=o["numbership"].ToString() %></td>
                                    <td><%=o["duedate"].ToString() %></td>
                                    <td><%=o["departuredate"].ToString() %></td>
                                    <td><%=o["dateofarrival"].ToString() %></td>
                                    <td><%=o["conDuedate"].ToString() %></td>

                                     <td><%=o["port"].ToString() %></td>
                                    <td><%=o["note"].ToString() %></td>
                                    <td><%=o["terms"].ToString() %></td>
                                    <td><%=o["paymentoption"].ToString() %></td>
                                    <td><%=o["nameshipname"].ToString() %></td>
                                    <td><%=o["daycertificate"].ToString() %></td>
                                    <td><%=o["sizefit"].ToString() %> fit</td>
                    
                                </tr>
                                <%
                                        order++;
                                    } %>

                                
                            </tbody>
                        </table>

				    </div>
			    </div>
		    </div>
	    </div> 
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
