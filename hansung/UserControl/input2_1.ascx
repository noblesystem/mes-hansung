<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="input2_1.ascx.cs" Inherits="hansung.UserControl.input2_1" %>
<style>
    .tb_sub td{
        background-color:#efeeed;
        border-left:none!important;
        border-bottom:none!important;
    }
</style>
<script>
    /*
    var changemn = true;
    $(document).ready(function () {
        bindoptionworkers("sl-employer-ctr")
        $(".sl-employer-ctr").change(function () {
            binddatacustomer();
        });
        $(".sl-tradingmission-ctr").change(function () {
            changeselectcustomer_ctr(this);

        });
        $(".tr-input-ctr .createnew").on('keyup', function (e) {
            if (e.keyCode == 13) {
                var rsdt = checkdatanull_detail_ctr_header("tabledetailOrderCtr")
                if (!rsdt)
                    return false;
                if ($(this).hasClass("inputmoney")) {
                    calculatormoneyBill_buy(this);
                    var mn = convertnumbertostring($(this).val());
                    $(this).val(mn);
                }
                var tr = $(".tabledetailOrderCtr .tr-input-ctr").clone();
                $(tr).removeClass("tr-input-ctr");
                $(tr).addClass("data_insert tr_new");
                $(tr).find(".rm-row").removeClass("datahidden");
                $(tr).find(".sub_popup ").remove();
                $(tr).attr("codeid","");
                $(tr).insertBefore(".tabledetailOrderCtr .tr-input-ctr");
                setautocompleat($(tr).find('.td-itemname'), items_group);
               
                resetTrinput('tr-input-ctr');
                var c = $(".tabledetailOrderCtr .data_insert").length;
                if (c < 10)
                    c = "0" + c;
                $(".tr-input-ctr .order").html(c);
                $(".tr-input-ctr .td-itemname").focus();
            }

        });


    });
    function openprint_bill() {
        openedit_bill_began();
    }
    function binddatacustomer() {
        var vl = $(".sl-employer-ctr").find(":selected").val();
        $(".sl-tradingmission-ctr").empty();
        var o = "<option class='option-item' value='0' phone='' style='display:none'></option><option class='option-item' phone='' value='-1'>All</option>";
        $(o).prependTo(".sl-tradingmission-ctr");
        bindoptionctmfollowwk(vl, 'sl-tradingmission-ctr');
    }
    function changestandar(o) {

        var s = $(o).find(":selected");
        var parent = $(o).parent().parent();
        $(parent).find(".td-qual").val($(s).attr("quantityincase"));
        var itemcode = $(s).attr("itemcode");
        if (itemcode.length < 4) {
            var n = 4 - itemcode.length;
            for (var t = 0; t < n; t++)
                itemcode = "0" + itemcode;
        }
        $(parent).find('.au-itemcode').html(itemcode);
        calculatormoneyBill_buy(o)

    }
    function inventory() {
        $(".sub_popup_ivtr").show();
    }
    function closeinventory() {
        $(".sub_popup_ivtr").hide();
    }
    function changechar_money() {
        if (changemn === true)
            $(".sub_popup_charmoney").show();

    }
    function changecurmoney(o) {

        changemn = false;
        var a = $(o).find(".t_tile").html();
        $(".charmoney").html(a);
        $(".sub_popup_charmoney").hide();
        $(".input-currency-ctr").html(a);
        $(".inputmoney").focus();
    }
    function changeselectcustomer_ctr(o) {
        var id = $(o).val();
        var obj = $(o).find(":selected");
        if (id === "-1") {
            $(".sl-tradingmission-ctr").empty();
            var o = "<option class='option-item' value='0' phone='' style='display:none'></option><option class='option-item' phone='' value='-1'>All</option>";
            $(o).prependTo(".sl-tradingmission-ctr");
            bindoptionctmfollowAllwk('sl-tradingmission-ctr');
            return false;
        }
        var transactionbalance = $(obj).attr("transactionbalance");

        $(".inputmoney-manager").val(convertnumbertostring(transactionbalance));
        var phone = $(obj).attr("phone");
        $('.input-phone-ctr').html(phone);

    }
    function autonotebill() {
        var a = $(".orderdate_ctr").val()
        var b = a.replace(/\./g, "");

        $(".input-notebill").html(b + "-01");
    }
    function opennewbill() {
        //$(".tabledetailOrderCtr .tr_new").remove();
        //$("#buybill").attr("codeid", "");
        //resetTrinput('tr-input-ctr');
        //resetTrinput('tb_bill');

        $("#popupdetail_1").modal("toggle");
        //$(".sl-employer-ctr").val(-1);
        //$(".sl-tradingmission-ctr").empty();
    }
    function save() {
        var rs = checkdatanull_ctr_header("tb_bill");
        var codeid = $("#buybill").attr("codeid");
        if (!rs)
            return false;
        var rsdt = checkdatanull_detail_ctr_header("tabledetailOrderCtr")

        if (!rsdt)
            return false;
        var hd = converdatatable_ctr("tb_bill");
        var dt = get_data_detail_ctr("tabledetailOrderCtr")
        var rs = "none";
        popenload("popupdetail_1");
        $.ajax({
            type: "POST",
            //getListOfCars is my webmethod   
            url: "/ServiceApi.asmx/savadatabill",
            data: "{jsonbill:'" + hd + "',jsondetail:'" + dt + "',obj:'wewe',codeid:'"+codeid+"'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json", // dataType is json format
            success: OnSuccess,
            error: OnErrorCall
        });
        function OnSuccess(response) {
            rs = response.d;
            location.reload();
        }
        function OnErrorCall(request, status, error) {

        }
        return rs;
    }
    function openedit_bill_began() {
        var o = $(".table1 .tr-active");
        if (o.length <= 0)
            return false;
        var codeid = $(o).attr("codeid");
            $("#buybill").attr("codeid", codeid);
        var employer = "";
        $(o).find("td").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = $(this).html();
            if (qr === "employer")
                employer = vl;
            binddataEdit(qr, vl,"tb_bill");
        });
        binddatacustomer();
        var tradingmission = $(o).find(".tradingmission").html();
        setselectoption(".sl-tradingmission-ctr", tradingmission);
        $(".tabledetailOrderCtr .tr_new").remove();
        var order = 1;
        var qltrow = $(".table3 .it-insert").length-1;
        $(".table3 .it-insert").each(function (index) {
            var obj = $(this);
            var code = $(this).attr("codeid");
            var data = [];
            $(obj).find("td").each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = $(this).html();
                var i = {
                    name: qr,
                    vl: vl
                }
                data.push(i);
            })
            if (index !== qltrow)
                createnewRow(data, code, "tabledetailOrderCtr", order);
            else {
              
                bindtr_input(data, code,order);
            }
            order++;
        })
        var currency = $(o).attr("currency");
        $(".charmoney").html(currency);
        $(".input-currency-ctr").html(currency);
  
        $("#popupdetail_1").modal("toggle");
       
    }
    function bindtr_input(data, code,order) {
             //console.log(data)
        if (order < 10)
            order = "0" + order;
          for (var i = 0; i < data.length; i++) {
            var qr = data[i].name;
            var vl = data[i].vl;

            if (moneyl.indexOf(qr) > -1)
                vl = convermoneytostr(vl);
              binddatadarow($(".tabledetailOrderCtr .tr-input-ctr"), vl, qr);
              $(".tabledetailOrderCtr .tr-input-ctr").attr("codeid", code);
              $(".tabledetailOrderCtr .tr-input-ctr").find(".order").html(order);
        }
    }
    function createnewRow(data,code,table, order) {
        if (order < 10)
            order = "0" + order;
        var tr = $(".tabledetailOrderCtr .tr-input-ctr").clone();
        $(tr).removeClass("tr-input-ctr");
        $(tr).addClass("data_insert tr_new");
        $(tr).find(".rm-row").removeClass("datahidden");
        $(tr).find(".sub_popup").remove();
        $(tr).find(".order").html(order);
        $(tr).attr("codeid",code);
        for (var i = 0; i < data.length; i++) {
            var qr = data[i].name;
            var vl = data[i].vl;

            if (moneyl.indexOf(qr) > -1)
                vl = convermoneytostr(vl);
            binddatadarow($(tr), vl, qr);
        }
        $(tr).insertBefore("."+table+" .tr-input-ctr");
        //calculatormoneyBill_buy($(tr).find(".inputmoney"))
        setautocompleat($(tr).find('.td-itemname'), items_group);
    }
    function binddatadarow(row,vl,sqla) {
        $(row).find('.td-data-a').each(function (index) {
            var sql = $(this).attr("data-sql");
            if (sql === sqla) {
                if ($(this).hasClass("data-input"))
                    $(this).find("input[type=text]").val(vl);
                else if ($(this).hasClass("data-auto"))
                    $(this).html(vl);
                 else if ($(this).hasClass("pinput"))
                    $(this).find(".p-input").html(vl);
                if (sql === "nameitem") {
                    var txt=$(this).find("input[type=text]");
                    bindstandarparent($(txt), 'sl-standar-ctr')
                }
                return false;
                
            }
        })
    }
    function binddataEdit(qr, vl,table) {
        $('.' +table+' .td-data').each(function (index) {
            var qra = $(this).attr("data-sql");
            if (qra === qr) {
                if ($(this).hasClass("data-input"))
                    $(this).find("input[type=text]").val(vl);
                else if ($(this).hasClass("select-dt"))
                    setselectbytext($(this).find('.select-op'), vl);
                else if ($(this).hasClass("pinput"))
                    $(this).find(".p-input").html(vl);
                return false;
            }
        })
    }

    */
