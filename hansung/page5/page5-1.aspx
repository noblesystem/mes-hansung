<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page5-1.aspx.cs" Inherits="hansung.page5.page5_1" %>

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
                                            <td><input type="text" id="stno" readonly="readonly" /></td>
                                            <td>gucd</td>
                                            <td><select id="gucd"></select>iccd<select id="iccd"></select></td>
                                        </tr>
                                        <tr>
                                            <td>전표일자</td>
                                            <td><input type="text" id="saledt" class="datecombo"/></td>
                                            <td>담당자</td>
                                            <td><input id="userid" type="hidden"/><input id="usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
                                        </tr>
                                        <tr>
                                            <td>승인일자</td>
                                            <td><input type="text" id="apprdt" class="datecombo"/></td>
                                            <td>stno2</td>
                                            <td><input type="text" id="stno2" readonly="readonly"/>userid2<input id="userid2" type="text" readonly="readonly"/>useyn<input type="text" id="useyn" readonly="readonly" /></td>
                                        </tr>
                                        <tr>
                                            <td>운송사</td>
                                            <td><input id="custcd" type="hidden"/><input id="custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#custnm').val(), 'custcd', 'custnm', 'tel')" /></td>
                                            <td>차량번호</td>
                                            <td><input id="carnm" type="text" /></td>
                                        </tr>
                                        <tr>
                                            <td>bccd</td>
                                            <td><select id="bccd"></select></td>
                                            <td>비고</td>
                                            <td><input id="rmk" type="text"/></td>
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
        var stno = '<%=stno %>';
        $(document).ready(function () {
            $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
            $('#inwhcd').zentSetComboWhcd('', '==선택==');
            $('#outwhcd').zentSetComboWhcd('', '==선택==');
            //$('#paycd').zentSetCombo('C003', '', '==선택==');
            $('#gucd').zentSetCombo('C020', '', '==선택=='); $('#gucd').val('E');
            $('#iccd').zentSetCombo('C021', '', '==선택=='); $('#iccd').val('A');
            $('#bccd').zentSetCombo('C022', '', '==선택==');
            //var string_scd = combo_code_string('C010', '', '==선택==');
            var string_statuscd = combo_code_string('C023', '', '==선택==');
            var string_falsecd = combo_code_string('C024', '', '==선택==');
            //=====================================================================
            //grid setting
            //=====================================================================
            jQuery("#grid2").jqGrid({
                colNames: ['mode', 'stno', '번호', '품목코드', '품목명', '규격', '매수', 'iqty(B)', '출고수량(B)', 
                    '시리얼 No', '정상/문제', 'falsecd', 'filepath', '항목비고', 'useyn'],
                colModel: [
                      { name: "mode", index: "mode", width: 100, editable: false }
                    , { name: "stno", index: "stno", width: 100, editable: false }
                    , { name: "stseq", index: "stseq", width: 100, editable: false }
                    , { name: "itemcd", index: "itemcd", width: 100, editable: false }
                    , { name: "itemnm", index: "itemnm", width: 100, editable: false }
                    , { name: "spec", index: "spec", width: 100, editable: false }
                    , { name: "qty", index: "qty", width: 100, editable: false }
                    , { name: "iqty", index: "iqty", width: 100, editable: false }
                    , { name: "cqty", index: "cqty", width: 100, editable: false }
                    , { name: "sno", index: "sno", width: 100, editable: true }
                    , { name: "statuscd", index: "statuscd", width: 100, editable: true, formatter: "select", edittype: "select", editoptions: { value: string_statuscd } }
                    , { name: "falsecd", index: "falsecd", width: 100, editable: true, formatter: "select", edittype: "select", editoptions: { value: string_falsecd } }
                    , { name: "filepath", index: "filepath", width: 100, editable: true }
                    , { name: "rmk", index: "rmk", width: 100, editable: true }
                    , { name: "useyn", index: "useyn", width: 100, editable: true }
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
                        var cstno = $('#cstno').val();
                        var gucd = $('#gucd').val();
                        pop_item('', 'grid2', rowid);
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
            fn_selone();
        });
        //===============================================================
        // 검색
        //===============================================================
        function fn_selone() {
            var param = JSON.stringify({ 'stno': stno });
            $.ajax({
                type: "POST",
                url: "/page5/page51_svc.asmx/selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $('#stno').val(result[0].stno);
                    $('#iccd').val(result[0].iccd);
                    $('#gucd').val(result[0].gucd);
                    $('#stdt').val(result[0].stdt);
                    $('#apprdt').val(result[0].apprdt);
                    $('#userid').val(result[0].userid);
                    $('#userid2').val(result[0].userid2);
                    $('#inwhcd').val(result[0].inwhcd);
                    $('#outwhcd').val(result[0].outwhcd);
                    $('#custcd').val(result[0].custcd);
                    $('#carnm').val(result[0].carnm);
                    $('#bccd').val(result[0].bccd);
                    $('#stno2').val(result[0].stno2);
                    $('#rmk').val(result[0].rmk);
                    $('#useyn').val(result[0].useyn);
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            fn_select_detail();
        }
        function fn_select_detail() {
            var param = JSON.stringify({ 'stno': stno });

            $.ajax({
                type: "POST",
                url: "/page5/page51_svc.asmx/detail_search",
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
            $('#stno').val('');
            $('#iccd').val('');
            $('#gucd').val('');
            $('#stdt').val('');
            $('#apprdt').val('');
            $('#userid').val('');
            $('#userid2').val('');
            $('#inwhcd').val('');
            $('#outwhcd').val('');
            $('#custcd').val('');
            $('#carnm').val('');
            $('#bccd').val('');
            $('#stno2').val('');
            $('#rmk').val('');
            $('#useyn').val('');

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
            param.stno = $.trim($('#stno').val());
            param.iccd = $.trim($('#iccd').val());
            param.gucd = $.trim($('#gucd').val());
            param.stdt = $.trim($('#stdt').val());
            param.apprdt = $.trim($('#apprdt').val());
            param.userid = $.trim($('#userid').val());
            param.userid2 = $.trim($('#userid2').val());
            param.inwhcd = $.trim($('#inwhcd').val());
            param.outwhcd = $.trim($('#outwhcd').val());
            param.custcd = $.trim($('#custcd').val());
            param.carnm = $.trim($('#carnm').val());
            param.bccd = $.trim($('#bccd').val());
            param.stno2 = $.trim($('#stno2').val());
            param.rmk = $.trim($('#rmk').val());
            param.useyn = $.trim($('#useyn').val());

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
                url: "/page5/page51_svc.asmx/save",
                data: JSON.stringify({ 'param': param, 'param2': param2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        stno = result.val;
                        fn_init();
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
            param.stno = $.trim($("#stno").val());
            if (param.stno == '') {
                alert('해당 전표는 등록되지 않은 전표 입니다!'); return;
            }
            var param = JSON.stringify(param);
            $.ajax({
                type: "POST",
                url: "/page5/page51_svc.asmx/del",
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
                            var cstno = $('#grid1').getCell(rowid, 'cstno');
                            $('#cstno').val(cstno);
                            stno = $('#grid1').getCell(rowid, 'stno');
                        }
                        else {
                            $('#cstno').val('');
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
                , "stno": ''
                , "stseq": ''
                , "itemcd": ''
                , "itemnm": ''
                , "spec": ''
                , "qty": ''
                , "iqty": ''
                , "cqty": ''
                , "sno": ''
                , "statuscd": ''
                , "falsecd": ''
                , "filepath": ''
                , "rmk": ''
                , "useyn": ''
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
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'spec', param.spec);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'qty', param.qty);
            $("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
            //$("#" + pop_item_grid).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        }
    </script>

</asp:Content>
