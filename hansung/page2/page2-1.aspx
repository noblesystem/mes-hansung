<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-1.aspx.cs" Inherits="hansung.page2.page2_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <!-- MAIN -->
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>구매전표관리</h2>

<!-- 발주, 통관/입고 버튼들 ==================================================================================== -->
                            <ul class="ul-button" style="">
                                <li>
                                    <div class="div-btn-header" onclick="balju_new()"><span class="span-title">신규(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_save()"><span class="span-title">저장(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_del()"><span class="span-title">삭제(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_row_add()"><span class="span-title">행추가(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_row_del()"><span class="span-title">행삭제(N)</span></div>
                                </li>
<%--                                <li>
                                    <div class="div-btn-header" onclick="show_tong('')"><span class="span-title">통관/입고</span></div>
                                </li>--%>
                                <li>
                                    <div class="div-btn-header" onclick="opentpopuppayment()"><span class="span-title">지급</span></div>
                                </li>
<%--                                <li class="close_up_subpopup">
                                    <div class="div-btn-header" style="position:relative;">
                                        <p class="span-title" onclick="$('.group-edit').slideToggle()">수정</p>
                                        <div class="group-btn group-edit">
                                            <!-- p onclick="openedit_bill_began()">발주</!-->
                                            <p onclick="edit_balju()">발주</p>
                                            <p onclick="EditShip()">통관/입고</p>
                                            <p onclick="editpayment()">지급</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="close_up_subpopup">
                                    <div class="div-btn-header" style="position: relative;">
                                        <p class="span-title" onclick="$('.group-edit-new').slideToggle()">인쇄</p>
                                        <div class="group-btn group-edit-new">
                                            <p onclick="print_bill()">발주</p>
                                            <p onclick="print_ships()">통관/입고</p>
                                            <p onclick="print_payment()">지급</p>
                                        </div>
                                    </div>
                                </li>--%>
                            </ul>
<div class="fixedScroll">
<!-- 전표리스트 ==================================================================================== -->
                                <div id="spd1"></div>
<!-- 전표 ======================================================================================== -->
                                chasu<input type="text" id="chasu" readonly="readonly" />cjpno<input type="text" id="cjpno" readonly="readonly" />
                                <table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
                                    <tbody>
                                        <tr>
                                            <td>전표번호</td>
                                            <td><input type="text" id="jpno" readonly="readonly" /></td>
                                            <td>전표구분</td>
                                            <td><select id="gucd" disabled="disabled"></select></td>
                                            <td>발주일자</td>
                                            <td><input type="text" id="jpdt" class="datecombo"/></td>
                                            <td>발주 담당</td>
                                            <td><input id="userid" type="hidden"/><input id="usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
                                        </tr>
                                        <tr>
                                            <td>거래사명</td>
                                            <td><input id="custcd" type="hidden"/><input id="custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#custnm').val(), 'custcd', 'custnm', 'tel')" /></td>
                                            <td>고객사 연락처</td>
                                            <td><input id="tel" type="text"/></td>
                                            <td>거래조건/TERMS</td>
                                            <td><select id="termcd"></select></td>
                                            <td>입고 창고</td>
                                            <td><select id="whcd"></select></td>
                                        </tr>
                                        <tr>
                                            <td>계약일(P/I date)</td>
                                            <td><input id="pidt" type="text"  class="datecombo"/></td>
                                            <td>미지급금</td>
                                            <td><input id="janamt" type="text" class="inputmoney inputmoney-manager" style="width: 100%" /></td>
                                            <td>P/I no</td>
                                            <td><input id="pino" type="text" /></td>
                                            <td>발주 확인</td>
                                            <td><input id="bcheckdt" type="text" class="datecombo" /></td>
                                        </tr>
                                        <tr>
                                            <td>Payment</td>
                                            <td><select id="paycd"></select></td>
                                            <td>L/C, T/T date</td>
                                            <td><input id="paydt" type="text"  class="datecombo"/></td>
                                            <td>L/C no</td>
                                            <td><input id="lcno" type="text" /></td>
                                            <td>신용장만기일(E/D)</td>
                                            <td><input id="mandt" type="text"  class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>B/L no</td>
                                            <td><input id="blno" type="text" /></td>
                                            <td>선적기일(S/D)</td>
                                            <td><input id="shipdt" type="text"   class="datecombo"/></td>
                                            <td>AMT</td>
                                            <td><input id="amt" type="text" /></td>
                                            <td>출항예정일(ETD)</td>
                                            <td><input id="chuldt" type="text"  class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>TOLERANCE %</td>
                                            <td><input id="tolper" type="text" style="width: 33px" /></td>
                                            <td>입항예정일(ETA)</td>
                                            <td><input id="ipdt" type="text" class="datecombo"/></td>
                                            <td>TOLERANCE AMT</td>
                                            <td><input id="tolamt" type="text" /></td>
                                            <td>CON 반납기일(F/T)</td>
                                            <td><input id="conbandt" type="text"  class="datecombo" onchange="bindcontainerday(this)" /></td>
                                        </tr>
                                        <tr>
                                            <td>USANCE</td>
                                            <td><input id="usance" type="text"/></td>
                                            <td>운송사/선사</td>
                                            <td><input id="shipnm" type="text"/></td>
                                            <td>발주 비고</td>
                                            <td colspan="3"><input id="rmk" type="text"/></td>
                                        </tr>
                                    </tbody>
                                </table>
<%--<!-- 구매전표상세 ==================================================================================== -->
                                <table id="grid2"></table>
                                <div id="grid2_pager"></div>--%>
<!-- 구매전표상세(devexpress) ==================================================================================== -->
    <div class="demo-container">
        <div id="data-grid-demo">
            <div id="gridDeleteSelected"></div>
            <div id="spd2"></div>
        </div>
    </div>
</div>
				    </div>
			    </div>
		    </div>
	    </div> 
    </div>
    <!-- //MAIN -->
<style>
#data-grid-demo {
    min-height: 700px;
}
​
#gridContainer {
    padding-top: 45px;
}
​
#gridDeleteSelected {
    position: absolute;
    z-index: 1;
    right: 0;
    margin: 1px;
    top: 0;
}
​
.dx-button-text {
    line-height: 0;
}
</style>
    <script>
