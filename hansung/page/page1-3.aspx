<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-3.aspx.cs" Inherits="hansung.page.page1_3" %>

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
                        <td align="left">창고관리</td>
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
                        <td>창고명</td>
                        <td><input id="s_whnm" type="text" value=""></td>
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
                                        <td>창고코드</td>
                                        <td><input id="whcd" type="text" /><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>창고명</td>
                                        <td><input id="whnm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>창고 적요</td>
                                        <td><input id="brief" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>창고전화</td>
                                        <td><input id="tel" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>창고주소</td>
                                        <td><input id="addr" type="text" /></td>
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
        $('#useyn').zentSetCombo('C007', '', '==선택==');
        grid1 = $("#grid1").dxDataGrid({
            columns: [
                { dataField: "whcd", caption: "창고코드", width: 100 }
                , { dataField: "whnm", caption: "창고명", width: 100 }
                , { dataField: "brief", caption: "창고적요", width: 100 }
                , { dataField: "tel", caption: "창고전화", width: 100 }
                , { dataField: "addr", caption: "창고주소", width: 100 }
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
                fn_selone(data.key.whcd);
            }
        }).dxDataGrid("instance");
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'whnm': $('#s_whnm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page13_svc.asmx/search",
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
    function fn_selone(whcd) {
        var param = JSON.stringify({ 'whcd': whcd });
        $.ajax({
            type: "POST",
            url: "/page/page13_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#whcd').prop('readonly', true);
                $('#whcd').val(result[0].whcd);
                $('#whnm').val(result[0].whnm);
                $('#brief').val(result[0].brief);
                $('#tel').val(result[0].tel);
                $('#addr').val(result[0].addr);
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
        $('#whcd').val('');
        $('#whnm').val('');
        $('#brief').val('');
        $('#tel').val('');
        $('#addr').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#whcd').prop('readonly', false);
        $('#useyn').val('Y');
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.whcd = $.trim($('#whcd').val());
        param.whnm = $.trim($('#whnm').val());
        param.brief = $.trim($('#brief').val());
        param.tel = $.trim($('#tel').val());
        param.addr = $.trim($('#addr').val());
        param.useyn = $.trim($('#useyn').val());

        if (param.whcd == '') { alert('코드를 입력해주세요!'); return; }
        if (param.whnm == '') { alert('코드명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page/page13_svc.asmx/save",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                if (result.code == "OK") {
                    fn_init();
                    fn_search();
                    fn_selone(result.val);
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
        var param = JSON.stringify({ 'whcd': '' });
        $.ajax({
            type: "POST",
            url: "/page1/page1_svc_search.asmx/page13_search",
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
