<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-7.aspx.cs" Inherits="hansung.page.page1_7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/js/jquery.form.zent.js?111"></script>
    <script src="/js/nb_util.js?433356"></script>
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
                        <td>메뉴명</td>
                        <td><input id="s_gbncd" type="text" value=""></td>
                        <td>코드명</td>
                        <td><input id="s_codenm" type="text" value=""></td>
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
                                        <td>구분코드</td>
                                        <td><input id="gbncd" type="text" /><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>코드</td>
                                        <td><input id="code" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>코드명</td>
                                        <td><input id="codenm" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>순서</td>
                                        <td><input id="codeseq" type="text" /></td>
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
        //$('#gbncd').zentSetComboGbncd('', '==선택==');
        $('#useyn').zentSetCombo('C007', '', '==선택==');
        $('#statuscd').zentSetCombo('C009', '', '==선택==');
        grid1 = $("#grid1").dxDataGrid({
            columns: [
                { dataField: "gbncd", caption: "구분코드", width: 100 }
                , { dataField: "code", caption: "코드", width: 100 }
                , { dataField: "codenm", caption: "코드명", width: 100 }
                , { dataField: "codeseq", caption: "순번", width: 100 }
                , { dataField: "useyn", caption: "사용여부", width: 100 }

            ]
            , showColumnLines: true
            , showRowLines: true
            , rowAlternationEnabled: false
            , showBorders: true
            , selection: {
                mode: "single"
            }
            , scrolling: {
                columnRenderingMode: "virtual"
            }
            , paging: {
                enabled: false
            }
            , width: 750
            , height: 200
            , onRowClick: function (data) {
                fn_selone(data.key.gbncd, data.key.code);
            }
        }).dxDataGrid("instance");
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'gbncd': $('#s_gbncd').val(), 'codenm': $('#s_codenm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page17_svc.asmx/search",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                $("#grid1").dxDataGrid({ dataSource: JSON.parse(data.d) });
                fn_init();
            },
            error: function (request, status, error) {
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    function fn_selone(gbncd, code) {
        var param = JSON.stringify({ 'gbncd' : gbncd, 'code': code });
        $.ajax({
            type: "POST",
            url: "/page/page17_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#gbncd').prop('readonly', true);
                $('#code').prop('readonly', true);
                $('#gbncd').val(result[0].gbncd);
                $('#code').val(result[0].code);
                $('#codenm').val(result[0].codenm);
                $('#codeseq').val(result[0].codeseq);
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
        $('#code').val('');
        $('#codenm').val('');
        $('#codeseq').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#code').prop('readonly', false);
        $('#useyn').val('Y');
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.gbncd = $.trim($('#gbncd').val());
        param.code = $.trim($('#code').val());
        param.codenm = $.trim($('#codenm').val());
        param.codeseq = $.trim($('#codeseq').val());
        param.useyn = $.trim($('#useyn').val());

        if (param.gbncd == '') { alert('구분코드를 입력해주세요!'); return; }
        if (param.code == '') { alert('코드을 입력해주세요!'); return; }
        if (param.codenm == '') { alert('코드명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page/page17_svc.asmx/save",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                if (result.code == "OK") {
                    fn_init();
                    fn_search();
                    fn_selone(result.msg, result.val);
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
    function fn_search2() {
        var param = JSON.stringify({ 'code': '' });
        $.ajax({
            type: "POST",
            url: "/page1/page1_svc_search.asmx/page17_search",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                $('#grid1')[0].addJSONData(JSON.parse(data.d));
            },
            error: function (request, status, error) {
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    </script>
</asp:Content>
