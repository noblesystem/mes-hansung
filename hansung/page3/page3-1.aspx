<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page3-1.aspx.cs" Inherits="hansung.page3.page3_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>영업전표관리</h2>

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
                                <li>
                                    <div class="div-btn-header" onclick="opentpopuppayment()"><span class="span-title">지급</span></div>
                                </li>
                            </ul>
<div class="fixedScroll">
<!-- 전표리스트 ==================================================================================== -->
<div id="grid1"></div>
<!-- 전표 ======================================================================================== -->
<table><tr><td width="100">[HIDDEN]</td><td>
    chasu<input type="text" id="chasu"      readonly="readonly" />
    csaleno<input type="text" id="csaleno"    readonly="readonly" />
    useyn<input type="text" id="useyn"      readonly="readonly" />
</td></tr></table>
<table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
    <tbody>
        <tr>
            <td>전표번호</td>
            <td><input type="text" id="saleno" readonly="readonly" /></td>
            <td>전표구분</td>
            <td><select id="gucd" disabled="disabled"></select></td>
            <td>마감여부</td>
            <td><select id="scd"></select></td>
        </tr>
        <tr>
            <td>수주일자(c)</td>
            <td><input type="text" id="saledt" class="datecombo"/></td>
            <td>영업 담당</td>
            <td><input id="userid" type="hidden"/><input id="usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
            <td>고객사명(c)</td>
            <td><input id="custcd" type="hidden"/><input id="custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#custnm').val(), 'custcd', 'custnm', 'tel')" /></td>
        </tr>
        <tr>
            <td>고객사 연락처(c)</td>
            <td><input id="tel" type="text"/></td>
            <td>거래조건(c)</td>
            <td><select id="termcd"></select></td>
            <td>미수금</td>
            <td><input id="janamt" type="text" class="inputmoney inputmoney-manager" style="width: 100%" /></td>
        </tr>
        <tr>
            <td>출고창고(c)</td>
            <td><select id="whcd"></select></td>
            <td>출고예정일(c)</td>
            <td><input id="ydt" type="text"  class="datecombo"/></td>
            <td>도착지 연락처(c)</td>
            <td><input id="doaddr" type="text" /></td>
        </tr>
        <tr>
            <td>프레임(c)</td>
            <td><select id="framecd"></select></td>
            <td>발주 비고</td>
            <td colspan="5"><input id="rmk" type="text"/></td>
        </tr>
        <tr>
            <td>운송사</td>
            <td><input id="carnm" type="text" /></td>
            <td>차량번호</td>
            <td><input id="carno" type="text" /></td>
            <td>운임</td>
            <td><input id="carpayamt" type="text" /></td>
        </tr>
        <tr>
            <td>승인확인</td>
            <td><input id="checkdt" type="text" class="datecombo" /></td>
            <td>출고확인</td>
            <td><input id="outdt" type="text"  class="datecombo" /></td>
            <td>출고시간</td>
            <td><input id="outtime" type="text"/></td>
        </tr>
    </tbody>
</table>
<!-- 영업전표상세 ==================================================================================== -->
<div id="grid2"></div>
<br/>[작업 내역 리스트]
<br/>* 테스트 및 보완 필요
<br/>* 요청사항 보완
<br/>* 컬럼 넓이 수정

				    </div>
			    </div>
		    </div>
	    </div> 
    </div>
