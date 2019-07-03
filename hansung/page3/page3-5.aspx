<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page3-5.aspx.cs" Inherits="hansung.page3.page3_5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>조회</h2>
					

                         <ul class="ul-button" style="float: left">
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="담당자">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="창고">
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
        <table id="table" class="table1 table-striped table-bordered" style="width:100%">

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">연번</th>
                    <th scope="col">판매출고일

                    </th>
                    <th scope="col">영업 담당

                    </th>
                    <th scope="col">거래처 더존코드

                    </th>

                    <th scope="col">고객사명

                    </th>
                    <th scope="col">출고 창고

                    </th>

                    <th scope="col">품목더존코드

                    </th>
                    <th scope="col">품목명

                    </th>
                    <th scope="col">규격

                    </th>
                    <th scope="col">매수

                    </th>

                    <th scope="col">수량(BOX)

                    </th>
                    <th scope="col">단가

                    </th>
                    <th scope="col">공급가액

                    </th>
                    <th scope="col">부가세

                    </th>
                    <th scope="col">합계 금액

                    </th>
                </tr>
            </thead>

           <tbody>
  <%
                    int order = 1;
                    foreach (var o in mainData)
                    {%>
                <tr class="it-insert" >
                    <td><%=order%></td>
                    <%foreach (var i in cl)
                        {
                            string clas = "";
                            if (tdright.IndexOf(i) != -1)
                                clas = "class='td-right'";
                            %>
                    <td <%=clas %>><%=o[i].ToString()%></td>
                    <%} %>
                   
                </tr>
                <%
                        order++;
                    } %>
               <!-- <tr class="it-insert">
                    <td colspan="10" style="text-align:left">합계</td>
                   
                    
                    <td class="td-right"><%=sumbox%></td>
                    
                    <td></td>
                    
                    <td class="td-right"><%=String.Format("{0:0,0}",sumspprice)%></td>
                    
                    <td class="td-right"><%=String.Format("{0:0,0}",sumvat)%></td>
                    
                    <td class="td-right"><%=String.Format("{0:0,0}",sumtotal)%></td>
                    
                   
                </tr>-->
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
