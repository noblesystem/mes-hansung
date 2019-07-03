<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-8.aspx.cs" Inherits="hansung.page.page1_8" %>

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
                        <td>이름</td>
                        <td><input id="s_usernm" type="text" value=""></td>
                    </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td width="40%">
<!-- 리스트 ==================================================================================== -->
                                <div id="grid1"></div>
                            </td>
                            <td width="60%">
<!-- 상세 ==================================================================================== -->
                                <div id="grid2"></div>
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
                { dataField: "userid", caption: "아이디", width: 100 }
                , { dataField: "usernm", caption: "이름", width: 100 }
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
            , width: 450
            , height: 200
            , onRowClick: function (data) {
                fn_selone(data.key.userid);
            }
        }).dxDataGrid("instance");
        
        grid2 = $("#grid2").dxDataGrid({
            columns: [
                { dataField: "userid", caption: "아이디", width: 0 }
                , { dataField: "menucd", caption: "코드", width: 100 }
                , { dataField: "menunm", caption: "메뉴명", width: 100 }
                , { dataField: "readyn", caption: "조회", width: 100, dataType: "checkbox" }
                , { dataField: "saveyn", caption: "저장", width: 100, dataType: "object" }
                , { dataField: "amtyn", caption: "금액", width: 100, dataType: "boolean" }

            ]
            , showColumnLines: true
            , showRowLines: true
            , rowAlternationEnabled: false
            , showBorders: true
            , selection: {
                mode: "multiple"
            }
            , scrolling: {
                columnRenderingMode: "virtual"
            }
            , paging: {
                enabled: false
            }
            , onEditorPreparing: function (e) {
                if (e.dataField == "amtyn") {
                    e.editorElement.dxCheckBox({
                        value: e.value,
                        onValueChanged: function (a) {
                            alert(a.value);
                        }
                    });
                }
                //console.log(e.dataField);
            }
            , width: 750
            , height: 200
            , onRowClick: function (e) {
                console.log(e);         
                //fn_selone(data.key.whcd);
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
            url: "/page/page18_svc.asmx/search",
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
        console.log(userid);
        var param = JSON.stringify({ 'userid': userid });
        $.ajax({
            type: "POST",
            url: "/page/page18_svc.asmx/search2",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                $("#grid2").dxDataGrid({ dataSource: JSON.parse(data.d) });
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
        grid2.option('dataSource', []);
    }
    
</script>
</asp:Content>