<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page8-1.aspx.cs" Inherits="hansung.page8.page8_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://jqwidgets.com/public/jqwidgets/styles/jqx.base.css" rel="stylesheet">
    <script src="https://jqwidgets.com/public/jqwidgets/jqx-all.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    
    <div class="wrapper wrapper-content animated fadeInRight">


        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-content">

                        <div class="row"> 
                            <div class="col-lg-12">
                                <div class="col-md-1">
                                    <label class="col-form-label">거래조건</label>
                                    <select class="form-control m-b" name="account">
                                        <option style="display: none"></option>
                                        <option class="option-item">내수</option>
                                        <option class="option-item">FOB</option>
                                        <option class="option-item">CIF</option>
                                        <option class="option-item">CFR</option>
                                    </select>
                                </div>
                                <div class="col-md-1">
                                    <label class="col-form-label">품목코드</label>
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-md-1">
                                    <label class="col-form-label">발주담당</label>
                                    <select class="form-control m-b">
                                    <option class="op-default" value="-1"></option>
                                    <option value="6">홍길동</option><option value="7">이문기</option><option value="8">이상열</option><option value="9">양만춘</option><option value="10">조용필</option><option value="11">이미연</option><option value="12">김종대</option><option value="13">김만복</option><option value="14">이순신</option><option value="15">문문문</option><option value="16">유관순</option><option value="17">홍길동1</option><option value="18">DUNGNV</option><option value="19">HAINT</option><option value="20">employee</option><option value="21">유관순</option></select>
                                    
                                </div>
                                <div class="col-md-1">
                                    <label class="col-form-label">고객사명</label>
                                    <select class="form-control m-b"><option class="option-item" value="0" phone="" style="display:none"></option><option class="option-item" phone="" value="-1">All</option><option class="option-item" destinationphone="051-2547-2548" phone="051-2354-2514" transactionbalance="10500000" destinationaddress="212 33 ewere">한국유리</option><option class="option-item" destinationphone="085-251-354-2514" phone="085-257-524-2547" transactionbalance="10500" destinationaddress="kfhksdjafhdhsda">ASIA</option><option class="option-item" destinationphone="02-2022-2020" phone="02-1234-1234" transactionbalance="20000" destinationaddress="부산">한국유리1</option></select>
                                </div>
                                <div class="col-md-3">
                                    <label class="col-form-label">기간</label>
                                    <div class="input-daterange input-group" id="datepicker">
                                        <input type="text" class="form-control-sm form-control" id="start_date" name="start" value="05/14/2014">
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="form-control-sm form-control" id="end_date" name="end" value="05/22/2014">
                                    </div>
                                </div> 

                                
                            </div>
                        </div>
                        
                        
                        <div class="row"> 
                            <div class="col-lg-12">

                                 <div class="col-md-1">
                                    <button class="btn btn-primary" type="submit">조회</button>
                                </div>
                                
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="row"> 
                            <div class="col-lg-12">
                              
                              <table id="dataTable" class="responsive-table tabledata" >

                                    <thead>
                                        <tr>
                                            <th rowspan="2" style="text-align: center">번호</th>
                                            <th rowspan="2" style="text-align: center">품명	</th>
                                            <th rowspan="2" style="text-align: center">규격</th>

                                            <th colspan="3" style="text-align: center">11/01(금일)</th>
                                            <th colspan="3" style="text-align: center">미통관 도착재고</th>
                                            <th colspan="3" style="text-align: center">금월예상(11/15)</th>

                                            <th colspan="3" style="text-align: center">소계	</th>
                                            <th colspan="3" style="text-align: center">추정발주(11/30)</th>
                                            <th colspan="3" style="text-align: center"> 추발합계</th>

                                            <th colspan="3" style="text-align: center"> 예발1(12)</th>
                                            <th colspan="3" style="text-align: center"> 예발2(01)</th>
                                            <th colspan="3" style="text-align: center"> 예발 총계</th>
                    
                                            <th colspan="5" style="text-align: center"> BUFFER</th>
                                            <th colspan="2" style="text-align: center">판 매 실 적</th>
                                            <th colspan="3" style="text-align: center">11월 판 매</th>
					
					                        <th rowspan="2" style="text-align: center">3개월누게</th>
                                            <th rowspan="2" style="text-align: center">증감률</th>
                                            <th rowspan="2" style="text-align: center">회전기일</th>

                                            <th rowspan="2" style="text-align: center">회전수식</th>
                                            <th rowspan="2" style="text-align: center">예합</th>
                                            <th rowspan="2" style="text-align: center">전일변동</th>

                                        </tr>
                                        <tr>

                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>

                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>

                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>

                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>
                   
                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>
                   
                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>
                   
                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>
                   
                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>
                   
                                            <th scope="col" style="text-align: center">I</th>
                                            <th scope="col" style="text-align: center">B</th>
                                            <th scope="col" style="text-align: center">계</th>

                                            <th scope="col" style="text-align: center">1-I</th>
                                            <th scope="col" style="text-align: center">1-B</th>
                                            <th scope="col" style="text-align: center">2-I</th>
                                            <th scope="col" style="text-align: center">2-B</th>
                                            <th scope="col" style="text-align: center">계</th>

                                            <th scope="col" style="text-align: center">09월</th>
                                            <th scope="col" style="text-align: center">10월</th>

                                            <th scope="col" style="text-align: center">1부</th>
                                            <th scope="col" style="text-align: center">2부</th>
                                            <th scope="col" style="text-align: center">계</th>

                    	

                                        </tr>
               

                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>

                                            <td></td>
                                        </tr>
                
                                    </tbody>
                                </table>

                            </div>
                        </div>

                        <!--
                       
                         <ul class="ul-button" style="float:left">

                            <li>
                                <div>
                                    <input type="text" class="input-search" placeholder="TERMS">
                                </div>
                            </li>
                            <li>
                                <div>
                                    <input type="text" class="input-search" placeholder="거래조건">
                                </div>
                            </li>
                            <li>
                                <div>
                                    <input type="text" class="input-search" placeholder="품목코드">
                                </div>
                            </li>
                            <li>
                                <div>

                                    <input type="text" class="input-search" placeholder="발주 담당">
                                </div>
                            </li>
                            <li>
                                <div>

                                    <input type="text" class="input-search" placeholder="고객사명">
                                </div>
                            </li>
                            <li>
                                <div>

                                    <input type="text" class="input-search" placeholder="기간">
                                </div>
                            </li>
                        
                            <li>
                                <div>
                                    <div class="div-btn-header"><span class="span-title">검색</span></div>

                                </div>
                            </li>
                        </ul>
                         <ul class="ul-button" style="float:right">

                                <li>
                                    <div class="div-btn-header"><span class="span-title">인쇄</span></div>
                                </li>
                         
                                <li style="padding-right:0">
                                    <div class="div-btn-header"><span class="span-title">Excel</span></div>
                                </li>
                      
                        </ul>

                        -->
                    </div>
                </div>

            </div>
        </div>
      
       
    </div>

    <script>
        $(document).ready(function () {

            $("#start_date").datepicker({ dateFormat: 'yy.mm.dd' });
            $("#end_date").datepicker({ dateFormat: 'yy.mm.dd' });
            /*$("#dataTable2").jqxDataTable(
            {
                altRows: true,
                sortable: true,
                columns: [{
                    text: 'Symbol',
                    datafield: 'Symbol',
                    width: 80
                }, {
                    text: 'Size',
                    datafield: 'Size',
                    cellsalign: 'right',
                    align: 'right',
                    width: 100
                }, {
                    text: 'AvgPx',
                    datafield: 'AvgPx',
                    cellsalign: 'right',
                    align: 'right',
                    width: 100
                }, {
                    text: 'PnL U',
                    columngroup: 'Analytics',
                    datafield: 'PnLU',
                    cellsalign: 'right',
                    align: 'right',
                    width: 100
                }, {
                    text: 'PnL R',
                    columngroup: 'Analytics',
                    datafield: 'PnLR',
                    cellsalign: 'right',
                    align: 'right',
                    width: 100
                }, {
                    text: 'Time Stamp',
                    columngroup: 'Analytics',
                    datafield: 'TimeStamp',
                    cellsalign: 'right',
                    align: 'right',
                    cellsformat: 'HH:mm:ss.fff',
                    width: 155
                }

                ],
                    columngroups: [{
                    text: 'Analytics',
                    align: 'center',
                    name: 'Analytics'
                }]
            });
            */
        });

    </script>
</asp:Content>
