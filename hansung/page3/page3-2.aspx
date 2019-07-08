<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page3-2.aspx.cs" Inherits="hansung.page3.page3_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>영업전표조회</h2>
<!-- 전표리스트 ==================================================================================== -->
                        <div id="spd1"></div>
				    </div>
			    </div>
		    </div>
	    </div> 
    </div>

    <script>
        function page32_pop(saleno) {
            var popUrl = "/page3/page3-2-pop.aspx?jpno=" + saleno;
            var popOption = "width=800, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
            var page32pop = window.open(popUrl, "page32pop", popOption);
            if (page32pop) page32pop.focus();
        }

        $(document).ready(function () {

            $("#spd1").dxDataGrid({
                columns: [
                    { 
                        width: "auto", 
                        cellTemplate: function(container, options) { 
                            //container.text(dataGrid.pageIndex() * dataGrid.pageSize() + options.rowIndex); 
                            //var totCount = this.totalCount();
                            container.text(options.rowIndex + 1); 
                        } 
                    }
                    , { dataField :	"saleno"   , caption : '전표번호'  , width : 100 }
                    , { dataField :	"gucd"     , caption : 'gucd'      , width : 100 }
                    , { dataField :	"chasu"    , caption : 'chasu'     , width : 100 }
                    , { dataField :	"csaleno"  , caption : 'csaleno'   , width : 100 }
                    , { dataField :	"usernm"   , caption : '영업담당'  , width : 100 }
                    , { dataField :	"custnm"   , caption : '고객사명'  , width : 100 }
                    , { dataField :	"whnm"     , caption : '출고창고'  , width : 100 }
                    , { dataField :	"ydt"      , caption : '출고예정일', width : 100 }
                    , { dataField :	"checkdt"  , caption : '승인확인'  , width : 100 }
                    , { dataField :	"outdt"    , caption : '출고확인'  , width : 100 }
                    , { dataField :	"itemnm"   , caption : '품목명'    , width : 100 }
                    , { dataField :	"spec"     , caption : '규격'      , width : 100 }
                    , { dataField :	"qty"      , caption : '매수'      , width : 100 }
                    , { dataField :	"boxqty"   , caption : '수량(B)'   , width : 100 }
                    , { dataField :	"carnm"    , caption : '운송사'    , width : 100 }
                    , { dataField :	"carno"    , caption : '차량번호'  , width : 100 }
                    , { dataField :	"carpayamt", caption : '운임'      , width : 100 }
                    , { dataField :	"rmk"      , caption : '수주비고'  , width : 100 }
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
                , onCellDblClick: function(e) {
                    if (e.rowType == 'data' && e.column.dataField == "saleno") {
                        var saleno = this.cellValue(e.rowIndex, "saleno");
                        location.href = '/page3/page3-1.aspx?saleno=' + saleno;
                        return true;
                    }
                    if (e.rowType == 'data' && e.column.dataField == "itemnm") {
                        var saleno = this.cellValue(e.rowIndex, "saleno");
                        page32_pop(saleno);
                        return true;
                    }
                }
            }).dxDataGrid("instance");

            fn_search();
        });
        //===============================================================
        // 검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'saleno': '' });
            $.ajax({
                type: "POST",
                url: "/page3/page3_svc_search.asmx/page32_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    $("#spd1").dxDataGrid({ dataSource: data }); //dev
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
    </script>
</asp:Content>