</script>

<div class="modal" id="popupdetail_1">
    <div class="modal-dialog" style="margin: 0; width: 100%;">
        <div class="modal-content">
            <div class="modal-body none_border">
                <div id="tb_bill" style="margin-top: 10px; margin-bottom: 15px;">
                    <table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
                        <tbody>
                            <tr>
                                <td>발주번호</td>
                                <td><input type="text" id="b_orderno" readonly="readonly" /></td>
                                <td>* 발주일자</td>
                                <td><input type="text" id="b_orderdt" class="datecombo"/></td>
                                <td>* 발주담당자</td>
                                <td><input id="b_usercd" type="hidden"/><input id="b_usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#b_usernm').val(), 'b_usercd', 'b_usernm')" /></td>
                            </tr>
                            <tr>
                                <td>* 거래사명</td>
                                <td><input id="b_custcd" type="hidden"/><input id="b_custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#b_custnm').val(), 'b_custcd', 'b_custnm', 'b_tel')" /></td>
                                <td>고객사 연락처</td>
                                <td><input id="b_tel" type="text"/></td>
                                <td>거래조건</td>
                                <td><select id="b_termcd"></select></td>
                            </tr>
                            <tr>
                                <td>* 입고창고</td>
                                <td><select id="b_whcd"></select></td>
                                <td>계약일</td>
                                <td><input id="b_contractdt" type="text"  class="datecombo"/></td>
                                <td>화폐단위</td>
                                <td><select id="b_curcd"></select></td>
                            </tr>
                            <tr>
                                <td>미지급금</td>
                                <td><input id="b_janamt" type="text" class="inputmoney inputmoney-manager" style="width: 100%" /></td>
                                <td>P/I NO</td>
                                <td><input id="b_pino" type="text" /></td>
                                <td>발주확인</td>
                                <td><input id="b_bcheckdt" type="text" class="datecombo" /></td>
                            </tr>
                            <tr>
                                <td>비고</td>
                                <td colspan="5"><input id="b_rmk" type="text"/></td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div id="tb_content" style="margin-top: 10px">
                    <!--== jqgrid =======================================================================-->

                    <table id="balju_grid" class="balju_grid table-striped table-bordered tablepopup"  style="width:100%">
                    <thead>
                        <tr>
                            <th scope="col">발주번호</th>
                            <th scope="col">발주순번</th>
                            <th scope="col">품목코드</th>
                            <th scope="col">품목명</th>
                            <th scope="col">규격</th>
                            <th scope="col">매수</th>
                            <th scope="col">수량(B)</th>
                            <th scope="col">화폐단위</th>
                            <th scope="col">단가</th>
                            <th scope="col">공급가액</th>
                            <th scope="col">부가세</th>
                            <th scope="col">합계 금액</th>
                            <th scope="col">수량(C)</th>
                            <th scope="col">SQM</th>
                            <th scope="col">항목비고</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                    </table>
                    <br />
                    <br />
