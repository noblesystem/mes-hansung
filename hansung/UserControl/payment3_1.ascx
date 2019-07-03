<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="payment3_1.ascx.cs" Inherits="hansung.UserControl.payment3_1" %>
<div class="modal in" id="poppayment" data-backdrop="static" aria-hidden="false" style="display: block;">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body" style="padding-top: 20px">
                    <table class="responsive-table table-popup tbpayment none_border" style="width: 1040px">
                        <thead>
                            <tr>

                                <th scope="col" style="text-align: center;">수주 일자(번호)</th>
                                <th scope="col">수금일자</th>
                                <th scope="col">영업 담당</th>
                                <th scope="col">거래처명</th>
                                <th scope="col">현금 수금액 </th>
                                <th scope="col">어음 수금액</th>
                                <th scope="col">수수료/기타 할인</th>
                                <th scope="col">입금계좌/현금</th>
                                <th scope="col">수금 적요</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="pinput td-data class130" data-sql="codeorder">
                                    <p class="p-input input-codeorder"></p>
                                </td>

                                <td class="td-data data-input class100" data-sql="paymentdate">
                                    <input type="text" class="datecombo data-not-null hasDatepicker" id="dp1557680970619">
                                </td>

                                <td class="td-data select-dt class80" data-sql="employer">
                                    <select class="select-op sl_employer">
                                    <option value="6">홍길동</option><option value="7">이문기</option><option value="8">이상열</option><option value="9">양만춘</option><option value="10">조용필</option><option value="11">이미연</option><option value="12">김종대</option><option value="13">김만복</option><option value="14">이순신</option><option value="15">문문문</option></select>

                                </td>

                                <td class="pinput td-data class130" data-sql="customer">
                                    <p class="p-input pm-customer">ASIA</p>

                                </td>

                                <td class="td-data select-dt class80 select_terms" data-sql="transactionterms">
                                    <select class="select-op">
                                        <option class="option-item">내수</option>
                                        <option class="option-item">외수</option>

                                    </select>
                                </td>

                                <td class="td-data data-input class90" data-sql="cashT_T">
                                    <input type="text" class="inputmoney data-not-null">
                                </td>

                                <td class="td-data data-input class90" data-sql="billL_C">
                                    <input type="text" class="inputmoney data-not-null"></td>
                                <td class="td-data data-input class90" data-sql="feesmoney">
                                    <input type="text" class="inputmoney data-not-null"></td>

                                <td class="td-data pinput class100" data-sql="paymentaccount">
                                    <p class="p-input paymentaccount"></p>
                                </td>


                                <td class="td-data data-input class150" data-sql="remark">
                                    <input type="text"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                 <div class="modal-footer" style="height: 55px">
                    <div style="float: right; color: white">
                        <div class="div-btn-header" id="savepayment" onclick="savepayment()" codeid=""><span class="span-title">저장</span></div>
                        <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>
                    </div>
                </div>
                <!-- Modal footer -->
               

            </div>
        </div>
    </div>