<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pop_user.aspx.cs" Inherits="hansung.popup.pop_user" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Toastr style -->
    <link href="/css/plugins/toastr/toastr.min.css" rel="stylesheet" />

    <!-- Gritter -->
    <link href="/js/plugins/gritter/jquery.gritter.css" rel="stylesheet" />    <link href="/css/jquery-ui.css?v=1.0.0" rel="stylesheet" />    <link href="/css/animate.css" rel="stylesheet" /><%--    <link href="/css/style.css?v=1.0.0" rel="stylesheet" />    <link href="/css/mycss.css?v=1.5.1" rel="stylesheet" />--%>    <link href="/css/plugins/dataTables/jquery.dataTables.min.css" rel="stylesheet" />    <link href="/css/plugins/easyui/theme/meterial/easyui.css" rel="stylesheet" />    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />    <link href="https://cdn.datatables.net/1.10.19/css/dataTables.jqueryui.min.css" rel="stylesheet" />    <link href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.jqueryui.min.css" rel="stylesheet" />    <link href="/css/reponsivetable.css?v=1.0.3" rel="stylesheet" />
    <script src="/js/jquery-2.1.1.js"></script>
    <script src="/Scripts/jquery-ui.js"></script>
    <script src="/js/datajss.js?v=1.2.4"></script>
    <script src="/js/addrowtable.js?v=1.1.9"></script>
    <script src="/js/JsClient.js?v=1.3.0"></script>
    <script src="/js/jquery.table2excel.js"></script>
    <script src="/js/calculatorBill.js?v=1.0.5"></script>
    <script src="/js/mainjs.js?v=1.8.1"></script>
    <script src="/js/ships.js?v=1.4.1"></script>
    <script src="/js/jQuery.print.js"></script>
    <script src="/js/jquery.chromatable.js"></script>
    <script src="/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/js/plugins/easyui/jquery.easyui.min.js"></script>
    <script src="/js/plugins/jquery.cookie.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
	<link href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css" rel="stylesheet" />    <script src="../js/nb_util.js"></script>    <script src="../js/jquery.form.zent.js"></script>    	<style>
	div.dt-buttons{
		position:relative;
		float:right;
		margin-left: 20px;
	}
	.dt-button{
		height:33px;
	}
	.buttons-copy {
	    margin-left: 15px;
	}
	</style>
    
    <style>
        .btn-popup {
            width: 30%
        }
        .ui-autocomplete {
			z-index:999999;
		}
    </style></head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="text" value="" id="searchword" />
            <input type="button" value="조회" id="btnSearch" />
            <input type="button" value="선택" id="btnSelect" />
            <input type="button" value="닫기" id="btnClose" />

            <table id="grid" class="grid table-striped table-bordered"  style="width:100%">
            <thead>
                <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">이름</th>
                </tr>
            </thead>
            <tbody></tbody>
            </table>
        </div>
    </form>
<script>
    var searchword = '<%=searchword %>';
    $(document).ready(function () {
        $('#grid').DataTable({
            columns: [
                  { data: "userid" }
                , { data: "usernm" }
            ],
            "language": {
                "search": ""
            },
            "order": [[1, "desc"]],
            "scrollX": true,
            "initComplete": function (settings, json) {
                $('#grid_filter input').addClass('form-control');
                $("#grid_filter input").attr("placeholder", "검색");
            }
        });
        $('#grid tbody').on('click', 'tr', function () {
            var table = $('#grid').DataTable();
            var row = table.row(this).data();
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        });
        $('#btnSearch').on('click', function () {
            fnSearch();
        });
        $('#btnSelect').on('click', function () {
            var table = $('#grid').DataTable();
            var row = table.rows('.selected').data();
            if (row.length == 0) {
                alert('선택된 사원이 없습니다');
                return;
            }
            var param = {};
            param.userid = row[0]["userid"];
            param.usernm = row[0]["usernm"];
            
            opener.pop_result_user(param);
            window.close();
        });
        $('#btnClose').on('click', function () {
            window.close();
        });
        function fnSearch() {
            var param = JSON.stringify({ searchword: $('#searchword').val() });
            $.ajax({
                type: "POST",
                url: "/websvc_common.asmx/search_user",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var myTable = $('#grid').DataTable();
                    myTable.clear().rows.add(JSON.parse(data.d)).draw();
                },
                error: function (request, status, error) {
                    //alert(100);
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function fnSelect(param) {
            opener.pop_result_user(param);
            window.close();
        }
        fnSearch();
    });
</script>

</body>
</html>
