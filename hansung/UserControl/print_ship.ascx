<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="print_ship.ascx.cs" Inherits="hansung.UserControl.print_ship" %>

<style>
    .modal-dialog-print td {
        background-color: white !important;
    }

    .modal-dialog-print th {
        background-color: #efeeed !important;
    }

    .tabledetailOrderCtr_print .sumdata_qlt td {
        padding-right: 6px !important
    }

    .modal-dialog-print select {
        -webkit-appearance: none;
        text-align-last: center;
    }
</style>
<script>
    function print_bill() {
        openedit_print();
        $('.modal-title').html("발주전표");
        $(".tbpayment_print").hide();
        $("#tb_bill_shp").hide();
        $("#tb_content_updatep").hide();
    }
    function EditShip_print() {
        var o = $(".table2 .tr_ship");

        if (o.length <= 0)
            return false;
        var codeid = $(o).attr("codeid");

        $(".table2 th").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = $(o).find("td:eq(" + index + ")").html();
            binddataEditship(qr, vl, "tb_bill_ship_print");
        });
        editdetailship_print();

    }
    function editdetailship_print() {
        $(".tabledetailOrderCtrup_p_print tbody").empty();

        var order = 1;
        var data_port = [];
        var data_size = [];
        $(".tabledata2 .it-insert").each(function (index) {
            var obj = $(this);
            var code = $(this).attr("codeid");
            var itname = $(this).attr("nameitem");
            var standar = $(this).attr("standard");
            var qltbox = $(this).attr("bitem");
            var data = [];
            $(obj).find("td").each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = $(this).html();
                if (qr === "port")
                    data_port.push(vl);
                else if (qr === "sizefit")
                    data_size.push(vl);
                var i = {
                    name: qr,
                    vl: vl
                }
                data.push(i);
            })
            var j = {
                name: 'itemname',
                vl: itname
            };
            var k = {
                name: 'standard',
                vl: standar
            };
            var m = {
                name: 'qltbox',
                vl: qltbox
            };
            data.push(j);
            data.push(k);
            data.push(m);
            createnewRow_ship_print(data, code, order);

            order++;
        });

    }
    function createnewRow_ship_print(data, code, order) {
        if (order < 10)
            order = "0" + order;
        var row = "<tr><td>" + order + "</td>";
        var txt_port = "";
        $(".tabledetailOrderCtrup_p_print .thdata").each(function (index) {
            var a = $(this).attr("data-input");
            var vl = getdatajson(a, data);
            if ($(this).hasClass("datetime")) {
                var c = "";
                if (a === "containerday")
                    c = "subcontainerday";
                row += '<td class="td-data-a data-input au-itemcode class95" data-sql="' + a + '"><input type="text" class="datecombo class95 ' + c + '" value="' + vl + '" ></td>';

            } else if ($(this).hasClass("select_dt_port")) {
                txt_port = vl;
                row += '<td class="td-data-a select-dt not-null sl-noempty" data-sql="' + a + '">' + sl_port + '</td>';
            }
            else if ($(this).hasClass("select_sizefit"))
                row += '<td class="td-data-a select-dt not-null sl-noempty" data-sql="' + a + '">' + sl_size + '</td>';
            else if ($(this).hasClass("data-input"))
                row += '<td><input type="text"  data-sql="' + a + '" class="td-data-a select-dt class100" value="' + vl + '" ></td>';
            else
                row += '<td  class="td-data-a select-dt not-null"  data-sql="' + a + '">' + vl + '</td>'

        })

        row += "</tr>";

        $(row).appendTo(".tabledetailOrderCtrup_p_print tbody");

    }
    function print_ships() {
        EditShip_print();
        openedit_print();
        $('.modal-title').html("입고전표");
        $(".tbpayment_print").hide();
        $("#tb_bill_shp").show();
        $("#tb_content_updatep").show();
        $("#popupdetail_Print .datecombo").removeClass("datecombo");
        $('#popupdetail_Print input[type=text]').attr('disabled', 'disabled'); //Disable
    }
    function print_payment() {
        editpayment_print();
        openedit_print();
        $('.modal-title').html("지급 전표");
        $("#tb_bill_shp").hide();
        $("#tb_content_updatep").hide();
        $(".tbpayment_print").show();
    }
    function openedit_print() {
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
            binddataEdit(qr, vl, "tb_bill_print");
        });

        var tradingmission = $(o).find(".tradingmission").html();
        setselectoption(".sl-tradingmission-ctr", tradingmission);
        $(".tabledetailOrderCtr_print .tr_new").remove();
        $(".tabledetailOrderCtr_print .sumdata_qlt").remove();
        var order = 1;
        var datasum = [];
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
                datasum.push(i)
            })
            createnewRow(data, code, "tabledetailOrderCtr_print", order);
            order++;

        })
        var currency = $(o).attr("currency");
        $(".charmoney").html(currency);
        $(".input-currency-ctr").html(currency);
        $(".p-ordernumber").html($(o).find(".ordernumber").html());
        $("#popupdetail_Print").modal("toggle");
        var s = $(".sumdata_qlt").clone();
        $(s).appendTo(".tabledetailOrderCtr_print tbody");
        $(".tabledetailOrderCtr_print select").attr("data-iconpos", "noicon");
        $(".tabledetailOrderCtr_print select").prop('disabled', 'disabled');
    }
    function editpayment_print() {
        var o = $(".table1 .tr-active");
        if (o.length === 0)
            return false;
        var codebill = $(o).attr("codeid");
        editpayment_print();

    }
    function editpayment_print() {
        var o = $(".table1 .tr-active");
        if (o.length === 0)
            return false;
        var codebill = $(o).attr("codeid");
        var data = getdetailObj("payment", "codebill", codebill);
        var json = JSON.parse(data);
        var ctm = $(o).find(".tradingmission").html();
        for (var i = 0; i < json.length; i++) {
            json[i].customer = ctm;
            json[i].employer = findnameworker(json[i].employer);
            json[i].paymentdate = convertdate(json[i].paymentdate);
        }
        binddatapayment_print("tbpayment_print", json[0], codebill);
        console.log(json[0])
        $(".tbpayment_print .pm-customer").html(json[0]["employer"]);
        //setselectoption(".tbpayment .sl_employer", json[0].employer);
    }
    function binddatapayment_print(table, json, codebill) {
        var cen = $(".table1 .tr-active").attr("currency");

        $(".tbpayment_print .td-data").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = json[qr];
            if (moneyl.indexOf(qr) > -1)
                vl = cen + convertnumbertostring(vl);
            if ($(this).hasClass("pinput"))
                $(this).find(".p-input").html(vl);
            else if ($(this).hasClass("data-input"))
                $(this).find("input[type=text]").val(vl);
            else if ($(this).hasClass("select-dt"))
                $(this).find(".select-op option:contains(" + vl + ")").prop("selected", true);
        });


    }
    function printData() {
        $("#popupdetail_Print input[type=text]").each(function (index) {
            var vl = $(this).val();
            $(this).parent().html(vl);

        })
        $("#popupdetail_Print select").each(function (index) {
            var vl = $(this).find(":selected").text();
            $(this).parent().html(vl);

        })
        $("#popupdetail_Print .modal-footer").hide();
        var mywindow = window.open('', 'my div');

        mywindow.document.write('<html><head><title></title>');

        mywindow.document.write('<link rel="stylesheet" href="/css/table_print.css" type="text/css" />');
        mywindow.document.write('</head><body>');
        mywindow.document.write($("#popupdetail_Print .modal-content").html());
        mywindow.document.write('</body></html>');
        mywindow.document.close();
        setTimeout(function () { mywindow.print(); }, 100);
        $("#popupdetail_Print .modal-footer").show();
        mywindow.onafterprint = function () {
            mywindow.close();
        }
        var myStyle = '<link rel="stylesheet" href="http://mysite.com/mystyle.css" />';
        w.document.write(myStyle + jQuery('.table_disp').html());
        $.print("#popupdetail_Print");

    }


