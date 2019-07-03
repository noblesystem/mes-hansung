<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-2.aspx.cs" Inherits="hansung.page.page1_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/js/jquery.form.zent.js?222"></script>
    <script src="/js/nb_util.js?456"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-content">
                    <table width="100%">
                    <tr>
                        <td align="left">품목관리</td>
                        <td align="right">
                            <input type="button" value="검색" onclick="fn_search();">
                            <input type="button" value="신규" onclick="fn_new();">
                            <input type="button" value="저장" onclick="fn_save();">
                            <input type="button" value="삭제" onclick="fn_del()">
                        </td>
                    </tr>
                    </table>
                    <table width="100%">
                    <tr>
                        <td>품목관리</td>
                        <td><input id="s_itemnm" type="text" value=""></td>
                    </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td width="70%">
<!-- 리스트 ==================================================================================== -->
                                <div id="grid1"></div>
                            </td>
                            <td width="30%">
<!-- 상세 ==================================================================================== -->
                                <table width="100%">
                                    <tr>
                                        <td>품목코드</td>
                                        <td><input id="itemcd" type="text" /><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>품목더존코드</td>
                                        <td><input id="ditemcd" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>품목명</td>
                                        <td><input id="itemnm" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>품목명1</td>
                                        <td><input id="sitemnm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>품목명2</td>
                                        <td><input id="eitemnm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>규격</td>
                                        <td><input id="spec" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>넓이</td>
                                        <td><input id="width" type="text"/></td>
                                     </tr>
                                    <tr>
                                        <td>높이</td>
                                        <td><input id="height" type="text"/></td>
                                     </tr>

                                    <tr>
                                        <td>매수</td>
                                        <td><input id="qty" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>단가</td>
                                        <td><input id="unitprice" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>규격면적</td>
                                        <td><input id="sqm" type="text" readonly="readonly" /></td>
                                     </tr>
                                    <tr>
                                        <td>안전재고량</td>
                                        <td><input id="safeqty" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>제조사</td>
                                        <td><input id="comnm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>정상/문제</td>
                                        <td><select id="statuscd"></select></td>
                                     </tr>
                                    <tr>
                                        <td>품목적요</td>
                                        <td><input id="rmk" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>사용여부</td>
                                        <td><select id="useyn"></select></td>
                                     </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        var grid1;
        $('#useyn').zentSetCombo('C007', '', '==선택==');
        $('#statuscd').zentSetCombo('C009', '', '==선택==');
        grid1 = $("#grid1").dxDataGrid({
            columns: [
                { dataField: "itemcd", caption: "품목코드", width: 100 }
                , { dataField: "ditemcd", caption: "품목더존코드", width: 100 }
                , { dataField: "itemnm", caption: "품목명", width: 100 }
                , { dataField: "spec", caption: "규격", width: 100 }
                , { dataField: "qty", caption: "매수", width: 100 }
                , { dataField: "unitprice", caption: "단가", width: 100 }
                , { dataField: "sqm", caption: "규격면적", width: 100 }
                , { dataField: "safeqty", caption: "안전재고량", width: 100 }
                , { dataField: "comnm", caption: "제조사", width: 100 }
                , { dataField: "statuscd", caption: "정상/문제", width: 100 }
                , { dataField: "rmk", caption: "품목적요", width: 100 }
            ]
            , showColumnLines: true
            , showRowLines: true
            , rowAlternationEnabled: true
            , showBorders: true
            , selection: {
                mode: "single"
            }    
            , height: 200
            , onRowClick: function (data) {
                fn_selone(data.key.itemcd);
            }
        }).dxDataGrid("instance");
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'itemnm': $('#s_itemnm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page12_svc.asmx/search",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                $("#grid1").dxDataGrid({ dataSource: JSON.parse(data.d) });
                fn_init();
            },
            error: function (request, status, error) {
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    function fn_selone(itemcd) {
        var param = JSON.stringify({ 'itemcd': itemcd });
        $.ajax({
            type: "POST",
            url: "/page/page12_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#itemcd').prop('readonly', true);
                $('#itemcd').val(result[0].itemcd);
                $('#itemnm').val(result[0].itemnm);
                $('#sitemnm').val(result[0].sitemnm);
                $('#eitemnm').val(result[0].eitemnm);
                $('#ditemcd').val(result[0].ditemcd);
                $('#spec').val(result[0].spec);
                $('#width').val(result[0].width);
                $('#height').val(result[0].height);
                $('#qty').val(result[0].qty);
                $('#sqm').val(result[0].sqm);
                $('#unitprice').val(result[0].unitprice);
                $('#safeqty').val(result[0].safeqty);
                $('#comnm').val(result[0].comnm);
                $('#statuscd').val(result[0].statuscd);
                $('#rmk').val(result[0].rmk);
                $('#useyn').val(result[0].useyn);
            },
            error: function (request, status, error) {
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    //===============================================================
    // 초기화
    //===============================================================
    function fn_init() {
        $('#mode').val('I');
        $('#itemcd').val('');
        $('#itemnm').val('');
        $('#sitemnm').val('');
        $('#eitemnm').val('');
        $('#ditemcd').val('');
        $('#spec').val('');
        $('#width').val('');
        $('#height').val('');
        $('#qty').val('');
        $('#sqm').val('');
        $('#unitprice').val('');
        $('#safeqty').val('');
        $('#comnm').val('');
        $('#statuscd').val('');
        $('#rmk').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#itemcd').prop('readonly', false);
        $('#useyn').val('Y');
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
        fn_new();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.itemcd = $.trim($('#itemcd').val());
        param.itemnm = $.trim($('#itemnm').val());
        param.sitemnm = $.trim($('#sitemnm').val());
        param.eitemnm = $.trim($('#eitemnm').val());
        param.ditemcd = $.trim($('#ditemcd').val());
        param.spec = $.trim($('#spec').val());
        param.width = $.trim($('#width').val());
        param.height = $.trim($('#height').val());
        param.qty = $.trim($('#qty').val());
        param.sqm = $.trim($('#sqm').val());
        param.unitprice = $.trim($('#unitprice').val());
        param.safeqty = $.trim($('#safeqty').val());
        param.comnm = $.trim($('#comnm').val());
        param.statuscd = $.trim($('#statuscd').val());
        param.rmk = $.trim($('#rmk').val());
        param.useyn = $.trim($('#useyn').val());

        if (param.itemcd == '') { alert('코드를 입력해주세요!'); return; }
        //if (param.itemnm == '') { alert('코드명을 입력해주세요!'); return; }
        if (param.sitemnm == '') { alert('코드명을 입력해주세요!'); return; }
        if (param.eitemnm == '') { alert('코드명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page/page12_svc.asmx/save",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                if (result.code == "OK") {
                    fn_init();
                    fn_search();
                    if (param.mode != "D") { fn_selone(result.val); }
                    param = JSON.parse(param);
                    if (param.mode == "I") { alert('저장 되었습니다'); }
                    if (param.mode == "U") { alert('저장 되었습니다'); }
                    if (param.mode == "D") { alert('삭제 되었습니다'); }
                }
                else { alert("저장오류!"); return; }
            },
            error: function (request, status, error) {
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    //===============================================================
    // etc function
    //===============================================================
    //function fn_search2() {
    //    var param = JSON.stringify({ 'itemcd': '' });
    //    $.ajax({
    //        type: "POST",
    //        url: "/page1/page1_svc_search.asmx/page12_search",
    //        data: JSON.stringify({ 'param': param }),
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        async: false,
    //        success: function (data) {
    //            $('#grid1')[0].addJSONData(JSON.parse(data.d));
    //        },
    //        error: function (request, status, error) {
    //            //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
    //            alert("code = " + request.status + " error = " + error); // 실패 시 처리
    //        }
    //    });
    //}
    </script>
</asp:Content>
