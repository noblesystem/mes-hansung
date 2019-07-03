<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page8-2.aspx.cs" Inherits="hansung.page8.page8_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">
         <ul class="ul-button" style="float:left">

                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="창고명">
                            </div>
                        </li>
                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="거래조건">
                            </div>
                        </li>
                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="품목명">
                            </div>
                        </li>
                        <li>
                            <div>

                                <input type="text" class="input-search" placeholder="규격">
                            </div>
                        </li>
                        <li>
                            <div>

                                <input type="text" class="input-search" placeholder="정상/문제">
                            </div>
                        </li>
                        <li>
                            <div>

                                <input type="text" class="input-search" placeholder="매수">
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
                                <div class="div-btn-header"><span class="span-title">재고현황 인쇄</span></div>
                            </li>
                         
                            <li style="padding-right:0">
                                <div class="div-btn-header"><span class="span-title">Excel</span></div>
                            </li>
                      
                    </ul>
        <table class="responsive-table tabledata" >

            <thead>
                <tr>
                    <th rowspan="3" style="text-align: center">번호</th>
                    <th rowspan="3" style="text-align: center">품목코드</th>
                    <th rowspan="3" style="text-align: center">품명</th>
                    <th rowspan="3" style="text-align: center">규격</th>
                    <th rowspan="3" style="text-align: center">매수</th>

                    <th colspan="9" style="text-align: center">인천</th>
                    <th colspan="9" style="text-align: center">김해</th>

					<th rowspan="3"  style="text-align: center">합계</th>  									  								

					
                </tr>
               <tr>
                    
                    <th rowspan="2" style="text-align: center">재고</th> 
                    <th rowspan="2" style="text-align: center">문제재고 </th>
                    <th rowspan="2" style="text-align: center">수주출대</th>
                    <th rowspan="2"  style="text-align: center">통관</th>

                    <th colspan="4" style="text-align: center">미통관</th>

                    <th rowspan="2" style="text-align: center">계</th>
                    
                    								  								
                    <th rowspan="2" style="text-align: center">재고</th> 
                    <th rowspan="2" style="text-align: center">문제재고 </th>
                    <th rowspan="2" style="text-align: center">수주출대</th>
                    <th rowspan="2"  style="text-align: center">통관</th>

                    <th colspan="4" style="text-align: center">미통관</th>

                    <th rowspan="2" style="text-align: center">계</th>
					
                </tr>
                  				  
                <tr>
                    <th scope="col" style="text-align: center">1</th>
                    <th scope="col" style="text-align: center">2</th>
                    <th scope="col" style="text-align: center">3</th>
                    <th scope="col" style="text-align: center">4</th>
                    
					<th scope="col" style="text-align: center">1</th>
                    <th scope="col" style="text-align: center">2</th>
                    <th scope="col" style="text-align: center">3</th>
                    <th scope="col" style="text-align: center">4</th>
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
                </tr>
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
                </tr>
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
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
