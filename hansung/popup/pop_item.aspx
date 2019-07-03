<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pop_item.aspx.cs" Inherits="hansung.popup.pop_item" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/19.1.4/css/dx.common.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/19.1.4/css/dx.light.css" />
    <script src="https://cdn3.devexpress.com/jslib/19.1.4/js/dx.all.js"></script>

    <script src="/js/nb_util.js"></script>    <script src="/js/jquery.form.zent.js"></script>    	<style>
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

            <div id="grid1"></div>
        </div>
    </form>
<script>
    $('#searchword').val('<%=searchword %>');
   
    $(document).ready(function () {
        var dataGrid = $("#grid1").dxDataGrid({
            columns: [
                  { dataField : "itemcd"    , caption : "품목코드"      , width : 100 }
                , { dataField : "itemnm"    , caption : "품목명"        , width : 100 }
                , { dataField : "eitemnm"   , caption : "품목명2"       , width : 100 }
                , { dataField : "spec"      , caption : "규격"          , width : 120 }
                , { dataField : "qty"       , caption : "매수"          , width : 100 }
                , { dataField : "unitprice" , caption : "단가"          , width : 100 }
                , { dataField : "sqm"       , caption : "sqm"           , width : 100 }
            ]
            , showColumnLines: true
            , showRowLines: true
            //, rowAlternationEnabled: true
            , showBorders: true
            , hoverStateEnabled: true
            , selection: { mode: "single" }
            , onRowDblClick: function(e) {
                if(e.data) {
                    opener.pop_result_item_grid(e.data);
                    window.close();
                }
                else {
                    if (row.length == 0) {
                        alert('선택된 품목이 없습니다');
                        return;
                    }
                }
            }
        }).dxDataGrid("instance");
        $('#grid1 tbody').on('click', 'tr', function () {
            var table = $('#grid1').DataTable();
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
            var table = $('#grid1').DataTable();
            var row = table.rows('.selected').data();
            if (row.length == 0) {
                alert('선택된 품목이 없습니다');
                return;
            }
            var param = {};
            opener.pop_result_item(row[0]);
            window.close();
        });
        $('#btnClose').on('click', function () {
            window.close();
        });
        function fnSearch() {
            var param = JSON.stringify({ searchword: $('#searchword').val() });
            $.ajax({
                type: "POST",
                url: "/websvc_common.asmx/search_item",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $("#grid1").dxDataGrid({ dataSource: JSON.parse(data.d) });
                },
                error: function (request, status, error) {
                    //alert(100);
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function fnSelect(param) {
            opener.pop_result_item_grid(param);
            window.close();
        }
        fnSearch();
    });
</script>

</body>
</html>
