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
                            <input type="button" value="신규" onclick="">
                            <input type="button" value="저장" onclick="">
                            <input type="button" value="삭제" onclick="">
                        </td>
                    </tr>
                    </table>
                    <table width="100%">
                    <tr>
                        <td>제목</td>
                        <td><input id="" type="text" value=""><input type="button" value="검색" onclick=""></td>
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
                                <input type="hidden" value="" id="s_seq"/>
                                <input type="hidden" value="" id="s_mode"/>
                                <table width="100%">
                                    <tr>
                                        <td>제목</td>
                                        <td><%-- input test subject --%></td>
                                        <td>이름</td>
                                        <td> <%-- input test inuser --%></td>
                                     </tr>
                                    <tr>
                                        <td colspan="4">내용</td>
                                     </tr>
                                    <tr>
                                        <td colspan="4">
                                           <%-- textarea contents --%>
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
            
            
        });
        //===============================================================
        //검색
        //===============================================================
        function fn_search() {

        }
        //===============================================================
        //상세화면-->오른쪽 보이는 input 박스 
        //===============================================================
        function fn_selone(seq) {

        }
        //===============================================================
        // 초기화
        //===============================================================
        function fn_init() {

        }
        //===============================================================
        // 신규
        //===============================================================
        function fn_new() {
            
        }
        //===============================================================
        // 저장
        //===============================================================
        function fn_save() {
            
        }
        //===============================================================
        // 삭제
        //===============================================================
        function fn_del() {

        }
        

    </script>
</asp:Content>
