<%@ Page Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-6.aspx.cs" Inherits="hansung.page.page1_6" %>

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
                        <td align="left">메뉴관리</td>
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
                        <td><input id="s_menunm" type="text" value=""></td>
                    </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td>
<!-- 리스트 ==================================================================================== -->
                                <div id="grid1"></div>
                            </td>
                            <td>
<!-- 상세 ==================================================================================== -->
                                <table width="100%">
                                    <tr>
                                        <td>메뉴코드</td>
                                        <td><input id="menucd" type="text" /><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>메뉴명</td>
                                        <td><input id="menunm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>URL</td>
                                        <td><input id="menuurl" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>메뉴그룹</td>
                                        <td><input id="menugroup" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>메뉴순서</td>
                                        <td><input id="orderseq" type="text" /></td>
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
                { dataField: "menucd", caption: "메뉴코드", width: 100 }
                , { dataField: "menunm", caption: "메뉴명", width: 200 }
                , { dataField: "menuurl", caption: "URL", width: 200 }
                , { dataField: "menugroup", caption: "메뉴그룹", width: 100 }
                , { dataField: "orderseq", caption: "순서", width: 50 }
                , { dataField: "useyn", caption: "사용여부", width: 50 }

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
                fn_selone(data.key.menucd);
            }
        }).dxDataGrid("instance");
       
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'menunm': $('#s_menunm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page16_svc.asmx/search",
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
    function fn_selone(menucd) {
        var param = JSON.stringify({ 'menucd': menucd });
        $.ajax({
            type: "POST",
            url: "/page/page16_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#menucd').prop('readonly', true);
                $('#menucd').val(result[0].menucd);
                $('#menunm').val(result[0].menunm);
                $('#menuurl').val(result[0].menuurl);
                $('#menugroup').val(result[0].menugroup);
                $('#orderseq').val(result[0].orderseq);
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
        $('#menucd').val('');
        $('#menunm').val('');
        $('#menuurl').val('');
        $('#menugroup').val('');
        $('#orderseq').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#menucd').prop('readonly', false);
        $('#useyn').val('Y');
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.menucd = $.trim($('#menucd').val());
        param.menunm = $.trim($('#menunm').val());
        param.menuurl = $.trim($('#menuurl').val());
        param.menugroup = $.trim($('#menugroup').val());
        param.orderseq = $.trim($('#orderseq').val());
        param.useyn = $.trim($('#useyn').val());
        if (param.menucd == '') { alert('코드를 입력해주세요!'); return; }
        if (param.menunm == '') { alert('코드명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page/page16_svc.asmx/save",
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
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    //===============================================================
    // etc function
    //===============================================================
    function fn_search2() {
        var param = JSON.stringify({ 'menucd': '' });
        $.ajax({
            type: "POST",
            url: "/page1/page1_svc_search.asmx/page16_search",
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