<style>
#data-grid-demo {
    min-height: 700px;
}
#gridContainer {
    padding-top: 45px;
}
#gridDeleteSelected {
    position: absolute;
    z-index: 1;
    right: 0;
    margin: 1px;
    top: 0;
}
.dx-button-text {
    line-height: 0;
}
</style>
    <script>
        var saleno = '<%=saleno %>';
        $(document).ready(function () {
            //combo
            $('#scd'    ).zentSetCombo('C010', '', '==선택==');
            $('#termcd' ).zentSetCombo('C001', '', '==선택==');
            $('#curcd'  ).zentSetCombo('C002', '', '==선택==');
            $('#whcd'   ).zentSetComboWhcd('', '==선택==');
            $('#gucd'   ).zentSetCombo('C013', '', '==선택==');

            var string_curcd = combo_code_string('C002', '', '==선택==');
            //=====================================================================
            //grid column option
            //=====================================================================
            var grid_combo = function(container, options) {
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
            //=====================================================================
            //grid setting
            //=====================================================================
			$("#grid1").kendoGrid({
                dataSource: {
                      schema: {
                        model: {
                            fields: {
                                  saleno     : { type : "string" }
                                , gucd       : { type : "string" }
                                , chasu      : { type : "number" }
                                , csaleno    : { type : "string" }
                                , usernm     : { type : "string" }
                                , custnm     : { type : "string" }
                                , whnm       : { type : "string" }
                                , ydt        : { type : "string" }
                                , checkdt    : { type : "string" }
                                , outdt      : { type : "string" }
                                , itemnm     : { type : "string" }
                                , spec       : { type : "string" }
                                , qty        : { type : "string" }
                                , boxqty     : { type : "string" }
                                , carnm      : { type : "string" }
                                , carno      : { type : "number" }
                                , carpayamt  : { type : "number" }
                                , rmk        : { type : "string" }
                            }
                        }
                    }
                }
                , columns: [
                      { field : "saleno"    , title : '전표번호'   , hidden : false , width : 120 }
                    , { field : "gucd"      , title : 'gucd'       , hidden : false , width : 100 }
                    , { field : "chasu"     , title : 'chasu'      , hidden : true  , width : 100 }
                    , { field : "csaleno"   , title : 'csaleno'    , hidden : true  , width : 100 }
                    , { field : "usernm"    , title : '영업담당'   , hidden : false , width : 100 }
                    , { field : "custnm"    , title : '고객사명'   , hidden : false , width : 100 }
                    , { field : "whnm"      , title : '출고창고'   , hidden : false , width : 100 }
                    , { field : "ydt"       , title : '출고예정일' , hidden : false , width : 100 }
                    , { field : "checkdt"   , title : '승인확인'   , hidden : false , width : 100 }
                    , { field : "outdt"     , title : '출고확인'   , hidden : false , width : 100 }
                    , { field : "itemnm"    , title : '품목명'     , hidden : false , width : 100 }
                    , { field : "spec"      , title : '규격'       , hidden : false , width : 100 }
                    , { field : "qty"       , title : '매수'       , hidden : false , width : 100 }
                    , { field : "boxqty"    , title : '수량(B)'    , hidden : false , width : 100 }
                    , { field : "carnm"     , title : '운송사'     , hidden : false , width : 100 }
                    , { field : "carno"     , title : '차량번호'   , hidden : false , width : 100 }
                    , { field : "carpayamt" , title : '운임'       , hidden : false , width : 100 }
                    , { field : "rmk"       , title : '수주비고'   , hidden : false , width : 100 } 
                ]
                , selectable: "row" //row, multiple
                , scrollable: true
                , resizable : true
                , height    : 200
                , change    : function(e) {
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
                                  saleno   : { type : "string" }
                                , saleseq  : { type : "number" }
                                , itemcd   : { type : "string" }
                                , itemnm   : { type : "string" }
                                , spec     : { type : "string" }
                                , qty      : { type : "number" }
                                , boxqty   : { type : "number" }
                                , curcd    : { type : "string" }
                                , unitprice: { type : "number" }
                                , supplyamt: { type : "number" }
                                , vat      : { type : "number" }
                                , totamt   : { type : "number" }
                                , rmk      : { type : "string" }
                                , sno      : { type : "string" }
                                , caseno   : { type : "string" }
                                , prodno   : { type : "string" }
                            }
                        }
                    }
                }
                , columns: [
                      { field : "saleno"     , title : '전표'     , hidden : false , width : 120 }
                    , { field : "saleseq"    , title : '번호'     , hidden : false , width : 100 }
                    , { field : "itemcd"     , title : '품목코드' , hidden : false , width : 100 }
                    , { field : "itemnm"     , title : '품목명'   , hidden : false , width : 100 }
                    , { field : "spec"       , title : '규격'     , hidden : false , width : 100 }
                    , { field : "qty"        , title : '매수'     , hidden : false , width : 100 }
                    , { field : "boxqty"     , title : '수량(B)'  , hidden : false , width : 100 }
                    , { field : "curcd"      , title : '화폐단위' , hidden : false , width : 100, editor : grid_combo }
                    , { field : "unitprice"  , title : '단가'     , hidden : false , width : 100 }
                    , { field : "supplyamt"  , title : '공급가액' , hidden : false , width : 100 }
                    , { field : "vat"        , title : '부가세'   , hidden : false , width : 100 }
                    , { field : "totamt"     , title : '합계 금액', hidden : false , width : 100 }
                    , { field : "rmk"        , title : '항목비고' , hidden : false , width : 100 }
                    , { field : "sno"        , title : '시리얼 No', hidden : false , width : 100 }
                    , { field : "caseno"     , title : 'CASE No'  , hidden : false , width : 100 }
                    , { field : "prodno"     , title : 'PROD No'  , hidden : false , width : 100 }
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
                        grid.tbody.find("td").keydown(function(e) {
                            if (event.keyCode == 13) {
                                var colid = e.target.title;
                                if (colid == 'itemnm') {
                                    var gucd  = $('#gucd').val();
                                    var rowid = grid.select().index();
                                    var sw = e.target.value;
                                    if (gucd == "B" || saleno == '') {
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
				}
				, save: function(e) {
	        	    if (e.values.hasOwnProperty('CD_GD')) { 
	        	    }
	        	    if (e.values.hasOwnProperty('NUM_PT')) {
	        	    }	
				}
            });

            grid1 = $('#grid1').data('kendoGrid');
            grid2 = $('#grid2').data('kendoGrid');

            if (saleno == '') { grid2.dataSource.data([]); }
            else { fn_search(); fn_selone(); }
        });
        //===============================================================
        // 검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'saleno': saleno });
            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/search",
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
                    $('#csaleno').val(grid.dataItem(row).csaleno);
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function fn_selone() {
            var param = JSON.stringify({ 'saleno': saleno });
            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $('#saleno'     ).val(result[0].saleno   );
                    $('#chasu'      ).val(result[0].chasu    );
                    $('#csaleno'    ).val(result[0].csaleno  );
                    $('#gucd'       ).val(result[0].gucd     );
                    $('#scd'        ).val(result[0].scd      );
                    $('#saledt'     ).val(result[0].saledt   );
                    $('#userid'     ).val(result[0].userid   );
                    $('#custcd'     ).val(result[0].custcd   );
                    $('#termcd'     ).val(result[0].termcd   );
                    $('#janamt'     ).val(result[0].janamt   );
                    $('#whcd'       ).val(result[0].whcd     );
                    $('#ydt'        ).val(result[0].ydt      );
                    $('#dotel'      ).val(result[0].dotel    );
                    $('#framecd'    ).val(result[0].framecd  );
                    $('#doaddr'     ).val(result[0].doaddr   );
                    $('#rmk'        ).val(result[0].rmk      );
                    $('#carnm'      ).val(result[0].carnm    );
                    $('#carno'      ).val(result[0].carno    );
                    $('#carpayamt'  ).val(result[0].carpayamt);
                    $('#checkdt '   ).val(result[0].checkdt  );
                    $('#outdt'      ).val(result[0].outdt    );
                    $('#outtime'    ).val(result[0].outtime  );
                    $('#useyn'      ).val(result[0].useyn    );

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
            var param = JSON.stringify({ 'saleno': saleno });

            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/detail_search",
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
            $('#saleno').val('');
            $('#chasu').val('');
            //$('#csaleno').val('');
            $('#gucd').val('');
            $('#scd').val('');
            $('#saledt').val('');
            $('#userid').val('');
            $('#custcd').val('');
            $('#termcd').val('');
            $('#janamt').val('');
            $('#whcd').val('');
            $('#ydt').val('');
            $('#dotel').val('');
            $('#framecd').val('');
            $('#doaddr').val('');
            $('#rmk').val('');
            $('#carnm').val('');
            $('#carno').val('');
            $('#carpayamt').val('');
            $('#checkdt').val('');
            $('#outdt').val('');
            $('#outtime').val('');
        }
        //===============================================================
        // 버튼~~(구매전표)
        //===============================================================
        function fn_new() {
            fn_init();
            var csaleno = $('#csaleno').val();
            if (csaleno == '') return;

            var param = JSON.stringify({ 'csaleno': csaleno });
            //통관전표
            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/selone_init",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.length == 0) {
                        return true;
                    }
                    //$('#saleno'     ).val(result[0].saleno   );
                    //$('#chasu'      ).val(result[0].chasu    );
                    $('#csaleno'    ).val(result[0].csaleno  );
                    //$('#gucd'       ).val(result[0].gucd     );
                    //$('#scd'        ).val(result[0].scd     );
                    $('#saledt'     ).val(result[0].saledt   );
                    $('#userid'     ).val(result[0].userid   );
                    $('#usernm'     ).val(result[0].usernm   );
                    $('#custcd'     ).val(result[0].custcd   );
                    $('#custnm'     ).val(result[0].custnm   );
                    $('#termcd'     ).val(result[0].termcd   );
                    //$('#janamt'     ).val(result[0].janamt   );
                    $('#whcd'       ).val(result[0].whcd     );
                    $('#ydt'        ).val(result[0].ydt      );
                    $('#dotel'      ).val(result[0].dotel    );
                    $('#framecd'    ).val(result[0].framecd  );
                    $('#doaddr'     ).val(result[0].doaddr   );
                    $('#rmk'        ).val(result[0].rmk      );
                    //$('#carnm'      ).val(result[0].carnm    );
                    //$('#carno'      ).val(result[0].carno    );
                    //$('#carpayamt'  ).val(result[0].carpayamt);
                    //$('#checkdt '   ).val(result[0].checkdt  );
                    //$('#outdt'      ).val(result[0].outdt    );
                    //$('#outtime'    ).val(result[0].outtime  );
                    //$('#useyn'      ).val(result[0].useyn    );
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            //품목리스트 
            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/detail_search_init",
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
            var param = {};
            param.mode      = $.trim($('#mode'      ).val());
            param.saleno    = $.trim($('#saleno'    ).val());
            param.chasu     = $.trim($('#chasu'     ).val());
            param.csaleno   = $.trim($('#csaleno'   ).val());
            param.gucd      = $.trim($('#gucd'      ).val());
            param.scd       = $.trim($("#scd"       ).val());
            param.saledt    = $.trim($('#saledt'    ).val());
            param.userid    = $.trim($('#userid'    ).val());
            param.custcd    = $.trim($('#custcd'    ).val());
            param.termcd    = $.trim($('#termcd'    ).val());
            param.janamt    = $.trim($('#janamt'    ).val());
            param.whcd      = $.trim($('#whcd'      ).val());
            param.ydt       = $.trim($('#ydt'       ).val());
            param.dotel     = $.trim($('#dotel'     ).val());
            param.framecd   = $.trim($('#framecd'   ).val());
            param.doaddr    = $.trim($('#doaddr'    ).val());
            param.rmk       = $.trim($('#rmk'       ).val());
            param.carnm     = $.trim($('#carnm'     ).val());
            param.carno     = $.trim($('#carno'     ).val());
            param.carpayamt = $.trim($('#carpayamt' ).val());
            param.checkdt   = $.trim($('#checkdt'   ).val());
            param.outdt     = $.trim($('#outdt'     ).val());
            param.outtime   = $.trim($('#outtime'   ).val());
            param.useyn     = $.trim($('#useyn'     ).val());
            if (param.saledt   == '') { alert('수주일자를 입력해주세요!'); return; }
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
                url: "/page3/page31_svc.asmx/save",
                data: JSON.stringify({ 'param': param, 'param2': param2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        saleno = result.val;
                        fn_init();
                        fn_search();
                        fn_selone();
                        alert('저장되었습니다');
                    }
                    else { alert("저장오류!"); return; }

                },
                error: function (request, status, error) {
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
            param.saleno = $.trim($("#saleno").val());
            if (param.saleno == '') {
                alert('해당 전표는 등록되지 않은 전표 입니다!'); return;
            }
            var param = JSON.stringify(param);
            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/del",
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
                            $('#csaleno').val(grid.dataItem(row).csaleno);
                        }
                        else {
                            $('#csaleno').val('');
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
                  "saleno"      : saleno
                , "saleseq"     : 0
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
                , "rmk"         : ''
                , "sno"         : ''
                , "caseno"      : ''
                , "prodno"      : '' 
            }
            grid = grid2;
            grid.dataSource.add(rowData); //grid2.addRow() : 오늘일자로 세팅되며 제일 첫줄에 신규 행이 발생
            var count = grid.dataSource.data().length;
            var row = grid.tbody.find(">tr:not(.k-grouping-row)").eq(count - 1);
            grid.select(row);
        }
        function fn_row_del() {
            var grid = grid2;
            var row  = grid.select();
            var dataItem = grid.dataItem(row);
            grid.dataSource.remove(dataItem);
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
