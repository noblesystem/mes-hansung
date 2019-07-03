<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-3.aspx.cs" Inherits="hansung.page2.page2_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>조회</h2>
					<!--
                        <ul class="ul-button" style="float: left">
                            <li>
                                <div>
                                    <input type="text" class="input-search" placeholder="발주 담당">
                                </div>
                            </li>
                            <li>
                                <div>
                                    <input type="text" class="input-search" placeholder="입고 창고">
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

                        -->
                        <ul class="ul-button" style="float: right">

                            <li>
                                <div class="div-btn-header"><span class="span-title">인쇄</span></div>
                            </li>

                            <li style="padding-right: 0">
                                <div class="div-btn-header"><span class="span-title">Excel</span></div>
                            </li>

                        </ul>
<!-- 전표리스트 ==================================================================================== -->
                                <table id="grid1"></table>
                                <div id="grid1_pager"></>
                        <table id="table" class="table1 table-striped table-bordered tabledata" >
                            <thead>
                                <tr>
                                    <th scope="col" style="text-align: center">연번</th>
                                    <th scope="col">전표 번호</th>
                                    <th scope="col">발주 담당</th>
                                    <th scope="col">거래사명</th>

                                    <th scope="col">입고창고</th>
                                    <th scope="col">P/I date</th>

                                    <th scope="col">입항예정일</th>
                                    <th scope="col">통관 예정일</th>
                                    <th scope="col">통관 확인</th>
                                    <th scope="col">품목명</th>

                                    <th scope="col">규격</th>
                                    <th scope="col">매수</th>
                                    <th scope="col">수량(B)</th>

                                    <th scope="col">SQM</th>


                                    <th scope="col">단가</th>
                                    <th scope="col">공급가액</th>
                                    <th scope="col">부가세</th>
                                    <th scope="col">합계 금액</th>


                                    <th scope="col">P/I no </th>
                                    <th scope="col">ETD 출예
                                    </th>
                                    <th scope="col">ETA 입예</th>
                                    <th scope="col">PORT</th>

                                    <th scope="col">L/C NO</th>
                                    <th scope="col">TERMS</th>
                                    <th scope="col">L/C T/T date</th>
                                    <th scope="col">C/K</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%  int order = 1;
                                    foreach (var o in mainData)
                                    {%>
                                <tr class="it-insert" accbank="<%=o["warehouse"].ToString() %>" codeid="<%=o["codeid"].ToString() %>">
                                    <td><%=order%></td>
                                    <td><%=o["ordernumber"].ToString() %></td>
                                    <td><%=o["orderingemployer"].ToString() %></td>
                                    <td><%=o["tradingmission"].ToString() %></td>
                                    <td><%=o["namewarehouse"].ToString() %></td>
                                    <td><%=o["contractdate"].ToString() %></td>
                                    <td><%=o["datebeginpayment"].ToString() %></td>
                                    <td><%=o["dateclearance"].ToString() %></td>
                                    <td><%=o["customsday"].ToString() %></td>
                                    <td><%=o["nameitem"].ToString() %></td>
                                    <td><%=o["standard"].ToString() %></td>
                                    <td><%=o["quantityincase"].ToString() %></td>
                                    <td><%=o["qltcase"].ToString() %></td>
                                    <td class="td-right"><%=String.Format("{0:0,0}",o["sqm"]) %></td>
                                    <td class="td-right"><%=String.Format("{0:0,0}",o["price"]) %></td>
                                    <td class="td-right"><%=String.Format("{0:0,0}",o["pricesupply"]) %></td>
                                    <td class="td-right"><%=String.Format("{0:0,0}",o["vat"]) %></td>
                                    <td class="td-right"><%=String.Format("{0:0,0}",o["totalamount"]) %></td>
                                    <td><%=o["note"].ToString() %></td>

                                      <td><%=o["departuredate"].ToString() %></td>
                                      <td><%=o["dateofarrival"].ToString() %></td>
                                     <td><%=o["port"].ToString() %></td>
                                       <td><%=o["note"].ToString() %></td>
                                        <td><%=o["terms"].ToString() %></td>
                                        <td><%=o["datebeginpayment"].ToString() %></td>
                                     <td><%=o["sizefit"].ToString() %></td>
                 
                                </tr>
                                <%
                                        order++;
                                    } %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th scope="col" style="text-align: center">연번</th>
                                    <th scope="col">전표 번호</th>
                                    <th scope="col">발주 담당</th>
                                    <th scope="col">거래사명</th>

                                    <th scope="col">입고창고</th>
                                    <th scope="col">P/I date</th>

                                    <th scope="col">입항예정일</th>
                                    <th scope="col">통관 예정일</th>
                                    <th scope="col">통관 확인</th>
                                    <th scope="col">품목명</th>

                                    <th scope="col">규격</th>
                                    <th scope="col">매수</th>
                                    <th scope="col">수량(B)</th>

                                    <th scope="col">SQM</th>


                                    <th scope="col">단가</th>
                                    <th scope="col">공급가액</th>
                                    <th scope="col">부가세</th>
                                    <th scope="col">합계 금액</th>


                                    <th scope="col">P/I no </th>
                                    <th scope="col">ETD 출예
                                    </th>
                                    <th scope="col">ETA 입예</th>
                                    <th scope="col">PORT</th>

                                    <th scope="col">L/C NO</th>
                                    <th scope="col">TERMS</th>
                                    <th scope="col">L/C T/T date</th>
                                    <th scope="col">C/K</th>
                                </tr>
                            </tfoot>
                        </table>

				    </div>
			    </div>
		    </div>
	    </div> 
    </div>


    <script>
        $(document).ready(function () {
           // addrow("tabledata", 12);

           // var tr = "<tr class='tr-total'><td colspan='8' class='td-null'>합계</td><td colspan='2'></td><td></td><td></td><td class='td-right'><%=String.Format("{0:0,0}",sumbox)%></td><td class='td-right'><%=String.Format("{0:0,0}",sumsqm)%></td><td></td><td class='td-right'><%=String.Format("{0:0,0}",sumspprice)%></td><td class='td-right'><%=String.Format("{0:0,0}",sumvat)%></td><td class='td-right'><%=String.Format("{0:0,0}",sumtotal)%></td><td colspan='8' class='td-null'></td></td>";
           // $(tr).appendTo(".tabledata tbody");
            $('#table').DataTable({
                "language": {
                    "search": ""
                },
                "pageLength": 25,
                "order": [[0, "desc"]],
                "scrollX": true,
                "initComplete": function (settings, json) {
                    $('#table_filter input').addClass('form-control');
                    $("#table_filter input").attr("placeholder", "검색");

                    this.api().columns().every(function () {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo($(column.footer()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
                }
            });
        });
    </script>
</asp:Content>
