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
                                    <div class="div-btn-header" onclick="fn_new()"><span class="span-title">신규(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="fn_save()"><span class="span-title">저장(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="fn_del()"><span class="span-title">삭제(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="fn_row_add()"><span class="span-title">행추가(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="fn_row_del()"><span class="span-title">행삭제(N)</span></div>
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
<div id="grid1"></div>
<!-- 전표 ======================================================================================== -->
<table><tr><td width="100">[HIDDEN]</td><td>
    chasu<input type="text" id="chasu" readonly="readonly" />
    cjpno<input type="text" id="cjpno" readonly="readonly" />
    useyn<input type="text" id="useyn" readonly="readonly" />
</td></tr></table>
<table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
    <tbody>
        <tr>
            <td>전표번호</td>
            <td><input type="text" id="jpno" readonly="readonly" /></td>
            <td>전표구분</td>
            <td><select id="gucd" disabled="disabled"></select></td>
            <td>마감여부</td>
            <td><select id="scd"></select></td>
            <td>발주일자(c)</td>
            <td><input type="text" id="jpdt" class="datecombo"/></td>
        </tr>
        <tr>
            <td>발주 담당(c)</td>
            <td><input id="userid" type="hidden"/><input id="usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
            <td>거래사명(c)</td>
            <td><input id="custcd" type="hidden"/><input id="custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#custnm').val(), 'custcd', 'custnm', 'tel')" /></td>
            <td>고객사 연락처(c)</td>
            <td><input id="tel" type="text"/></td>
            <td>거래조건/TERMS(c)</td>
            <td><select id="termcd"></select></td>
        </tr>
        <tr>
            <td>입고 창고(c)</td>
            <td><select id="whcd"></select></td>
            <td>계약일(P/I date)(c)</td>
            <td><input id="pidt" type="text"  class="datecombo"/></td>
            <td>미지급금</td>
            <td><input id="janamt" type="text" class="inputmoney inputmoney-manager" style="width: 100%" /></td>
            <td>P/I no(c)</td>
            <td><input id="pino" type="text" /></td>
        </tr>
        <tr>
            <td>화폐단위</td>
            <td><select id="curcd"></select></td>
            <td>발주 확인(c)</td>
            <td><input id="bcheckdt" type="text" class="datecombo" /></td>
            <td>Payment</td>
            <td><select id="paycd"></select></td>
            <td>L/C, T/T date</td>
            <td><input id="paydt" type="text"  class="datecombo"/></td>
            
        </tr>
        <tr>
            <td>L/C no</td>
            <td><input id="lcno" type="text" /></td>
            <td>신용장만기일(E/D)</td>
            <td><input id="mandt" type="text"  class="datecombo"/></td>
            <td>B/L no</td>
            <td><input id="blno" type="text" /></td>
            <td>선적기일(S/D)</td>
            <td><input id="shipdt" type="text"   class="datecombo"/></td>
        </tr>
        <tr>
            <td>AMT</td>
            <td><input id="amt" type="text" /></td>
            <td>출항예정일(ETD)</td>
            <td><input id="chuldt" type="text"  class="datecombo"/></td>
            <td>TOLERANCE %</td>
            <td><input id="tolper" type="text" style="width: 33px" /></td>
            <td>입항예정일(ETA)</td>
            <td><input id="ipdt" type="text" class="datecombo"/></td>
        </tr>
        <tr>
            <td>TOLERANCE AMT</td>
            <td><input id="tolamt" type="text" /></td>
            <td>CON 반납기일(F/T)</td>
            <td><input id="conbandt" type="text"  class="datecombo" onchange="bindcontainerday(this)" /></td>
            <td>USANCE</td>
            <td><input id="usance" type="text"/></td>
            <td>운송사/선사</td>
            <td><input id="shipnm" type="text"/></td>
        </tr>
        <tr>
            <td>발주 비고</td>
            <td><input id="rmk" type="text"/></td>
            <td colspan="6"></td>
        </tr>
    </tbody>
</table>

<%--<!-- 구매전표상세 ==================================================================================== -->
                                <table id="grid2"></table>
                                <div id="grid2_pager"></div>--%>
<!-- 구매전표상세(devexpress) ==================================================================================== -->
<div id="grid2"></div>

                        <br/>[작업 내역 리스트]
                        <br/>* 등록시 수량 0, 화폐단위, 단가, 공급가액, 합계금액가 없을 경우 저장 불가(전표 master, 전표 상세 등등 저장시 필수항목 검증필요)
                        <br/>* 마지막 행이 아닌 전표를 수정할 경우 ??
                        <br/>* 통관전표를 수정전표로 바꿀 경우 ??
                        <br/>* 수량, 화폐단위, 공급가액, 부가세, 합계금액 등등(환율정보??)
                        <br/>* 내수일 경우 지급전표는 P/I NO 기준 / 내수 외 지급전표는 구매전표 기준
                        
                        <br/>* 컬럼중에서 수정되지 않는 부분 LOCK 필요
                        <br/>* 컬럼 넓이 재조정 필요
                        <br/>* (완료) 내수 일 경우, 합계금액으로 공급가액, 부가세 계산 / 그 외 입력하도록 함
                        <br/>* (완료) 품목명 입력 후 엔터
                        <br/>* (완료) 전표삭제 : 마지막 전표는 삭제 가능(마지막 전표가 아닐 경우 삭제 불가)
                        <br/>* (완료) 동일 품목은 2줄이 생기지 않도록 함
                        <br/>* (완료) 잔량전표 생성 
                        <br/>* (완료) 신규 버튼 클릭시 : 통관전표 작성시 자동으로 남은 수량 데이타 가져오기
                        <br/>* (완료) 신규버튼 클릭시 구매품목 미입고 리스트 보여지기
                        <br/>* (완료) 수정전표의 품목정보들은 모두 마감이 되어야 함
                        <br/>* (완료) 저장시 입고시간 저장
                        <br/>* (완료) 입고시간 가져오기
                        <br/>* (완료) 컬럼사이즈 변경
                        <br/>* (완료) kendo grid로 grid 변경
                        <br/>* (완료)의 의미는 일어부분 해결이 되었다는 뜻이며, 수정과 보완이 필요할 수 있음
                        <br/>[공통]
                        <br/>* 각종 팝업화면은 행 더블클릭 혹은 선택 버튼 클릭시 동작 가능하도록 수정
                        <br/>[참고사항]
                        <br/>* (c)로 표기 된 부분은 공통 부분(통관전표, 수정전표에서 수정불가)
                        <br/>* 상담의 hidden 등 박스는 테스트 용으로 사용
                        <br/>* 하단 그리드의 jpno 는 hidden 처리 예정
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
        var ds1, ds2 = [];
        var data1 = [];
        var data2 = [];
        var grid1, grid2;

        $(document).ready(function () {
            //combo 
            $('#scd').zentSetCombo('C010', '', '==선택==');
            $('#termcd').zentSetCombo('C001', '', '==선택==');
            $('#curcd').zentSetCombo('C002', '', '==선택==');
            $('#whcd').zentSetComboWhcd('', '==선택==');
            $('#paycd').zentSetCombo('C003', '', '==선택==');
            $('#gucd').zentSetCombo('C006', '', '==선택==');
            //grid combo
            var string_curcd = combo_code_string('C002', '', '==선택==');
            var string_ckcd = combo_code_string('C005', '', '==선택==');
            
            //=====================================================================
            //grid column option
            //=====================================================================
            
            function grid_combo(container, options) {
                var combo = [];
                if (options.field == 'curcd') combo = string_curcd;
                if (options.field == 'ckcd')  combo = string_ckcd;
                $('<input required name="' + options.field + '"/>')
                    .appendTo(container)
                    .kendoDropDownList({
                        autoBind: false
                        , dataTextField : "codenm"
                        , dataValueField: "code"
                        , dataSource    : { data : combo }
                    });
                //console.log(curcd);
            }
            var editor_cal = function(container, options){
                var input = $("<input/>"); 
                input.attr("name",options.field); 
                input.appendTo(container); 
                input.kendoDateTimePicker({
                    format: "yyyy.MM.dd"
                    , dateInput: false
                });
            }
            var readonlyEditor = function (container, options) {
                grid2.closeCell();
            };
            //=====================================================================
            //grid setting
            //=====================================================================
			$("#grid1").kendoGrid({
                dataSource: {
                      schema: {
                        model: {
                            fields: {
                                //type : "string", "number", "boolean", "date", "object", (Default) "default"
                                  jpno		    : { type : "string" }
                                , gucd          : { type : "string" }
                                , chasu         : { type : "number" }
                                , cjpno         : { type : "string" }
                                , termcd        : { type : "string" }
                                , usernm        : { type : "string" }
                                , custnm        : { type : "string" }
                                , whnm          : { type : "string" }
                                , pidt          : { type : "string" }
                                , ipdt          : { type : "string" }
                                , tongdt        : { type : "string" }
                                , passdt        : { type : "string" }
                                , inchecktime   : { type : "string" }
                                , itemnm        : { type : "string" }
                                , spec          : { type : "string" }
                                , qty           : { type : "number" }
                                , boxqty        : { type : "number" }
                                , blno          : { type : "string" }
                                , ckcd          : { type : "string" }
                                , ftdt          : { type : "string" }
                                , conbandt      : { type : "string" }
                                , inyodt        : { type : "string" }
                                , incheckdt     : { type : "string" }
                                , inchecktime   : { type : "string" }
                                , rmk           : { type : "string" }
                            }
                        }
                    }
                }
                , columns: [
                      { field : "jpno"        , title : "전표번호"    , hidden : false , width : 120 }
                    , { field : "gucd"        , title : "구분"        , hidden : false , width : 100 }
                    , { field : "chasu"       , title : "차수"        , hidden : true  , width : 100 }
                    , { field : "cjpno"       , title : "공통전표"    , hidden : true  , width : 100 }
                    , { field : "termcd"      , title : "TERMS"       , hidden : false , width : 100 }
                    , { field : "usernm"      , title : "발주담당"    , hidden : false , width : 100 }
                    , { field : "custnm"      , title : "거래사명"    , hidden : false , width : 100 }
                    , { field : "whnm"        , title : "입고창고"    , hidden : false , width : 100 }
                    , { field : "pidt"        , title : "P/I date"    , hidden : false , width : 100 }
                    , { field : "ipdt"        , title : "입항예정일"  , hidden : false , width : 100 }
                    , { field : "tongdt"      , title : "통관예정일"  , hidden : false , width : 100 }
                    , { field : "passdt"      , title : "통관확인"    , hidden : false , width : 100 }
                    , { field : "inchecktime" , title : "입고확인"    , hidden : false , width : 100 }
                    , { field : "itemnm"      , title : "품목명"      , hidden : false , width : 100 }
                    , { field : "spec"        , title : "규격"        , hidden : false , width : 100 }
                    , { field : "qty"         , title : "매수"        , hidden : false , width : 100 }
                    , { field : "boxqty"      , title : "수량(B)"     , hidden : false , width : 100 }
                    , { field : "blno"        , title : "B/L no"      , hidden : false , width : 100 } 
                    , { field : "ckcd"        , title : "C/K"         , hidden : false , width : 100 }
                    , { field : "ftdt"        , title : "F/T"         , hidden : false , width : 100 }
                    , { field : "conbandt"    , title : "CON 반납일"  , hidden : false , width : 100 }
                    , { field : "inyodt"      , title : "입고요청일"  , hidden : false , width : 100 }
                    , { field : "incheckdt"   , title : "입고일"      , hidden : false , width : 100 }
                    , { field : "inchecktime" , title : "입고시간"    , hidden : false , width : 100 }
                    , { field : "rmk"         , title : "발주비고"    , hidden : false , width : 100 }    
                ]
                , selectable: "row" //row, multiple
                , scrollable: true

                , resizable : true
                //, width     : 450
                , height    : 200
                , change        : function(e) {
                        var row = this.select();
                        jpno = this.dataItem(row[0]).jpno;
                        fn_selone();
                    }
            });
			$("#grid2").kendoGrid({
                dataSource: {
                      schema: {
                        model: {
                            fields: {
                                  jpno       : { type : "string" }//type : "string", "number", "boolean", "date", "object", (Default) "default"
                                , jpseq      : { type : "number" }
                                , itemcd     : { type : "string" }
                                , itemnm     : { type : "string" }
                                , spec       : { type : "string" }
                                , qty        : { type : "number" }
                                , boxqty     : { type : "number" }
                                , curcd      : { type : "string" }
                                , unitprice  : { type : "number" }
                                , supplyamt  : { type : "number" }
                                , vat        : { type : "number" }
                                , totamt     : { type : "number" }
                                , conqty     : { type : "number" }
                                , sqm        : { type : "number" }
                                , rmk        : { type : "string" }
                                , tongdt     : { type : "date"   }
                                , passdt     : { type : "date"   }
                                , port       : { type : "string" }
                                , conno      : { type : "string" }
                                , docno      : { type : "string" }
                                , ckcd       : { type : "string" }
                                , ftdt		 : { type : "date"   }
                                , conbandt   : { type : "date"   }
                                , inyodt     : { type : "date"   }
                                , incheckdt  : { type : "date"   }
                                , inchecktime: { type : "string" }
                                , sno		 : { type : "string" }
                                , prodcd     : { type : "string" }
                                , casenom    : { type : "string" }
                                , proddt     : { type : "date"   }
                            }
                        }
                    }
                }
                , columns: [
                      { field : "jpno"       , title : "jpno"           , hidden : false , width : 120, editor: readonlyEditor }
                    , { field : "jpseq"      , title : "번호"           , hidden : false , width : 100, editor: readonlyEditor }
                    , { field : "itemcd"     , title : "품목코드"       , hidden : false , width : 100 }
                    , { field : "itemnm"     , title : "품목명"         , hidden : false , width : 100 }
                    , { field : "spec"       , title : "규격"           , hidden : false , width : 100 }
                    , { field : "qty"        , title : "매수"           , hidden : false , width : 100 }
                    , { field : "boxqty"     , title : "수량(B)"        , hidden : false , width : 100 }
                    , { field : "curcd"      , title : "화폐단위"       , hidden : false , width : 100, value : $("#curcd").val()}
                    , { field : "unitprice"  , title : "단가"           , hidden : false , width : 100, format : "{0:#,###}" }
                    , { field : "supplyamt"  , title : "공급가액"       , hidden : false , width : 100 }
                    , { field : "vat"        , title : "부가세"         , hidden : false , width : 100 }
                    , { field : "totamt"     , title : "합계 금액"      , hidden : false , width : 100 }
                    , { field : "conqty"     , title : "수량(C)"        , hidden : false , width : 100 }
                    , { field : "sqm"        , title : "SQM"            , hidden : false , width : 100 }
                    , { field : "rmk"        , title : "항목비고"       , hidden : false , width : 100 }
                    , { field : "tongdt"     , title : "품목통관 예정일", hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                    , { field : "passdt"     , title : "품목 통관일"    , hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                    , { field : "port"       , title : "PORT"           , hidden : false , width : 100 } 
                    , { field : "conno"      , title : "CON No"         , hidden : false , width : 100 }
                    , { field : "docno"      , title : "원산지증명서"   , hidden : false , width : 100 }
                    , { field : "ckcd"       , title : "C/K"            , hidden : false , width : 100, editor : grid_combo }
                    , { field : "ftdt"		 , title : "F/T"            , hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                    , { field : "conbandt"   , title : "CON반납일"      , hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                    , { field : "inyodt"     , title : "입고요청일"     , hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                    , { field : "incheckdt"  , title : "입고확인"       , hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                    , { field : "inchecktime", title : "입고시간"       , hidden : false , width : 100 }
                    , { field : "sno"		 , title : "시리얼 No"      , hidden : false , width : 100 }
                    , { field : "prodcd"     , title : "PROD code"      , hidden : false , width : 100 } 
                    , { field : "casenom"    , title : "CASE nom"       , hidden : false , width : 100 }
                    , { field : "proddt"     , title : "PROD date"      , hidden : false , width : 100, format: "{0:yyyy.MM.dd}", filterable: {ui: 'datetimepicker'}}
                ]
                , autoSync      : true
                , navigatable   : true
                , selectable    : "row" //row, multiple
                , scrollable    : true
                , editable      : true
                , resizable     : true
                //, change    : grid1_change
                //, dataBound : grid2_dataBound
                //, width     : 450
                , height        : 200
                , edit          : function(e) {
                        var grid = this;
                        grid.tbody.find("tr").dblclick(function(e) {
                            //var cjpno = $('#cjpno').val();
                            //var gucd  = $('#gucd').val();
                            //var rowid = grid.select().index();
                            //var colid = e.target.title;
                            //if (colid == 'itemnm') {
                            //    if (gucd == "B" || jpno == '') {
                            //        pop_item('', 'grid2', rowid);
                            //    }
                            //}
                        });
                        grid.tbody.find("td").keydown(function(e) {
                            if (event.keyCode == 13) {
                                var colid = e.target.title;
                                if (colid == 'itemnm') {
                                    var gucd  = $('#gucd').val();
                                    var rowid = grid.select().index();
                                    var sw = e.target.value;
                                    if (gucd == "B" || jpno == '') {
                                        pop_item(sw, 'grid2', rowid);
                                    }
                                }
                                if (colid == 'totamt') {
                                    var termcd  = $('#termcd').val();
                                    if (termcd == '1') { //내수일경우
                                        var dataItem = grid.dataItem(grid.select());
                                        var totamt = e.target.value;
                                        var supplyamt = parseInt(totamt / 1.1);
                                        var vat = totamt - supplyamt;
                                        dataItem.set('vat', vat);
                                        dataItem.set('supplyamt', supplyamt);
                                    }
                                }
                            }
                        });
                    }
                , dataBound     : function(e) {
                        var grid = this;
                        //for (var i = 0; i < this.columns.length; i++) {
                        //    this.autoFitColumn(i);
                        //}
                        //grid.tbody.find("tr").dblclick(function(e) {
                        //    var rowid = e.select().index();
                        //    var cjpno = $('#cjpno').val();
                        //    var gucd  = $('#gucd').val();
                        //    alert(rowid);
                        //    if (gucd == "B" || jpno == '') {
                        //        pop_item('', 'grid2', rowid);
                        //    }
                        //    var row = grid.dataItem(this);
                        //    //alert(row.jpno);
                        //});
				}
				, save: function(e) {
	        	    if (e.values.hasOwnProperty('CD_GD')) { // 감시하고자 하는 컬럼이 수정되었는지 확인하는 방법
                        //var cd_gd = e.values.CD_GD;
                        //for(var i = 0; i < sclArr.length; i++) {
                        //	if (sclArr[i].CD_SCALED == cd_gd) { e.model.NUM_PT = sclArr[i].NUM_PT; this.refresh(); break;}
                        //}
                        //setTimeout(function() {
                        //	    getTotalGrade();
                        //});
	        	    }
	        	    if (e.values.hasOwnProperty('NUM_PT')) { // 감시하고자 하는 컬럼이 수정되었는지 확인하는 방법
                        //var num_from = Number($('#num_from').val());
                        //var num_to   = Number($('#num_to').val());
	        		
                        //var num_pt_rater = e.values.NUM_PT;
                        //if (num_pt_rater < num_from || num_pt_rater > num_to) {
                        //	dews.error(dews.localize.get("점수는 " + num_from + '점에서 ' + num_to + '까지 입력가능합니다.'));
                        //	this.cancelChanges(e.model);
                        //}
                        //setTimeout(function() {
                        //	    getTotalGrade();
                        //});
	        	    }	
				}
            });

            grid1 = $('#grid1').data('kendoGrid');
            grid2 = $('#grid2').data('kendoGrid');

            if (jpno == '') { grid2.dataSource.data([]); }
            else { fn_search(); fn_selone(); }
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

                    var grid = $('#grid1').data('kendoGrid');
                    grid.dataSource.data(data);
                    
                    //첫 행 선택
                    var row = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                    grid.select(row);
                    $('#cjpno').val(grid.dataItem(row).cjpno);
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function fn_selone() {
            var param = JSON.stringify({ 'jpno': jpno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $('#jpno').val(result[0].jpno);
                    $('#chasu').val(result[0].chasu);
                    $('#gucd').val(result[0].gucd);
                    $('#scd').val(result[0].scd);
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
                    $('#curcd').val(result[0].curcd); console.log(result[0].curcd);
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
                    $('#useyn').val(result[0].useyn);

                    grid2.dataSource.data([]);
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            fn_detail_search();
        }
        function fn_detail_search() {
            var param = JSON.stringify({ 'jpno': jpno });

            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/detail_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d)
                    var grid = $('#grid2').data('kendoGrid');
                    grid.dataSource.data(data);
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
        function fn_init() {
            $('#jpno').val('');
            $('#chasu').val('');
            $('#gucd').val('');
            $('#scd').val('');
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
            $('#curcd').val('');
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
            //grid1.dataSource.data([]);
        }
        //===============================================================
        // 버튼~~(구매전표)
        //===============================================================
        function fn_new() {
            fn_init();

            var cjpno = $('#cjpno').val();
            if (cjpno == '') return;

            var param = JSON.stringify({ 'cjpno': cjpno });
            //통관전표
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/selone_init",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    //$('#jpno').val(result[0].jpno);
                    //$('#chasu').val(result[0].chasu);
                    //$('#gucd').val(result[0].gucd);
                    //$('#scd').val(result[0].scd);
                    $('#jpdt').val(result[0].jpdt);
                    $('#userid').val(result[0].userid);
                    $('#usernm').val(result[0].usernm);
                    $('#custcd').val(result[0].custcd);
                    $('#custnm').val(result[0].custnm);
                    $('#tel').val(result[0].tel);
                    $('#termcd').val(result[0].termcd);
                    $('#whcd').val(result[0].whcd);
                    $('#pidt').val(result[0].pidt);
                    //$('#janamt').val(result[0].janamt);
                    $('#pino').val(result[0].pino);
                    //$('#curcd').val(result[0].curcd);
                    $('#bcheckdt').val(result[0].bcheckdt);
                    //$('#paycd').val(result[0].paycd);
                    //$('#paydt').val(result[0].paydt);
                    //$('#lcno').val(result[0].lcno);
                    //$('#mandt').val(result[0].mandt);
                    //$('#blno').val(result[0].blno);
                    //$('#shipdt').val(result[0].shipdt);
                    //$('#amt').val(result[0].amt);
                    //$('#chuldt').val(result[0].chuldt);
                    //$('#tolper').val(result[0].tolper);
                    //$('#ipdt').val(result[0].ipdt);
                    //$('#tolamt').val(result[0].tolamt);
                    //$('#conbandt').val(result[0].conbandt);
                    //$('#usance').val(result[0].usance);
                    //$('#shipnm').val(result[0].shipnm);
                    //$('#rmk').val(result[0].rmk);
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            //품목리스트 
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/detail_search_init",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    var grid = $('#grid2').data('kendoGrid');
                    grid.dataSource.data(data);
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        var param_del = [];
        function fn_save() {
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
            param.jpno      = $.trim($("#jpno"      ).val());
            param.chasu     = $.trim($("#chasu"     ).val());
            param.cjpno     = $.trim($("#cjpno"     ).val());
            param.gucd      = $.trim($("#gucd"      ).val());
            param.scd       = $.trim($("#scd"       ).val());
            param.jpdt      = $.trim($("#jpdt"      ).val());
            param.termcd    = $.trim($("#termcd"    ).val());
            param.pidt      = $.trim($("#pidt"      ).val());
            param.userid    = $.trim($("#userid"    ).val());
            param.custcd    = $.trim($("#custcd"    ).val());
            param.whcd      = $.trim($("#whcd"      ).val());
            param.janamt    = $.trim($("#janamt"    ).val());
            param.pino      = $.trim($("#pino"      ).val());
            param.curcd     = $.trim($("#curcd"     ).val());
            param.bcheckdt  = $.trim($("#bcheckdt"  ).val());
            param.paycd     = $.trim($("#paycd"     ).val());
            param.paydt     = $.trim($("#paydt"     ).val());
            param.lcno      = $.trim($("#lcno"      ).val());
            param.amt       = $.trim($("#amt"       ).val());
            param.tolper    = $.trim($("#tolper"    ).val());
            param.tolamt    = $.trim($("#tolamt"    ).val());
            param.usance    = $.trim($("#usance"    ).val());
            param.mandt     = $.trim($("#mandt"     ).val());
            param.blno      = $.trim($("#blno"      ).val());
            param.shipdt    = $.trim($("#shipdt"    ).val());
            param.chuldt    = $.trim($("#chuldt"    ).val());
            param.ipdt      = $.trim($("#ipdt"      ).val());
            param.conbandt  = $.trim($("#conbandt"  ).val());
            param.shipnm    = $.trim($("#shipnm"    ).val());
            param.rmk       = $.trim($("#rmk"       ).val());
            param.useyn     = $.trim($("#useyn"     ).val());
            if (param.jpdt   == '') { alert('발주일자를 입력해주세요!'); return; }
            if (param.curcd  == '') { alert('화폐단위를 입력해주세요!'); return; }
            //if (param.userid == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
            var param = JSON.stringify(param);
            var param2 = [];
            var row = grid2.dataSource.data();
            for (var i = 0; i < row.length; i++) {
                //================================================================
                // validation check
                //================================================================




                param2.push(row[i]);
            }
            if(param2.length == 0) {
                alert('품목을 입력해주세요!');
                return;
            }
            param2 = JSON.stringify(param2);
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/save",
                data: JSON.stringify({ 'param': param, 'param2': param2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        jpno = result.val;
                        fn_init();
                        fn_search();
                        fn_selone();
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
        function fn_del() {  
            if (!confirm('해당 전표를 삭제하시겠습니까?')) return;

            var count = grid1.dataSource.data().length - 1;
            var rowid = grid1.select().index();

            if (count != rowid) { alert('마지막 행만 삭제 가능합니다'); return; }
            
            var param = {};
            param.jpno = $.trim($("#jpno").val());
            if (param.jpno == '') {
                alert('해당 전표는 등록되지 않은 전표 입니다!'); return;
            }
            var param = JSON.stringify(param);
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/del",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        fn_init();
                        fn_search();
                        var count = grid1.dataSource.data().length;
                        if (count > 0) {
                            var row = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                            grid.select(row);
                            $('#cjpno').val(grid.dataItem(row).cjpno);
                        }
                        else {
                            $('#cjpno').val('');
                        }
                        alert('삭제 되었습니다');
                    }
                    else { alert("삭제 오류!"); return; }
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function fn_row_add() {
            var rowData = {
                      "jpno"        : jpno
                    , "jpseq"       : 0
                    , "itemcd"      : ''
                    , "itemnm"      : ''
                    , "spec"        : ''
                    , "qty"         : ''
                    , "boxqty"      : ''
                    , "curcd"       : ''
                    , "unitprice"   : ''
                    , "supplyamt"   : ''
                    , "vat"         : ''
                    , "totamt"      : ''
                    , "conqty"      : ''
                    , "sqm"         : ''
                    , "rmk"         : ''
                    , "tongdt"      : ''
                    , "passdt"      : ''
                    , "port"        : ''
                    , "conno"       : ''
                    , "docno"       : ''
                    , "ckcd"        : ''
                    , "ftdt"        : ''
                    , "conbandt"    : ''
                    , "inyodt"      : ''
                    , "incheckdt"   : ''
                    , "inchecktime" : ''
                    , "sno"         : ''
                    , "prodcd"      : ''
                    , "casenom"     : ''
                    , "proddt"      : '' 
            }
            grid = grid2;
            grid.dataSource.add(rowData); //grid2.addRow() : 오늘일자로 세팅되며 제일 첫줄에 신규 행이 발생
            var count = grid.dataSource.data().length;
            var row = grid.tbody.find(">tr:not(.k-grouping-row)").eq(count - 1);
            grid.select(row);
        }
        function fn_row_del() {
            var grid = grid2;
            var row = grid.select();
            var dataItem = grid.dataItem(row);
            //grid.removeRow(dataItem); //just gives alert message
            grid.dataSource.remove(dataItem); //removes it actually from the grid
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
        function pop_result_item_grid(param) {
            var grid = grid2;
            var count = 0;
            for (var i = 0; i < grid2.dataSource.data().length; i++) {
                var row = grid.dataSource.data()[i]; //index 0부터 시작
                if (row.itemcd == param.itemcd) {
                    count = count + 1;
                    alert('동일한 품목이 존재 합니다!');
                    return;
                }
            }
            var dataItem  = grid.dataSource.data()[pop_item_row]; //index 0부터 시작
            //var row = grid.tbody.find(">tr:not(.k-grouping-row)").eq(1); //ok : index 0 부터 시작
            //var dataItem = grid.dataItem(row); //ok
            dataItem.set("itemcd"   , param.itemcd      );
            dataItem.set("itemnm"   , param.itemnm      );
            dataItem.set("spec"     , param.spec        );
            dataItem.set("qty"      , param.qty         );
            dataItem.set("unitprice", param.unitprice   );
            dataItem.set("sqm"      , param.sqm         );
        }
    </script>
</asp:Content>
