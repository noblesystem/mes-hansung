<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-4.aspx.cs" Inherits="hansung.page.page1_4" %>

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
                        <td align="left">사원관리</td>
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
                        <td><input id="s_usernm" type="text" value=""></td>
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
                                        <td>아이디</td>
                                        <td><input id="userid" type="text" /><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>사원명</td>
                                        <td><input id="usernm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>이메일</td>
                                        <td><input id="email" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>휴대폰</td>
                                        <td><input id="hp" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>직급</td>
                                        <td><select id="jkcd"></select></td>
                                     </tr>
                                    <tr>
                                        <td>부서</td>
                                        <td><select id="deptcd"></select></td>
                                     </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td><input id="addr" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>첨부파일</td>
                                        <td><input id="filepath" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>비밀번호</td>
                                        <td><input id="pwd" type="text" /></td>
                                     </tr>
                                    <tr>
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
        $('#jkcd').zentSetCombo('C011', '', '==선택==');
        $('#deptcd').zentSetCombo('C012', '', '==선택==');
        $('#useyn').zentSetCombo('C007', '', '==선택==');
        grid1 = $("#grid1").dxDataGrid({
            columns: [
                { dataField: "userid", caption: "아이디", width: 100 }
                , { dataField: "usernm", caption: "사원명", width: 100 }
                , { dataField: "email", caption: "E-mail", width: 100 }
                , { dataField: "hp", caption: "휴대폰", width: 100 }
                , { dataField: "jkcd", caption: "직책", width: 100 }
                , { dataField: "deptcd", caption: "부서", width: 100 }
                , { dataField: "addr", caption: "주소", width: 100 }
                , { dataField: "filepath", caption: "첨부파일", width: 100 }
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
                fn_selone(data.key.userid);
            }
        }).dxDataGrid("instance");
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'usernm': $('#s_usernm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page14_svc.asmx/search",
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
    function fn_selone(userid) {
        var param = JSON.stringify({ 'userid': userid });
        $.ajax({
            type: "POST",
            url: "/page/page14_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#userid').prop('readonly', true);
                $('#userid').val(result[0].userid);
                $('#usernm').val(result[0].usernm);
                $('#email').val(result[0].email);
                $('#hp').val(result[0].hp);
                $('#jkcd').val(result[0].jkcd);
                $('#deptcd').val(result[0].deptcd);
                $('#addr').val(result[0].addr);
                $('#filepath').val(result[0].filepath);
                $('#pwd').val(result[0].pwd);
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
        $('#userid').val('');
        $('#usernm').val('');
        $('#email').val('');
        $('#hp').val('');
        $('#jkcd').val('');
        $('#deptcd').val('');
        $('#addr').val('');
        $('#filepath').val('');
        $('#pwd').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#userid').prop('readonly', false);
        $('#useyn').val('Y');
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.userid = $.trim($('#userid').val());
        param.usernm = $.trim($('#usernm').val());
        param.email = $.trim($('#email').val());
        param.hp = $.trim($('#hp').val());
        param.jkcd = $.trim($('#jkcd').val());
        param.deptcd = $.trim($('#deptcd').val());
        param.addr = $.trim($('#addr').val());
        param.filepath = $.trim($('#filepath').val());
        param.pwd = $.trim($('#pwd').val());
        param.useyn = $.trim($('#useyn').val());

        if (param.userid == '') { alert('아이디를 입력해주세요!'); return; }
        if (param.usernm == '') { alert('사원명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page/page14_svc.asmx/save",
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
        var param = JSON.stringify({ 'userid': '' });
        $.ajax({
            type: "POST",
            url: "/page1/page1_svc_search.asmx/page14_search",
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
