<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-2.aspx.cs" Inherits="hansung.page2.page2_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2> 조회</h2>
<!-- 전표리스트 ==================================================================================== -->
                        <div id="grid1"></div>
				    </div>
			    </div>
		    </div>
	    </div> 
    </div>

    <script>
        function page22_pop(jpno) {
            alert(jpno);
            var popUrl = "/page2/page2-2-pop.aspx?jpno=" + jpno;
            var popOption = "width=800, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
            var page22pop = window.open(popUrl, "page22pop", popOption);
            if (page22pop) page22pop.focus();
        }

        var grid1; var i ;
        $(document).ready(function () {
            grid1 = $("#grid1").dxDataGrid({
                columns: [
                    { 
                        width: "auto", 
                        cellTemplate: function(container, options) { 
                            //container.text(dataGrid.pageIndex() * dataGrid.pageSize() + options.rowIndex); 
                            //var totCount = this.totalCount();
                            container.text(options.rowIndex + 1); 
                        } 
                    }
                    , { dataField :	"jpno"       , caption : '전표번호'		, width : 100 }
                    , { dataField :	"gucd"       , caption : '구분'			, width : 100 }
                    , { dataField :	"chasu"      , caption : '차수'			, width : 100 }
                    , { dataField :	"cjpno"      , caption : '공통전표'		, width : 100 }
                    , { dataField :	"termcd"     , caption : 'TERMS'		, width : 100 }
                    , { dataField :	"usernm"     , caption : '발주담당'		, width : 100 }
                    , { dataField :	"custnm"     , caption : '거래사명'		, width : 100 }
                    , { dataField :	"whnm"       , caption : '입고창고'		, width : 100 }
                    , { dataField :	"pidt"       , caption : 'P/I date'		, width : 100 }
                    , { dataField :	"ipdt"       , caption : '입항예정일'	, width : 100 }
                    , { dataField :	"tongdt"     , caption : '통관예정일'	, width : 100 }
                    , { dataField :	"passdt"     , caption : '통관확인'		, width : 100 }
                    , { dataField :	"inchecktime", caption : '입고확인'		, width : 100 }
                    , { dataField :	"itemnm"     , caption : '품목명'		, width : 100 }
                    , { dataField :	"spec"       , caption : '규격'			, width : 100 }
                    , { dataField :	"qty"        , caption : '매수'			, width : 100 }
                    , { dataField :	"boxqty"     , caption : '수량(B)'		, width : 100 }
                    , { dataField :	"blno"       , caption : 'B/L no'		, width : 100 }
                    , { dataField :	"ckcd"       , caption : 'C/K'			, width : 100 }
                    , { dataField :	"ftdt"       , caption : 'F/T'			, width : 100 }
                    , { dataField :	"conbandt"   , caption : 'CON 반납일'	, width : 100 }
                    , { dataField :	"inyodt"     , caption : '입고요청일'	, width : 100 }
                    , { dataField :	"incheckdt"  , caption : '입고일'		, width : 100 }
                    , { dataField :	"rmk"        , caption : '발주비고'		, width : 100 }
                ]
                , searchPanel: { visible: true, width: 300, placeholder: "Search..." }
                , headerFilter: { visible: true }
                , filterRow: { visible: true, applyFilter: "auto" }
                , showColumnLines: true
                , showRowLines: true
                //, rowAlternationEnabled: true
                , showBorders: true
                , hoverStateEnabled: true
                , selection: { mode: "single" }
                //, onCellHoverChanged: function (e) {
                //    var colid = e.column.dataField;
                //    if (e.rowType == "data" && colid == 'gucd') {
                //        popup.option("contentTemplate",
        	       //         function(contentElement) {
                //              $("<div/>")
                //                  .append("Toolip for: " + e.column.caption)
                //                  .appendTo(contentElement);         
                //        });
                //        popup.option("target", e.cellElement);
   			          //  popup.show();
                //    }
                //}
                , onCellDblClick: function(e) {
                    if (e.rowType == 'data' && e.column.dataField != "itemnm") {
                        var jpno = this.cellValue(e.rowIndex, "jpno");
                        location.href = '/page2/page2-1.aspx?jpno=' + jpno;
                    }
                    if (e.rowType == 'data' && e.column.dataField == "itemnm") {
                        var jpno = this.cellValue(e.rowIndex, "jpno");
                        page22_pop(jpno);
                    }
                }
            }).dxDataGrid("instance");
            fn_search();
        });
        //===============================================================
        // 검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'jpno': '' });
            $.ajax({
                type: "POST",
                url: "/page2/page2_svc_search.asmx/page22_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $("#grid1").dxDataGrid({ dataSource: JSON.parse(data.d) });
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
    </script>
</asp:Content>
