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
                                <table id="grid1"></table>
                                <div id="grid1_pager"></div>
<!-- 전표 ======================================================================================== -->
                                <table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
                                    <tbody>
                                        <tr>
                                            <td>전표번호</td>
                                            <td><input type="text" id="saleno" readonly="readonly" />차수<input type="text" id="chasu" readonly="readonly" />공통전표<input type="text" id="csaleno" readonly="readonly" /></td>
                                            <td>전표구분</td>
                                            <td><select id="gucd" disabled="disabled"></select></td>
                                        </tr>
                                        <tr>
                                            <td>수주일자(번호)</td>
                                            <td><input type="text" id="saledt" class="datecombo"/></td>
                                            <td>영업 담당</td>
                                            <td><input id="userid" type="hidden"/><input id="usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
                                        </tr>
                                        <tr>
                                            <td>고객사명</td>
                                            <td><input id="custcd" type="hidden"/><input id="custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#custnm').val(), 'custcd', 'custnm', 'tel')" /></td>
                                            <td>고객사 연락처</td>
                                            <td><input id="tel" type="text"/></td>
                                        </tr>
                                        <tr>   
                                            <td>거래조건</td>
                                            <td><select id="termcd"></select></td>
                                            <td>미수금</td>
                                            <td><input id="janamt" type="text" class="inputmoney inputmoney-manager" style="width: 100%" /></td>
                                        </tr>
                                        <tr>
                                            <td>출고 창고</td>
                                            <td><select id="whcd"></select></td>
                                            <td>출고예정일</td>
                                            <td><input id="ydt" type="text"  class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>도착지 연락처</td>
                                            <td><input id="doaddr" type="text" /></td>
                                            <td>프레임</td>
                                            <td><select id="framecd"></select></td>
                                        </tr>
                                        <tr>
                                            <td>발주 비고</td>
                                            <td colspan="3"><input id="rmk" type="text"/></td>
                                        </tr>
                                        <tr>
                                            <td>운송사</td>
                                            <td><input id="carnm" type="text" /></td>
                                            <td>차량번호</td>
                                            <td><input id="carno" type="text" /></td>
                                        </tr>
                                        <tr>
                                            <td>운임</td>
                                            <td><input id="carpayamt" type="text" /></td>
                                            <td>승인확인</td>
                                            <td><input id="checkdt" type="text" class="datecombo" /></td>
                                        </tr>
                                        <tr>
                                            <td>출고확인</td>
                                            <td><input id="outdt" type="text"  class="datecombo" /></td>
                                            <td>출고시간</td>
                                            <td><input id="outtime" type="text"/></td>
                                        </tr>
                                    </tbody>
                                </table>
<!-- 구매전표상세 ==================================================================================== -->

                                <table id="grid2"></table>
                                <div id="grid2_pager"></div>
