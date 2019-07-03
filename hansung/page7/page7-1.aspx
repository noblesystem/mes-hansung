<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page7-1.aspx.cs" Inherits="hansung.page7.page7_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            bindoptioncustomers("customer");
            bindoptionworkers("worker1,worker2");
            bindoptionwarehouse("warehouse");
            addrow("tabledata1", 7)
            getdetail();
            $(".inpectcode").change(function () {
                inpectioncode();
            });
        })
        function inpectioncode() {
            var now = new Date(Date.now());
            var h = now.getHours();
            if (h < 10)
                h = "0" + h;
            var m = now.getMinutes();
            if (m < 10)
                m = "0" + m;
            var formatted = h + "" + m;

            var d = $(".inpectcode").val();
            var d1 = convertdate(d);
            $(".inpectcode").val("I" + d1.replace(/\./g, "") + formatted);
        }
        function saveinpection() {
            var data = converdatatable("tableinpection");
            console.log(data)
            var rs = savedata("inspection", data, "");
        }
        function getdetail() {
            $(".tabledata1 tr").click(function () {
                $(".tabledata1 tr").removeClass("tr-active");
                if ($(this).find("th").length > 0)
                    return false;
                if ($(this).hasClass("tr-active") === false) {
                    $(".tabledata tbody").empty();
                    var inspnumber = $(this).find(".inspnumber").html();
                    var rs = getdetailObj("Inputwarehouse", "inspnumber", inspnumber);
                    if (rs !== "") {
                        var js = JSON.parse(rs);
                        for (var i = 0; i < js.length;i++)
                            binddata("tabledata",js[i],"")
                    }
                    $(this).addClass("tr-active");
                    sortorder("tabledata")
                    addrow("tabledata",5)
                }

            });

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="border-bottom white-bg dashboard-header">

        <ul class="ul-button" style="float: left">
            <li>

                <div class="div-btn-header" onclick="openpopup('Popupone')"><span class="span-title">신규</span></div>

            </li>
            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">저장</span></div>

                </div>
            </li>
            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">인쇄</span></div>

                </div>
            </li>

            <li>
                <div>
                    <div class="div-btn-header"><span class="span-title">수신</span></div>

                </div>
            </li>

        </ul>

        
        <div class="modal" id="Popupone">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-body">
                        <table class="responsive-table tableinpection" style="font-size: 14px; width: 800px;">

                            <thead>
                                <tr>
                                    <th scope="col" style="text-align: center; width: 50px">실사 년월일 시</th>
                                    <th scope="col" class="class180" style="width: 150px;">실사 창고</th>
                                    <th scope="col" class="SerialNo">실사 담당1</th>
                                    <th scope="col" data-s="daycertificate">실사 담당2</th>
                                    <th scope="col" data-s="daycertificate">재고 실사 적요</th>

                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td class="td-data data-input" data-sql="inspnumber">
                                        <input type="text" class="txt-input datecombo inpectcode" /></td>
                                    <td class="td-data select-dt" data-sql="warehouse">
                                        <select class="select-op warehouse">
                                            <option style="display: none"></option>

                                        </select>

                                    </td>
                                    <td class="td-data select-dt" data-sql="worker1">
                                        <select class="select-op worker1">
                                            <option style="display: none"></option>
                                        </select>
                                    </td>
                                    <td class="td-data select-dt" data-sql="worker2">
                                        <select class="select-op worker2">
                                            <option style="display: none"></option>
                                        </select>
                                    </td>
                                    <td class="td-data data-input" data-sql="remarks">
                                        <input type="text" style="width: 100%;" />
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

                                    <div class="div-btn-header" onclick="saveinpection()"><span class="span-title">적용</span></div>

                                    <div class="div-btn-header" data-dismiss="modal">
                                        <span class="span-title">닫기</span>

                                    </div>

                                </div>
                            </li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>
        <div class="clear"></div>
        <table class="responsive-table tabledata1" style="font-size: 14px; width: 55%">

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">번호</th>
                    <th scope="col">실사 년월일 시</th>
                    <th scope="col">실사 창고</th>
                    <th scope="col">실사 담당1</th>
                    <th scope="col">실사 담당2</th>
                    <th scope="col">재고 실사 적요</th>

                </tr>
            </thead>

            <tbody>
                <% var order = 1;
                    foreach (var i in mainData)
                    {%>
                <tr class="it-insert">
                    <td><%=order %></td>
                    <td class="inspnumber"><%=i["inspnumber"].ToString() %></td>
                    <td><%=i["warehouse"].ToString() %></td>
                    <td><%=i["workerone"].ToString() %></td>
                    <td><%=i["workertwo"].ToString() %></td>
                    <td><%=i["remarks"].ToString() %></td>
                </tr>
                <%
                        order++;
                    } %>
            </tbody>
        </table>

        <table class="responsive-table tabledata" >

            <thead>
                <tr>
                    <th scope="col" style="text-align: center">번호</th>
                    <th scope="col" data-input="destination">지고 선택</th>
                    <th scope="col" data-input="rowdestination">열 선택</th>
                    <th scope="col" data-input="YajiSelection">야지 선택</th>
                    <th scope="col" data-input="rowYaji">열 선택</th>
                    <th scope="col" data-input="container">컨테이너</th>
                    <th scope="col" data-input="itemcode">품목코드</th>
                    <th scope="col" data-input="itemname">품목명</th>
                    <th scope="col" data-input="size">규격</th>
                    <th scope="col"  data-input="qltincase">매수</th>
                    <th scope="col"  data-input="qltbox">수량(B)</th>
                    <th scope="col"  data-input="seriesnum">시리얼 No</th>
                    <th scope="col" data-input="problems">정상/문제</th>
                    <th scope="col"  data-input="defecttype">불량 유형</th>
                    <th scope="col" data-input="manufacturer">제조사</th>
                    <th scope="col" data-input="remarksitem">항목 비고</th>
                    <th scope="col" data-input="destination">위치</th>
                    <th scope="col" data-input="purchasenotes">실사 비고</th>
                    <th scope="col" data-input="attachments">첨부파일</th>
                </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
    </div>
 
</asp:Content>
