<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-1.aspx.cs" Inherits="hansung.page.page1_1" %>

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
                        <td align="left">거래처관리</td>
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
                        <td>고객사명</td>
                        <td><input id="s_custnm" type="text" value=""></td>
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
                                        <td>거래처코드</td>
                                        <td><input id="custcd" type="text" /><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>영업담당</td>
                                        <td><input id="userid" type="text" readonly="readonly" /><input id="usernm" type="text" /><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
                                     </tr>
                                    <tr>
                                        <td>더존코드</td>
                                        <td><input id="dcustcd" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>고객사명</td>
                                        <td><input id="custnm" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>사업자등록번호</td>
                                        <td><input id="bizno" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>대표자</td>
                                        <td><input id="ceo" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>전화번호</td>
                                        <td><input id="tel" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>팩스번호</td>
                                        <td><input id="fax" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>이동전화</td>
                                        <td><input id="hp" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>E-mail</td>
                                        <td><input id="email" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>본사주소</td>
                                        <td><input id="addr" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>도착지전화</td>
                                        <td><input id="dotel" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>도착지주소</td>
                                        <td><input id="doaddr" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>거래계좌번호</td>
                                        <td><input id="acctno" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>거래잔액</td>
                                        <td><input id="janamt" type="text" /></td>
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
                { dataField: "custcd", caption: "거래처코드", width: 100 }
                , { dataField: "usernm", caption: "영업담당", width: 100 }
                , { dataField: "dcustcd", caption: "더존코드", width: 100 }
                , { dataField: "custnm", caption: "고객사명", width: 100 }
                , { dataField: "bizno", caption: "사업자등록번호", width: 100 }
                , { dataField: "ceo", caption: "대표자", width: 100 }
                , { dataField: "tel", caption: "전화번호", width: 100 }
                , { dataField: "fax", caption: "팩스번호", width: 100 }
                , { dataField: "hp", caption: "이동전화", width: 100 }
                , { dataField: "email", caption: "E-mail", width: 100 }
                , { dataField: "addr", caption: "본사주소", width: 100 }
                , { dataField: "dotel", caption: "도착지전화", width: 100 }
                , { dataField: "doaddr", caption: "도착지주소", width: 100 }
                , { dataField: "acctno", caption: "거래계좌번호", width: 100 }
                , { dataField: "creditamt", caption: "여신한도", width: 100 }
                , { dataField: "janamt", caption: "거래잔액", width: 100 }
            ]
            , showColumnLines: true
            , showRowLines: true
            , rowAlternationEnabled: false
            , showBorders: true
            , selection: {
                mode: "single"
            }
            ,scrolling: {
                columnRenderingMode: "virtual"
            }
            ,paging: {
                enabled: false
            }
            , width:750
            , height: 200
            , onRowClick: function (data) {
                fn_selone(data.key.custcd);
            }
        }).dxDataGrid("instance");
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'custnm': $('#s_custnm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page11_svc.asmx/search",
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
    function fn_selone(custcd) {
        var param = JSON.stringify({ 'custcd': custcd });
        $.ajax({
            type: "POST",
            url: "/page/page11_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#custcd').prop('readonly', true);
                $('#custcd').val(result[0].custcd);
                $('#custnm').val(result[0].custnm);
                $('#dcustcd').val(result[0].dcustcd);
                $('#userid').val(result[0].userid);
                $('#usernm').val(result[0].usernm);
                $('#bizno').val(result[0].bizno);
                $('#ceo').val(result[0].ceo);
                $('#tel').val(result[0].tel);
                $('#fax').val(result[0].fax);
                $('#hp').val(result[0].hp);
                $('#email').val(result[0].email);
                $('#addr').val(result[0].addr);
                $('#dotel').val(result[0].dotel);
                $('#doaddr').val(result[0].doaddr);
                $('#curcd').val(result[0].curcd);
                $('#janamt').val(result[0].janamt);
                $('#creditamt').val(result[0].creditamt);
                $('#acctno').val(result[0].acctno);
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
        $('#custcd').val('');
        $('#custnm').val('');
        $('#dcustcd').val('');
        $('#userid').val('');
        $('#usernm').val('');
        $('#bizno').val('');
        $('#ceo').val('');
        $('#tel').val('');
        $('#fax').val('');
        $('#hp').val('');
        $('#email').val('');
        $('#addr').val('');
        $('#dotel').val('');
        $('#doaddr').val('');
        $('#curcd').val('');
        $('#janamt').val('');
        $('#creditamt').val('');
        $('#acctno').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#custcd').prop('readonly', false);
        $('#useyn').val('Y');
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.custcd = $.trim($('#custcd').val());
        param.custnm = $.trim($('#custnm').val());
        param.dcustcd = $.trim($('#dcustcd').val());
        param.userid = $.trim($('#userid').val());
        param.bizno = $.trim($('#bizno').val());
        param.ceo = $.trim($('#ceo').val());
        param.tel = $.trim($('#tel').val());
        param.fax = $.trim($('#fax').val());
        param.hp = $.trim($('#hp').val());
        param.email = $.trim($('#email').val());
        param.addr = $.trim($('#addr').val());
        param.dotel = $.trim($('#dotel').val());
        param.doaddr = $.trim($('#doaddr').val());
        param.curcd = $.trim($('#curcd').val());
        param.janamt = $.trim($('#janamt').val());
        param.creditamt = $.trim($('#creditamt').val());
        param.acctno = $.trim($('#acctno').val());
        param.useyn = $.trim($('#useyn').val());
        if (param.custcd == '') { alert('코드를 입력해주세요!'); return; }
        if (param.custnm == '') { alert('코드명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page/page11_svc.asmx/save",
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
        var param = JSON.stringify({ 'custcd': '' });
        $.ajax({
            type: "POST",
            url: "/page1/page1_svc_search.asmx/page11_search",
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
