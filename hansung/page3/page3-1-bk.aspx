<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page3-1-bk.aspx.cs" Inherits="hansung.page3.page3_1_bk" %>


<%@ Register Src="/UserControl/input3_1.ascx" TagName="input3_1" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/Print3_1.ascx" TagName="Print3_1" TagPrefix="uc2" %>
<%@ Register Src="/UserControl/ship_internal_3_1.ascx" TagName="ship_internal_3_1" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .ui-autocomplete {
			z-index:999999;
		}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="/js/salejs.js?v=1.1.8"></script>
    <script>
        $(document).ready(function () {

            bindoptionwarehouse("sl-warehouse");
            setautocompleat($('.employerpay'), emloyer);
            bindoptionworkers("op_employer");
            bindoptionctm("3", "op-companys");
            setautocompleat($('.td-itemname'), items_group);
            // $(".createnew").on('keyup', function (e) {
            //    if (e.keyCode == 13) {
            //        addrowdata();
            //    }
            //});
            $(".sl-workers").change(function () {
                var a = $(this).find(":selected").val()
                bindoptionctmfollowwk(a, 'sl-companys')
            });
            $(".sl-companys").change(function () {
                var a = $(this).find(":selected");
                var transactionbalance = $(a).attr("transactionbalance");
                $(".inputmoney-manager").val(convertnumbertostring(transactionbalance));
                if ($(a).val() === -1)
                    return false
                binddatactm($(a).text(), 'input-customercontacts', 'h', 'phonenumber');
                binddatactm($(a).text(), 'input-contactphone', 'h', 'destinationphone');
                binddatactm($(a).text(), 'input-destinationaddress', 'h', 'destinationaddress');
            });
            $(".companys").blur(function () {
                if ($(this).val() === "")
                    return false
                binddatactm($(this).val(), 'input-customercontacts', 'h', 'phonenumber');
                binddatactm($(this).val(), 'input-contactphone', 'h', 'destinationphone');
                binddatactm($(this).val(), 'input-destinationaddress', 'h', 'destinationaddress');

            });
            $(".orderdate").change(function () {
                newcodefile("S", $(this));
            });
            $(".sl-standar").blur(function () {
                var s = $(this).find(":selected");
                $(".td-qual").val($(s).attr("quantityincase"));
                var itemcode = $(s).attr("itemcode");
                if (itemcode.length < 4) {
                    var n = 4 - itemcode.length;
                    for (var t = 0; t < n; t++)
                        itemcode = "0" + itemcode;
                }
                $('.au-itemcode').html(itemcode);
            });

        })
        function savepaymentpm() {
            var o = $(".table1").find(".tr-active");

            var codebill = $(o).attr("codeid");
            var data = converdatatable('tbpayment');
            if (data === false)
                return false;
            var idedit = $("#savepayment").attr("idedit");
            var rs = savedata("paymentorder", data, codebill);
            location.reload();
        }
        function openEditpay() {
            var data = [];
            $(".tablepay .it-insert .td-data").each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = $(this).html();
                var i = {
                    name: qr,
                    vl: vl
                }
                data.push(i);
            })
    
            $('.tbpayment .td-data').each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = findvalinjson(data,qr);
      
                if ($(this).hasClass("pinput"))
                    $(this).find(".p-input").html(vl);
                else if ($(this).hasClass("data-input"))
                    $(this).find("input[type=text]").val(vl);
                else if ($(this).hasClass("select-dt"))
                  setselectoptionselect($(this).find(".select-op"),vl);
            })
            $("#poppayment").modal("toggle");
        }
        function findvalinjson(json, c) {
            var rs = "";
            for (var i = 0; i < json.length; i++) {
                if (json[i].name === c) {
                    rs = json[i].vl;
                    return rs;
                }
            }
            return rs;
        }
    </script>
    <uc1:input3_1 ID="input3_1" runat="server" />
    <uc2:Print3_1 ID="Print3_1" runat="server" />
    <uc4:ship_internal_3_1 ID="ship_internal" runat="server" />
    <div class="modal" id="poppayment">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <table class="responsive-table table-popup none_border tbpayment">
                        <thead>
                            <tr>
                                <th>수주 일자(번호)</th>
                                <th>수금일자</th>
                                <th>영업 담당</th>
                                <th>거래처명</th>
                                <th>현금 수금액 </th>
                                <th>어음 수금액</th>
                                <th class="th_white">수수료/기타 할인</th>
                                <th>입금계좌/현금</th>
                                <th class="th_white">수금 적요</th>
                            </tr>
                        </thead>
                        <tr>

                            <td class="pinput td-data" data-sql="codeorder">
                                <p class="p-input input-codeorder"></p>
                            </td>
                            <td class="td-data data-input" data-sql="paymentdate">
                                <input type="text" class="datecombo data-not-null" />
                            </td>
                            <td class="td-data select-dt" data-sql="employer">
                                <select class="select-op op_employer"></select>
                            </td>
                            <td class="pinput td-data" data-sql="customer">
                                <p class="p-input pm-customer"></p>

                            </td>
                            <td class="td-data select-dt" data-sql="transactionterms">
                                <select class="select-op">
                                    <option class="option-item">내수</option>
                                    <option class="option-item">외수</option>

                                </select>
                            </td>
                            <td class="td-data data-input" data-sql="cashT_T">
                                <input type="text" class="inputmoney" />
                            </td>
                            <td class="td-data data-input" data-sql="billL_C">
                                <input type="text" class="inputmoney" /></td>
                            <td class="td-data pinput" data-sql="paymentaccount">
                                <p class="p-input paymentaccount"></p>
                            </td>
                            <td class="td-data data-input" data-sql="remark">
                                <input type="text" /></td>
                        </tr>

                    </table>
                </div>

                <!-- Modal footer -->

                <div class="modal-footer" style="height: 55px">
                    <div style="float: right; color: white">
                        <div class="div-btn-header" id="savepayment" onclick="savepaymentpm()" codeid="" idedit="0"><span class="span-title">저장</span></div>
                        <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="popupdetail">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <table class="responsive-table tabledetailOrder" style="font-size: 14px; width: 800px;">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center; width: 50px" data-type="numberorder">번호</th>
                                <th scope="col" class="class180">품목코드</th>
                                <th scope="col">품목명</th>
                                <th scope="col">규격</th>
                                <th scope="col">매수</th>
                                <th scope="col">수량(B)</th>
                                <th scope="col">합계 금액</th>
                                <th scope="col">항목 비고</th>

                                <th scope="col">시리얼 No</th>
                                <th scope="col">CASE No</th>
                                <th scope="col">PROD No</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr class="tr-input">
                                <td class="td-auto order"></td>
                                <td class="td-data-a data-auto au-itemcode" data-sql="itemcode"></td>
                                <td class="td-data-a data-input" data-sql="itemname">
                                    <input type="text" class="txt-input td-itemname createnew data-not-null" onblur="bindstandar($(this).val(),'sl-standar')"></td>
                                <td class="td-data-a select-dt" data-sql="standard">
                                    <select class="sl-option sl-standar data-not-null" style="width: 100px">
                                    </select>
                                </td>
                                <td class="td-data-a data-input" data-sql="qltincase">
                                    <input type="text" class="txt-input td-qual numberinput td-right createnew data-not-null"></td>
                                <td class="td-data-a data-input" data-sql="qltcase">
                                    <input type="text" class="txt-input td-right numberinput packesize createnew data-not-null"></td>

                                <td class="td-data-a data-input" data-sql="totalamount">
                                    <input type="text" class="txt-input inputmoney createnew data-not-null"></td>
                                <td class="td-data-a data-input" data-sql="itemremarks">
                                    <input type="text" class="txt-input numberinput qlC createnew data-not-null"></td>

                                <td class="td-data-a data-input" data-sql="serialNo">
                                    <input type="text" class="txt-input sumpake td-right createnew data-not-null"></td>
                                <td class="td-data-a data-input" data-sql="caseNo">
                                    <input type="text" class="txt-input createnew "></td>
                                <td class="td-data-a data-input" data-sql="PRODNo">
                                    <input type="text" class="txt-input createnew "></td>
                                <td></td>
                            </tr>

                        </tbody>
                    </table>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <ul class="ul-button" style="">
                        <li class="li-right" style="float: right; padding-right: 0">
                            <div>

                                <div class="div-btn-header" onclick="savedetailOrder()"><span class="span-title">저장</span></div>
                                <div class="div-btn-header" data-dismiss="modal"><span class="span-title">취소</span></div>

                            </div>
                        </li>
                    </ul>

                </div>

            </div>
        </div>
    </div>
    <div class="modal" id="newItem">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <table class="table-popup tbinput">
                        <tr>
                            <td>수주 일자(번호)</td>
                            <td class="data-input td-data" data-sql="orderdate">
                                <input type="text" class="datecombo data-not-null orderdate" />
                            </td>
                        </tr>
                        <tr>

                            <td>영업 담당</td>
                            <td class="td-data select-dt" data-sql="salesrepresentative">
                                <select class="select-op sl-workers data-not-null select-dt">
                                    <option class="option-item" value="-1">Select one</option>
                                    <%foreach (var i in employer)
                                        {%>
                                    <option class="option-item" value="<%=i["id"].ToString() %>"><%=i["name"].ToString() %></option>
                                    <%} %>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>고객사명</td>
                            <td class="td-data select-dt" data-sql="customercompany">
                                <select class="select-op sl-companys data-not-null select-dt">
                                    <option class="option-item companys data-not-null" value="-1">Select one</option>

                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>고객사 연락처</td>
                            <td class="pinput td-data" data-sql="customercontacts">
                                <p class="p-input input-customercontacts"></p>

                            </td>
                        </tr>
                        <tr>
                            <td>거래 조건</td>
                            <td class="td-data select-dt" data-sql="terms">
                                <select class="select-op sl-terms">
                                    <option class="option-item">내수</option>
                                    <option class="option-item">FOB</option>
                                    <option class="option-item">CIF</option>
                                    <option class="option-item">CFR</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>미수금</td>
                            <td class="td-data data-input" data-sql="transactionbalancectm">
                                <input type="text" class="inputmoney-manager inputmoney" />
                            </td>
                        </tr>
                        <tr>
                            <td>출고 창고</td>
                            <td class="td-data select-dt" data-sql="warehouse">
                                <select class="select-op sl-warehouse">
                                    <option class="op-default" value="-1">Select one</option>

                                </select></td>
                        </tr>

                        <tr>
                            <td>출고 예정일</td>
                            <td class="td-data data-input" data-sql="issuedate">
                                <input type="text" class="datecombo" />

                            </td>
                        </tr>
                        <tr>
                            <td>도착지 연락처</td>
                            <td class="td-data pinput" data-sql="contactphone">
                                <p class="p-input input-contactphone"></p>

                            </td>
                        </tr>
                        <tr>
                            <td>프레임</td>
                            <td class="td-data select-dt" data-sql="frame">
                                <select class="select-op">
                                    <option class="option-item" value="-1">Select one</option>
                                    <option class="option-item" value="-1">한국</option>
                                    <option class="option-item" value="-1">KCC</option>
                                    <option class="option-item" value="-1">메이커</option>
                                    <option class="option-item" value="-1">B</option>
                                </select>

                            </td>
                        </tr>

                        <tr>
                            <td>도착지 주소</td>
                            <td class="td-data pinput" data-sql="destinationaddress">
                                <p class="p-input input-destinationaddress"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>수주 비고</td>
                            <td class="td-data data-input" data-sql="remark">
                                <input type="text" /></td>
                        </tr>
                    </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" style="float: left" class="btn btn-popup" onclick="cretenewsalse()">저장</button>

                    <button type="button" class="btn btn-popup" data-dismiss="modal">취소</button>
                </div>

            </div>
        </div>
    </div>
    <div class="modal" id="newCar">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <table class="table-popup tbinputCar">
                        <tr>
                            <td>출고전표번호</td>
                            <td class="td-data pinput" data-sql="forwardingnumber">
                                <p class="p-input p-forwardingnumber"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>운송사</td>
                            <td class="td-data select-dt" data-sql="company">
                                <select class="select-op op-companys">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr>

                            <td>차량번호</td>
                            <td class="td-data data-input" data-sql="numberofvehicles">
                                <input type="text" class="data-not-null" />
                            </td>
                        </tr>
                        <tr>
                            <td>운임</td>
                            <td class="td-data data-input" data-sql="rate">
                                <input type="text" class="data-not-null inputmoney" />
                            </td>
                        </tr>
                        <tr>
                            <td>승인 확인</td>
                            <td class="select-check td-data" data-sql="verifyingacceptance">
                                <input type="checkbox" class="check-option">
                            </td>
                        </tr>
                        <tr>
                            <td>출고확인</td>
                            <td class="td-data select-dt" data-sql="deliveryworker">
                                <select class="select-op op-deliveryworker">
                                    <option></option>
                                    <%foreach (var i in employer)
                                        {%>
                                    <option><%=i["name"].ToString() %></option>
                                    <%} %>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>출고시간</td>
                            <td class="pinput td-data" data-sql="shippingtime">
                                <p class="p-input input-shippingtime"></p>
                            </td>
                        </tr>

                    </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" style="float: left" class="btn btn-popup" onclick="cretenewcar()">저장</button>

                    <button type="button" class="btn btn-popup" data-dismiss="modal">취소</button>
                </div>

            </div>
        </div>
    </div>
    <div class="border-bottom white-bg dashboard-header">

        <ul class="ul-button">
            <li>
                <div>
                    <div class="div-btn-header btn-addnew" onclick="opennewbill()"><span class="span-title" data-toggle="modal">수주</span></div>
                    <div class="div-btn-header btn-addnew" onclick="new_car()"><span class="span-title" data-toggle="modal">출고</span></div>

                    <div class="div-btn-header btn-addnew" onclick="openpaymentOrder()"><span class="span-title" data-toggle="modal">수금</span></div>
                </div>
            </li>

            <li class="close_up_subpopup">
                <div>
                    <div class="div-btn-header" style="position: relative;">
                        <p class="span-title" onclick="closedropdow('group-edit')">수정</p>
                        <div class="group-btn group-edit">
                            <p onclick="openedit_bill_began('table1','tbinput','newItem')">수주</p>
                            <p onclick="Edit_internal()">출고</p>
                            <p onclick="openEditpay()">수금</p>

                        </div>
                    </div>

                </div>
            </li>
            <li class="close_up_subpopup">
                <div>
                    <div class="div-btn-header" style="position: relative;">
                        <p class="span-title" onclick="closedropdow('group-edit-new')">인쇄</p>
                        <div class="group-btn group-edit-new">
                            <p onclick="print_bill()">수주</p>
                            <p onclick="print_car()">출고</p>
                            <p onclick="printpayemnt()">수금</p>

                        </div>
                    </div>

                </div>
            </li>
        </ul>
        <div class="clear">

            <table class="responsive-table table1">

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
                    <%foreach (var i in mainData)
                        {%>
                    <tr class="it-insert" codeid="<%=i["codeid"].ToString() %>" currency="">
                        <td class="new-orderdate orderdate new-td ordernumber class130" data-sql="orderdate"><%=i["orderdate"].ToString() %></td>
                        <td class="new-salesrepresentative salesrepresentative new-td" data-sql="salesrepresentative"><%=i["salesrepresentative"].ToString() %></td>
                        <td class="new-customercompany customercompany new-td" data-sql="customercompany"><%=i["customercompany"].ToString() %></td>
                        <td class="new-customercontacts customercontacts new-td" data-sql="customercontacts"><%=i["customercontacts"].ToString() %></td>
                        <td class="new-terms terms new-td" data-sql="terms"><%=i["terms"].ToString() %></td>
                        <td class="new-receivables receivables new-td" data-sql="transactionbalancectm"><%=String.Format("{0:0,0}",i["transactionbalancectm"]) %></td>
                        <td class="new-warehouse warehouse new-td" data-sql="warehouse"><%=i["warehouse"].ToString() %></td>
                        <td class="new-issuedate issuedate new-td" data-sql="issuedate"><%=i["issuedate"].ToString() %></td>
                        <td class="new-contactphone destinationaddress new-td" data-sql="destinationaddress"><%=i["destinationaddress"].ToString() %></td>
                        <td class="new-frame frame new-td" data-sql="frame"><%=i["frame"].ToString() %></td>
                        <td class="new-remark remark new-td" data-sql="remark"><%=i["remarks"].ToString() %></td>

                    </tr>
                    <%} %>
                </tbody>
            </table>

        </div>
    </div>
    <script>

    </script>
</asp:Content>
