<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="hansung.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="border-bottom white-bg dashboard-header">
         <ul class="ul-button" style="float:left">

                        
                        <li>
                            <div>
                                <div class="div-btn-header"><span class="span-title">날자</span></div>

                            </div>
                        </li>
                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="yyyy mm">
                            </div>
                        </li>
                        <li>
                            <div>
                                <div class="div-btn-header"><span class="span-title"> D +</span></div>

                            </div>
                        </li>
                        <li>
                            <div>
                                <input type="text" class="input-search" placeholder="10">
                            </div>
                        </li>
                        <li>
                            <div>
                                <div class="div-btn-header"><span class="span-title">일</span></div>

                            </div>
                        </li>

                    </ul>
    <table class="responsive-table tabledata" >
            <thead>
                 <tr>
                    <th rowspan="2"  style="text-align: center;max-width:200px;">구분</th>

                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;">D</th>
                    <th colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">=</th>
                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">%</th>


                   	<th rowspan="2" colspan="2" style="text-align: center;width:100px;">Q</th>							  								
                    <th colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">=</th>
                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">%</th>

                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;">VL</th>
                    <th colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">=</th>
                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">%</th>

                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;">전월비</th>
                    <th colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">=</th>
                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;"></th>
                    <th rowspan="2" style="text-align: center;width:35px;">%</th>

                    <th rowspan="2" colspan="2" style="text-align: center;width:100px;">잔</th>
                    <th style="text-align: center;width:35px;">Q</th>
                    <th style="text-align: center;width:35px;">ᇫ</th>
                    <th colspan="3" style="text-align: center;width:150px;"></th>
                    <th colspan="5" style="text-align: center;width:250px;"></th>
                    
                </tr>
                <tr>
                    <th colspan="2" style="text-align: center"></th>
                   
                    <th colspan="2" style="text-align: center"></th>
                    <th colspan="2" style="text-align: center"></th>
                    <th colspan="2" style="text-align: center"></th>
                    <th style="text-align: center">Q</th>
                    <th style="text-align: center">ᇫ</th>
                    <th colspan="3" style="text-align: center"></th>
                    <th colspan="5" style="text-align: center"></th>
                    
                </tr>
            </thead>

            <tbody>
               
                <tr>
                    <td rowspan="3">중점품목(호부진)</td>
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
                    <td rowspan="3">전월비(진도율)</td>
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
                    <td rowspan="3">분석(비율)</td>
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
                <tr style="height:100px;">
                    <td rowspan="3">지시사항</td>
                    <td rowspan="3" colspan="44"></td>  
                </tr>
               
            </tbody>
        </table>
         <div class="row" style="margin-top:20px; margin:5px 0;">
             <div class="col-md-4 text-center" style="border-style: solid; height:200px;line-height:200px;">
                 <span>판매현황 그래프- 두꺼운선 회사전체 얇은선 각 영업담당</span>

             </div>
             <div class="col-md-4 text-center border" style="border-style: solid;height:200px;line-height:200px;">
                 <span>구매현황 그래프-두꺼운선 회사전체 얇은선 각 영업담당</span>

             </div>
             <div class="col-md-4 text-center border" style="border-style: solid;height:200px;line-height:200px;">
                 <span>수금현황 그래프-두꺼운선 회사전체 얇은선 각 영업담당</span>

             </div>
         </div>
    </div>
</asp:Content>