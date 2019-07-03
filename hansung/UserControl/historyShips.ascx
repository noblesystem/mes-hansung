<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="historyShips.ascx.cs" Inherits="hansung.UserControl.historyShips" %>
<div class="modal" id="popupdetail_ship_gtr">
    <div class="modal-dialog" style="margin: 0; width: 100%;">
        <div class="modal-content" style="overflow: auto">

            <div class="modal-body">
                
                <div id="tb_bill_sh" style="margin-top: 10px; margin-bottom: 15px;">

                    <table class="responsive-table tb_bill_ship_htr">
                        <thead>
                            <tr>
                                <th style="text-align: center" data-query="orderbill">통관/입고번호</th>
                                <th data-query="paymentoption">지급</th>
                                <th data-query="note">L/C no</th>
                                <th data-query="money">AMT</th>
                                <th class="th_white" data-query="tolerancepercent">T/%</th>

                                <th class="th_white" data-query="tolerancemoney">TOL/AMT</th>
                                <th style="font-size: 10px;" data-query="usance">USANCE</th>
                                <th data-query="datebeginpayment">L/C, T/T date</th>
                                <th data-query="creditduedate">신용장만기일</th>

                                <th data-query="numbership">B/L no</th>
                                <th data-query="duedate">선적기일</th>

                                <th data-query="departuredate">출항예정일</th>
                                <th data-query="dateofarrival">입항예정일</th>
                                <th data-query="conDuedate">CON반납기일</th>
                                <th data-query="nameshipname">운송사/선사</th>

                            </tr>
                        </thead>
                        <tbody>
               
                        </tbody>
                    </table>

                </div>

                <div id="tb_content_update" style="margin-top: 10px">

                    <table class="responsive-table tabledetailOrderCtrup_htr">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45" data-type="numberorder">번호</th>
                                <th scope="col" class="class100 thdata datetime" data-input="dateclearance">통관 예정일</th>
                                <th scope="col" class="class100 thdata datetime th_white" data-input="customsday">품목 통관일</th>
                                <th scope="col" class="class40 thdata select_dt_port" data-input="port">PORT</th>
                                <th scope="col" class="class100 thdata data-input th_white" class_item="class100" data-input="containernumber">CON No</th>
                                <th scope="col" class="class100 thdata datetime th_white" data-input="daycertificate">원산지증명서</th>
                                <th scope="col" class="thdata select_sizefit th_white" data-input="sizefit">C/K</th>
                                <th scope="col" class="thdata datetime th_white" data-input="containerday">F/C</th>
                                <th scope="col" class="class90 thdata datetime th_white" data-input="conreturnday">CON반납일</th>
                                <th scope="col" class="class90 thdata datetime" data-input="requestday">입고요청일</th>
                                <th scope="col" class="class90 thdata datetime th_white" data-input="confirmreceiptday">입고확인</th>

                                <th scope="col" class="class130 thdata t_serinumber th_white" data-input="serinumber">시리얼 No</th>
                                <th scope="col" class="thdata t_prodcode class75 th_white" data-input="prodcode">PROD code</th>
                                <th scope="col" class="thdata t_casenom class75 th_white" data-input="casenom">CASE nom</th>
                                <th scope="col" class="thdata t_proddate class75 th_white" data-input="proddate">PROD date</th>
                                <%-- <th scope="col"></th>--%>
                            </tr>
                        </thead>

                        <tbody>
                        </tbody>
                    </table>

                </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <ul class="ul-button" style="">
                    <li class="li-right" style="float: right; padding-right: 0">
                        <div>

                            
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>

                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>