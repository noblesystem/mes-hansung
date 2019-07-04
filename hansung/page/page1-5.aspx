<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-5.aspx.cs" Inherits="hansung.page.page1_5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
      
    </script>
    <style>
        textarea{resize:nono; width:100%; height:400px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox">
                <div class="ibox-content">
                    <table width="100%">
                    <tr>
                        <td align="left" width="30%">공지사항</td>
                        <td align="right" width="30%">
                            
                        </td>
                        <td align="right" width="40%">
                            <input type="button" value="신규" onclick="fn_new()">
                            <input type="button" value="저장" onclick="fn_save()">
                            <input type="button" value="삭제" onclick="fn_del()">
                        </td>
                    </tr>
                    </table>
                    <table width="100%">
                    <tr>
                        <td>제목</td>
                        <td><input id="s_subject" type="text" value=""><input type="button" value="검색" onclick="fn_search();"></td>
                        <td width="40%">&nbsp;</td>
                    </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td width="60%">
<!-- 리스트 ==================================================================================== -->
                                <div id="grid1"></div>
                            </td>
                            <td width="40%">
<!-- 상세 ==================================================================================== -->
                                <input type="hidden" value="" id="seq"/>
                                <input type="hidden" value="" id="mode"/>
                                <table width="100%">
                                    <tr>
                                        <td>제목</td>
                                        <td><input type="text" id="subject" value=""/></td>
                                        <td>글쓴이</td>
                                        <td><input type="text" id="inuser" value="" /></td>
                                     </tr>
                                    <tr>
                                        <td colspan="4">내용</td>
                                     </tr>
                                    <tr>
                                        <td colspan="4">
                                           <textarea id="contents"></textarea>
                                        </td>
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
        //input 박스 및 textarea 생성
        //onclick이벤트 들어갈 함수 넣기
        //그리드 보여질 목로 순번(seq),제목(subject),글쓴이(inuser),날짜(updtime) 순서대로
        //신규버튼클릭시 글작성가능하도록초기설정(readonly)
        //신규작성 후  초기화
        //수정할때 글쓴이는 수정되지 않도록
        //수정후 저장시 빈값체크 seq, subject,contents,inuser 
        //검색 주소: /page/page19_svc.asmx/notice_search
        //상세 주소: /page/page19_svc.asmx/notice_selone
        //저장 주소: /page/page19_svc.asmx/notice_save
        //
        $(document).ready(function () {
            grid1 = $("#grid1").dxDataGrid({
                columns: [
                    { dataField: "seq", caption: "seq", width: 0 }
                    ,{ dataField: "Num", caption: "순번" }
                    , { dataField: "subject", caption: "제목", width: 100 }
                    , { dataField: "inuser", caption: "글쓴이", width: 100 }
                    , { dataField: "updtime", caption: "날짜", width: 100 }
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
                , height: 400
                , onRowClick: function (data) {
                    fn_selone(data.key.seq);
                }
            }).dxDataGrid("instance");
            fn_search();
        });
        //===============================================================
        //검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'subject': $('#s_subject').val() });
            $.ajax({
                type: "POST",
                url: "/page/page19_svc.asmx/notice_search",
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
        function fn_selone(seq) {
            var param = JSON.stringify({ 'seq': seq });
            $.ajax({
                type: "POST",
                url: "/page/page19_svc.asmx/notice_selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    fn_selone_init();
                    $('#seq').val(result[0].seq);
                    $('#subject').val(result[0].subject);
                    $('#inuser').val(result[0].inuser);
                    $('#contents').val(result[0].contents);
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
            $('#mode').val('');//모드값 초기화
            $('#seq').val('');//seq 초기화
            $('#subject').val('');//제목 초기화
            $('#inuser').val('');//글쓴이 초기화
            $('#contents').val('');//모드값 초기화
            $('#subject').prop('readonly', true);//제목 readonly 활성화(입력안됨)
            $('#inuser').prop('readonly', true);//글쓴이 readonly 활성화(입력안됨)
            $('#contents').prop('readonly', true);//내용 readonly 활성화(입력안됨)
        }
        function fn_selone_init() {
            $('#mode').val('U');//수정모드
            $('#subject').prop('readonly', false);////제목 readonly 비활성화(입력됨)
            $('#inuser').prop('readonly', true);////제목 readonly 비활성화(입력됨)
            $('#contents').prop('readonly', false);////제목 readonly 비활성화(입력됨)
        }
        //===============================================================
        // 신규
        //===============================================================
        function fn_new() {
            $('#mode').val('I');
            $('#seq').val('');
            $('#subject').val('');
            $('#inuser').val('');
            $('#contents').val('');
            $('#subject').prop('readonly', false);
            $('#inuser').prop('readonly', false);
            $('#contents').prop('readonly', false);
        }
        //===============================================================
        // 저장
        //===============================================================
        function fn_save() {
            var param = {};//param으로 파라메터값 정의
            param.mode = $.trim($('#mode').val());//모드 값 넣기(I,U,D)
            param.seq = $.trim($('#seq').val());//seq 값 넣기(생성시에는 빈값)
            param.subject = $.trim($('#subject').val());//제목 넣기()
            param.inuser = $.trim($('#inuser').val());//글쓴이 넣기()
            param.contents = $.trim($('#contents').val());//내용 넣기()
            if (param.subject == '') { alert('제목을 입력해주세요!'); return; }//제목 validation check
            if (param.inuser == '') { alert('글쓴이를 입력해주세요!'); return; }//글쓴이 validation check
            if (param.contents == '') { alert('내용을 입력해주세요!'); return; }//내용 validation check
            param = JSON.stringify(param);
            $.ajax({
                type: "POST",
                url: "/page/page19_svc.asmx/notice_save",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        fn_search();
                        param = JSON.parse(param);
                        if (param.mode == "I") { alert('저장 되었습니다'); }
                        if (param.mode == "U") { alert('수정 되었습니다'); fn_selone(param.seq); }
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
        }
        

    </script>
</asp:Content>
