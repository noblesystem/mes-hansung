<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-1n.aspx.cs" Inherits="hansung.page2.page2_1n" %>

<%@ Register Src="/UserControl/input2_1.ascx" TagName="input2_1" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/input2_1_ship.ascx" TagName="input2_1_ship" TagPrefix="uc2" %>
<%@ Register Src="/UserControl/print_ship.ascx" TagName="print_ship" TagPrefix="uc3" %>
<%@ Register Src="/UserControl/ship_internal.ascx" TagName="ship_internal" TagPrefix="uc4" %>
<%@ Register Src="/UserControl/historyShips.ascx" TagName="historyShips" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:input2_1 ID="input2_1" runat="server" />
    <uc2:input2_1_ship ID="input2_1_ship" runat="server" />
    <uc3:print_ship ID="print_ship" runat="server" />
    <uc4:ship_internal ID="ship_internal" runat="server" />
    <uc5:historyShips ID="historyShips" runat="server" />
   
    
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
        <div class="col-lg-3">
            <div class="ibox ">
                <div class="ibox-content">

                    <asp:DropDownList ID="lstJob" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstJob_SelectedIndexChanged">
                        <asp:ListItem>회사원</asp:ListItem>
                        <asp:ListItem>회사원1</asp:ListItem>
                        <asp:ListItem>회사원2</asp:ListItem>
                    </asp:DropDownList>
                    <h3>전표 이력(history)</h3>

                    <table class="table table-hover no-margins">
                        <thead>
                        <tr>
                            <th>발주 일자(번호)</th>
                            <th>전표 타입</th>
                            <th>담당자</th>
                            <th>등록일</th> 
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="cursor:pointer">
                            <td><small>20190514A01</small></td>
                            <td>발주</td>
                            <td>이상열</td>
                            <td>2019-05-19 11:15</td>
                        </tr>
                        <tr style="cursor:pointer;background-color: ghostwhite;">
                            <td><small>20190514A01</small></td>
                            <td>통관</td>
                            <td>이상열</td>
                            <td>2019-05-19 11:15</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="ibox-footer text-right">
                    <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="Print" class="btn btn-sm btn-white">통관</button>
                    <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white">입고</button>
                    <button title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white">수정</button>
                </div>

            </div>
        </div>

        <div class="col-lg-9">

            <div class="row">
                 <div class="col-lg-12">

                    <div class="ibox ">
                        <div class="ibox-content">
                            <h3>발주 정보</h3>

                            <table class="table table-hover no-margins">
                            <thead>
                            <tr>
                                <tr>
                                    <th>고객사</th>
                                    <th>고객사 연락처</th>
                                    <th>거래조건</th>
                                    <th>입고창고</th>
                                    <th>계약일</th>
                                    <th>미지급금</th>

                                    <th>P/I no</th>
                                    <th>발주확인</th>

                                    <th>비 고</th>

                                </tr>
                            </tr>
                            </thead>
                            <tbody>
                                <tr >

                                    <td data-sql="tradingmission" class="new-td tradingmission">한국유리</td>
                                    <td data-sql="phone" class="new-td">051-2354-2514</td>
                                    <td data-sql="terms" class="new-td terms_main">FOB</td>
                                    <td data-sql="warehouse" class="new-td warehouse">김해창고</td>
                                    <td data-sql="orderdate" class="new-td tb1contractdate">2019.05.18</td>
                                    <td data-sql="paymoney" class="new-td td-right">₩ 27,523,000</td>
                                    <td data-sql="notebill" class="new-td">20190518-01</td>
                                    <td data-sql="dateconfirmation" class="new-td">2019.05.18</td>
                                    <td data-sql="remark" class="new-td class200"></td>
                                </tr>
                            </tbody>
                        </table>  

                        </div>
                    </div>

                </div>

            </div>

            <div class="row">
                 <div class="col-lg-12">

                    <div class="ibox ">
                        <div class="ibox-content">
                            <h3>품목 정보</h3>

                            <table class="table table-hover no-margins">
                            <thead>
                            <tr>
                                <th scope="col" style="text-align: center; width: 45px" class="index-order">번호</th>
                                <th scope="col" class="class80" data-input="codeitem">품목코드</th>
                                <th scope="col" class="class110" data-input="nameitem">품목명</th>
                                <th scope="col" class="class120" data-input="standard">규격</th>
                                <th scope="col" class="class70" data-input="quantityincase">매수</th>
                                <th scope="col" class="class70" data-input="qltcase">수량(B)</th>
                                <th scope="col" class="class70" data-input="price">단가</th>

                                <th scope="col" class="class110" data-input="pricesupply">공급가액</th>
                                <th scope="col" class="class110" data-input="vat">부가세</th>
                                <th scope="col" class="class110" data-input="totalamount">합계 금액</th>
                                <th scope="col" class="class70" data-input="qltcontainer">수량(C)</th>

                                <th scope="col" class="class70" data-input="sqm">SQM</th>
                                <th scope="col" data-input="remark" style="width: 205px">항목비고</th>
                            </tr>
                            </thead>
                            <tbody>
