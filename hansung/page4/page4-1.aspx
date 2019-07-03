<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page4-1.aspx.cs" Inherits="hansung.page4.page4_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--<link href="/pickerMonth/MonthPicker.min.css" rel="stylesheet" />
<script src="/pickerMonth/MonthPicker.min.js"></script>
<script src="/pickerMonth/examples.js"></script>--%>

<script>
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-content">
                    <table width="100%">
                    <tr>
                        <td align="left">매출계획입력</td>
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
                        <td>사원명</td>
                        <td><input id="s_usernm" type="text" value=""></td>
                    </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td width="70%">
<!-- 리스트 ==================================================================================== -->
                                <table id="grid1"></table>
                                <div id="grid1_pager"></div>
                            </td>
                            <td width="30%">
<!-- 상세 ==================================================================================== -->
                                <table width="100%">
                                    <tr>
                                        <td>계획번호</td>
                                        <td><input id="planno" type="text" readonly="readonly"/><input id="mode" type="text" readonly="readonly"/></td>
                                     </tr>
                                    <tr>
                                        <td>기간</td>
                                        <td><input id="plandt" type="text" class="datecombo" /></td>
                                     </tr>
                                    <tr>
                                        <td>영업 담당자</td>
                                        <td><input id="userid" type="text" readonly="readonly" /><input id="usernm" type="text" /><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
                                     </tr>
                                    <tr>
                                        <td>금액</td>
                                        <td><input id="amt" type="text" /></td>
                                     </tr>
                                    <tr>
                                        <td>적요</td>
                                        <td><input id="rmk" type="text" /></td>
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
        //$('#useyn').zentSetCombo('C007', '', '==선택==');
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        jQuery("#grid1").jqGrid({
            colNames: ['계획번호', '기간', 'userid', '영업담당자', '금액', '적요'],
            colModel: [
                  { name: "planno", index: "planno", width: 100 }
                , { name: "plandt", index: "plandt", width: 100 }
                , { name: "userid", index: "userid", width: 100 }
                , { name: "usernm", index: "usernm", width: 100 }
                , { name: "amt", index: "amt", width: 100 }
                , { name: "rmk", index: "rmk", width: 100 }
            ],

            //forceFit: true,
            //cellEdit: true,
            //cellsubmit: 'clientArray',
            onSelectRow: function (rowid, status, e) {
                var planno = $('#grid1').jqGrid('getCell', rowid, 'planno');
                fn_selone(planno);
            },
            ondblClickRow: function (rowid, row, col) {
                //var cm = jQuery("#grid1").jqGrid("getGridParam", "colModel");
                //if (cm[col].name != "itemname") {
                //    var planno = $('#grid1').jqGrid('getCell', rowid, 'planno');
                //    location.href = '/page1/page1-1.aspx?planno=' + planno;
                //}
            },
            rowNum: 10000,
            //rowList: [10, 20, 30],
            //pager: '#pager2',
            //sortname: 'id',
            viewrecords: true,
            //sortorder: "asc",
            width: 900,
            height: 600,
            caption: ""
        });
        jQuery("#grid1").jqGrid('navGrid', '#grid1_pager', { edit: false, add: false, del: false });
        fn_search();
    });
    //===============================================================
    // 검색
    //===============================================================
    function fn_search() {
        var param = JSON.stringify({ 'usernm': $('#s_usernm').val() });
        $.ajax({
            type: "POST",
            url: "/page4/page41_svc.asmx/search",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                $('#grid1')[0].addJSONData(JSON.parse(data.d));
                fn_init();
            },
            error: function (request, status, error) {
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    function fn_selone(planno) {
        var param = JSON.stringify({ 'planno': planno });
        $.ajax({
            type: "POST",
            url: "/page4/page41_svc.asmx/selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                $('#mode').val('U');
                $('#planno').val(result[0].planno);
                $('#plandt').val(result[0].plandt);
                $('#userid').val(result[0].userid);
                $('#usernm').val(result[0].usernm);
                $('#amt').val(result[0].amt);
                $('#rmk').val(result[0].rmk);
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
        $('#planno').val('');
        $('#plandt').val('');
        $('#userid').val('');
        $('#amt').val('');
        $('#rmk').val('');
        //추가항목
        $('#usernm').val('');
    }
    //===============================================================
    // button
    //===============================================================
    function fn_new() {
        fn_init();
        $('#mode').val('I');
        //$('#planno').prop('readonly', false);
    }
    function fn_del() {
        $('#mode').val('D');
        fn_save();
    }
    function fn_save() {
        var param = {};
        param.mode = $.trim($('#mode').val());
        param.planno = $.trim($('#planno').val());
        param.plandt = $.trim($('#plandt').val());
        param.userid = $.trim($('#userid').val());
        param.amt = $.trim($('#amt').val());
        param.rmk = $.trim($('#rmk').val());

        //f (param.planno == '') { alert('코드를 입력해주세요!'); return; }
        //if (param.custnm == '') { alert('코드명을 입력해주세요!'); return; }
        param = JSON.stringify(param);
        $.ajax({
            type: "POST",
            url: "/page4/page41_svc.asmx/save",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var result = JSON.parse(data.d);
                if (result.code == "OK") {
                    fn_init();
                    fn_search();
                    
                    param = JSON.parse(param);
                    if (param.mode == "I") { fn_selone(result.val); alert('저장 되었습니다'); }
                    if (param.mode == "U") { fn_selone(result.val); alert('저장 되었습니다'); }
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

    </script>
</asp:Content>

