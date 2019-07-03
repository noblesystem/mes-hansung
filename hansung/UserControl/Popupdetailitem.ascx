<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popupdetailitem.ascx.cs" Inherits="hansung.UserControl.Popupdetailitem" %>
<div class="modal in" id="popdetail" data-backdrop="static" aria-hidden="false" style="display: block;">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <table class="responsive-table tabledetail" style="font-size: 14px; width: 800px;">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center; width: 50px" data-type="numberorder">번호</th>
                                <th scope="col" class="class180">품목코드</th>
                                <th scope="col">품목명</th>
                                <th scope="col">규격</th>
                                <th scope="col">매수</th>
                                <th scope="col">수량(B)</th>
                                <th scope="col" class="datahidden">단가</th>

                                <th scope="col" class="datahidden">공급가액</th>
                                <th scope="col" class="datahidden">부가세</th>
                                <th scope="col">합계 금액</th>
                                <th scope="col">수량(C)</th>

                                <th scope="col" class="datahidden">SQM</th>
                                <th scope="col">항목비고</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr class="tr-input">
                                <td class="td-data td-auto order" data-sql="id"></td>
                                <td class="td-data td-auto itemcode" data-sql="itemcode"></td>
                                <td class="td-data td-input" data-sql="itemname">
                                    <span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span><input type="text" class="txt-input td-itemname createnew data-not-null ui-autocomplete-input" onblur="setauto($(this))" autocomplete="off"></td>
                                <td class="td-data td-option">
                                    <select class="sl-option sl-standar data-not-null" data-sql="standar">
                                        <option value="-1"></option>
                                        
                                        <option class="option-item op-item" itemcode="1" qlt="40" style="display: none" nitem="고방5" value="1">1830*2440</option>
                                        
                                        <option class="option-item op-item" itemcode="2" qlt="40" style="display: none" nitem="다이아5" value="2">1830*2440</option>
                                        
                                        <option class="option-item op-item" itemcode="3" qlt="35" style="display: none" nitem="다이아5" value="3">2134*2440</option>
                                        
                                        <option class="option-item op-item" itemcode="4" qlt="31" style="display: none" nitem="초백5" value="4">2140*3300</option>
                                        
                                        <option class="option-item op-item" itemcode="5" qlt="26" style="display: none" nitem="초백5" value="5">2140*3660</option>
                                        
                                        <option class="option-item op-item" itemcode="6" qlt="38" style="display: none" nitem="오셔닉5" value="6">1830*3050</option>
                                        
                                        <option class="option-item op-item" itemcode="7" qlt="33" style="display: none" nitem="오셔닉5" value="7">2130*3050</option>
                                        
                                        <option class="option-item op-item" itemcode="8" qlt="33" style="display: none" nitem="미스트5" value="8">2130*3048</option>
                                        
                                        <option class="option-item op-item" itemcode="9" qlt="40" style="display: none" nitem="미스트5" value="9">1830*2440</option>
                                        
                                        <option class="option-item op-item" itemcode="10" qlt="36" style="display: none" nitem="미스트3" value="10">1830*3050</option>
                                        
                                        <option class="option-item op-item" itemcode="11" qlt="40" style="display: none" nitem="워터큐브5" value="11">1830*2440</option>
                                        
                                        <option class="option-item op-item" itemcode="12" qlt="35" style="display: none" nitem="워터큐브5" value="12">1830*3050</option>
                                        
                                    </select>
                                </td>
                                <td class="td-data td-input">
                                    <input type="text" class="txt-input td-qual numberinput td-right createnew data-not-null" data-sql="qltincase"></td>
                                <td class="td-data td-input">
                                    <input type="text" class="txt-input td-right numberinput packesize createnew data-not-null" data-sql="qltcase"></td>
                                <td class="td-data td-input datahidden">

                                    <input type="text" class="txt-input td-right price" disabled="disabled" data-sql="price"></td>

                                <td class="td-data td-input datahidden">
                                    <input type="text" class="txt-input td-right suplypr " disabled="disabled" data-sql="suplyprice"></td>
                                <td class="td-data td-input datahidden">
                                    <input type="text" class="txt-input vat td-right " disabled="disabled" data-sql="vat"></td>
                                <td class="td-data td-input">
                                    <input type="text" class="txt-input inputmoney createnew data-not-null" data-sql="totalprice"></td>
                                <td class="td-data td-input">
                                    <input type="text" class="txt-input numberinput qlC createnew data-not-null" data-sql="qltcontainer"></td>

                                <td class="td-data td-input datahidden">
                                    <input type="text" class="txt-input sumpake td-right data-not-null" disabled="disabled" data-sql="sumpake"></td>
                                <td class="td-data td-input">
                                    <input type="text" class="txt-input createnew" data-sql="remark"></td>
                            </tr><tr class="tmp-line" codeid="dtdeb109fad3f4470fb0da3c059d7c70ea"><td class="order">1</td><td class="newitemcode">0001</td><td class="itemname">고방5</td><td><select class="sl-option-item sl-standar-sub data-not-null"><option selected="" class="option-item op-item" itemcode="1" qlt="40" nitem="고방5" value="undefined">1830*2440</option></select></td><td><input type="text" value="40" class="txt-input-new qltincase td-right data-not-null numberinput"></td><td><input type="text" value="10" class="txt-input-new qltcase td-right data-not-null numberinput"></td><td><input type="text" value="15,000,000" class="txt-input-new totalprice td-right data-not-null"></td><td><input type="text" value="2" class="txt-input-new qltcontainer td-right data-not-null numberinput"></td><td><input type="text" value="null" class="txt-input-new remark "></td></tr>
                        </tbody>
                    </table>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <ul class="ul-button" style="">
                        <li class="li-right" style="float: right; padding-right: 0">
                            <div>

                                <div class="div-btn-header" onclick="savelistItem()"><span class="span-title">저장</span></div>
                                <div class="div-btn-header" data-dismiss="modal"><span class="span-title">취소</span></div>

                            </div>
                        </li>
                    </ul>

                </div>

            </div>
        </div>
    </div>