<tr class="it-insert" codeid="dtbuy8121b17ba7c64e02ac41294e5374532d" nameitem="고방5" bitem="5" codeitem="0001" standard="1830*2440" ship="" shipid=""><td class="new-index">01</td><td class="td-data codeitem " data-sql="codeitem">0001</td><td class="td-data nameitem " data-sql="nameitem">고방5</td><td class="td-data standard " data-sql="standard">1830*2440</td><td class="td-data quantityincase td-right" data-sql="quantityincase">40</td><td class="td-data qltcase td-right" data-sql="qltcase">5</td><td class="td-data price td-right" data-sql="price"> 10</td><td class="td-data pricesupply td-right" data-sql="pricesupply"> 10,180</td><td class="td-data vat td-right" data-sql="vat"> 1,018</td><td class="td-data totalamount td-right" data-sql="totalamount"> 11,200</td><td class="td-data qltcontainer td-right" data-sql="qltcontainer"></td><td class="td-data sqm td-right" data-sql="sqm">893</td><td class="td-data remark " data-sql="remark"></td></tr><tr class="it-insert" codeid="dtbuy74177d3f70ec4d7cb79dd36553c645c9" nameitem="다이아5" bitem="5" codeitem="0003" standard="2134*2440" ship="" shipid=""><td class="new-index">02</td><td class="td-data codeitem " data-sql="codeitem">0003</td><td class="td-data nameitem " data-sql="nameitem">다이아5</td><td class="td-data standard " data-sql="standard">2134*2440</td><td class="td-data quantityincase td-right" data-sql="quantityincase">35</td><td class="td-data qltcase td-right" data-sql="qltcase">5</td><td class="td-data price td-right" data-sql="price"> 13</td><td class="td-data pricesupply td-right" data-sql="pricesupply"> 12,900</td><td class="td-data vat td-right" data-sql="vat"> 1,290</td><td class="td-data totalamount td-right" data-sql="totalamount"> 14,200</td><td class="td-data qltcontainer td-right" data-sql="qltcontainer"></td><td class="td-data sqm td-right" data-sql="sqm">911</td><td class="td-data remark " data-sql="remark"></td></tr><tr class="sumdata_qlt"><td>합계</td><td class="nosum"></td><td class="nosum"></td><td class="nosum"></td><td class="nosum"></td><td class="sumqltcase td-right">10</td><td class="nosum"></td><td class="sumpricesupply td-right"> 23,080</td><td class="sumvat td-right"> 2,308</td><td class="sumtotalamount td-right"> 25,400</td><td class="nosum"></td><td class="sumsqm td-right">1,804</td><td class="nosum"></td>
                                </tr>
                            </tbody>
                        </table>  

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    </div>

    
    <script type="text/javascript">
        var toolbar = [{
            text: 'Add',
            iconCls: 'icon-add',
            handler: function () { alert('add') }
        }, {
            text: 'Cut',
            iconCls: 'icon-cut',
            handler: function () { alert('cut') }
        }, '-', {
            text: 'Save',
            iconCls: 'icon-save',
            handler: function () { alert('save') }
        }];
    </script>
</asp:Content>