</script>
<div class="modal" id="popupdetail_Print">
    <div class="modal-dialog modal-dialog-print" style="margin: 0; width: 100%;">
        <div class="modal-content">
            <div class="modal-header" style="border: none; padding-bottom: 0">
                <p class="modal-title" style="letter-spacing: 28px; font-size: 22px; color: #000; padding-left: 25px;"></p>

            </div>
            <div class="modal-body">

                <div id="tb_billp" style="margin-top: 10px; margin-bottom: 15px;">

                    <table class="responsive-table tb_bill_print tablepopup" style="width: unset">
                        <thead>
                            <tr>
                                <th>발주 일자(번호)</th>
                                <th>발주담당</th>
                                <th>거래사명</th>
                                <th>고객사 연락처</th>

                                <th>거래조건</th>
                                <th>입고창고</th>
                                <th>계약일</th>
                                <th>미지급금</th>

                                <th>P/I no</th>
                                <th>발주확인</th>

                                <th>비 고</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="data-input pinput" data-sql="ordernumber" note_alert="발주 일자(번호)">
                                    <p class="p-input p-ordernumber"></p>
                                </td>
                                <td class="td-data pinput" data-sql="employer">
                                    <p class="p-input input-phone-ctr"></p>
                                </td>

                                <td class="td-data pinput" data-sql="tradingmission">
                                    <p class="p-input input-phone-ctr"></p>
                                </td>

                                <td class="pinput td-data class140" data-sql="phone" note_alert="please input phone">
                                    <p class="p-input input-phone-ctr"></p>

                                </td>

                                <td class="td-data pinput class80 data-not-null-td" data-sql="terms" note_alert="거래조건">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput class80" data-sql="warehouse" note_alert="입고창고">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput class100 data-not-null-td" data-sql="orderdate" note_alert="계약일">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput class100" data-sql="paymoney" note_alert="please input paymoney">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput class100" data-sql="notebill" note_alert="please input notebill">
                                    <p class="p-input input-notebill noline"></p>
                                </td>

                                <td class="td-data pinput class100 data-not-null-td" data-sql="dateconfirmation" note_alert="발주확인">
                                    <p class="p-input input-notebill noline"></p>

                                </td>

                                <td class="td-data pinput" data-sql="remark" note_alert="please input remark" style="border-right: 1px solid #ddd!important;">
                                    <p class="p-input input-notebill noline"></p>
                                </td>

                            </tr>
                        </tbody>
                    </table>

                </div>

                <div id="tb_content" style="margin-top: 10px">

                    <table class="responsive-table tabledetailOrderCtr_print tablepopup" style="width: unset">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45" data-type="numberorder">번호</th>
                                <th scope="col" class="class80">품목코드</th>
                                <th scope="col" class="class100">품목명</th>
                                <th scope="col" class="class110">규격</th>
                                <th scope="col" class="class70">매수</th>
                                <th scope="col" class="class70">수량(B)</th>
                                <th scope="col" class="class70">단가</th>
                                <th scope="col" class="class100">공급가액</th>
                                <th scope="col" class="class100">부가세</th>
                                <th scope="col" class="class100">합계 금액</th>
                                <th scope="col" class="class70">수량(C)</th>
                                <th scope="col" class="class70">SQM</th>
                                <th scope="col">항목비고</th>
                                <%-- <th scope="col"></th>--%>
                            </tr>
                        </thead>

                        <tbody>
                            <tr class="tr-input-ctr data_insert" style="display: none" codeid="">
                                <td class="td-auto order">01</td>
                                <td class="td-data-a data-auto au-itemcode class80" data-sql="codeitem"></td>
                                <td class="td-data-a pinput not-null" data-sql="nameitem" note_alert="품목명">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data-a pinput" data-sql="standard" note_alert="규격">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data-a pinput not-null" data-sql="quantityincase" note_alert="매수">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data-a pinput not-null" data-sql="qltcase" note_alert="수량(B)">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data pinput" data-sql="price">

                                    <p class="p-input price-ctr td-right" style="border: none"></p>
                                </td>
                                <td class="td-data pinput" data-sql="pricesupply">
                                    <span class="charmoney"></span>
                                    <p class="p-input pricesupply-ctr td-right" style="border: none"></p>
                                </td>
                                <td class="td-data pinput" data-sql="vat" note_alert="please input ...">
                                    <span class="charmoney"></span>
                                    <p class="p-input vat_ctr  td-right" style="border: none"></p>
                                </td>
                                <td class="td-data-a pinput not-null" data-sql="totalamount" note_alert="합계 금액">
                                    <span class="charmoney"></span>
                                    <p class="p-input vat_ctr  td-right" style="border: none"></p>
                                </td>
                                <td style="position: relative" class="td-data-a pinput" data-sql="qltcontainer" note_alert="please input ...">
                                    <p class="p-input pricesupply-ctr td-right" style="border: none"></p>
                                </td>

                                <td class="td-data-a pinput" data-sql="sqm" note_alert="please input ...">
                                    <p class="p-input input-sqm sqm_ctr" style="border: none"></p>
                                </td>
                                <td class="td-data-a pinput" data-sql="remark">
                                    <p class="p-input vat_ctr  td-right" style="border: none"></p>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div id="tb_bill_shp" style="margin-top: 10px; margin-bottom: 15px;">

                    <table class="responsive-table tb_bill_ship_print">
                        <thead>
                            <tr>
                                <th style="text-align: center">통관/입고번호</th>
                                <th>지급</th>
                                <th>L/C no</th>
                                <th>AMT</th>
                                <th>T/%</th>

                                <th class="th_white">TOL/AMT</th>
                                <th style="font-size: 10px;">USANCE</th>
                                <th>L/C, T/T date</th>
                                <th>신용장만기일</th>

                                <th>B/L no</th>
                                <th>선적기일</th>

                                <th>출항예정일</th>
                                <th>입항예정일</th>
                                <th>CON반납기일</th>
                                <th>운송사/선사</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tb_bill_ship_select">
                                <td class="pinput td-data data-not-null-td class130" data-sql="orderbill" note_alert="통관/입고번호">
                                    <p class="p-input input-orderbill"></p>
                                </td>
                                <td class="td-data pinput-dt sl-noempty class50 data-not-null-td" data-sql="paymentoption" note_alert="지급">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data pinput data-not-null-td class90" data-sql="note" note_alert="L/C no">
                                    <p class="p-input input-money-amt td-right"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td class100" data-sql="money" note_alert="AMT">
                                    <p class="p-input input-money-amt td-right"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td" data-sql="tolerancepercent" note_alert="T/%">
                                    <p class="p-input input-money-amt td-right"></p>
                                </td>

                                <td class="td-data pinput class100" data-sql="tolerancemoney">
                                    <p class="p-input input-tlcmoney numberinput"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td" data-sql="usance" note_alert="USANCE">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td" data-sql="datebeginpayment" note_alert="L/C, T/T date">

                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td" data-sql="creditduedate" note_alert="신용장만기일">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td td-reset" data-sql="numbership" note_alert="B/L no">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td td-reset" data-sql="duedate" note_alert="선적기일">
                                    <p class="p-input"></p>
                                </td>

                                <td class="td-data pinput data-not-null-td td-reset" data-sql="departuredate" note_alert="출항예정일">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data pinput data-not-null-td td-reset" data-sql="dateofarrival" note_alert="입항예정일">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data pinput data-not-null-td td-reset" data-sql="conDuedate" note_alert="CON반납기일">
                                    <p class="p-input"></p>
                                </td>
                                <td class="td-data pinput data-not-null-td td-reset" data-sql="nameshipname" note_alert="운송사/선사">
                                    <p class="p-input"></p>
                                </td>

                            </tr>
                        </tbody>
                    </table>

                </div>

                <div id="tb_content_updatep" style="margin-top: 10px">

                    <table class="responsive-table tabledetailOrderCtrup_p_print">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45" data-type="numberorder">번호</th>
                                <th scope="col" class="class100 thdata datetime" data-input="dateclearance">통관 예정일</th>
                                <th scope="col" class="class100 thdata datetime" data-input="customsday">품목 통관일</th>
                                <th scope="col" class="class40 thdata select_dt_port" data-input="port">PORT</th>
                                <th scope="col" class="class100 thdata data-input" class_item="class100" data-input="containernumber">CON No</th>
                                <th scope="col" class="class100 thdata datetime" data-input="daycertificate">원산지증명서</th>
                                <th scope="col" class="thdata select_sizefit" data-input="sizefit">C/K</th>
                                <th scope="col" class="thdata datetime" data-input="containerday">F/C</th>
                                <th scope="col" class="class90 thdata datetime" data-input="conreturnday">CON반납일</th>
                                <th scope="col" class="class90 thdata datetime" data-input="requestday">입고요청일</th>
                                <th scope="col" class="class90 thdata datetime" data-input="confirmreceiptday">입고확인</th>

                                <th scope="col" class="class130 thdata t_serinumber" data-input="serinumber">시리얼 No</th>
                                <th scope="col" class="thdata t_prodcode class75" data-input="prodcode">PROD code</th>
                                <th scope="col" class="thdata t_casenom class75" data-input="casenom">CASE nom</th>
                                <th scope="col" class="thdata t_proddate class75" data-input="proddate">PROD date</th>
                                <%-- <th scope="col"></th>--%>
                            </tr>
                        </thead>

                        <tbody>
                        </tbody>
                    </table>

                </div>
                <table class="responsive-table tbpayment_print" style="width: 97%; margin-top: 15px;">
                    <thead>
                        <tr>

                            <th scope="col" style="text-align: center;">통관/입고 전표번호</th>
                            <th scope="col" style="width: 100px">지급 일자</th>
                            <th scope="col" style="width: 100px">지급 담당</th>
                            <th scope="col">거래처명</th>
                            <th scope="col" style="width: 100px">거래조건</th>
                            <th scope="col">현금 T/T</th>
                            <th scope="col">어음 L/C</th>
                            <th scope="col">수수료</th>
                            <th scope="col">지급계좌</th>

                            <th scope="col">적요</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="pinput td-data class130" data-sql="codeorder">
                                <p class="p-input input-codeorder"></p>
                            </td>

                            <td class="td-data pinput class100" data-sql="paymentdate">
                                <p class="p-input"></p>
                            </td>

                            <td class="td-data pinput class80" data-sql="employer">
                                <p class="p-input"></p>
                            </td>

                            <td class="pinput td-data class130" data-sql="customer">
                                <p class="p-input pm-customer"></p>

                            </td>

                            <td class="td-data pinput class80 select_terms" data-sql="transactionterms">
                                <p class="p-input"></p>

                            </td>

                            <td class="td-data pinput class90" data-sql="cashT_T">
                                <p class="p-input"></p>
                            </td>

                            <td class="td-data pinput class90" data-sql="billL_C">
                                <p class="p-input"></p>
                            </td>
                            <td class="td-data pinput class90" data-sql="feesmoney">
                                <p class="p-input"></p>
                            </td>

                            <td class="td-data pinput class100" data-sql="paymentaccount">
                                <p class="p-input paymentaccount"></p>
                            </td>


                            <td class="td-data pinput class150" data-sql="remark">
                                <p class="p-input"></p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <ul class="ul-button" style="">
                    <li class="li-right" style="float: right; padding-right: 0">
                        <div>

                            <p class="p_empty er_bill" style="float: left; line-height: 30px; margin-right: 20px;"></p>

                            <div class="div-btn-header" onclick="printData();"><span class="span-title">인쇄</span></div>
                           <%-- <div class="div-btn-header"><span class="span-title">PDF</span></div>--%>
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>

                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>
