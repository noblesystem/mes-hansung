<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-9.aspx.cs" Inherits="hansung.page.page1_9" %>

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
                        <td>구분코드</td>
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
                                        <td><input id="codenm" type="text" /></td>
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
    //$('#useyn').zentSetCombo('C007', '', '==선택==');//useyn select option 추가
  
    $(document).ready(function () {//web 실행시 작동되는 함수 그리드 선언 함수 추가
        $('#useyn').zentSetCombo('C007', '', '==선택==');
        $('#statuscd').zentSetCombo('C009', '', '==선택==');
        var grid1;
        //$('#useyn').zentSetCombo('C007', '', '==선택==');
        
        grid1 = $("#grid1").dxDataGrid({
            columns: [
                { dataField: "gbncd", caption: "구분코드", width: 100 }
                , { dataField: "code", caption: "코드", width: 100 }
                , { dataField: "codenm", caption: "코드명", width: 100 }
                , { dataField: "codeseq", caption: "순서", width: 100 }
                , { dataField: "useyn", caption: "사용여부", width: 100 }
            ]
            , showColumnLines: true
            , showRowLines: true
            , rowAlternationEnabled: true
            , showBorders: true
            , selection: {
                mode: "single"
            }
            , height: 400
            , onRowClick: function (data) {
                fn_selone(data.key.itemcd);
            }
        }).dxDataGrid("instance");
        fn_search();
    });

    //===============================================================
    //검색
    //===============================================================
     function fn_search() {
        var param = JSON.stringify({ 'gbncd': $('#s_gbncd').val(), 'codenm': $('#s_codenm').val() });
        $.ajax({
            type: "POST",
            url: "/page/page19_svc.asmx/search",
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
    //===============================================================
    //상세화면-->오른쪽 보이는 input 박스 
    //===============================================================
    function fn_selone(gbncd, code) {
        var param = JSON.stringify({ 'gbncd': gbncd, 'code': code });
        $.ajax({
            type: "POST",
            url: "/page/page19_svc.asmx/selone",
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
        $('#gbncd').val('');
        $('#mode').val('I');
        $('#code').val('');
        $('#codenm').val('');
        $('#codeseq').val('');
        $('#useyn').val('');
    }
    //===============================================================
    // 신규
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        $('#code').prop('readonly', false);
        $('#useyn').val('Y');
    }
    //===============================================================
    // 저장
    //===============================================================
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
            url: "/page/page19_svc.asmx/save",
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
    // 삭제
    //===============================================================
    function fn_del() {
        $('#mode').val('D');
        fn_save();
        fn_new();
    }
    //gbncd,codenm 검색조건 컬럼
    //gbncd, code, codenm, codeseq, useyn 검색시 보여줘야할 컬럼
    //gbncd,code 상세화면 조건 컬럼
    //gbncd, code, codenm, codeseq, useyn 상세화면 및 저장때 넘겨줘야할 컬럼

</script>
</asp:Content>
