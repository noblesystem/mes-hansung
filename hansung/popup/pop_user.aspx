<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pop_user.aspx.cs" Inherits="hansung.popup.pop_user" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Gritter -->
    <link href="/css/kendo.common.min.css" rel="stylesheet" />
    <link href="/css/kendo.default.min.css" rel="stylesheet" />
    <link href="/css/kendo.default.mobile.min.css" rel="stylesheet" />

    <script src="/js/jquery-2.1.1.js"></script>
    <script src="/js/kendo.all.min.js"></script>    <script src="/js/nb_util.js"></script>    <script src="/js/jquery.form.zent.js"></script>    	<style>
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
    var searchword = '';
    var grid1;
    $(document).ready(function () {
        $("#grid1").kendoGrid({
            dataSource: {
                schema: {
                    model: {
                        fields: {
                              userid: { type: "string" }
                            , usernm: { type: "string" }
                        }
                    }
                }
            }
            , columns: [
                  { field: "userid", title: "아이디", width: "130px" }
                , { field: "usernm", title: "사원명", width: "130px" }
            ]
            , height: 550
            , resizable     : true  //컬럼넓이 조정
            , selectable    : "row" //row, multiple
            , scrollable    : true
            , dataBound     : function(e) {
                    var grid = this;
                    grid.tbody.find("tr").dblclick(function(e) {
                        var row = grid.dataItem(this);
                        var param = {};
                        param.userid = row.userid;
                        param.usernm = row.usernm;
                        opener.pop_result_user(param);
                        window.close();
                    });
			}
        });
        grid1 = $('#grid1').data('kendoGrid');

        $('#btnSearch').on('click', function () {
            fnSearch();
        });
        $('#btnSelect').on('click', function () {
            var grid = grid1;
            var rowid = grid.select().index();
            alert(rowid);
            var dataItem = grid.dataItem(grid.select());
            var param = {};
            param.userid = row.userid;
            param.usernm = row.usernm;
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
                    data = JSON.parse(data.d);

                    var grid = $('#grid1').data('kendoGrid');
                    grid.dataSource.data(data);
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
