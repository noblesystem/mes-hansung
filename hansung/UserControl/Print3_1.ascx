<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Print3_1.ascx.cs" Inherits="hansung.UserControl.Print3_1" %>
<script>
    function print_bill() {
        if (print_detail()===false)
            return false;
        getRowPrint("table1", "it-insert", "tablebill_print");
        getRowPrint("table3", "it-insert", "table3_print");
        $(".table2_print").hide();
         $(".tablepay_print").hide();
        $("#popupdetail_Print").modal("toggle");
    }
    function print_car() {
         if (print_detail()===false)
            return false;
                print_detail();
        getRowPrint("table1", "it-insert", "tablebill_print");
        getRowPrint("table3", "it-insert", "table3_print");
        getRowPrint("table2", "car_it", "table2_print");
          $(".table2_print").show();
         $(".tablepay_print").hide();
        $("#popupdetail_Print").modal("toggle");
    }
    function printpayemnt() {
         if (print_detail()===false)
            return false;
                print_detail();
        getRowPrint("table1", "it-insert", "tablebill_print");
        getRowPrint("table3", "it-insert", "table3_print");
        getRowPrint("tablepay", "it-insert", "tablepay_print");
          $(".table2_print").hide();
         $(".tablepay_print").show();
        $("#popupdetail_Print").modal("toggle");
    }
    function print_detail() {
        if ($(".table1 .tr-active").length <= 0)
            return false;
        $(".table2_print tbody").empty();
        $(".table3_print tbody").empty();
        $(".tablepay_print tbody").empty();
        $(".tablebill_print tbody").empty();
    }
    function getRowPrint(table, c, tbprint) {
        $("." + table + " ." + c).each(function (index) {
            var tr = "<tr>";
            $(this).find("td").each(function (index) {
                $(this).find("td")
                tr += "<td>" + $(this).html() + "</td>";
            })
            tr += "</tr>";
            $(tr).appendTo('.' + tbprint + ' tbody');
        })
    }
    function print_data() {
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
                <table class="responsive-table tablebill_print">

                    <thead>
                        <tr>
                            <th scope="col" style="width: 200px; text-align: center" data-input="orderdate">수주 일자(번호)
                            </th>
                            <th scope="col" class="class180" data-input="salesrepresentative">영업 담당
                            </th>
                            <th scope="col" class="class180" data-input="customercompany">고객사명
                            </th>
                            <th scope="col" class="class180" data-input="customercontacts">고객사 연락처
                            </th>
                            <th scope="col" class="class180" data-input="terms">거래 조건
                            </th>
                            <th scope="col" class="class180" data-input="transactionbalancectm">미수금
                            </th>
                            <th scope="col" style="width: 200px;" data-input="warehouse">출고 창고
                            </th>

                            <th scope="col" class="class180" data-input="issuedate">출고 예정일
                            </th>
                            <th scope="col" class="class180" data-input="contactphone">도착지 연락처
                            </th>
                            <th scope="col" class="class180" data-input="frame">프레임
                            </th>
                            <th scope="col" data-input="remark">수주 비고
                            </th>

                        </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>

                <table class="responsive-table table3_print">

                    <thead>
                        <tr>
                            <th scope="col" class="index-order" style="text-align: center; width: 50px">번호

                            </th>
                            <th scope="col" class="class180" data-input="itemcode">품목코드</th>
                            <th scope="col" data-input="itemname">품목명</th>
                            <th scope="col" data-input="standard">규격</th>
                            <th scope="col" data-input="qltincase">매수</th>
                            <th scope="col" data-input="qltcase">수량(B)</th>
                            <th scope="col" data-input="price">단가</th>

                            <th scope="col" data-input="pricesupply">공급가액</th>
                            <th scope="col" data-input="vat">부가세</th>
                            <th scope="col" data-input="totalamount">합계 금액</th>
                            <th scope="col" data-input="itemremarks">항목 비고</th>

                            <th scope="col" data-input="serialNo">시리얼 No</th>
                            <th scope="col" data-input="caseNo">CASE No</th>
                            <th scope="col" data-input="PRODNo">PROD No</th>
                        </tr>
                    </thead>

                    <tbody></tbody>
                </table>


                <table class="responsive-table table2_print clear">
                    <thead>
                        <tr>
                            <th data-input="numbill" class="class130">출고전표번호</th>
                            <th data-input="company" class="class100">운송사</th>
                            <th data-input="numberofvehicles" class="class100">차량번호</th>
                            <th data-input="rate" class="class100">운임</th>
                            <th data-input="verifyingacceptance" class="class100">승인 확인	</th>
                            <th data-input="deliveryworker" class="class100">출고확인</th>
                            <th data-input="shippingtime" class="class150">출고시간</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <table class="responsive-table tablepay_print clear">
                    <thead>
                        <tr>
                            <th data-input="codeorder" class="class130">수주 일자(번호)</th>
                            <th data-input="paymentdate" class="class100">수금일자</th>
                            <th data-input="employer" class="class100">영업 담당</th>
                            <th data-input="customer" class="class100">거래처명</th>
                            <th data-input="transactionterms" class="class100">현금 수금액</th>
                            <th data-input="cashT_T" class="class100">어음 수금액</th>
                            <th data-input="billL_C" class="class150">수수료/기타 할인</th>

                            <th data-input="paymentaccount" class="class100">입금계좌/현금</th>
                            <th data-input="remark" class="class100">수금 적요</th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <ul class="ul-button" style="">
                    <li class="li-right" style="float: right; padding-right: 0">
                        <div>

                            <p class="p_empty er_bill" style="float: left; line-height: 30px; margin-right: 20px;"></p>

                            <div class="div-btn-header" onclick="print_data();"><span class="span-title">인쇄</span></div>
                            <%-- <div class="div-btn-header"><span class="span-title">PDF</span></div>--%>
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>

                        </div>
                    </li>
                </ul>

            </div>
        </div>

    </div>
</div>
