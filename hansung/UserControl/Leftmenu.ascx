<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Leftmenu.ascx.cs" Inherits="hansung.UserControl.Leftmenu" %>
<%@ Import Namespace="hansung" %>
<%@ Import Namespace="hansung.datamoder" %>

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span>
                        <img alt="image" src="/img/logo.jpg" style="width: 100%" />
                    </span>


                    <%--  <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="#" id="useremail">Profile</a></li>
                        <li><a href="#" id="username">Contacts</a></li>
                        <li><a href="#" id="userauth">Mailbox</a></li>
                        <li class="divider"></li>
                      
                    </ul>--%>


                    <script src="/js/plugins/jquery.cookie.js"></script>
                    <script>
                        /*
                        if (typeof ($.cookie("email")) == "undefined" || $.cookie("email") == "") {
                            alert("로그인페이지로 이동합니다")
                            window.location = "/loginuser";
                        }

                        $("#useremail").html($.cookie("email"));
                        $("#username").html($.cookie("username"));
                        $("#userauth").html($.cookie("userauth"));
                        */
                    </script>
                </div>
                <div class="logo-element">
                    IN+
                </div>

            </li>
            <li class="page">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
                    </div>
                </nav>
                <script>
                    $('#logout').click(function (e) {
                        location.href = '/logout.aspx';
                    });
                </script>
                <a id="logout" style="font-size: 16px;color:red">Logout</a><br/>
                <a href="/"><%=usernm %>(<%=userid %>)</a>
            </li>
            <li class="page">
                <a href="/"><i class="fa fa-th-large"></i><span class="nav-label">메인화면</span> </a>
            </li>
            <%=menulist %>




            <!--
            <li class="page">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">기초등록</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">


                    <li><a href="/page/page1-1">거래처등록</a></li>
                    <li><a href="/page/page1-2">품목등록</a></li>
                    <li><a href="/page/page1-3">창고등록</a></li>
                    <li><a href="/page/page1-4">사원등록</a></li>
                    <li><a href="/page/page1-5">공지등록</a></li>
                    <li><a href="/page/page1-6">메뉴관리</a></li>
                    <li><a href="/page/page1-7">기초코드</a></li>
                    <li><a href="/page/page1-8">권한관리</a></li>
                </ul>
            </li>


            <li class="page2">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">구매관리</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                     <li>
                        <a  href="/page2/page2-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">구매전표</span></a>
                    </li>
                    <li>
                        <a  href="/page2/page2-2" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">구매전표조회</span></a>
                    </li>

                    <li>
                        <a  href="/page2/page2-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">발주현황</span></a>
                    </li>

                    <li>
                        <a  href="/page2/page2-4" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">미통관현황</span></a>
                    </li>
                    <li>
                        <a  href="/page2/page2-5" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">통관현황</span></a>
                    </li>

                    <li>
                        <a  href="/page2/page2-6" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">미입고현황</span></a>
                    </li>
                    <li>
                        <a  href="/page2/page2-7" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">입고현황</span></a>
                    </li>
                    <li>
                        <a  href="/page2/page2-8" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">구매 현황</span></a>
                    </li>
                    <li>
                        <a  href="/page2/page2-9" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">지급현황</span></a>
                    </li>
                    <li>
                        <a  href="/page2/page2-10" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">거래처관리대장</span></a>
                    </li>
                   
                </ul>
            </li>
            <li class="page3">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">영업관리</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a  href="/page3/page3-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">영업전표</span></a>
                    </li>
                    <li>
                        <a  href="/page3/page3-2" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">영업전표조회</span></a>
                    </li>

                    <li>
                        <a  href="/page3/page3-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">출고현황</span></a>
                    </li>

                    <li>
                        <a  href="/page3/page3-4" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">미출고현황</span></a>
                    </li>
                    <li>
                        <a  href="/page3/page3-5" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">판매현황</span></a>
                    </li>

                    <li>
                        <a  href="/page3/page3-6" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">수금현황</span></a>
                    </li>
                    <li>
                        <a  href="/page3/page3-7" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">채권현황</span></a>
                    </li>
                    <li>
                        <a  href="/page3/page3-8" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">거래처관리대장</span></a>
                    </li>
                </ul>
            </li>
            <li class="page4">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">계획관리</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                     <li>
                        <a  href="/page4/page4-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">매출계획 입력</span></a>
                    </li>
                    <li>
                        <a  href="/page4/page4-2" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">매출계획 조회</span></a>
                    </li>

                    <li>
                        <a  href="/page4/page4-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">매출계획비교표</span></a>
                    </li>
                </ul>
            </li>
            <li class="page5">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">창고관리</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                 <li>
                        <a  href="/page5/page5-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">이고전표</span></a>
                    </li>
                    <li>
                        <a  href="/page5/page5-2" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">이고전표조회</span></a>
                    </li>

                    <li>
                        <a  href="/page5/page5-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">이고현황</span></a>
                    </li>

                </ul>
            </li>
            <li class="page6">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">불량관리</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                     <li>
                        <a  href="/page6/page6-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">불량관리 전표</span></a>
                    </li>
                    <li>
                        <a  href="/page6/page6-2" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">불량관리전표 조회</span></a>
                    </li>

                    <li>
                        <a  href="/page6/page6-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">불량처리현황</span></a>
                    </li>
                    <li>
                        <a  href="/page6/page6-4" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">대체품목현황</span></a>
                    </li>
                
                    <li>
                        <a  href="/page6/page6-5" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">폐기현황</span></a>
                    </li>
                    <li>
                        <a  href="/page6/page6-6" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">불량률보고</span></a>
                    </li>

                </ul>
            </li>

            <li class="page7">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">재고관리</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a  href="/page7/page7-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">재고 실사</span></a>
                    </li>
                    <li>
                        <a  href="/page7/page7-2" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">재고실사 조회</span></a>
                    </li>

                    <li>
                        <a  href="/page7/page7-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">실사 내역</span></a>
                    </li>
                    <li>
                        <a  href="/page7/page7-4" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">재고조정 조회</span></a>
                    </li>
                
                    <li>
                        <a  href="/page7/page7-5" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">재고 조정</span></a>
                    </li>
                  
                </ul>
            </li>
            <li class="page8">
                <a href="javescript:void(0)"><i class="fa fa-th-large"></i><span class="nav-label">출력물</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li>
                        <a  href="/page8/page8-1" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">재고변동표</span></a>
                    </li>
                    <li>
                        <a  href="/page8/page8-2" aria-expanded="false">재고현황</a>
                    </li>

                    <li>
                        <a  href="/page8/page8-3" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non"> 영업보고서</span></a>
                    </li>
                    <li>
                        <a  href="/page8/page8-4" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">재고수불부</span></a>
                    </li>
                
                    <li>
                        <a  href="/page8/page8-5" aria-expanded="false"><span class="educate-icon educate-event icon-wrap sub-icon-mg" aria-hidden="true"></span> <span class="mini-click-non">채권채무현황</span></a>
                    </li>
                </ul>
            </li>

            -->
        </ul>

    </div>
</nav>
<script>
    $(document).ready(function () {
        var page = '<%=page%>';
        var subpage = '<%=subpage%>';
        var sp = subpage - 1;
        var o = $("." + page);
        $(o).find("li:eq(" + sp + ")").addClass("active");
        $("." + page).addClass("active");
    });
</script>

