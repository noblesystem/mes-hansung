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
            <div id="grid2"></div>
        </div>
    </form>
<script>
    var searchword = '';
    $(document).ready(function () {
        $("#grid2").kendoGrid({
            dataSource: {
                //data: user,
                schema: {
                    model: {
                        fields: {
                              userid: { type: "string" }
                            , usernm: { type: "string" }
                        }
                    }
                }
            },
            height: 550,
            scrollable: true,
            //sortable: true,
            //selectable: "cell",
            editable: true,
            columns: [
                  { field: "userid", title: "아이디", width: "130px" }
                , { field: "usernm", title: "사원명", width: "130px" }
            ],
            change: onChange,
            dataBound: function (e) {
               var grid = this;
               grid.tbody.find("tr").dblclick(function (e) {
                  var dataItem = grid.dataItem(this);
                });
            }
        });
        function onChange(e) {
              var cell = this.select();
              //alert(cell.
              //var cellIndex = cell[0].cellIndex;
              //var column = this.columns[cellIndex];
              //var dataItem = this.dataItem(cell.closest("tr"));
              //alert("Selected value " + dataItem[column.field]);
            //var selected = $.map(this.select(), function(item) {
            //    return $(item).text();
            //});

            //kendoConsole.log("Selected: " + selected.length + " item(s), [" + selected.join(", ") + "]");
        }

        //$('#grid tbody').on('click', 'tr', function () {
        //    var table = $('#grid').DataTable();
        //    var row = table.row(this).data();
        //    if ($(this).hasClass('selected')) {
        //        $(this).removeClass('selected');
        //    }
        //    else {
        //        table.$('tr.selected').removeClass('selected');
        //        $(this).addClass('selected');
        //    }
        //});
        $('#btnSearch').on('click', function () {
            fnSearch();
            //모든 데이타
            var displayedData = $("#grid2").data().kendoGrid.dataSource.view()
            alert(JSON.stringify(displayedData));
            
            var grid = $("#grid2").data("kendoGrid");
            //$("#grid2").data.dataSource.add({ userid: '10002', usernm: 'bbb' });
            //var dataSource = grid.dataSource;
            //var total = dataSource.data().length;
            //dataSource.insert(total, { userid: '10002', usernm: 'bbb' );
            //dataSource.page(dataSource.totalPages());
            //grid.editRow(grid.tbody.children().last());
        });
        $('#btnSelect').on('click', function () {
            //var table = $('#grid').DataTable();
            //var row = table.rows('.selected').data();
            //if (row.length == 0) {
            //    alert('선택된 사원이 없습니다');
            //    return;
            //}
            //var param = {};
            //param.userid = row[0]["userid"];
            //param.usernm = row[0]["usernm"];
            
            //opener.pop_result_user(param);
            //window.close();
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
                    $('#grid2').data('kendoGrid').dataSource.data(JSON.parse(data.d));
                    //alert($('#grid2').data('kendoGrid').dataSource.total());
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