<table id="list2"></table>
<div id="pager2"></div>

                    <table class="responsive-table none_border tabledetailOrderCtr tablepopup" style="width: unset;display;none;" >
                        <tbody>
                            <tr class="tr-input-ctr data_insert">
                                <td>발주순번</td>
                                <td><input id="bd_rowindex" type="hidden" /><input id="bd_orderno" type="hidden" /><input id="bd_orderseq" type="text" readonly='readonly'/></td>
                                <td>* 품목코드</td>
                                <td><input id="bd_itemcd" type="text" readonly="readonly"/></td>
                                <td>* 품목명</td>
                                <td><input id="bd_itemnm" type="text"/><input type="button" value="검색" onclick="pop_item($('#bd_itemnm').val(), 'bd_itemcd', 'bd_itemnm', 'bd_standard', 'bd_qty', 'bd_unitprice')" /></td>
                            </tr>
                            <tr>
                                <td>* 규격</td>
                                <td><input id="bd_standard" type="text" readonly="readonly"/></td>
                                <td>* 매수</td>
                                <td><input id="bd_qty" type="text" readonly="readonly"/></td>
                                <td>* 수량(B)</td>
                                <td><input id="bd_boxqty" type="text"/></td>
                            </tr>
                            <tr>
                                <td>* 화폐단위</td>
                                <td><select id="bd_curcd"></select></td>
                                <td>* 단가</td>
                                <td><input id="bd_unitprice" type="text" class="inputmoney inputmoney-manager"/></td>
                                <td>* 공급가액</td>
                                <td><input id="bd_supplyamt" type="text" class="inputmoney inputmoney-manager"/></td>
                            </tr>
                            <tr>
                                <td>* 부가세</td>
                                <td><input id="bd_vat" type="text" class="inputmoney inputmoney-manager"/></td>
                                <td>* 합계금액</td>
                                <td><input id="bd_totamt" type="text" class="inputmoney inputmoney-manager"/></td>
                                <td>수량(C)</td>
                                <td><input id="bd_conqty" type="text" class="inputmoney inputmoney-manager"/></td>
                            </tr>
                            <tr>
                                <td>SQM</td>
                                <td><input id="bd_sqm" type="text"/></td>
                                <td>항목비고</td>
                                <td colspan="3"><input id="bd_rmk" type="text"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <ul class="ul-button" style="">
                    <li class="li-right" style="float: right; padding-right: 0">
                        <div>
                            <p class="p_empty er_bill" style="float: left; line-height: 30px; margin-right: 20px;"></p>
                            <div class="div-btn-header" id="balju_new" onclick="balju_new()"><span class="span-title">신규</span></div>
                            <div class="div-btn-header" id="balju_add" onclick="balju_add('A')"><span class="span-title">추가</span></div>
                             <div class="div-btn-header" id="upd_balju" onclick="balju_add('U')"><span class="span-title">수정</span></div>
                            <div class="div-btn-header" id="del_balju" onclick="balju_del()"><span class="span-title">삭제</span></div>
                            <div class="div-btn-header" id="buybill" onclick="balju_save()"><span class="span-title">저장</span></div>
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">닫기</span></div>
                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        var string_curcd = combo_code_string('C002', '', '==선택==');
        $('#balju_grid').DataTable({
            columns: [
                { data: "orderno" }
                , { data: "orderseq" }
                , { data: "itemcd" }
                , { data: "itemnm" }
                , { data: "standard" }
                , { data: "qty" }
                , { data: "boxqty" }
                , { data: "curcd" }
                , { data: "unitprice" }
                , { data: "supplyamt" }
                , { data: "vat" }
                , { data: "totamt" }
                , { data: "conqty" }
                , { data: "sqm" }
                , { data: "rmk" }
            ],
            //"language": {
            //    "search": ""
            //},
            //"order": [[1, "desc"]],
            searching: false, paging: false, info: false, buttons: [], ordering: false,
            "scrollX": true,
            "initComplete": function (settings, json) {
                //$('#balju_grid_filter input').addClass('form-control');
                //$("#balju_grid_filter input").attr("placeholder", "검색");
            }
        });
        var table = $('#balju_grid').DataTable();

        var lastsel;
        jQuery("#list2").jqGrid({
            //url: "/page2/page21_svc.asmx/balju_detail_search2",
            //datatype: "json",
            colNames: ['발주번호','발주순번','품목코드','품목명','규격','매수','수량(B)','화폐단위','단가','공급가액','부가세','합계 금액','수량(C)','SQM','항목비고'],
            colModel: [
                { name: "orderno", index: "orderno", width: 100, editable: false }
                , { name: "orderseq", index: "orderseq", width: 100, editable: false  }
                , { name: "itemcd", index: "itemcd", width: 100, editable: false  }
                , { name: "itemnm", index: "itemnm", width: 100, editable: false }
                , { name: "standard", index: "standard", width: 100, editable: false }
                , { name: "qty", index: "qty", width: 100, editable: false }
                , { name: "boxqty", index: "boxqty", width: 100, editable: true }
                , { name: "curcd", index: "curcd", width: 100, editable: true, edittype: "select", editoptions: { value: string_curcd } }	
                , { name: "unitprice", index: "unitprice", width: 100, editable: false }	
                , { name: "supplyamt", index: "supplyamt", width: 100, editable: false }
                , { name: "vat", index: "vat", width: 100, editable: false }
                , { name: "totamt", index: "totamt", width: 100, editable: true,
                    editoptions: { size: '50', maxlength: '100', dataEvents: [{
                                                type: 'keydown', fn: function (e) {                                    //keydown Event
                                                    //if (e.keyCode == 9 || e.keyCode == 13) {      //Enter Key or Tab Key
                                                        //var totamt = $("#bd_totamt").val();
                                                        //if (totamt == '0' || totamt == '') return;

                                                        //var supplyamt = parseInt(totamt / 1.1);
                                                        //var vat = totamt - supplyamt;
                                                        //$("#list2").jgQrid('setCell', ids[i], 'supplyamt', supplyamt);
                                                        //$("#list2").jgQrid('setCell', ids[i], 'vat', vat);
                                                    //}
                                                }
                                            }]    //dataEvents 종료
                    }
                }  //editoptions 종료, 칼럼정의 종료
                , { name: "conqty", index: "conqty", width: 100, editable: true }
                , { name: "sqm", index: "sqm", width: 100, editable: true }
                , { name: "rmk", index: "rmk", width: 100, editable: true }
            ],
            onSelectRow: function (rowid, status, e) {
                if (rowid && rowid !== lastsel) {
                    jQuery('#list2').jqGrid('restoreRow', lastsel);
                    jQuery('#list2').jqGrid('editRow', rowid, true);
                    lastsel = rowid;
                }
            },
            forceFit: true,
            cellEdit: true,
            cellsubmit: 'clientArray',
            afterSaveCell: function (rowid, cellname, value, iRow, iCol) {
                if (cellname == "totamt") {
                    var totamt = value;
                    if (totamt == '0' || totamt == '') return;
                    var supplyamt = parseInt(totamt / 1.1);
                    var vat = totamt - supplyamt;
                    $("#list2").jqGrid('setRowData', rowid, { 'supplyamt': supplyamt });
                    $("#list2").jqGrid('setRowData', rowid, { 'vat': vat });

                }
            },
            /*
            afterEditCell: function (id, name, val, iRow, iCol) {
                if (name == 'invdate') {
                    jQuery("#" + iRow + "_invdate", "#list").datepicker({ dateFormat: "yy-mm-dd" });
                }
            },
            */
            ondblClickRow: function (rowid, row, col) {
                var cm = jQuery("#list2").jqGrid("getGridParam", "colModel");
                if (cm[col].name == "itemnm") {
                    var searchword = $('#list2').jqGrid('getCell', rowid, 'itemnm');
                    pop_item_grid('', 'list2', rowid);
                }
            },
            //rowNum: 10,
            //rowList: [10, 20, 30],
            //pager: '#pager2',
            //sortname: 'id',
            viewrecords: true,
            //sortorder: "desc",
            caption: "구매상세내역",

        });
        jQuery("#list2").jqGrid('navGrid', '#pager2', { edit: true, add: true, del: false });
    });
    function pop_result_item_grid(param) {
        $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
        $("#" + pop_item_name).jqGrid('setRowData', pop_item_row, { 'itemnm': param.itemnm });
        $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'standard', param.standard);
        $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'qty', param.qty);
        $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
    }
    function balju_select_detail2(orderno) {
        var param = JSON.stringify({ 'orderno': orderno });
        //$("#list2").jqGrid('setGridParam', {
        //    url: "/page2/page21_svc.asmx/balju_detail_search2",
        //    datatype: "json",
        //    "postData": JSON.stringify({ 'param': param }) 
        //}).trigger('reloadGrid');

        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/balju_detail_search2",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                //var myTable = $('#balju_grid').DataTable();
                //myTable.clear().rows.add(JSON.parse(data.d)).draw();
                $('#list2')[0].addJSONData(JSON.parse(data.d));
            },
            error: function (request, status, error) {
                //alert(100);
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }

    $('#balju_grid tbody').on('click', 'tr', function () {
        var table = $('#balju_grid').DataTable();
        //var a = table.cell({ row: this.parentNode.rowIndex, column: this.cellIndex }).data();
        var row = table.row(this).data();
        var r = {};
        //var data = table.row(this).data().map(function (item, index) {
        //    r['col' + index] = item;
        //});
        if ($(this).hasClass('selected')) {
            //$(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        //row data를 뿌려준다..
        $('#bd_rowindex').val(table.row(this).index());
        $('#bd_orderno').val(row.orderno);
        $('#bd_orderseq').val(row.orderseq);
        $('#bd_itemcd').val(row.itemcd);
        $('#bd_itemnm').val(row.itemnm);
        $('#bd_standard').val(row.standard);
        $('#bd_qty').val(row.qty);
        $('#bd_boxqty').val(row.boxqty);
        $('#bd_curcd').val(row.curcd);
        $('#bd_unitprice').val(row.unitprice);
        $('#bd_supplyamt').val(row.supplyamt);
        $('#bd_vat').val(row.vat);
        $('#bd_totamt').val(row.totamt);
        $('#bd_conqty').val(row.conqty);
        $('#bd_sqm').val(row.sqm);
        $('#bd_rmk').val(row.rmk);

    });
    function show_balju(orderno) {
        $("#popupdetail_1").modal("toggle");
        $('#b_termcd').zentSetCombo('C001', '', '==선택==');
        $('#b_curcd').zentSetCombo('C002', '', '==선택==');
        $('#bd_curcd').zentSetCombo('C002', '', '==선택==');
        $('#b_whcd').zentSetComboWhcd('', '==선택==');
        balju_init();
        balju_init_detail();
        if (orderno != '') {
            balju_selone(orderno);
            balju_select_detail(orderno);
            balju_select_detail2(orderno);
        }
    }
    function balju_selone(orderno) {
        var param = JSON.stringify({ 'orderno': orderno });
        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/balju_selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                //초기화 
                var result = JSON.parse(data.d);
                $('#b_orderno').val(result[0].orderno);    
                $('#b_orderdt').val(result[0].orderdt);
                $('#b_usercd').val(result[0].usercd);
                $('#b_usernm').val(result[0].usernm);
                $('#b_custcd').val(result[0].custcd);
                $('#b_custnm').val(result[0].custnm);
                $('#b_tel').val(result[0].tel);
                $('#b_termcd').val(result[0].termcd);
                $('#b_whcd').val(result[0].whcd);
                $('#b_contractdt').val(result[0].contractdt);
                $('#b_curcd').val(result[0].curcd);
                $('#b_janamt').val(result[0].janamt);
                $('#b_pino').val(result[0].pino);
                $('#b_bcheckdt').val(result[0].bcheckdt);
                $('#b_rmk').val(result[0].rmk);
            },
            error: function (request, status, error) {
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                //alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });

    }
    function balju_select_detail(orderno) {
        var param = JSON.stringify({ 'orderno': orderno });
        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/balju_detail_search",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var myTable = $('#balju_grid').DataTable();
                myTable.clear().rows.add(JSON.parse(data.d)).draw();
            },
            error: function (request, status, error) {
                //alert(100);
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    function balju_init() {
        $('#b_orderno').val('');
        $('#b_orderdt').val('');
        $('#b_usercd').val('');
        $('#b_usernm').val('');
        $('#b_custcd').val('');
        $('#b_custnm').val('');
        $('#b_tel').val('');
        $('#b_termcd').val('');
        $('#b_whcd').val('');
        $('#b_contractdt').val('');
        $('#b_curcd').val('');
        $('#b_janamt').val('');
        $('#b_pino').val('');
        $('#b_bcheckdt').val('');
        $('#b_rmk').val('');

        //balju_grid
        $('#balju_grid').DataTable().clear().draw();;
        //var myTable = $('#balju_init_detail').DataTable();
        //myTable.clear().rows.add(JSON.parse(data.d)).draw();
    }

    function balju_init_detail() {
        $('#bd_orderno').val('');
        $('#bd_orderseq').val('');
        $('#bd_itemcd').val('');
        $('#bd_itemnm').val('');
        $('#bd_standard').val('');
        $('#bd_qty').val('');
        $('#bd_boxqty').val('');
        $('#bd_curcd').val('');
        $('#bd_unitprice').val('');
        $('#bd_supplyamt').val('');
        $('#bd_vat').val('');
        $('#bd_totamt').val('');
        $('#bd_conqty').val('');
        $('#bd_sqm').val('');
        $('#bd_rmk').val('');
    }

    function balju_new() {
        balju_init_detail();
    }
    function balju_del() {
        var table = $('#balju_grid').DataTable();
        table.row('.selected').remove().draw(false);
        balju_init_detail();
    }
    function balju_add(mode) {
        var table = $('#balju_grid').DataTable();
        var row = {};
        row.orderno = $.trim($('#bd_orderno').val());
        row.orderseq = $.trim($('#bd_orderseq').val());
        row.itemcd = $.trim($('#bd_itemcd').val());
        row.itemnm = $.trim($('#bd_itemnm').val());
        row.standard = $.trim($('#bd_standard').val());
        row.qty = $.trim($('#bd_qty').val());
        row.boxqty = $.trim($('#bd_boxqty').val());
        row.curcd = $.trim($('#bd_curcd').val());
        row.unitprice = $.trim($('#bd_unitprice').val());
        row.supplyamt = $.trim($('#bd_supplyamt').val());
        row.vat = $.trim($('#bd_vat').val());
        row.totamt = $.trim($('#bd_totamt').val());
        row.conqty = $.trim($('#bd_conqty').val());
        row.sqm = $.trim($('#bd_sqm').val());
        row.rmk = $.trim($('#bd_rmk').val());
        //validate 
        if (row.itemcd == '') { alert('품목을 입력해주세요!'); return; }
        if (row.itemnm == '') { alert('품목을 입력해주세요!'); return; }
        if (row.standard == '') { alert('규격을 입력해주세요!'); return; }
        if (row.qty == '') { alert('매수를 입력해주세요!'); return; }
        if (row.boxqty == '') { alert('수량(B)를 입력해주세요!'); return; }
        if (row.curcd == '') { alert('화폐단위를 입력해주세요!'); return; }
        if (row.unitprice == '') { alert('단가를 입력해주세요!'); return; }
        if (row.supplyamt == '') { alert('공급가액을 입력해주세요!'); return; }
        if (row.vat == '') { alert('부가세를 입력해주세요!'); return; }
        if (row.totamt == '') { alert('합계금액을 입력해주세요!'); return; }
       
        
        if (mode == "A") {
            table.row.add(row).draw(false);
            balju_init_detail();
        }
        if (mode == "U") {
            var rowindex = $('#bd_rowindex').val();
            if (rowindex == "") {
                return;
            }
            //var temp = table.row('tr-active').data();
            //var temp = table.rows('.tr-active').data();
            //table.dataTable().fnUpdate(temp, 1);
            table.row(rowindex).data(row).draw();
        }
    }

    function balju_save() {
        //validate check == master
        var param = {};
        param.orderno = $.trim($('#b_orderno').val());
        param.orderdt = $.trim($('#b_orderdt').val()); // *
        param.usercd  = $.trim($('#b_usercd').val()); // *
        param.usernm  = $.trim($('#b_usernm').val()); // *
        param.custcd  = $.trim($('#b_custcd').val()); // *
        param.custnm  = $.trim($('#b_custnm').val()); // *
        param.tel     = $.trim($('#b_tel').val());
        param.termcd  = $.trim($('#b_termcd').val());
        param.whcd    = $.trim($('#b_whcd').val()); // *
        param.contractdt = $.trim($('#b_contractdt').val());
        param.curcd   = $.trim($('#b_curcd').val());
        param.janamt  = $.trim($('#b_janamt').val());
        param.pino    = $.trim($('#b_pino').val());
        param.bcheckdt = $.trim($('#b_bcheckdt').val());
        param.rmk = $.trim($('#b_rmk').val());
        if (param.orderdt == '') { alert('발주일자를 입력해주세요!'); return; }
        if (param.usercd == '') { alert('담당자를 입력해주세요!'); return; }
        if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
        if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
        if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
        if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
        var param = JSON.stringify(param);
        //validate check == detail
        var param2 = [];
        var row = $('#balju_grid').DataTable().rows().data();
        alert(row.length);
        for (var i = 0; i < row.length; i++) {
            param2.push(row[i]);
        }
        param2 = JSON.stringify(param2);

        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/balju_save",
            data: JSON.stringify({ 'param': param, 'param2' : param2 }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                //var table = $('#grid21').DataTable();
                //table.clear().rows.add(JSON.parse(data.d)).draw();
                var result = JSON.parse(data.d);
                if (result.code == "OK") {
                    //alert(result.val);
                    balju_init();
                    balju_init_detail();
                    balju_selone(result.val);
                    balju_select_detail(result.val);
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

</script>