<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page3-6.aspx.cs" Inherits="hansung.page3.page3_6" %>

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
                    <input type="text" class="input-search" placeholder="고객사명">
                </div>
            </li>
            <li>
                <div>
                    <input type="text" class="input-search" placeholder="담당자">
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
                   <%foreach (var i in clname)
                       {%>
                              <th scope="col" style="text-align: center"><%=i %></th>
                        <%} %>

                </tr>
            </thead>

            <tbody>
                
                <%
                    int order = 1;
                    foreach (var o in mainData)
                    {
                        
                        %>
                <tr class="it-insert">
                    <td><%=order%></td>
                    <%foreach (var i in clumn)
                        {
                             string clas = "";
                            if (tdright.IndexOf(i) != -1)
                                clas = "class='td-right'";
                            %>
                    <%try
                        { %>
                    <td td-type="<%=i%>" <%=clas %>><%=o[i].ToString()%></td>
                    <%}
                        catch
                        { %>
                   
                    <%} %>
                    <%} %>
                </tr>
                <%
                        order++;
                    } %>
          
              
                <!--<tr class="tr-total">
                    <td colspan="2" class="td-null">합계</td>
                    <td colspan="2"></td>
                    <td><%=String.Format("{0:0,0}", cashT_T) %></td>
                    <td><%=String.Format("{0:0,0}", billL_C) %></td>
                    <td><%=String.Format("{0:0,0}", feesmoney) %></td>
                    <td><%=String.Format("{0:0,0}", sumofpayments) %></td>
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