</div>
				    </div>
			    </div>
		    </div>
	    </div> 
    </div>
    <script>
        var saleno = '<%=saleno %>';
        $(document).ready(function () {
            $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
            //saleno = $('#saleno').val();
            //if (saleno == '') saleno = '';
            $('#termcd').zentSetCombo('C001', '', '==선택==');
            $('#curcd').zentSetCombo('C002', '', '==선택==');
            $('#whcd').zentSetComboWhcd('', '==선택==');
            //$('#paycd').zentSetCombo('C003', '', '==선택==');
            $('#gucd').zentSetCombo('C013', '', '==선택==');
            //var string_scd = combo_code_string('C010', '', '==선택==');
            var string_curcd = combo_code_string('C002', '', '==선택==');
            //var string_ckcd = combo_code_string('C005', '', '==선택==');
            //=====================================================================
            //grid setting
            //=====================================================================
            jQuery("#grid1").jqGrid({
                colNames: ['전표번호', 'gucd', 'chasu', 'csaleno', '영업담당', '고객사명', '출고창고', '출고예정일', '승인확인', '출고확인', '품목명', '규격',
                    '매수', '수량(B)', '운송사', '차량번호', '운임', '수주비고'],
                colModel: [
                      { name: "saleno", index: "saleno", width: 100 }
                    , { name: "gucd", index: "gucd", width: 100 }
                    , { name: "chasu", index: "chasu", width: 100 }
                    , { name: "csaleno", index: "csaleno", width: 100 }
                    , { name: "usernm", index: "usernm", width: 100 }
                    , { name: "custnm", index: "custnm", width: 100 }
                    , { name: "whnm", index: "whnm", width: 100 }
                    , { name: "ydt", index: "ydt", width: 100 }
                    , { name: "checkdt", index: "checkdt", width: 100 }
                    , { name: "outdt", index: "outdt", width: 100 }
                    , { name: "itemnm", index: "itemnm", width: 100 }
                    , { name: "spec", index: "spec", width: 100 }
                    , { name: "qty", index: "qty", width: 100 }
                    , { name: "boxqty", index: "boxqty", width: 100 }
                    , { name: "carnm", index: "carnm", width: 100 }
                    , { name: "carno", index: "carno", width: 100 }
                    , { name: "carpayamt", index: "carpayamt", width: 100 }
                    , { name: "rmk", index: "rmk", width: 100 }
                ],

                //forceFit: true,
                //cellEdit: true,
                //cellsubmit: 'clientArray',
                onSelectRow: function (rowid, status, e) {
                    saleno = $('#grid1').jqGrid('getCell', rowid, 'saleno');
                    fn_selone();
                },
                //rowNum: 10,
                //rowList: [10, 20, 30],
                //pager: '#pager2',
                //sortname: 'id',
                viewrecords: true,
                //sortorder: "desc",
                height: 100,
                caption: ""
            });
            jQuery("#grid1").jqGrid('navGrid', '#grid1_pager', { edit: false, add: false, del: false });
            jQuery("#grid2").jqGrid({
                colNames: ['mode', '전표', '번호', '품목코드', '품목명', '규격', '매수', '수량(B)', '화폐단위', '단가', '공급가액', '부가세', '합계 금액',
                    '항목비고', '시리얼 No', 'CASE No', 'PROD No'],
                colModel: [
                      { name: "mode", index: "mode", width: 100, editable: false }
                    , { name: "saleno", index: "saleno", width: 100, editable: false }
                    , { name: "saleseq", index: "saleseq", width: 100, editable: false }
                    , { name: "itemcd", index: "itemcd", width: 100, editable: false }
                    , { name: "itemnm", index: "itemnm", width: 100, editable: false }
                    , { name: "spec", index: "spec", width: 100, editable: false }
                    , { name: "qty", index: "qty", width: 100, editable: false }
                    , { name: "boxqty", index: "boxqty", width: 100, editable: true }
                    , { name: "curcd", index: "curcd", width: 100, editable: true, formatter: "select", edittype: "select", editoptions: { value: string_curcd } }
                    , { name: "unitprice", index: "unitprice", width: 100, editable: true }
                    , { name: "supplyamt", index: "supplyamt", width: 100, editable: true }
                    , { name: "vat", index: "vat", width: 100, editable: true }
                    , { name: "totamt", index: "totamt", width: 100, editable: true,
                        editoptions: {
                            size: '50', maxlength: '100', dataEvents: [{
                                type: 'keydown', fn: function (e) { }
                            }]    //dataEvents 종료
                        }
                    }  //editoptions 종료, 칼럼정의 종료
                    , { name: "rmk", index: "rmk", width: 100, editable: true }
                    , { name: "sno", index: "sno", width: 100, editable: true }
                    , { name: "caseno", index: "caseno", width: 100, editable: true }
                    , { name: "prodno", index: "prodno", width: 100, editable: true }
                ],
                onSelectRow: function (rowid, status, e) {
                    var $this = $(this);

                    //$this.jqGrid('setGridParam', { cellEdit: true });
                    //$this.jqGrid('editCell', iRow, iCol, true);
                    //$this.jqGrid('setGridParam', { cellEdit: false });
                    //if (rowid && rowid !== lastsel) {
                    //    jQuery('#grid2').jqGrid('restoreRow', lastsel);
                    //    jQuery('#grid2').jqGrid('editRow', rowid, true);
                    //    lastsel = rowid;
                    //}
                },
                //loadonce: true,
                //gridview: true,
                rownumbers: true,                datatype: 'json',                //viewrecords: true,                //height: 'auto',                //editurl: 'clientArray',                forceFit: true,
                cellEdit: true,
                cellsubmit: 'clientArray',
                afterSaveCell: function (rowid, cellname, value, iRow, iCol) {
                    if (cellname == "totamt") {
                        var totamt = value;
                        if (totamt == '0' || totamt == '') return;
                        var supplyamt = parseInt(totamt / 1.1);
                        var vat = totamt - supplyamt;
                        $("#grid2").jqGrid('setRowData', rowid, { 'supplyamt': supplyamt });
                        $("#grid2").jqGrid('setRowData', rowid, { 'vat': vat });
                    }
                },
                afterEditCell: function (rowid, cellname, value, iRow, iCol) {
                    //if (cellname == 'tongdt') { $("#" + iRow + "_tongdt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //if (cellname == 'passdt') { $("#" + iRow + "_passdt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //if (cellname == 'ftdt') { $("#" + iRow + "_ftdt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //if (cellname == 'conbandt') { $("#" + iRow + "_conbandt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //if (cellname == 'inyodt') { $("#" + iRow + "_inyodt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //if (cellname == 'indt') { $("#" + iRow + "_indt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //if (cellname == 'proddt') { $("#" + iRow + "_proddt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                    //$("#" + rowid + "_" + cellname).blur(function () {
                    //    $("#tong_grid").jqGrid("saveCell", iRow, iCol);
                    //});
                },
                /*
                afterEditCell: function (id, name, val, iRow, iCol) {
                    if (name == 'invdate') {
                        jQuery("#" + iRow + "_invdate", "#list").datepicker({ dateFormat: "yy-mm-dd" });
                    }
                },
                */
                ondblClickRow: function (rowid, row, col) {
                    var cm = jQuery("#grid2").jqGrid("getGridParam", "colModel");
                    if (cm[col].name == "itemnm") {
                        var searchword = $('#grid2').jqGrid('getCell', rowid, 'itemnm');
                        var csaleno = $('#csaleno').val();
                        var gucd = $('#gucd').val();
                        if (gucd == "S") {
                            pop_item('', 'grid2', rowid);
                        }
                        else {
                            pop_item_sale('', 'grid2', rowid, csaleno);
                        }
                    }
                },
                //rowNum: 10,
                //rowList: [10, 20, 30],
                //pager: '#pager2',
                //sortname: 'id',
                viewrecords: true,
                //sortorder: "desc",
                //height: 80,
                caption: ""
            });
            jQuery("#grid2").jqGrid('navGrid', '#grid2_pager', { edit: false, add: false, del: false });
            //$("#grid2 > .ui-jqgrid-titlebar").hide();
            //$("#grid2 > .ui-jqgrid-titlebar").hide();
            //$("#grid2 > .ui-jqgrid-titlebar").hide();
            fn_search();
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
                    $('#grid1')[0].addJSONData(JSON.parse(data.d));
                    var count = $("#grid1").getGridParam("reccount");
                    if (count > 0) {
                        var rowid = $("#grid1").getDataIDs()[0];
                        var csaleno = $('#grid1').getCell(rowid, 'csaleno');
                        $('#csaleno').val(csaleno);
                    }
                    else {
                        $('#csaleno').val('');
                    }
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
                    $('#saleno').val(result[0].saleno);
                    $('#chasu').val(result[0].chasu);
                    $('#csaleno').val(result[0].csaleno);
                    $('#gucd').val(result[0].gucd);
                    $('#saledt').val(result[0].saledt);
                    $('#userid').val(result[0].userid);
                    $('#custcd').val(result[0].custcd);
                    $('#termcd').val(result[0].termcd);
                    $('#janamt').val(result[0].janamt);
                    $('#whcd').val(result[0].whcd);
                    $('#ydt').val(result[0].ydt);
                    $('#dotel').val(result[0].dotel);
                    $('#framecd').val(result[0].framecd);
                    $('#doaddr').val(result[0].doaddr);
                    $('#rmk').val(result[0].rmk);
                    $('#carnm').val(result[0].carnm);
                    $('#carno').val(result[0].carno);
                    $('#carpayamt').val(result[0].carpayamt);
                    $('#checkdt').val(result[0].checkdt);
                    $('#outdt').val(result[0].outdt);
                    $('#outtime').val(result[0].outtime);
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            fn_select_detail();
        }
        function fn_select_detail() {
            var param = JSON.stringify({ 'saleno': saleno });

            $.ajax({
                type: "POST",
                url: "/page3/page31_svc.asmx/detail_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $('#grid2')[0].addJSONData(JSON.parse(data.d));
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

            $('#grid2').clearGridData();
        }
        //===============================================================
        // 버튼~~(구매전표)
        //===============================================================
        function fn_new() {
            fn_init();
        }
        var param_del = [];
        function fn_save() {
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
            param.mode = $.trim($('#mode').val());
            param.saleno = $.trim($('#saleno').val());
            param.chasu = $.trim($('#chasu').val());
            param.csaleno = $.trim($('#csaleno').val());
            param.gucd = $.trim($('#gucd').val());
            param.saledt = $.trim($('#saledt').val());
            param.userid = $.trim($('#userid').val());
            param.custcd = $.trim($('#custcd').val());
            param.termcd = $.trim($('#termcd').val());
            param.janamt = $.trim($('#janamt').val());
            param.whcd = $.trim($('#whcd').val());
            param.ydt = $.trim($('#ydt').val());
            param.dotel = $.trim($('#dotel').val());
            param.framecd = $.trim($('#framecd').val());
            param.doaddr = $.trim($('#doaddr').val());
            param.rmk = $.trim($('#rmk').val());
            param.carnm = $.trim($('#carnm').val());
            param.carno = $.trim($('#carno').val());
            param.carpayamt = $.trim($('#carpayamt').val());
            param.checkdt = $.trim($('#checkdt').val());
            param.outdt = $.trim($('#outdt').val());
            param.outtime = $.trim($('#outtime').val());

            //if (param.saledt   == '') { alert('발주일자를 입력해주세요!'); return; }
            //if (param.userid == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
            var param = JSON.stringify(param);
            //validate check == detail
            var param2 = [];
            for (var i = 0; i < param_del.length; i++) {
                param2.push(param_del[i]);
            }
            var row = $('#grid2').getRowData();
            for (var i = 0; i < row.length; i++) {
                param2.push(row[i]);
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
                    //alert(100);
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function fn_del() {
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
                    //var table = $('#grid21').DataTable();
                    //table.clear().rows.add(JSON.parse(data.d)).draw();
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        fn_init();
                        var count = $("#grid1").getGridParam("reccount");
                        if (count > 0) {
                            var rowid = $("#grid1").getDataIDs()[0];
                            var csaleno = $('#grid1').getCell(rowid, 'csaleno');
                            $('#csaleno').val(csaleno);
                            saleno = $('#grid1').getCell(rowid, 'saleno');
                        }
                        else {
                            $('#csaleno').val('');
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
        function fn_row_add() {
            var rowData = {
                  "mode": 'I'
                , "saleno": ''
                , "saleseq": ''
                , "itemcd": ''
                , "itemnm": ''
                , "spec": ''
                , "qty": ''
                , "boxqty": ''
                , "curcd": ''
                , "unitprice": ''
                , "supplyamt": ''
                , "vat": ''
                , "totamt": ''
                , "rmk": ''
                , "sno": ''
                , "caseno": ''
                , "prodno": '' 
            }
            var rowid = $("#grid2").getGridParam("reccount"); // 페이징 처리 시 현 페이지의 Max RowId 값
            $("#grid2").jqGrid("addRowData", rowid + 1, rowData, 'last'); // 마지막 행에 Row 추가
        }
        function fn_row_del() {
            var rowid = $('#grid2').jqGrid('getGridParam', 'selrow');
            if (rowid == undefined) { alert('선택된 행이 없습니다'); return; }

            var row = $("#grid2").jqGrid('getRowData', rowid);
            if (row.jpseq != '') {
                row.mode = 'D';
                param_del.push(row);
            }
            $("#grid2").jqGrid("delRowData", rowid); // 행 삭제
        }
        //===============================================================
        // 기타 함수
        //===============================================================
        function pop_result_item(param) {
            alert(pop_item_row);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'spec', param.spec);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'qty', param.qty);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        }
        function pop_result_item_sale(param) {
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'spec', param.spec);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'qty', param.qty);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'boxqty', param.boxqty);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'curcd', param.curcd);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'supplyamt', param.supplyamt);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'vat', param.vat);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'totamt', param.totamt);
            //$("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        }
    </script>

</asp:Content>
