<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="input3_1.ascx.cs" Inherits="hansung.UserControl.input3_1" %>
<script>
    var changemn = true;
    $(document).ready(function () {
        bindoptionworkers("sl-employer-ctr")
        bindoptionwarehouse("select_warehouse");
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
                $(tr).find(".sub_popup").remove();
                $(tr).attr("codeid", "");
                 $(tr).insertBefore(".tabledetailOrderCtr .tr-input-ctr");
                setautocompleat($(tr).find('.td-itemname'), items);
                resetTrinput('tr-input-ctr');
                var c = $(".tabledetailOrderCtr .data_insert").length;
                if (c < 10)
                    c = "0" + c;
                $(".tr-input-ctr .order").html(c);
                $(".tr-input-ctr .td-itemname").focus();
            }

        });


    });
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
        var destinationphone = $(obj).attr("destinationphone");
        $('.input-contactphone').html(phone);
        var destinationaddress = $(obj).attr("destinationaddress");
        $('.ip-destinationaddress').html(destinationaddress);

    }
    function autonotebill() {
        var a = $(".orderdate_ctr").val()
        var b = a.replace(/\./g, "");

        $(".input-notebill").html(b + "-01");
    }
    function opennewbill() {
        $(".tabledetailOrderCtr .tr_new").remove();
        $("#buybill_sale").attr("codeid", "");
        resetTrinput('tr-input-ctr');
        resetTrinput('tb_bill');

        $("#popupdetail_1").modal("toggle");
        $(".sl-employer-ctr").val(-1);
        $(".sl-tradingmission-ctr").empty();

    }
    function save() {
        //var rs = checkdatanull_ctr_header("tb_bill");
        var codeid = $("#buybill_sale").attr("codeid");

        //var rsdt = checkdatanull_detail_ctr_header("tabledetailOrderCtr")

        //if (!rsdt)
        //    return false;
        var hd = converdatatable_ctr("tb_bill");
        var dt = get_data_detail_ctr("tabledetailOrderCtr")
        var rs = "none";
        $.ajax({
            type: "POST",
            //getListOfCars is my webmethod   
            url: "/ServiceApi.asmx/savadata_sale_ship",
            data: "{jsonbill:'" + hd + "',jsondetail:'" + dt + "',codeid:'" + codeid + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json", // dataType is json format
            async: false,
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
        $("#buybill_sale").attr("codeid", codeid);
        var employer = "";
        $(o).find("td").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = $(this).html();
            if (qr === "employer")
                employer = vl;
            binddataEdit_sale(qr, vl, "tb_bill");
        });
        binddatacustomer();
        var tradingmission = $(o).find(".customercompany").html();

        setselectoption(".sl-tradingmission-ctr", tradingmission);
        $(".tabledetailOrderCtr .tr_new").remove();
        var qltrow = $(".table3 .it-insert").length - 1;
        var order = 1;
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

                bindtr_input(data, code, order);
            }
            order++;
        })
        var currency = $(o).attr("currency");
        $(".charmoney").html(currency);
        $(".input-currency-ctr").html(currency);

        $("#popupdetail_1").modal("toggle");

    }
    function binddatacustomer() {
        var vl = $(".sl-employer-ctr").find(":selected").val();
        $(".sl-tradingmission-ctr").empty();
        var o = "<option class='option-item' value='0' phone='' style='display:none'></option><option class='option-item' phone='' value='-1'>All</option>";
        $(o).prependTo(".sl-tradingmission-ctr");
        bindoptionctmfollowwk(vl, 'sl-tradingmission-ctr');
    }
    function bindtr_input(data, code, order) {
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
    function createnewRow(data, code, table, order) {
        if (order < 10)
            order = "0" + order;
        var tr = $(".tabledetailOrderCtr .tr-input-ctr").clone();
        $(tr).removeClass("tr-input-ctr");
        $(tr).addClass("data_insert tr_new");
        $(tr).find(".rm-row").removeClass("datahidden");
        $(tr).find(".sub_popup").remove();
        $(tr).find(".order").html(order);
        $(tr).attr("codeid", code);
        for (var i = 0; i < data.length; i++) {
            var qr = data[i].name;
            var vl = data[i].vl;

            if (moneyl.indexOf(qr) > -1)
                vl = convermoneytostr(vl);
            binddatadarow($(tr), vl, qr);
        }
        $(tr).insertBefore("." + table + " .tr-input-ctr");
        //calculatormoneyBill_buy($(tr).find(".inputmoney"))
        setautocompleat($(tr).find('.td-itemname'), items);
    }
    function binddatadarow(row, vl, sqla) {
        $(row).find('.td-data-a').each(function (index) {
            var sql = $(this).attr("data-sql");
            if (sql === sqla) {
                if ($(this).hasClass("data-input"))
                    $(this).find("input[type=text]").val(vl);
                else if ($(this).hasClass("data-auto"))
                    $(this).html(vl);
                else if ($(this).hasClass("pinput"))
                    $(this).find(".p-input").html(vl);
                if (sql === "itemname") {
                    var txt = $(this).find("input[type=text]");
                    bindstandarparent($(txt), 'sl-standar-ctr')
                }
                return false;

            }
        })
    }
    function binddataEdit_sale(qr, vl) {
        $('.tb_bill .td-data').each(function (index) {
            var qra = $(this).attr("data-sql");
            if (qra === qr) {
                console.log(qr + ":" + vl)
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
</script>

<div class="modal" id="popupdetail_1">
    <div class="modal-dialog" style="margin: 0; width: 100%;">
        <div class="modal-content">

            <div class="modal-body">

                <div id="tb_bill" style="margin-top: 10px; margin-bottom: 15px;">

                    <table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
                        <thead>
                            <tr>
                                <th>수주 일자(번호)</th>
                                <th>영업 담당</th>
                                <th>고객사명</th>
                                <th class="th_white">고객사 연락처</th>

                                <th>거래 조건</th>
                                <th>미수금</th>
                                <th>출고 창고</th>
                                <th class="th_white">출고 예정일</th>

                                <th class="class110">도착지 연락처</th>
                                <th>프레임</th>


                                <th class="th_white">수주 비고</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="data-input td-data class130 data-not-null-td" data-sql="orderdate" note_alert="발주 일자(번호)">
                                    <input type="text" class="txtdate datecombo data-not-null orderdate" id="ip-ordernumber" />
                                </td>
                                <td class="td-data select-dt class80 data-not-null-td" data-sql="salesrepresentative" note_alert="발주담당">
                                    <select class="select-op sl-employer-ctr data-not-null">
                                        <option class="op-default" value="-1"></option>
                                    </select>

                                </td>

                                <td class="td-data select-dt class130 data-not-null-td" data-sql="customercompany" note_alert="거래사명">
                                    <select class="select-op sl-tradingmission-ctr data-not-null select-dt">
                                    </select>
                                </td>

                                <td class="pinput td-data class140" data-sql="customercontacts" note_alert="please input phone">
                                    <p class="p-input input-phone-ctr"></p>

                                </td>

                                <td class="td-data select-dt class80 data-not-null-td" data-sql="terms" note_alert="거래조건">
                                    <select class="select-op sl-terms">
                                        <option style="display: none"></option>
                                        <option class="option-item">내수</option>
                                        <option class="option-item">FOB</option>
                                        <option class="option-item">CIF</option>
                                        <option class="option-item">CFR</option>
                                    </select>
                                </td>
                                <td class="td-data data-input class100" data-sql="transactionbalancectm" note_alert="please input paymoney">
                                    <input type="text" class="inputmoney inputmoney-manager" style="width: 100%" />

                                </td>
                                <td class="td-data select-dt data-not-null-td class80" data-sql="warehouse" note_alert="입고창고">
                                    <select class="select-op select_warehouse">
                                        <option class="op-default" value="-1"></option>

                                    </select>
                                </td>

                                <td class="td-data data-input class100 data-not-null-td" data-sql="issuedate" note_alert="계약일">
                                    <input type="text" class="datecombo orderdate_ctr" /></td>

                                <td class="td-data pinput class120" data-sql="destinationaddress" note_alert="please input notebill">
                                    <p class="p-input ip-destinationaddress"></p>
                                </td>

                                <td class="td-data  select-dt class100 data-not-null-td" data-sql="frame" note_alert="발주확인">
                                    <select class="select-op">
                                        <option class="option-item" value="-1">Select one</option>
                                        <option class="option-item" value="-1">한국</option>
                                        <option class="option-item" value="-1">KCC</option>
                                        <option class="option-item" value="-1">메이커</option>
                                        <option class="option-item" value="-1">B</option>
                                    </select>
                                </td>

                                <td class="td-data data-input" data-sql="remark">
                                    <input type="text" class="" /></td>



                            </tr>
                        </tbody>
                    </table>

                </div>

                <div id="tb_content" style="margin-top: 10px">

                    <table class="responsive-table tabledetailOrderCtr tablepopup none_border" style="width: unset">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45" data-type="numberorder">번호</th>
                                <th scope="col" class="class80">품목코드</th>
                                <th scope="col" class="class100">품목명</th>
                                <th scope="col" class="class110">규격</th>
                                <th scope="col" class="class70">매수</th>
                                <th scope="col" class="class70">수량(B)</th>
                                <th scope="col" class="class70">합계 금액</th>
                                <th scope="col" class="class100">항목 비고</th>
                                <th scope="col" class="class100">시리얼 No</th>
                                <th scope="col" class="class100">CASE No</th>
                                <th scope="col" class="class70">PROD No</th>

                                <%-- <th scope="col"></th>--%>
                            </tr>
                        </thead>

                        <tbody>
                            <tr class="tr-input-ctr data_insert" codeid="">
                                <td class="td-auto order">01</td>
                                <td class="td-data-a data-auto au-itemcode class80" data-sql="itemcode"></td>
                                <td class="td-data-a data-input not-null" data-sql="itemname" note_alert="품목명">
                                    <input type="text" class="txt-input td-itemname" onblur="bindstandarparent($(this),'sl-standar-ctr')" /></td>
                                <td class="td-data-a select-dt not-null" data-sql="standard" note_alert="규격">
                                    <select class="sl-option sl-standar-ctr" style="width: 100%" onblur="changestandar(this)">
                                        <option value="-1"></option>

                                    </select>
                                </td>
                                <td class="td-data-a data-input not-null" data-sql="qltincase" note_alert="매수">
                                    <input type="text" class="txt-input td-qual numberinput td-right" /></td>
                                <td class="td-data-a data-input not-null" data-sql="qltcase" note_alert="수량(B)">
                                    <input type="text" class="txt-input td-right numberinput packesize" onfocus="inventory();" onblur="closeinventory();" />

                                </td>
                                <td style="position: relative" class="td-data-a data-input not-null" data-sql="totalamount" note_alert="합계 금액">
                                    <input type="text" class="txt-input inputmoney createnew" />
                                    <div class="sub_popup sub_popup_ivtr" style="width: 100px;">
                                        <table class="tb_sub">
                                            <tr>
                                                <td colspan="2">재고현황</td>
                                            </tr>
                                            <tr>
                                                <td>인천</td>
                                                <td>212</td>
                                            </tr>
                                            <tr>
                                                <td>부산	</td>
                                                <td>323</td>
                                            </tr>
                                            <tr>
                                                <td>미입고</td>
                                                <td>32</td>
                                            </tr>
                                        </table>

                                    </div>
                                </td>
                                <td class="td-data-a  data-input" data-sql="itemremarks" note_alert="please input ...">
                                    <input type="text" class="txt-input createnew" />
                                </td>
                                <td class="td-data-a pinput" data-sql="serialNo" note_alert="please input ...">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data-a pinput not-null" data-sql="caseNo" note_alert="합계 금액">
                                    <p class="p-input"></p>
                                </td>
                                <td style="position: relative" class="td-data-a pinput" data-sql="PRODNo" note_alert="please input ...">
                                    <p class="p-input"></p>
                                </td>


                                <%--<td style="width: 35px"><span class="rm-row datahidden" onclick="removeparent(this)">X</span></td>--%>
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

                            <div class="div-btn-header" id="buybill_sale" onclick="save()"><span class="span-title">저장</span></div>
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>

                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>