//===================================================================================
        //$(function () {
            //var employeesStore = new DevExpress.data.ArrayStore({
            //    key: "ID",
            //    data: employees
            //});

            //var deleteButton = $("#gridDeleteSelected").dxButton({
            //    text: "Delete Selected Records",
            //    height: 34,
            //    width: 195,
            //    disabled: true,
            //    onClick: function () {
            //        $.each(dataGrid.getSelectedRowKeys(), function () {
            //            employeesStore.remove(this);
            //        });
            //        dataGrid.refresh();
            //    }
            //}).dxButton("instance");


//===================================================================
        var jpno = '<%=jpno %>';
        var spd1;
        var spd2;
        var ds1 = [];
        var ds2 = [];

        $(document).ready(function () {
            $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
            $.jgrid.defaults.responsive = true;
            //jpno = $('#jpno').val();
            //if (jpno == '') jpno = '';
            $('#termcd').zentSetCombo('C001', '', '==선택==');
            $('#curcd').zentSetCombo('C002', '', '==선택==');
            $('#whcd').zentSetComboWhcd('', '==선택==');
            $('#paycd').zentSetCombo('C003', '', '==선택==');
            $('#gucd').zentSetCombo('C006', '', '==선택==');
            var string_scd   = combo_code_string('C010', '', '==선택==');
            var string_curcd = combo_code_string('C002', '', '==선택==');
            var string_ckcd  = combo_code_string('C005', '', '==선택==');
           // alert(JSON.stringify(string_ckcd));
            //=====================================================================
            //grid setting
            //=====================================================================
            spd1 = $("#spd1").dxDataGrid({
                  dataSource : ds1
                , columns: [
                      { dataField : "jpno"        , caption : "전표번호"    , visible : g_t, width : 100 }
                    , { dataField : "gucd"        , caption : "구분"        , visible : g_t, width : 100 }
                    , { dataField : "chasu"       , caption : "차수"        , visible : g_t, width : 100 }
                    , { dataField : "cjpno"       , caption : "공통전표"    , visible : g_t, width : 100 }
                    , { dataField : "termcd"      , caption : "TERMS"       , visible : g_t, width : 100 }
                    , { dataField : "usernm"      , caption : "발주담당"    , visible : g_t, width : 100 }
                    , { dataField : "custnm"      , caption : "거래사명"    , visible : g_t, width : 100 }
                    , { dataField : "whnm"        , caption : "입고창고"    , visible : g_t, width : 100 }
                    , { dataField : "pidt"        , caption : "P/I date"    , visible : g_t, width : 100 }
                    , { dataField : "ipdt"        , caption : "입항예정일"  , visible : g_t, width : 100 }
                    , { dataField : "tongdt"      , caption : "통관예정일"  , visible : g_t, width : 100 }
                    , { dataField : "passdt"      , caption : "통관확인"    , visible : g_t, width : 100 }
                    , { dataField : "inchecktime" , caption : "입고확인"    , visible : g_t, width : 100 }
                    , { dataField : "itemnm"      , caption : "품목명"      , visible : g_t, width : 100 }
                    , { dataField : "spec"        , caption : "규격"        , visible : g_t, width : 100 }
                    , { dataField : "qty"         , caption : "매수"        , visible : g_t, width : 100 }
                    , { dataField : "boxqty"      , caption : "수량(B)"     , visible : g_t, width : 100 }
                    , { dataField : "blno"        , caption : "B/L no"      , visible : g_t, width : 100 } 
                    , { dataField : "ckcd"        , caption : "C/K"         , visible : g_t, width : 100 }
                    , { dataField : "ftdt"        , caption : "F/T"         , visible : g_t, width : 100 }
                    , { dataField : "conbandt"    , caption : "CON 반납일"  , visible : g_t, width : 100 }
                    , { dataField : "inyodt"      , caption : "입고요청일"  , visible : g_t, width : 100 }
                    , { dataField : "incheckdt"   , caption : "입고일"      , visible : g_t, width : 100 }
                    , { dataField : "rmk"         , caption : "발주비고"    , visible : g_t, width : 100 }
                ]
                , showColumnLines: true
                , showRowLines: true
                //, rowAlternationEnabled: true
                , showBorders: true
                //, dataSource: employeesStore
                //, paging: { enabled: false }.
                , selection: {
                    mode: "single"
                }
                //, selection: { mode: "multiple" }
                , onSelectionChanged: function(selectedItems) {
                    //deleteButton.option("disabled", !data.selectedRowsData.length);
                    //var data = selectedItems.selectedRowsData[0];
                    //if(data) {
                        //$(".employeeNotes").text(data.Notes);
                        //$(".employeePhoto").attr("src", data.Picture);
                    //}
                }
                , onRowClick: function(e) {
                    jpno = this.cellValue(e.rowIndex, 'jpno');
                    balju_selone();
                }
		        , onContentReady: function(e) {
			        //$('.chart').height(e.element.height());
                    if(this.totalCount() > 0) {
                        //alert(this.totalCount());
                        var cjpno = this.cellValue(0, 'cjpno');
                        $('#cjpno').val(cjpno);
                    }
                    //var cm = jQuery("#grid2").jqGrid("getGridParam", "colModel");
                    //if (cm[col].name == "itemnm") {
                    //    var searchword = $('#grid2').jqGrid('getCell', rowid, 'itemnm');
                    //    var cjpno = $('#cjpno').val();
                    //    var gucd = $('#gucd').val();
                    //    if (gucd == "B") {
                    //        pop_item('', 'grid2', rowid);
                    //    }
                    //    else {
                    //        pop_item_buy('', 'grid2', rowid, cjpno);
                    //    }
                    //}
		        }
                //, onContentReady: function(e) {
                //    alert(this.totalCount());
                    
                //    var count = 3;
                //    //var count = spd1._controllers.data._dataSource.totalCount();
                //    //alert(count);
                //    if (count > 0) {
                //        var cjpno = spd1.cellValue(0, 'cjpno');
                //        $('#cjpno').val(cjpno);
                //    }
                //    else {
                //        $('#cjpno').val('');
                //    }
                //}
                //, onCellDblClick: function(e) {
                //    var a = "";
                //    var b = "";
                //    var rowid = e.rowIndex;
                //    var cjpno = this.cellValue(0, 'cjpno');
                //    var gucd = $('#gucd').val();
                //    if (e.rowType == 'data' && e.column.dataField == "itemnm") {
                //        if (gucd == "B") {
                //            pop_item('', 'spd2', rowid);
                //        }
                //        else {
                //            pop_item_buy('', 'spd2', rowid, cjpno);
                //        }
                //    }
            }).dxDataGrid("instance");
            


            spd2 = $("#spd2").dxDataGrid({
                  dataSource : ds2
                , columns: [
                      { dataField : "mode"       , caption : "mode"            , visible : g_t, allowEditing : g_f, width : 100 }
                    , { dataField : "jpno"       , caption : "jpno"            , visible : g_t, allowEditing : g_f, width : 100 }
                    , { dataField : "jpseq"      , caption : "번호"            , visible : g_t, allowEditing : g_f, width : 100 }
                    , { dataField : "itemcd"     , caption : "품목코드"        , visible : g_t, allowEditing : g_f, width : 100 }
                    , { dataField : "itemnm"     , caption : "품목명"          , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "spec"       , caption : "규격"            , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "qty"        , caption : "매수"            , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "boxqty"     , caption : "수량(B)"         , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "scd"        , caption : "수정전표"        , visible : g_t, allowEditing : g_t, width : 100,  lookup: { dataSource: string_scd  , displayExpr: "codenm", valueExpr: "code" }}
                    , { dataField : "curcd"      , caption : "화폐단위"        , visible : g_t, allowEditing : g_t, width : 100,  lookup: { dataSource: string_curcd, displayExpr: "codenm", valueExpr: "code" }}
                    , { dataField : "unitprice"  , caption : "단가"            , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "supplyamt"  , caption : "공급가액"        , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "vat"        , caption : "부가세"          , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "totamt"     , caption : "합계 금액"       , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "conqty"     , caption : "수량(C)"         , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "sqm"        , caption : "SQM"             , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "rmk"        , caption : "항목비고"        , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "tongdt"     , caption : "품목통관 예정일" , visible : g_t, allowEditing : g_t, width : 100,  dataType: "date", format: "yyyy.MM.dd" } 
                    , { dataField : "passdt"     , caption : "품목 통관일"     , visible : g_t, allowEditing : g_t, width : 100,  dataType: "date", format: "yyyy.MM.dd" } 
                    , { dataField : "port"       , caption : "PORT"            , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "conno"      , caption : "CON No"          , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "docno"      , caption : "원산지증명서"    , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "ckcd"       , caption : "C/K"             , visible : g_t, allowEditing : g_t, width : 100,  lookup: { dataSource: string_ckcd, displayExpr: "codenm", valueExpr: "code" }}
                    , { dataField : "ftdt"		 , caption : "F/T"             , visible : g_t, allowEditing : g_t, width : 100,  dataType: "date", format: "yyyy.MM.dd" } 
                    , { dataField : "conbandt"   , caption : "CON반납일"       , visible : g_t, allowEditing : g_t, width : 100,  dataType: "date", format: "yyyy.MM.dd" } 
                    , { dataField : "inyodt"     , caption : "입고요청일"      , visible : g_t, allowEditing : g_t, width : 100,  dataType: "date", format: "yyyy.MM.dd" } 
                    , { dataField : "incheckdt"  , caption : "입고확인"        , visible : g_t, allowEditing : g_t, width : 100,  dataType: "date", format: "yyyy.MM.dd" }  
                    , { dataField : "sno"		 , caption : "시리얼 No"       , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "prodcd"     , caption : "PROD code"       , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "casenom"    , caption : "CASE nom"        , visible : g_t, allowEditing : g_t, width : 100 }
                    , { dataField : "proddt"     , caption : "PROD date"       , visible : g_t, allowEditing : g_t, width : 100 }
                ]
                , showColumnLines: true
                , showRowLines: true
                , rowAlternationEnabled: true
                , showBorders: true
                //, dataSource: employeesStore
                //, paging: { enabled: false }.
                , selection: {
                    mode: "single"
                }
                , editing: {
                    mode: "cell", allowUpdating: true
                }
                //, selection: { mode: "multiple" }
                , height : 200
                , onCellDblClick: function(e) {
                    var a = "";
                    var b = "";
                    var rowid = e.rowIndex;
                    var cjpno = $('#cjpno').val();
                    var gucd  = $('#gucd').val();
                    if (e.rowType == 'data' && e.column.dataField == "itemnm") {
                        if (gucd == "B" || jpno == '') {
                            pop_item('', 'spd2', rowid);
                        }
                        else {
                            pop_item_buy('', 'spd2', rowid, cjpno);
                        }
                    }
                    //var dataGrid = $("#dataGridContainer").dxDataGrid("instance");
                    
                    //var cm = jQuery("#grid2").jqGrid("getGridParam", "colModel");
                    //if (cm[col].name == "itemnm") {
                    //    var searchword = $('#grid2').jqGrid('getCell', rowid, 'itemnm');
                    //    var cjpno = $('#cjpno').val();
                    //    var gucd = $('#gucd').val();
                    //    if (gucd == "B") {
                    //        pop_item('', 'grid2', rowid);
                    //    }
                    //    else {
                    //        pop_item_buy('', 'grid2', rowid, cjpno);
                    //    }
                    //}
                }
            }).dxDataGrid("instance");

            if (jpno == '') {spd2.option('dataSource', []); }
            else fn_search();
        });

        //===============================================================
        // 검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'jpno': jpno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    $("#spd1").dxDataGrid({ dataSource: data });

                    //rowcount 를 얻을 수 없음...
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function balju_selone() {
            var param = JSON.stringify({ 'jpno': jpno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $('#jpno').val(result[0].jpno);
                    $('#chasu').val(result[0].chasu);
                    $('#gucd').val(result[0].gucd);
                    $('#jpdt').val(result[0].jpdt);
                    $('#userid').val(result[0].userid);
                    $('#usernm').val(result[0].usernm);
                    $('#custcd').val(result[0].custcd);
                    $('#custnm').val(result[0].custnm);
                    $('#tel').val(result[0].tel);
                    $('#termcd').val(result[0].termcd);
                    $('#whcd').val(result[0].whcd);
                    $('#pidt').val(result[0].pidt);
                    $('#janamt').val(result[0].janamt);
                    $('#pino').val(result[0].pino);
                    $('#bcheckdt').val(result[0].bcheckdt);
                    $('#paycd').val(result[0].paycd);
                    $('#paydt').val(result[0].paydt);
                    $('#lcno').val(result[0].lcno);
                    $('#mandt').val(result[0].mandt);
                    $('#blno').val(result[0].blno);
                    $('#shipdt').val(result[0].shipdt);
                    $('#amt').val(result[0].amt);
                    $('#chuldt').val(result[0].chuldt);
                    $('#tolper').val(result[0].tolper);
                    $('#ipdt').val(result[0].ipdt);
                    $('#tolamt').val(result[0].tolamt);
                    $('#conbandt').val(result[0].conbandt);
                    $('#usance').val(result[0].usance);
                    $('#shipnm').val(result[0].shipnm);
                    $('#rmk').val(result[0].rmk);

                    spd2.option('dataSource', []);
                    spd2.remove();
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            balju_detail_search();
        }
        function balju_detail_search() {
            var param = JSON.stringify({ 'jpno': jpno });

            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_detail_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    spd2.option('dataSource', []);
                    $("#spd2").dxDataGrid({ dataSource: JSON.parse(data.d) });
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }

        //===============================================================
        // 초기화
        //===============================================================
        function balju_init() {
            $('#jpno').val('');
            $('#chasu').val('');
            $('#gucd').val('');
            $('#jpdt').val('');
            $('#userid').val('');
            $('#usernm').val('');
            $('#custcd').val('');
            $('#custnm').val('');
            $('#tel').val('');
            $('#termcd').val('');
            $('#whcd').val('');
            $('#pidt').val('');
            $('#janamt').val('');

            $('#pino').val('');
            $('#bcheckdt').val('');
            $('#paycd').val('');
            $('#paydt').val('');
            $('#lcno').val('');
            $('#mandt').val('');
            $('#blno').val('');
            $('#shipdt').val('');
            $('#amt').val('');
            $('#chuldt').val('');
            $('#tolper').val('');
            $('#ipdt').val('');
            $('#tolamt').val('');
            $('#conbandt').val('');
            $('#usance').val('');
            $('#shipnm').val('');
            $('#rmk').val('');
            spd2.option('dataSource', []);
        }
        //===============================================================
        // 버튼~~(구매전표)
        //===============================================================
        function balju_new() {
            balju_init();
        }
        var param_del = [];
        function balju_save() {
            if (checklogin() != 1) { location.href = '/login.aspx'; return; } //logincheck

            //var rowid_list = jQuery("#grid2").jqGrid('getDataIDs');
            //for (var i = 0; i < rowid_list.length; i++) {
            //    var rowid = rowid_list[i];
            //    //$('#grid2').jqGrid('saveRow', rowid);
            //    //$("#grid2").saveRow(rowid, true, 'clientArray');
            //    $("#grid2").jqGrid('saveRow', rowid);
            //}
            //return;
            //$('#grid2').jqGrid('saveRow', capturedIdOfRowInEditMode);
            //$("#grid2").saveRow(jqMFPLastRowId, true, 'clientArray');
            //alert('111');
            var param = {};
            param.jpno = $.trim($("#jpno").val());
            param.chasu = $.trim($("#chasu").val());
            param.cjpno = $.trim($("#cjpno").val());
            param.gucd = $.trim($("#gucd").val());
            param.jpdt = $.trim($("#jpdt").val());
            param.termcd = $.trim($("#termcd").val());
            param.pidt = $.trim($("#pidt").val());
            param.userid = $.trim($("#userid").val());
            param.custcd = $.trim($("#custcd").val());
            param.whcd = $.trim($("#whcd").val());
            param.janamt = $.trim($("#janamt").val());
            param.pino = $.trim($("#pino").val());
            param.bcheckdt = $.trim($("#bcheckdt").val());
            param.paycd = $.trim($("#paycd").val());
            param.paydt = $.trim($("#paydt").val());
            param.lcno = $.trim($("#lcno").val());
            param.amt = $.trim($("#amt").val());
            param.tolper = $.trim($("#tolper").val());
            param.tolamt = $.trim($("#tolamt").val());
            param.usance = $.trim($("#usance").val());
            param.mandt = $.trim($("#mandt").val());
            param.blno = $.trim($("#blno").val());
            param.shipdt = $.trim($("#shipdt").val());
            param.chuldt = $.trim($("#chuldt").val());
            param.ipdt = $.trim($("#ipdt").val());
            param.conbandt = $.trim($("#conbandt").val());
            param.shipnm = $.trim($("#shipnm").val());
            param.rmk = $.trim($("#rmk").val());
            if (param.jpdt   == '') { alert('발주일자를 입력해주세요!'); return; }
            //if (param.userid == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
            var param = JSON.stringify(param);
            //validate check == detail
            var param2 = [];
            //for (var i = 0; i < param_del.length; i++) {
            //    param2.push(param_del[i]);
            //}
            var row = spd2.getDataSource().items();
            for (var i = 0; i < row.length; i++) {
                param2.push(row[i]);
            }
            param2 = JSON.stringify(param2);
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_save",
                data: JSON.stringify({ 'param': param, 'param2': param2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        jpno = result.val;
                        balju_init();
                        fn_search();
                        balju_selone();
                        alert('저장되었습니다');
                    }
                    else { alert("저장오류!"); return; }

                },
                error: function (request, status, error) {
                    //alert(100);
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function balju_del() {  
            var param = {};
            param.jpno = $.trim($("#jpno").val());
            if (param.jpno == '') {
                alert('해당 전표는 등록되지 않은 전표 입니다!'); return;
            }
            var param = JSON.stringify(param);
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_del",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //var table = $('#grid21').DataTable();
                    //table.clear().rows.add(JSON.parse(data.d)).draw();
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        balju_init();
                        var count = $("#grid1").getGridParam("reccount");
                        if (count > 0) {
                            var rowid = $("#grid1").getDataIDs()[0];
                            var cjpno = $('#grid1').getCell(rowid, 'cjpno');
                            $('#cjpno').val(cjpno);
                            jpno = $('#grid1').getCell(rowid, 'jpno');
                        }
                        else {
                            $('#cjpno').val('');
                        }
                        fn_search();
                        alert('삭제 되었습니다');
                    }
                    else { alert("저장오류!"); return; }
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function balju_row_add() {
            var rowData = {
                      "mode"      : 'I'
                    , "jpno"      : ''
                    , "jpseq"     : ''
                    , "itemcd"    : ''
                    , "itemnm"    : ''
                    , "spec"      : ''
                    , "qty"       : ''
                    , "boxqty"    : ''
                    , "scd"       : ''
                    , "curcd"     : ''
                    , "unitprice" : ''
                    , "supplyamt" : ''
                    , "vat"       : ''
                    , "totamt"    : ''
                    , "conqty"    : ''
                    , "sqm"       : ''
                    , "rmk"       : ''
                    , "tongdt"    : ''
                    , "passdt"    : ''
                    , "port"      : ''
                    , "conno"     : ''
                    , "docno"     : ''
                    , "ckcd"      : ''
                    , "ftdt"      : ''
                    , "conbandt"  : ''
                    , "inyodt"    : ''
                    , "indt"      : ''
                    , "sno"       : ''
                    , "prodcd"    : ''
                    , "casenom"   : ''
                    , "proddt"    : '' 
            }
            spd2.addRow(rowData);
            //var rowid = $("#grid2").getGridParam("reccount"); // 페이징 처리 시 현 페이지의 Max RowId 값
            //$("#grid2").jqGrid("addRowData", rowid + 1, rowData, 'last'); // 마지막 행에 Row 추가
        }
        function balju_row_del() {
            //var rowid = $('#grid2').jqGrid('getGridParam', 'selrow');
            ////if (rowid == undefined) { alert('선택된 행이 없습니다'); return; }

            //var row = $("#grid2").jqGrid('getRowData', rowid);
            //if (row.jpseq != '') {
            //    row.mode = 'D';
            //    param_del.push(row);
            //}
            //$("#grid2").jqGrid("delRowData", rowid); // 행 삭제
            ////dxgrid
            //rowid = spd2.getSelectedRowKeys();
            //if (rowid.length > 0) {
            //    spd2.deleteRow(rowid);
            //    var param = spd2.getDataSource.data();
            //}
            //else {
            //    alert('선택된 항목이 없습니다');
            //    return;
            //}
        }
        //===============================================================
        // 기타 함수
        //===============================================================
        //function pop_result_item_grid(param) {
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm );
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'spec', param.spec);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'qty', param.qty);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        //}
        //function pop_result_item_grid2(param) {
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'spec', param.spec);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'qty', param.qty);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'boxqty', param.boxqty);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'curcd', param.curcd);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'supplyamt', param.supplyamt);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'vat', param.vat);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'totamt', param.totamt);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'conqty', param.conqty);
        //    $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        //}
        function pop_result_item_grid(param) {
            //alert(pop_item_name);
            spd2.cellValue(pop_item_row, 'itemcd', param.itemcd);
            spd2.cellValue(pop_item_row, 'itemnm', param.itemnm );
            spd2.cellValue(pop_item_row, 'spec', param.spec);
            spd2.cellValue(pop_item_row, 'qty', param.qty);
            spd2.cellValue(pop_item_row, 'unitprice', param.unitprice);
            spd2.cellValue(pop_item_row, 'sqm', param.sqm);
        }
        function pop_result_item_buy(param) {
            spd2.cellValue(pop_item_row, 'itemcd', param.itemcd);
            spd2.cellValue(pop_item_row, 'itemnm', param.itemnm);
            spd2.cellValue(pop_item_row, 'spec', param.spec);
            spd2.cellValue(pop_item_row, 'qty', param.qty);
            spd2.cellValue(pop_item_row, 'boxqty', param.boxqty);
            spd2.cellValue(pop_item_row, 'curcd', param.curcd);
            spd2.cellValue(pop_item_row, 'unitprice', param.unitprice);
            spd2.cellValue(pop_item_row, 'supplyamt', param.supplyamt);
            spd2.cellValue(pop_item_row, 'vat', param.vat);
            spd2.cellValue(pop_item_row, 'totamt', param.totamt);
            spd2.cellValue(pop_item_row, 'conqty', param.conqty);
            spd2.cellValue(pop_item_row, 'sqm', param.sqm);
        }
    </script>
</asp:Content>
