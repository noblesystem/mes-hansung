<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="hansung.page2.WebForm1" %>


<!DOCTYPE html>

<html>
<head><title>
	Hansung
</title><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <a href="WebForm1.aspx">WebForm1.aspx</a>
    <link href="/css/ui.jqgrid.css" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/i18n/grid.locale-kr.js"></script><!-- jq grid -->
    
    <script src="/js/jquery.jqGrid.min.js"></script>
    <script src="/js/jquery.form.zent.js?222"></script>
    <script src="/js/nb_util.js?888"></script>




</head>
<body>
    <input type="file" class="fileup" style="display: none" />
    <div class="modal" id="loadscreen">
        <div class="modal-dialog">
            <div class="modal-content" style="background: transparent;">

                <div class="modal-body">
                    <div class="loader"></div>
                </div>
            </div>
        </div>
    </div>

    <form method="post" action="./page2-1?jpno=P20190624001" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="8aiMwnSVmfkuwcx0UFuZ//ZcYqdqAGw/hh4+EZw86/du9I1jJWbXuZ6fHHkis2a4n+fvwX06kLeXhDVpu/lGaJcuxj5IJJ+wXpHMgK518gk=" />
</div>

        
<script>

    var idemloyer = [];
    var emloyer = [];
    var ctmer = [];
    var accotctm = [];
    var idcpn = [];
    var items = [];
    var items_group = [];
    var iditems = [];
    var standar = [];
    var qltincase = [];
    var warehouse = [];
     var idwarehouse = [];
        
    emloyer.push('tesr');
    idemloyer.push('1');
        
    emloyer.push('대표이사');
    idemloyer.push('2');
        
    emloyer.push('이상길');
    idemloyer.push('3');
        
    emloyer.push('홍길동');
    idemloyer.push('4');
        
    emloyer.push('test W04');
    idemloyer.push('5');
        
    emloyer.push('홍길동');
    idemloyer.push('6');
        
    emloyer.push('이문기');
    idemloyer.push('7');
        
    emloyer.push('이상열');
    idemloyer.push('8');
        
    emloyer.push('양만춘');
    idemloyer.push('9');
        
    emloyer.push('조용필');
    idemloyer.push('10');
        
    emloyer.push('이미연');
    idemloyer.push('11');
        
    emloyer.push('김종대');
    idemloyer.push('12');
        
    emloyer.push('김만복');
    idemloyer.push('13');
        
    emloyer.push('이순신');
    idemloyer.push('14');
        
    emloyer.push('문문문');
    idemloyer.push('15');
        
    emloyer.push('유관순');
    idemloyer.push('16');
        
    emloyer.push('홍길동1');
    idemloyer.push('17');
        
    emloyer.push('Admin');
    idemloyer.push('18');
        
    emloyer.push('HAINT');
    idemloyer.push('19');
        
    emloyer.push('employee');
    idemloyer.push('20');
        
    emloyer.push('유관순');
    idemloyer.push('21');
        
    accotctm.push('');
    ctmer.push('AGC');
    idcpn.push('2');
        
    accotctm.push('');
    ctmer.push('한유');
    idcpn.push('3');
        
    accotctm.push('');
    ctmer.push('신신');
    idcpn.push('4');
        
    accotctm.push('');
    ctmer.push('신화');
    idcpn.push('5');
        
    accotctm.push('');
    ctmer.push('태명알미늄');
    idcpn.push('6');
        
    accotctm.push('');
    ctmer.push('정안유리');
    idcpn.push('7');
        
    accotctm.push('');
    ctmer.push('엘지전자(주)');
    idcpn.push('8');
        
    accotctm.push('');
    ctmer.push('하늘유리');
    idcpn.push('28');
        
    accotctm.push('');
    ctmer.push('LG하우시스(주)');
    idcpn.push('29');
        
    accotctm.push('');
    ctmer.push('신광판유리㈜');
    idcpn.push('33');
        
    accotctm.push('');
    ctmer.push('삼화지엔티㈜');
    idcpn.push('34');
        
    accotctm.push('');
    ctmer.push('대성유리공업(주)곡성');
    idcpn.push('35');
        
    accotctm.push('');
    ctmer.push('성경티에스(주)');
    idcpn.push('36');
        
    accotctm.push('');
    ctmer.push('신화(김해)');
    idcpn.push('37');
        
    accotctm.push('');
    ctmer.push('명성창호1');
    idcpn.push('38');
        
    accotctm.push('');
    ctmer.push('아진글라스(주)');
    idcpn.push('39');
        
    accotctm.push('');
    ctmer.push('명성창호(부산)');
    idcpn.push('40');
        
    accotctm.push('');
    ctmer.push('케지티(주)');
    idcpn.push('41');
        
    accotctm.push('');
    ctmer.push('한라창호');
    idcpn.push('42');
        
    accotctm.push('');
    ctmer.push('영광판유리(주)');
    idcpn.push('43');
        
    accotctm.push('');
    ctmer.push('대영유리(부산)');
    idcpn.push('44');
        
    accotctm.push('');
    ctmer.push('한남유리(광주)');
    idcpn.push('45');
        
    accotctm.push('');
    ctmer.push('한남산업');
    idcpn.push('46');
        
    accotctm.push('');
    ctmer.push('명성유리(부산)');
    idcpn.push('47');
        
    accotctm.push('');
    ctmer.push('에스제이통상(주)');
    idcpn.push('48');
        
    accotctm.push('');
    ctmer.push('원일유리');
    idcpn.push('49');
        
    accotctm.push('');
    ctmer.push('정암안전유리(주)');
    idcpn.push('50');
        
    accotctm.push('');
    ctmer.push('천지유리');
    idcpn.push('51');
        
    accotctm.push('');
    ctmer.push('대신이엔씨(울산)');
    idcpn.push('52');
        
    accotctm.push('');
    ctmer.push('아진유리');
    idcpn.push('53');
        
    accotctm.push('');
    ctmer.push('영성기업');
    idcpn.push('54');
        
    accotctm.push('');
    ctmer.push('호남복층유리(주)');
    idcpn.push('55');
        
    accotctm.push('');
    ctmer.push('대한기업');
    idcpn.push('56');
        
    accotctm.push('');
    ctmer.push('동진창호(주)부산');
    idcpn.push('57');
        
    accotctm.push('');
    ctmer.push('한성창호유리산업');
    idcpn.push('58');
        
    accotctm.push('');
    ctmer.push('대한유리');
    idcpn.push('59');
        
    accotctm.push('');
    ctmer.push('강한유리');
    idcpn.push('60');
        
    accotctm.push('');
    ctmer.push('정암지앤더블유㈜');
    idcpn.push('61');
        
    accotctm.push('');
    ctmer.push('국영복층유리(부산)');
    idcpn.push('62');
        
    accotctm.push('');
    ctmer.push('우주㈜');
    idcpn.push('63');
        
    accotctm.push('');
    ctmer.push('용진판유리');
    idcpn.push('64');
        
    accotctm.push('');
    ctmer.push('대헌유리상사');
    idcpn.push('65');
        
    accotctm.push('');
    ctmer.push('국제유리(김해)');
    idcpn.push('66');
        
    accotctm.push('');
    ctmer.push('엔지유솔라앤글로발(울산공장)');
    idcpn.push('67');
        
    accotctm.push('');
    ctmer.push('유경유리');
    idcpn.push('68');
        
    accotctm.push('');
    ctmer.push('세경지텍㈜');
    idcpn.push('69');
        
    accotctm.push('');
    ctmer.push('한국유리(김해)');
    idcpn.push('70');
        
    accotctm.push('');
    ctmer.push('효성글라스㈜');
    idcpn.push('71');
        
    accotctm.push('');
    ctmer.push('새한그라스테크㈜');
    idcpn.push('72');
        
    accotctm.push('');
    ctmer.push('다윈지엠(주)');
    idcpn.push('73');
        
    accotctm.push('');
    ctmer.push('금강창호기공(주)');
    idcpn.push('74');
        
    accotctm.push('');
    ctmer.push('동아글라스(주)제주');
    idcpn.push('75');
        
    accotctm.push('');
    ctmer.push('금창판유리');
    idcpn.push('76');
        
    accotctm.push('');
    ctmer.push('선진유리');
    idcpn.push('77');
        
    accotctm.push('');
    ctmer.push('현대제경산업');
    idcpn.push('78');
        
    accotctm.push('');
    ctmer.push('자산유리(주)');
    idcpn.push('79');
        
    accotctm.push('');
    ctmer.push('에이치에스글라스(HS GLASS)');
    idcpn.push('80');
        
    accotctm.push('');
    ctmer.push('용진유리공업(포천)');
    idcpn.push('81');
        
    accotctm.push('');
    ctmer.push('제3글라스텍');
    idcpn.push('82');
        
    accotctm.push('');
    ctmer.push('용진유리판매(주)');
    idcpn.push('83');
        
    accotctm.push('');
    ctmer.push('삼보안전유리(주)');
    idcpn.push('84');
        
    accotctm.push('');
    ctmer.push('이호(주)');
    idcpn.push('85');
        
    accotctm.push('');
    ctmer.push('미창유리공업(주)');
    idcpn.push('86');
        
    accotctm.push('');
    ctmer.push('(주)대한거울');
    idcpn.push('87');
        
    accotctm.push('');
    ctmer.push('경남유리');
    idcpn.push('88');
        
    accotctm.push('');
    ctmer.push('한길유리(주)');
    idcpn.push('89');
        
    accotctm.push('');
    ctmer.push('한테크㈜');
    idcpn.push('90');
        
    accotctm.push('');
    ctmer.push('대일특수유리(주)');
    idcpn.push('91');
        
    accotctm.push('');
    ctmer.push('삼우지앤티');
    idcpn.push('92');
        
    accotctm.push('');
    ctmer.push('유진산업㈜');
    idcpn.push('93');
        
    accotctm.push('');
    ctmer.push('호성유리(주)');
    idcpn.push('94');
        
    accotctm.push('');
    ctmer.push('자산유리파주지점(주)');
    idcpn.push('95');
        
    accotctm.push('');
    ctmer.push('동원산업주식회사');
    idcpn.push('96');
        
    accotctm.push('');
    ctmer.push('동원유리㈜');
    idcpn.push('97');
        
    accotctm.push('');
    ctmer.push('성진지엠피(주)');
    idcpn.push('98');
        
    accotctm.push('');
    ctmer.push('신당종합유리㈜');
    idcpn.push('99');
        
    accotctm.push('');
    ctmer.push('세종유리건업');
    idcpn.push('100');
        
    accotctm.push('');
    ctmer.push('정산유리㈜');
    idcpn.push('101');
        
    accotctm.push('');
    ctmer.push('대한글라스텍');
    idcpn.push('102');
        
    accotctm.push('');
    ctmer.push('영동알미늄');
    idcpn.push('103');
        
    accotctm.push('');
    ctmer.push('용운산업');
    idcpn.push('104');
        
    accotctm.push('');
    ctmer.push('성경글라스 유한회사');
    idcpn.push('105');
        
    accotctm.push('');
    ctmer.push('에스에이치글라스(주)시흥');
    idcpn.push('106');
        
    accotctm.push('');
    ctmer.push('SH글라스(주)');
    idcpn.push('107');
        
    accotctm.push('');
    ctmer.push('방이유리');
    idcpn.push('108');
        
    accotctm.push('');
    ctmer.push('원광유리(주)(광주)');
    idcpn.push('109');
        
    accotctm.push('');
    ctmer.push('창의인터내셔날㈜');
    idcpn.push('110');
        
    accotctm.push('');
    ctmer.push('신흥그라스텍(주)');
    idcpn.push('111');
        
    accotctm.push('');
    ctmer.push('태성유리');
    idcpn.push('112');
        
    accotctm.push('');
    ctmer.push('청원유리');
    idcpn.push('113');
        
    accotctm.push('');
    ctmer.push('한성유리(의정부／송추)');
    idcpn.push('114');
        
    accotctm.push('');
    ctmer.push('케이씨씨월드(주)');
    idcpn.push('115');
        
    accotctm.push('');
    ctmer.push('두현㈜');
    idcpn.push('116');
        
    accotctm.push('');
    ctmer.push('세일인더스트㈜');
    idcpn.push('117');
        
    accotctm.push('');
    ctmer.push('영동복층유리(주)');
    idcpn.push('118');
        
    accotctm.push('');
    ctmer.push('유글라스(U GLASS)');
    idcpn.push('119');
        
    accotctm.push('');
    ctmer.push('한빛유리(일산)');
    idcpn.push('120');
        
    accotctm.push('');
    ctmer.push('동화유리');
    idcpn.push('121');
        
    accotctm.push('');
    ctmer.push('삼호글라스');
    idcpn.push('122');
        
    accotctm.push('');
    ctmer.push('우신복층유리(하남)');
    idcpn.push('123');
        
    accotctm.push('');
    ctmer.push('동국특수유리(양지)');
    idcpn.push('124');
        
    accotctm.push('');
    ctmer.push('대광유리(의정부)');
    idcpn.push('125');
        
    accotctm.push('');
    ctmer.push('새들그라스');
    idcpn.push('126');
        
    accotctm.push('');
    ctmer.push('신원유리');
    idcpn.push('127');
        
    accotctm.push('');
    ctmer.push('영경유리');
    idcpn.push('128');
        
    accotctm.push('');
    ctmer.push('삼원유리(포천)');
    idcpn.push('129');
        
    accotctm.push('');
    ctmer.push('대성ENG');
    idcpn.push('130');
        
    accotctm.push('');
    ctmer.push('아름유리(마석)');
    idcpn.push('131');
        
    accotctm.push('');
    ctmer.push('원광그라스(주)');
    idcpn.push('132');
        
    accotctm.push('');
    ctmer.push('삼성종합유리');
    idcpn.push('133');
        
    accotctm.push('');
    ctmer.push('성원종합유리');
    idcpn.push('134');
        
    accotctm.push('');
    ctmer.push('우신지엠씨(주)');
    idcpn.push('135');
        
    accotctm.push('');
    ctmer.push('천일제경');
    idcpn.push('136');
        
    accotctm.push('');
    ctmer.push('안중제경사');
    idcpn.push('137');
        
    accotctm.push('');
    ctmer.push('한양유리');
    idcpn.push('138');
        
    accotctm.push('');
    ctmer.push('아름지엘에스(주)');
    idcpn.push('139');
        
    accotctm.push('');
    ctmer.push('한백그라스');
    idcpn.push('140');
        
    accotctm.push('');
    ctmer.push('광명기업(용인)');
    idcpn.push('141');
        
    accotctm.push('');
    ctmer.push('삼양유리산업(주)');
    idcpn.push('142');
        
    accotctm.push('');
    ctmer.push('신신유리(주)(서울)');
    idcpn.push('143');
        
    accotctm.push('');
    ctmer.push('칠성글라스텍');
    idcpn.push('144');
        
    accotctm.push('');
    ctmer.push('원광유리');
    idcpn.push('145');
        
    accotctm.push('');
    ctmer.push('수정유리공업');
    idcpn.push('146');
        
    accotctm.push('');
    ctmer.push('동아유리㈜');
    idcpn.push('147');
        
    accotctm.push('');
    ctmer.push('에이비씨글라스㈜');
    idcpn.push('148');
        
    accotctm.push('');
    ctmer.push('필텍그라스');
    idcpn.push('149');
        
    accotctm.push('');
    ctmer.push('한일이엔지(한일ENG)');
    idcpn.push('150');
        
    accotctm.push('');
    ctmer.push('세광유리');
    idcpn.push('151');
        
    accotctm.push('');
    ctmer.push('성원종합유리㈜');
    idcpn.push('152');
        
    accotctm.push('');
    ctmer.push('태산글라스');
    idcpn.push('153');
        
    accotctm.push('');
    ctmer.push('디엘디지글라스㈜');
    idcpn.push('154');
        
    accotctm.push('');
    ctmer.push('에이치글라스');
    idcpn.push('155');
        
    accotctm.push('');
    ctmer.push('이노글라스㈜');
    idcpn.push('156');
        
    accotctm.push('');
    ctmer.push('W홀딩컴퍼니 SH글라스(주)');
    idcpn.push('157');
        
    accotctm.push('010-3159-4569');
    ctmer.push('대산이앤지㈜');
    idcpn.push('158');
        
    accotctm.push('');
    ctmer.push('광성유리산업(주)');
    idcpn.push('159');
        
    accotctm.push('');
    ctmer.push('한울G＆P');
    idcpn.push('160');
        
    accotctm.push('');
    ctmer.push('동진유리산업');
    idcpn.push('161');
        
    accotctm.push('');
    ctmer.push('태원유리');
    idcpn.push('162');
        
    accotctm.push('');
    ctmer.push('신광유리제경');
    idcpn.push('163');
        
    accotctm.push('');
    ctmer.push('신형유리');
    idcpn.push('164');
        
    accotctm.push('');
    ctmer.push('동양산업(인천)');
    idcpn.push('165');
        
    accotctm.push('');
    ctmer.push('신창안전유리(주)인천');
    idcpn.push('166');
        
    accotctm.push('');
    ctmer.push('이화글라스㈜');
    idcpn.push('167');
        
    accotctm.push('');
    ctmer.push('영준유리');
    idcpn.push('168');
        
    accotctm.push('');
    ctmer.push('민재유리');
    idcpn.push('169');
        
    accotctm.push('');
    ctmer.push('태광안전유리(주) 지점');
    idcpn.push('170');
        
    accotctm.push('');
    ctmer.push('현대유리(주)덕양');
    idcpn.push('171');
        
    accotctm.push('');
    ctmer.push('위스㈜');
    idcpn.push('172');
        
    accotctm.push('');
    ctmer.push('삼우이엠씨(주)');
    idcpn.push('173');
        
    accotctm.push('');
    ctmer.push('가인공영㈜');
    idcpn.push('174');
        
    accotctm.push('');
    ctmer.push('가인');
    idcpn.push('175');
        
    accotctm.push('');
    ctmer.push('태광안전유리.지점(인천)');
    idcpn.push('176');
        
    accotctm.push('');
    ctmer.push('미광유리(미아)');
    idcpn.push('177');
        
    accotctm.push('');
    ctmer.push('신광유리(장안동)');
    idcpn.push('178');
        
    accotctm.push('');
    ctmer.push('이도㈜');
    idcpn.push('179');
        
    accotctm.push('');
    ctmer.push('진성유리');
    idcpn.push('180');
        
    accotctm.push('');
    ctmer.push('성우유리');
    idcpn.push('181');
        
    accotctm.push('');
    ctmer.push('동해건업');
    idcpn.push('182');
        
    accotctm.push('');
    ctmer.push('동아은경(주)');
    idcpn.push('183');
        
    accotctm.push('');
    ctmer.push('화성종합');
    idcpn.push('184');
        
    accotctm.push('');
    ctmer.push('이화유리');
    idcpn.push('185');
        
    accotctm.push('');
    ctmer.push('엠코스타');
    idcpn.push('186');
        
    accotctm.push('');
    ctmer.push('주식회사 대명유리');
    idcpn.push('187');
        
    accotctm.push('');
    ctmer.push('아산비즈니스(주)');
    idcpn.push('188');
        
    accotctm.push('');
    ctmer.push('태광안전유리(주)');
    idcpn.push('189');
        
    accotctm.push('');
    ctmer.push('신원C＆GT');
    idcpn.push('190');
        
    accotctm.push('');
    ctmer.push('케이산업㈜');
    idcpn.push('191');
        
    accotctm.push('');
    ctmer.push('삼원그라스카바(주)');
    idcpn.push('192');
        
    accotctm.push('');
    ctmer.push('세광산업');
    idcpn.push('193');
        
    accotctm.push('');
    ctmer.push('국영지앤엠(주)');
    idcpn.push('194');
        
    accotctm.push('');
    ctmer.push('명진산업유리(주)');
    idcpn.push('195');
        
    accotctm.push('');
    ctmer.push('썬텍글라스(주)');
    idcpn.push('196');
        
    accotctm.push('');
    ctmer.push('영창유리');
    idcpn.push('197');
        
    accotctm.push('');
    ctmer.push('수글라스');
    idcpn.push('198');
        
    accotctm.push('');
    ctmer.push('파이텍㈜');
    idcpn.push('199');
        
    accotctm.push('');
    ctmer.push('특강유리');
    idcpn.push('200');
        
    accotctm.push('');
    ctmer.push('자산유리글라스');
    idcpn.push('201');
        
    accotctm.push('');
    ctmer.push('지디컴포니');
    idcpn.push('202');
        
    accotctm.push('');
    ctmer.push('영림임업(주)');
    idcpn.push('203');
        
    accotctm.push('');
    ctmer.push('현대중문');
    idcpn.push('204');
        
    accotctm.push('');
    ctmer.push('현대유리(서구)');
    idcpn.push('205');
        
    accotctm.push('');
    ctmer.push('정선유리');
    idcpn.push('206');
        
    accotctm.push('');
    ctmer.push('이도글라스');
    idcpn.push('207');
        
    accotctm.push('');
    ctmer.push('합동하이텍그라스(주)');
    idcpn.push('208');
        
    accotctm.push('');
    ctmer.push('서울안전유리(주)');
    idcpn.push('209');
        
    accotctm.push('');
    ctmer.push('성진그라스텍');
    idcpn.push('210');
        
    accotctm.push('');
    ctmer.push('대창유리');
    idcpn.push('211');
        
    accotctm.push('');
    ctmer.push('베스트글라스(주)');
    idcpn.push('212');
        
    accotctm.push('');
    ctmer.push('일영유리제경');
    idcpn.push('213');
        
    accotctm.push('');
    ctmer.push('우림도어㈜');
    idcpn.push('214');
        
    accotctm.push('');
    ctmer.push('서부유리(대전)');
    idcpn.push('215');
        
    accotctm.push('');
    ctmer.push('글라스닛시(주)');
    idcpn.push('216');
        
    accotctm.push('');
    ctmer.push('우진기업(주)');
    idcpn.push('217');
        
    accotctm.push('');
    ctmer.push('태양유리제경사(전주)');
    idcpn.push('218');
        
    accotctm.push('');
    ctmer.push('한유에스앤지(주)');
    idcpn.push('219');
        
    accotctm.push('');
    ctmer.push('DH글라스');
    idcpn.push('220');
        
    accotctm.push('');
    ctmer.push('지오㈜');
    idcpn.push('221');
        
    accotctm.push('');
    ctmer.push('현대안전유리공업(주)');
    idcpn.push('222');
        
    accotctm.push('');
    ctmer.push('마린아트');
    idcpn.push('223');
        
    accotctm.push('');
    ctmer.push('동아금속 유한회사');
    idcpn.push('224');
        
    accotctm.push('');
    ctmer.push('대일강화유리');
    idcpn.push('225');
        
    accotctm.push('');
    ctmer.push('성광기업');
    idcpn.push('226');
        
    accotctm.push('');
    ctmer.push('삼경안전유리(주)');
    idcpn.push('227');
        
    if (items_group.indexOf('다이아 5') == -1)
        items_group.push('다이아 5');
        items.push('다이아 5');
        iditems.push('3');
    
    if (items_group.indexOf('다이아 5') == -1)
        items_group.push('다이아 5');
        items.push('다이아 5');
        iditems.push('4');
    
    if (items_group.indexOf('레인 5') == -1)
        items_group.push('레인 5');
        items.push('레인 5');
        iditems.push('5');
    
    if (items_group.indexOf('모루 5') == -1)
        items_group.push('모루 5');
        items.push('모루 5');
        iditems.push('6');
    
    if (items_group.indexOf('연습 1') == -1)
        items_group.push('연습 1');
        items.push('연습 1');
        iditems.push('7');
    
    if (items_group.indexOf('연습 1') == -1)
        items_group.push('연습 1');
        items.push('연습 1');
        iditems.push('8');
    
    if (items_group.indexOf('연습 6') == -1)
        items_group.push('연습 6');
        items.push('연습 6');
        iditems.push('9');
    
    if (items_group.indexOf('연습1') == -1)
        items_group.push('연습1');
        items.push('연습1');
        iditems.push('10');
    
    if (items_group.indexOf('오셔닉 5') == -1)
        items_group.push('오셔닉 5');
        items.push('오셔닉 5');
        iditems.push('11');
    
    if (items_group.indexOf('오셔닉 5') == -1)
        items_group.push('오셔닉 5');
        items.push('오셔닉 5');
        iditems.push('12');
    
    if (items_group.indexOf('워터큐브 5') == -1)
        items_group.push('워터큐브 5');
        items.push('워터큐브 5');
        iditems.push('13');
    
    if (items_group.indexOf('초백 4') == -1)
        items_group.push('초백 4');
        items.push('초백 4');
        iditems.push('14');
    
    if (items_group.indexOf('초백 5') == -1)
        items_group.push('초백 5');
        items.push('초백 5');
        iditems.push('15');
    
    if (items_group.indexOf('초백 5') == -1)
        items_group.push('초백 5');
        items.push('초백 5');
        iditems.push('16');
    
    if (items_group.indexOf('초백 5') == -1)
        items_group.push('초백 5');
        items.push('초백 5');
        iditems.push('17');
    
    if (items_group.indexOf('초백 5') == -1)
        items_group.push('초백 5');
        items.push('초백 5');
        iditems.push('18');
    
    if (items_group.indexOf('초백 6') == -1)
        items_group.push('초백 6');
        items.push('초백 6');
        iditems.push('19');
    
    if (items_group.indexOf('초백 8') == -1)
        items_group.push('초백 8');
        items.push('초백 8');
        iditems.push('20');
    
    if (items_group.indexOf('티타늄 0.5-5') == -1)
        items_group.push('티타늄 0.5-5');
        items.push('티타늄 0.5-5');
        iditems.push('21');
    
    if (items_group.indexOf('티타늄 0.9-5') == -1)
        items_group.push('티타늄 0.9-5');
        items.push('티타늄 0.9-5');
        iditems.push('22');
    
    if (items_group.indexOf('ACID 4 논슬립') == -1)
        items_group.push('ACID 4 논슬립');
        items.push('ACID 4 논슬립');
        iditems.push('23');
    
    if (items_group.indexOf('ACID 5-0.5') == -1)
        items_group.push('ACID 5-0.5');
        items.push('ACID 5-0.5');
        iditems.push('24');
    
    if (items_group.indexOf('ACID 5-0.7') == -1)
        items_group.push('ACID 5-0.7');
        items.push('ACID 5-0.7');
        iditems.push('25');
    
    if (items_group.indexOf('ACID BZ 5-0.7') == -1)
        items_group.push('ACID BZ 5-0.7');
        items.push('ACID BZ 5-0.7');
        iditems.push('26');
    
    if (items_group.indexOf('BFG(BZ) 3') == -1)
        items_group.push('BFG(BZ) 3');
        items.push('BFG(BZ) 3');
        iditems.push('27');
    
    if (items_group.indexOf('BFG(BZ) 3') == -1)
        items_group.push('BFG(BZ) 3');
        items.push('BFG(BZ) 3');
        iditems.push('28');
    
    if (items_group.indexOf('BFG(BZ) 3') == -1)
        items_group.push('BFG(BZ) 3');
        items.push('BFG(BZ) 3');
        iditems.push('29');
    
    if (items_group.indexOf('BFG(BZ) 3') == -1)
        items_group.push('BFG(BZ) 3');
        items.push('BFG(BZ) 3');
        iditems.push('30');
    
    if (items_group.indexOf('BFG(BZ) 3') == -1)
        items_group.push('BFG(BZ) 3');
        items.push('BFG(BZ) 3');
        iditems.push('31');
    
    if (items_group.indexOf('BFG(BZ) 3') == -1)
        items_group.push('BFG(BZ) 3');
        items.push('BFG(BZ) 3');
        iditems.push('32');
    
    if (items_group.indexOf('BFG(BZ) 4') == -1)
        items_group.push('BFG(BZ) 4');
        items.push('BFG(BZ) 4');
        iditems.push('33');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('34');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('35');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('36');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('37');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('38');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('39');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('40');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('41');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('42');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('43');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('44');
    
    if (items_group.indexOf('BFG(BZ) 5') == -1)
        items_group.push('BFG(BZ) 5');
        items.push('BFG(BZ) 5');
        iditems.push('45');
    
    if (items_group.indexOf('BFG(BZ) 6') == -1)
        items_group.push('BFG(BZ) 6');
        items.push('BFG(BZ) 6');
        iditems.push('46');
    
    if (items_group.indexOf('BFG(BZ) 6') == -1)
        items_group.push('BFG(BZ) 6');
        items.push('BFG(BZ) 6');
        iditems.push('47');
    
    if (items_group.indexOf('BFG(BZ) 6') == -1)
        items_group.push('BFG(BZ) 6');
        items.push('BFG(BZ) 6');
        iditems.push('48');
    
    if (items_group.indexOf('BFG(BZ) 6') == -1)
        items_group.push('BFG(BZ) 6');
        items.push('BFG(BZ) 6');
        iditems.push('49');
    
    if (items_group.indexOf('BFG(BZ) 6') == -1)
        items_group.push('BFG(BZ) 6');
        items.push('BFG(BZ) 6');
        iditems.push('50');
    
    if (items_group.indexOf('BFG(BZ) 6') == -1)
        items_group.push('BFG(BZ) 6');
        items.push('BFG(BZ) 6');
        iditems.push('51');
    
    if (items_group.indexOf('BFG(BZ) 8') == -1)
        items_group.push('BFG(BZ) 8');
        items.push('BFG(BZ) 8');
        iditems.push('52');
    
    if (items_group.indexOf('BFG(BZ) 8') == -1)
        items_group.push('BFG(BZ) 8');
        items.push('BFG(BZ) 8');
        iditems.push('53');
    
    if (items_group.indexOf('BFG(BZ) 8') == -1)
        items_group.push('BFG(BZ) 8');
        items.push('BFG(BZ) 8');
        iditems.push('54');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('55');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('56');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('57');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('58');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('59');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('60');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('61');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('62');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('63');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('64');
    
    if (items_group.indexOf('BL 5') == -1)
        items_group.push('BL 5');
        items.push('BL 5');
        iditems.push('65');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('66');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('67');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('68');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('69');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('70');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('71');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('72');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('73');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('74');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('75');
    
    if (items_group.indexOf('BL 6') == -1)
        items_group.push('BL 6');
        items.push('BL 6');
        iditems.push('76');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('77');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('78');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('79');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('80');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('81');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('82');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('83');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('84');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('85');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('86');
    
    if (items_group.indexOf('BLR 6') == -1)
        items_group.push('BLR 6');
        items.push('BLR 6');
        iditems.push('87');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('88');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('89');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('90');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('91');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('92');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('93');
    
    if (items_group.indexOf('CFG 10') == -1)
        items_group.push('CFG 10');
        items.push('CFG 10');
        iditems.push('94');
    
    if (items_group.indexOf('CFG 12') == -1)
        items_group.push('CFG 12');
        items.push('CFG 12');
        iditems.push('95');
    
    if (items_group.indexOf('CFG 12') == -1)
        items_group.push('CFG 12');
        items.push('CFG 12');
        iditems.push('96');
    
    if (items_group.indexOf('CFG 12') == -1)
        items_group.push('CFG 12');
        items.push('CFG 12');
        iditems.push('97');
    
    if (items_group.indexOf('CFG 12') == -1)
        items_group.push('CFG 12');
        items.push('CFG 12');
        iditems.push('98');
    
    if (items_group.indexOf('CFG 12') == -1)
        items_group.push('CFG 12');
        items.push('CFG 12');
        iditems.push('99');
    
    if (items_group.indexOf('CFG 12') == -1)
        items_group.push('CFG 12');
        items.push('CFG 12');
        iditems.push('100');
    
    if (items_group.indexOf('CFG 15') == -1)
        items_group.push('CFG 15');
        items.push('CFG 15');
        iditems.push('101');
    
    if (items_group.indexOf('CFG 15') == -1)
        items_group.push('CFG 15');
        items.push('CFG 15');
        iditems.push('102');
    
    if (items_group.indexOf('CFG 15') == -1)
        items_group.push('CFG 15');
        items.push('CFG 15');
        iditems.push('103');
    
    if (items_group.indexOf('CFG 15') == -1)
        items_group.push('CFG 15');
        items.push('CFG 15');
        iditems.push('104');
    
    if (items_group.indexOf('CFG 19') == -1)
        items_group.push('CFG 19');
        items.push('CFG 19');
        iditems.push('105');
    
    if (items_group.indexOf('CFG 19') == -1)
        items_group.push('CFG 19');
        items.push('CFG 19');
        iditems.push('106');
    
    if (items_group.indexOf('CFG 19') == -1)
        items_group.push('CFG 19');
        items.push('CFG 19');
        iditems.push('107');
    
    if (items_group.indexOf('CFG 2') == -1)
        items_group.push('CFG 2');
        items.push('CFG 2');
        iditems.push('108');
    
    if (items_group.indexOf('CFG 2') == -1)
        items_group.push('CFG 2');
        items.push('CFG 2');
        iditems.push('109');
    
    if (items_group.indexOf('CFG 3') == -1)
        items_group.push('CFG 3');
        items.push('CFG 3');
        iditems.push('110');
    
    if (items_group.indexOf('CFG 3') == -1)
        items_group.push('CFG 3');
        items.push('CFG 3');
        iditems.push('111');
    
    if (items_group.indexOf('CFG 3') == -1)
        items_group.push('CFG 3');
        items.push('CFG 3');
        iditems.push('112');
    
    if (items_group.indexOf('CFG 3') == -1)
        items_group.push('CFG 3');
        items.push('CFG 3');
        iditems.push('113');
    
    if (items_group.indexOf('CFG 3') == -1)
        items_group.push('CFG 3');
        items.push('CFG 3');
        iditems.push('114');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('115');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('116');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('117');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('118');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('119');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('120');
    
    if (items_group.indexOf('CFG 4') == -1)
        items_group.push('CFG 4');
        items.push('CFG 4');
        iditems.push('121');
    
        warehouse.push('인천창고');
       idwarehouse.push('1');
    
        warehouse.push('김해창고');
       idwarehouse.push('2');
    
        warehouse.push('양산창고');
       idwarehouse.push('3');
    
    $(document).ready(function () {
     
    })
    function bindstandar(name, select) {

        $('.' + select).empty();
      
        $(".it-item-box").each(function (index) {
            var nameit = $(this).attr("nameit");
            if (nameit === name) {
                var standar = $(this).attr("standard");
                var quantityincase = $(this).attr("quantityincase");
                var itemcode = $(this).attr("itemcode");
                var op = "<option quantityincase='" + quantityincase + "' itemcode='" + itemcode + "'>" + standar + "</option>";
                $(op).appendTo('.' + select);
            }
        });

    }
    function bindstandarparent(child, select) {

        var name = $(child).val();
        var parent = $(child).parent().parent();
        var selecta=$(parent).find('.' + select);
        $(selecta).empty();
        $(".it-item-box").each(function (index) {
            var nameit = $(this).attr("nameit");
            if (nameit === name) {
                var standar = $(this).attr("standard");
                var quantityincase = $(this).attr("quantityincase");
                var itemcode = $(this).attr("itemcode");
                var op = "<option quantityincase='" + quantityincase + "' itemcode='" + itemcode + "'>" + standar + "</option>";
                $(op).appendTo(selecta);
            }
        });

    }
    function getaccoutctm(name) {
        var index = ctmer.indexOf(name);
        return accotctm[index];
    }
    function bindqltincase(name,standar,c,ext) {
         $(".it-item-box").each(function (index) {
             var nameit = $(this).attr("nameit");
              var standard = $(this).attr("standard");
            if (nameit === name && standard===standar) {
                var quantityincase = $(this).attr("quantityincase");
                if (ext === "h")
                    $("." + c).html(quantityincase);
                else
                    $("." + c).val(quantityincase);
                return false;
            }
        });
    }
    function setautocustomer(o, c) {
        var a = [];

        var index = emloyer.indexOf(o);

        var id = idemloyer[index];
        $(".hidder-customer option").each(function (index) {
            var namectm = $(this).val();
            if (namectm === id)
                a.push($(this).attr('namectm'))
        })

        setautocompleat($('.' + c), a);
    }
    function findnameworker(id) {
        try {
            var indexname = idemloyer.indexOf(id.toString());
            return emloyer[indexname];
        }
        catch{
            return "";
        }
    }
    function findnameItem(id) {
        try {
            var indexname =iditems.indexOf(id.toString());
            return items[indexname];
        }
        catch{
            return "";
        }

    }
    function findnamewarehouse(id) {
        try {
            var indexname =idwarehouse.indexOf(id.toString());
            return warehouse[indexname];
        }
        catch{
            return "";
        }
    }
    function findnamecompany(id) {
        var indexname = idcpn.indexOf(id.toString());
        return ctmer[indexname];

    }
    function setautocustomertyle(idcode, c) {
        var a = [];

        $(".hidder-customer option").each(function (index) {
            var code = $(this).attr('code');
            if (code === idcode)
                a.push($(this).attr('namectm'))
        })

        setautocompleat($('.' + c), a);
    }
    function bindoptionctm(idcode, c) {
     
        $(".hidder-customer option").each(function (index) {
            var code = $(this).attr('code');
            if (code === idcode) {

                var o = '<option class="option-item">' + $(this).attr("namectm") + '</option>';
                $(o).appendTo("." + c);
            }

        })
    }
     function bindoptionctmfollowwk(idcode, c) {
     
        $(".hidder-customer option").each(function (index) {
            var code = $(this).val();
            if (code === idcode) {

                var o = '<option class="option-item" destinationphone="'+ $(this).attr('destinationphone')+'" phone="'+ $(this).attr('phonenumber')+'" transactionbalance="'+ $(this).attr('transactionbalance') +'" destinationaddress="'+ $(this).attr('destinationaddress') +'">' + $(this).attr("namectm") + '</option>';
                $(o).appendTo("." + c);
            }

        })
    }
    function bindoptionctmfollowAllwk(c) {
     
        $(".hidder-customer option").each(function (index) {
         
                var o = '<option class="option-item" phone="'+ $(this).attr('phonenumber')+'" transactionbalance="'+ $(this).attr('transactionbalance') +'">' + $(this).attr("namectm") + '</option>';
                $(o).appendTo("." + c);
          
        })
    }
    function binddatactm(name, c, style, get) {
        var index = ctmer.indexOf(name);
        var a = $(".hidder-customer option:eq(" + index + ")").attr(get);
        if (style === "h")
            $('.' + c).html(a);
        else if (style === "v")
            $('.' + c).val(a);
    }
    function bindoptionwarehouse(c) {
        var o = "";
        var l = c.split(',');
        for (var i = 0; i < warehouse.length; i++) {
            o += "<option>"+warehouse[i]+"</option>";
        }
        for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }
    function bindoptionworkers(c) {
        var o = "";
        var l = c.split(',');
        for (var i = 0; i < emloyer.length; i++) {
            o += "<option value='"+idemloyer[i]+"'>"+emloyer[i]+"</option>";
        }
        for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }

     function bindoptioncustomers(c) {
         var o = "";
         var l = c.split(',');
        for (var i = 0; i < ctmer.length; i++) {
            o += "<option>"+ctmer[i]+"</option>";
        }
       for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }
    function selectStroptioncustomers(idcpns,vl) {
        var o = "<select style='width:100%' class='sl-option'><option style='display:none'></option>";
         $(".hidder-customer option").each(function (index) {
             var code = $(this).attr('code');
             var n = $(this).attr('namectm');
             if (code === idcpns) {
                 if(n===vl)
                    o += '<option class="option-item" selected>' + $(this).attr("namectm") + '</option>';
                 else
                      o += '<option class="option-item">' + $(this).attr("namectm") + '</option>';

             }
        })
        o += "</select>";

        return o;
    }
     function selectStroptionworker(vl) {
        var o ="<select style='width:100%' class='sl-option'><option style='display:none'></option>";
       
         for (var i = 0; i < emloyer.length; i++) {
             if (vl === emloyer[i])
                 o += "<option selected>"+emloyer[i]+"</option>";
             else
                o += "<option>" + emloyer[i] + "</option>";
        }
         o += "</select>";

        return o;
    }
     function bindoptionwarehouse(c) {
         var o = "";
         var l = c.split(',');
        for (var i = 0; i < warehouse.length; i++) {
            o += "<option>"+warehouse[i]+"</option>";
        }
       for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }
    function getinforItem(iditem) {
        var info = [];
          $(".it-item-box").each(function (index) {
            var idId = $(this).attr("iditem");
           
            if (parseInt(iditem) === parseInt(idId)) {
   
                var itemcode = $(this).attr("itemcode");
                var standard = $(this).attr("standard");
                var nameit = $(this).attr("nameit");
                info = {
                    itemcode: returncode(itemcode,4),
                    standard: standard,
                    nameit: nameit
                };
                return false;
            }
        });
        return info;
    }
</script>
<select class="hidder-customer" style="display: none">
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="AGC" address="" phonenumber="1" transactionbalance="">1</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="한유" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="신신" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="신화" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="태명알미늄" address="" phonenumber="010-4507-0233" transactionbalance="">010-4507-0233</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="정안유리" address="" phonenumber="053-286-6260" transactionbalance="">053-286-6260</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="엘지전자(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="하늘유리" address="" phonenumber="010-4965-6289" transactionbalance="">010-4965-6289</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="LG하우시스(주)" address="" phonenumber="010-6930-0165" transactionbalance="">010-6930-0165</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="신광판유리㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="삼화지엔티㈜" address="" phonenumber="051-751-1155" transactionbalance="">051-751-1155</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="대성유리공업(주)곡성" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="성경티에스(주)" address="" phonenumber="055-353-6667" transactionbalance="">055-353-6667</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="신화(김해)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="명성창호1" address="" phonenumber="051-941-1145" transactionbalance="">051-941-1145</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="아진글라스(주)" address="" phonenumber="051-525-0072" transactionbalance="">051-525-0072</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="명성창호(부산)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="케지티(주)" address="" phonenumber="051-441-6280" transactionbalance="">051-441-6280</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="한라창호" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="영광판유리(주)" address="" phonenumber="055-587-6202" transactionbalance="">055-587-6202</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="대영유리(부산)" address="" phonenumber="051-303-7052" transactionbalance="">051-303-7052</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="한남유리(광주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="한남산업" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="명성유리(부산)" address="" phonenumber="051-973-9681" transactionbalance="">051-973-9681</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="에스제이통상(주)" address="" phonenumber="051-329-8110" transactionbalance="">051-329-8110</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="원일유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="정암안전유리(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="천지유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="대신이엔씨(울산)" address="" phonenumber="052-261-9841" transactionbalance="">052-261-9841</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="아진유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="영성기업" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="호남복층유리(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="대한기업" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="동진창호(주)부산" address="" phonenumber="051-583-8361" transactionbalance="">051-583-8361</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="한성창호유리산업" address="" phonenumber="055-762-5801" transactionbalance="">055-762-5801</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="대한유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="강한유리" address="" phonenumber="055-761-9050" transactionbalance="">055-761-9050</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="정암지앤더블유㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="국영복층유리(부산)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="우주㈜" address="" phonenumber="055-343-6204" transactionbalance="">055-343-6204</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="용진판유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="대헌유리상사" address="" phonenumber="052-269-0621" transactionbalance="">052-269-0621</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="국제유리(김해)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="엔지유솔라앤글로발(울산공장)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="유경유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="세경지텍㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="한국유리(김해)" address="" phonenumber="055-343-8103" transactionbalance="">055-343-8103</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="효성글라스㈜" address="" phonenumber="061-395-1800" transactionbalance="">061-395-1800</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="새한그라스테크㈜" address="" phonenumber="055-353-0901" transactionbalance="">055-353-0901</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="다윈지엠(주)" address="" phonenumber="055-802-7000" transactionbalance="">055-802-7000</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="금강창호기공(주)" address="" phonenumber="052-275-9995" transactionbalance="">052-275-9995</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="동아글라스(주)제주" address="" phonenumber="064-759-8811" transactionbalance="">064-759-8811</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="금창판유리" address="" phonenumber="010-3041-8995" transactionbalance="">010-3041-8995</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="선진유리" address="" phonenumber="051-531-3201" transactionbalance="">051-531-3201</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="현대제경산업" address="" phonenumber="051-325-3200" transactionbalance="">051-325-3200</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="자산유리(주)" address="" phonenumber="031-947-4735" transactionbalance="">031-947-4735</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="에이치에스글라스(HS GLASS)" address="" phonenumber="02-587-6289" transactionbalance="">02-587-6289</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="용진유리공업(포천)" address="" phonenumber="031-544-1523" transactionbalance="">031-544-1523</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="제3글라스텍" address="" phonenumber="031-431-8430" transactionbalance="">031-431-8430</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="용진유리판매(주)" address="" phonenumber="02-988-1523" transactionbalance="">02-988-1523</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="삼보안전유리(주)" address="" phonenumber="043-217-6161" transactionbalance="">043-217-6161</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="이호(주)" address="" phonenumber="041-663-0020" transactionbalance="">041-663-0020</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="미창유리공업(주)" address="" phonenumber="02-856-0963" transactionbalance="">02-856-0963</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="(주)대한거울" address="" phonenumber="063-323-1150" transactionbalance="">063-323-1150</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="경남유리" address="" phonenumber="031-643-6262" transactionbalance="">031-643-6262</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="한길유리(주)" address="" phonenumber="02-575-8819" transactionbalance="">02-575-8819</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="한테크㈜" address="" phonenumber="041-735-7353" transactionbalance="">041-735-7353</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="대일특수유리(주)" address="" phonenumber="043-286-1066" transactionbalance="">043-286-1066</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="삼우지앤티" address="" phonenumber="041-663-4700" transactionbalance="">041-663-4700</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="유진산업㈜" address="" phonenumber="042-546-0601" transactionbalance="">042-546-0601</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="호성유리(주)" address="" phonenumber="02-422-9868" transactionbalance="">02-422-9868</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="자산유리파주지점(주)" address="" phonenumber="031-941-6289" transactionbalance="">031-941-6289</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="동원산업주식회사" address="" phonenumber="041-663-0236" transactionbalance="">041-663-0236</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="동원유리㈜" address="" phonenumber="041-663-0238" transactionbalance="">041-663-0238</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="성진지엠피(주)" address="" phonenumber="031-764-5881" transactionbalance="">031-764-5881</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="신당종합유리㈜" address="" phonenumber="02-2232-7254" transactionbalance="">02-2232-7254</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="세종유리건업" address="" phonenumber="010-5230-5065" transactionbalance="">010-5230-5065</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="정산유리㈜" address="" phonenumber="031-433-4345" transactionbalance="">031-433-4345</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="대한글라스텍" address="" phonenumber="031-977-3464" transactionbalance="">031-977-3464</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="영동알미늄" address="" phonenumber="043-211-0995" transactionbalance="">043-211-0995</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="용운산업" address="" phonenumber="063-432-9991" transactionbalance="">063-432-9991</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="성경글라스 유한회사" address="" phonenumber="063-531-9957" transactionbalance="">063-531-9957</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="에스에이치글라스(주)시흥" address="" phonenumber="031-318-6261" transactionbalance="">031-318-6261</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="SH글라스(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="방이유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="원광유리(주)(광주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="창의인터내셔날㈜" address="" phonenumber="031-565-8493" transactionbalance="">031-565-8493</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="신흥그라스텍(주)" address="" phonenumber="010-3104-6261" transactionbalance="">010-3104-6261</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="태성유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="청원유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="한성유리(의정부／송추)" address="" phonenumber="031-837-0735" transactionbalance="">031-837-0735</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="케이씨씨월드(주)" address="" phonenumber="032-588-3880" transactionbalance="">032-588-3880</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="두현㈜" address="" phonenumber="-1588-8895" transactionbalance="">-1588-8895</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="세일인더스트㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="영동복층유리(주)" address="" phonenumber="031-736-5611" transactionbalance="">031-736-5611</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="유글라스(U GLASS)" address="" phonenumber="070-7767-3353" transactionbalance="">070-7767-3353</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="한빛유리(일산)" address="" phonenumber="010-5430-4234" transactionbalance="">010-5430-4234</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="동화유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="삼호글라스" address="" phonenumber="031-542-1888" transactionbalance="">031-542-1888</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="우신복층유리(하남)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="동국특수유리(양지)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="대광유리(의정부)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="새들그라스" address="" phonenumber="031-236-1789" transactionbalance="">031-236-1789</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="신원유리" address="" phonenumber="031-631-6963" transactionbalance="">031-631-6963</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="영경유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="삼원유리(포천)" address="" phonenumber="031-533-3092" transactionbalance="">031-533-3092</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="대성ENG" address="" phonenumber="031-968-4411" transactionbalance="">031-968-4411</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="아름유리(마석)" address="" phonenumber="031-593-5408" transactionbalance="">031-593-5408</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="원광그라스(주)" address="" phonenumber="031-769-6201" transactionbalance="">031-769-6201</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="삼성종합유리" address="" phonenumber="031-983-6242" transactionbalance="">031-983-6242</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="성원종합유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="우신지엠씨(주)" address="" phonenumber="02-780-2593" transactionbalance="">02-780-2593</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="천일제경" address="" phonenumber="031-527-6646" transactionbalance="">031-527-6646</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="안중제경사" address="" phonenumber="031-914-9745" transactionbalance="">031-914-9745</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="한양유리" address="" phonenumber="010-7663-2607" transactionbalance="">010-7663-2607</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="아름지엘에스(주)" address="" phonenumber="031-534-5408" transactionbalance="">031-534-5408</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="한백그라스" address="" phonenumber="031-972-9505" transactionbalance="">031-972-9505</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="광명기업(용인)" address="" phonenumber="031-334-6113" transactionbalance="">031-334-6113</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="삼양유리산업(주)" address="" phonenumber="031-543-0061" transactionbalance="">031-543-0061</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="신신유리(주)(서울)" address="" phonenumber="02-836-3000" transactionbalance="">02-836-3000</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="칠성글라스텍" address="" phonenumber="031-751-8200" transactionbalance="">031-751-8200</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="원광유리" address="" phonenumber="031-769-6201" transactionbalance="">031-769-6201</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="수정유리공업" address="" phonenumber="031-541-6151" transactionbalance="">031-541-6151</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="동아유리㈜" address="" phonenumber="032-875-8491" transactionbalance="">032-875-8491</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="에이비씨글라스㈜" address="" phonenumber="031-922-0950" transactionbalance="">031-922-0950</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="필텍그라스" address="" phonenumber="02-812-6205" transactionbalance="">02-812-6205</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="한일이엔지(한일ENG)" address="" phonenumber="031-751-6289" transactionbalance="">031-751-6289</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="세광유리" address="" phonenumber="02-503-6204" transactionbalance="">02-503-6204</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="성원종합유리㈜" address="" phonenumber="02-927-7363" transactionbalance="">02-927-7363</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="태산글라스" address="" phonenumber="070-4090-4458" transactionbalance="">070-4090-4458</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="디엘디지글라스㈜" address="" phonenumber="031-541-6151" transactionbalance="">031-541-6151</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="에이치글라스" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="이노글라스㈜" address="" phonenumber="031-748-6200" transactionbalance="">031-748-6200</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="W홀딩컴퍼니 SH글라스(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="대산이앤지㈜" address="" phonenumber="010-9355-1810" transactionbalance="">010-9355-1810</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="광성유리산업(주)" address="" phonenumber="031-527-6230" transactionbalance="">031-527-6230</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="한울G＆P" address="" phonenumber="032-556-6282" transactionbalance="">032-556-6282</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="동진유리산업" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="태원유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="신광유리제경" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="신형유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="동양산업(인천)" address="" phonenumber="032-433-4961" transactionbalance="">032-433-4961</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="신창안전유리(주)인천" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="이화글라스㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="영준유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="민재유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="태광안전유리(주) 지점" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="현대유리(주)덕양" address="" phonenumber="031-979-2713" transactionbalance="">031-979-2713</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="위스㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="삼우이엠씨(주)" address="" phonenumber="02-3673-3343" transactionbalance="">02-3673-3343</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="가인공영㈜" address="" phonenumber="031-989-8791" transactionbalance="">031-989-8791</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="가인" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="태광안전유리.지점(인천)" address="" phonenumber="032-555-7392" transactionbalance="">032-555-7392</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="미광유리(미아)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="신광유리(장안동)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="이도㈜" address="" phonenumber="031-997-6231" transactionbalance="">031-997-6231</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="진성유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="성우유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="동해건업" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="동아은경(주)" address="" phonenumber="02-418-8872" transactionbalance="">02-418-8872</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="화성종합" address="" phonenumber="031-406-4450" transactionbalance="">031-406-4450</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="이화유리" address="" phonenumber="031-953-7708" transactionbalance="">031-953-7708</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="엠코스타" address="" phonenumber="02-988-0030" transactionbalance="">02-988-0030</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="주식회사 대명유리" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="아산비즈니스(주)" address="" phonenumber="02-6000-4942" transactionbalance="">02-6000-4942</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="태광안전유리(주)" address="" phonenumber="032-546-7392" transactionbalance="">032-546-7392</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="신원C＆GT" address="" phonenumber="070-8771-8907" transactionbalance="">070-8771-8907</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="케이산업㈜" address="" phonenumber="041-837-9907" transactionbalance="">041-837-9907</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="삼원그라스카바(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="세광산업" address="" phonenumber="017-341-6424" transactionbalance="">017-341-6424</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="국영지앤엠(주)" address="" phonenumber="02-2015-0328" transactionbalance="">02-2015-0328</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="명진산업유리(주)" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="썬텍글라스(주)" address="" phonenumber="031-998-5961" transactionbalance="">031-998-5961</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="영창유리" address="" phonenumber="010-6231-8378" transactionbalance="">010-6231-8378</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="수글라스" address="" phonenumber="031-356-2443" transactionbalance="">031-356-2443</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="파이텍㈜" address="" phonenumber="031-982-8455" transactionbalance="">031-982-8455</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="특강유리" address="" phonenumber="032-572-4545" transactionbalance="">032-572-4545</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="자산유리글라스" address="" phonenumber="010-3960-1305" transactionbalance="">010-3960-1305</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="지디컴포니" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="영림임업(주)" address="" phonenumber="010-9823-6700" transactionbalance="">010-9823-6700</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="현대중문" address="" phonenumber="010-2070-0000" transactionbalance="">010-2070-0000</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="현대유리(서구)" address="" phonenumber="032-565-7297" transactionbalance="">032-565-7297</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="정선유리" address="" phonenumber="031-997-5404" transactionbalance="">031-997-5404</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="이도글라스" address="" phonenumber="031-997-6231" transactionbalance="">031-997-6231</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="합동하이텍그라스(주)" address="" phonenumber="043-881-8872" transactionbalance="">043-881-8872</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="서울안전유리(주)" address="" phonenumber="049-878-6260" transactionbalance="">049-878-6260</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="성진그라스텍" address="" phonenumber="032-572-0340" transactionbalance="">032-572-0340</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="대창유리" address="" phonenumber="043-881-1204" transactionbalance="">043-881-1204</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="베스트글라스(주)" address="" phonenumber="049-878-2951" transactionbalance="">049-878-2951</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="일영유리제경" address="" phonenumber="033-264-8932" transactionbalance="">033-264-8932</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="우림도어㈜" address="" phonenumber="010-2036-5103" transactionbalance="">010-2036-5103</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="서부유리(대전)" address="" phonenumber="042-532-3398" transactionbalance="">042-532-3398</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="11" namectm="글라스닛시(주)" address="" phonenumber="031-429-6260" transactionbalance="">031-429-6260</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="12" namectm="우진기업(주)" address="" phonenumber="043-846-6262" transactionbalance="">043-846-6262</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="1" namectm="태양유리제경사(전주)" address="" phonenumber="063-272-6244" transactionbalance="">063-272-6244</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="2" namectm="한유에스앤지(주)" address="" phonenumber="02-561-1962" transactionbalance="">02-561-1962</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="3" namectm="DH글라스" address="" phonenumber="070-7786-6240" transactionbalance="">070-7786-6240</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="4" namectm="지오㈜" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="5" namectm="현대안전유리공업(주)" address="" phonenumber="032-569-1803" transactionbalance="">032-569-1803</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="6" namectm="마린아트" address="" phonenumber="010-8686-9933" transactionbalance="">010-8686-9933</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="7" namectm="동아금속 유한회사" address="" phonenumber="063-446-9614" transactionbalance="">063-446-9614</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="8" namectm="대일강화유리" address="" phonenumber="043-842-6261" transactionbalance="">043-842-6261</option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="9" namectm="성광기업" address="" phonenumber="" transactionbalance=""></option>
    
    <option class="option-item op-customer" code="" destinationaddress="" destinationphone="" value="10" namectm="삼경안전유리(주)" address="" phonenumber="043-534-9200" transactionbalance="">043-534-9200</option>
    
</select>
<div id="box-item" style="display:none">
    
            <div class="it-item-box" idItem="3" itemcode="3" nameit="다이아 5" standard="1.830*2.440" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="4" itemcode="4" nameit="다이아 5" standard="1.830*2.440*40" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="5" itemcode="0005" nameit="레인 5" standard="1.830*2.440*40" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="6" itemcode="0006" nameit="모루 5" standard="1.830*2.440*40" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="7" itemcode="0007" nameit="연습 1" standard="10*10*4" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="8" itemcode="0008" nameit="연습 1" standard="10*10*5" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="9" itemcode="0009" nameit="연습 6" standard="11*11*20" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="10" itemcode="0010" nameit="연습1" standard="10*10*3" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="11" itemcode="0011" nameit="오셔닉 5" standard="1.830*2.440*32" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="12" itemcode="0012" nameit="오셔닉 5" standard="1.830*2.440*32" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="13" itemcode="0013" nameit="워터큐브 5" standard="1.830*2.440*32" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="14" itemcode="0014" nameit="초백 4" standard="2.140*3.300*31" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="15" itemcode="0015" nameit="초백 5" standard="2.140*3.300*30" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="16" itemcode="0016" nameit="초백 5" standard="2.140*3.300*26" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="17" itemcode="0017" nameit="초백 5" standard="2.140*3.660*26" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="18" itemcode="0018" nameit="초백 5" standard="2.440*3.300*26" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="19" itemcode="0019" nameit="초백 6" standard="2.140*3.300*25" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="20" itemcode="0020" nameit="초백 8" standard="2.440*3.300*17" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="21" itemcode="0021" nameit="티타늄 0.5-5" standard="1.830*2.440*40" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="22" itemcode="0022" nameit="티타늄 0.9-5" standard="1.830*2.440*40" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="23" itemcode="0023" nameit="ACID 4 논슬립" standard="0.28*0.28*400" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="24" itemcode="0024" nameit="ACID 5-0.5" standard="1.830*2.440*40" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="25" itemcode="0025" nameit="ACID 5-0.7" standard="1.830*2.440*40" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="26" itemcode="0026" nameit="ACID BZ 5-0.7" standard="1.830*2.440*40" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="27" itemcode="0027" nameit="BFG(BZ) 3" standard="2.134*3.050*48" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="28" itemcode="0028" nameit="BFG(BZ) 3" standard="2.286*3.300*44" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="29" itemcode="0029" nameit="BFG(BZ) 3" standard="2.134*3.050*50" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="30" itemcode="0030" nameit="BFG(BZ) 3" standard="2.286*3.050*48" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="31" itemcode="0031" nameit="BFG(BZ) 3" standard="2.286*3.300*45" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="32" itemcode="0032" nameit="BFG(BZ) 3" standard="2.440*3.050*45" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="33" itemcode="0033" nameit="BFG(BZ) 4" standard="2.140*3.300*38" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="34" itemcode="0034" nameit="BFG(BZ) 5" standard="2.134*3.048*32" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="35" itemcode="0035" nameit="BFG(BZ) 5" standard="2.140*3.353*31" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="36" itemcode="0036" nameit="BFG(BZ) 5" standard="2.440*3.353*25" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="37" itemcode="0037" nameit="BFG(BZ) 5" standard="1.830*3.353*31" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="38" itemcode="0038" nameit="BFG(BZ) 5" standard="2.140*3.300*30" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="39" itemcode="0039" nameit="BFG(BZ) 5" standard="1.830*3.353*31" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="40" itemcode="0040" nameit="BFG(BZ) 5" standard="2.140*3.353*31" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="41" itemcode="0041" nameit="BFG(BZ) 5" standard="2.286*3.353*28" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="42" itemcode="0042" nameit="BFG(BZ) 5" standard="2.440*3.353*25" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="43" itemcode="0043" nameit="BFG(BZ) 5" standard="2.134*3.050*31" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="44" itemcode="0044" nameit="BFG(BZ) 5" standard="2.440*3.050*27" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="45" itemcode="0045" nameit="BFG(BZ) 5" standard="2.440*3.353*24" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="46" itemcode="0046" nameit="BFG(BZ) 6" standard="2.440*3.300*21" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="47" itemcode="0047" nameit="BFG(BZ) 6" standard="2.250*3.300*25" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="48" itemcode="0048" nameit="BFG(BZ) 6" standard="2.140*3.300*26" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="49" itemcode="0049" nameit="BFG(BZ) 6" standard="2.140*3.353*25" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="50" itemcode="0050" nameit="BFG(BZ) 6" standard="2.440*3.353*21" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="51" itemcode="0051" nameit="BFG(BZ) 6" standard="2.440*3.660*20" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="52" itemcode="0052" nameit="BFG(BZ) 8" standard="1.830*3.353*20" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="53" itemcode="0053" nameit="BFG(BZ) 8" standard="2.134*3.353*18" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="54" itemcode="0054" nameit="BFG(BZ) 8" standard="2.440*3.353*15" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="55" itemcode="0055" nameit="BL 5" standard="2.140*3.660*30" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="56" itemcode="0056" nameit="BL 5" standard="2.440*3.300*25" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="57" itemcode="0057" nameit="BL 5" standard="2.440*3.330*24" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="58" itemcode="0058" nameit="BL 5" standard="2.140*3.353*31" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="59" itemcode="0059" nameit="BL 5" standard="1.829*3.353*31" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="60" itemcode="0060" nameit="BL 5" standard="1.981*3.353*31" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="61" itemcode="0061" nameit="BL 5" standard="2.134*3.660*30" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="62" itemcode="0062" nameit="BL 5" standard="2.140*3.300*14" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="63" itemcode="0063" nameit="BL 5" standard="2.140*3.353*31" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="64" itemcode="0064" nameit="BL 5" standard="2.440*3.353*25" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="65" itemcode="0065" nameit="BL 5" standard="2.438*3.660*24" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="66" itemcode="0066" nameit="BL 6" standard="1.981*3.353*26" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="67" itemcode="0067" nameit="BL 6" standard="2.440*3.353*21" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="68" itemcode="0068" nameit="BL 6" standard="1.830*3.353*26" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="69" itemcode="0069" nameit="BL 6" standard="1.981*3.353*26" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="70" itemcode="0070" nameit="BL 6" standard="1.981*3.353*26" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="71" itemcode="0071" nameit="BL 6" standard="2.134*3.660*24" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="72" itemcode="0072" nameit="BL 6" standard="2.134*3.660*25" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="73" itemcode="0073" nameit="BL 6" standard="2.140*3.353*26" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="74" itemcode="0074" nameit="BL 6" standard="2.440*3.353*21" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="75" itemcode="0075" nameit="BL 6" standard="2.440*3.353*13" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="76" itemcode="0076" nameit="BL 6" standard="2.440*3.353*17" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="77" itemcode="0077" nameit="BLR 6" standard="1.830*3.353*27" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="78" itemcode="0078" nameit="BLR 6" standard="2.134*3.353*23" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="79" itemcode="0079" nameit="BLR 6" standard="2.440*3.353*20" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="80" itemcode="0080" nameit="BLR 6" standard="1.830*3.300*20" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="81" itemcode="0081" nameit="BLR 6" standard="1.830*3.300*25" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="82" itemcode="0082" nameit="BLR 6" standard="1.981*3.300*25" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="83" itemcode="0083" nameit="BLR 6" standard="2.140*3.300*25" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="84" itemcode="0084" nameit="BLR 6" standard="2.140*3.353*26" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="85" itemcode="0085" nameit="BLR 6" standard="2.440*3.353*14" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="86" itemcode="0086" nameit="BLR 6" standard="2.440*3.353*21" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="87" itemcode="0087" nameit="BLR 6" standard="1.981*3.353*25" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="88" itemcode="0088" nameit="CFG 10" standard="2.440*3.050*13" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="89" itemcode="0089" nameit="CFG 10" standard="2.134*3.660*12" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="90" itemcode="0090" nameit="CFG 10" standard="2.134*3.050*11" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="91" itemcode="0091" nameit="CFG 10" standard="2.134*3.050*15" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="92" itemcode="0092" nameit="CFG 10" standard="2.134*3.353*14" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="93" itemcode="0093" nameit="CFG 10" standard="2.440*3.353*12" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="94" itemcode="0094" nameit="CFG 10" standard="2.440*3.660*11" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="95" itemcode="0095" nameit="CFG 12" standard="1.981*3.050*13" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="96" itemcode="0096" nameit="CFG 12" standard="1.981*3.660*11" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="97" itemcode="0097" nameit="CFG 12" standard="2.134*3.050*12" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="98" itemcode="0098" nameit="CFG 12" standard="2.134*3.660*10" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="99" itemcode="0099" nameit="CFG 12" standard="2.440*3.050*11" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="100" itemcode="0100" nameit="CFG 12" standard="2.440*3.660*9" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="101" itemcode="0101" nameit="CFG 15" standard="2.140*3.300*9" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="102" itemcode="0102" nameit="CFG 15" standard="2.440*3.300*9" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="103" itemcode="0103" nameit="CFG 15" standard="2.440*3.300*8" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="104" itemcode="0104" nameit="CFG 15" standard="2.440*3.300*8" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="105" itemcode="0105" nameit="CFG 19" standard="2.140*3.660*7" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="106" itemcode="0106" nameit="CFG 19" standard="2.440*3.300*6" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="107" itemcode="0107" nameit="CFG 19" standard="2.140*3.300*7" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="108" itemcode="0108" nameit="CFG 2" standard="1.220*1.016*220" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="109" itemcode="0109" nameit="CFG 2" standard="1.220*1.530*200" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="110" itemcode="0110" nameit="CFG 3" standard="1.830*3.050*60" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="111" itemcode="0111" nameit="CFG 3" standard="1.830*2.440*75" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="112" itemcode="0112" nameit="CFG 3" standard="1.829*3.048*52" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="113" itemcode="0113" nameit="CFG 3" standard="2.134*3.048*43" quantityincase="33"></div>
    
            <div class="it-item-box" idItem="114" itemcode="0114" nameit="CFG 3" standard="2.134*3.048*44" quantityincase="34"></div>
    
            <div class="it-item-box" idItem="115" itemcode="0115" nameit="CFG 4" standard="1.981*3.353*37" quantityincase="35"></div>
    
            <div class="it-item-box" idItem="116" itemcode="0116" nameit="CFG 4" standard="1.981*3.353*37" quantityincase="36"></div>
    
            <div class="it-item-box" idItem="117" itemcode="0117" nameit="CFG 4" standard="1.981*3.050*23" quantityincase="37"></div>
    
            <div class="it-item-box" idItem="118" itemcode="0118" nameit="CFG 4" standard="1.981*3.353*37" quantityincase="38"></div>
    
            <div class="it-item-box" idItem="119" itemcode="0119" nameit="CFG 4" standard="1.981*3.050*41" quantityincase="39"></div>
    
            <div class="it-item-box" idItem="120" itemcode="0120" nameit="CFG 4" standard="2.134*3.050*38" quantityincase="40"></div>
    
            <div class="it-item-box" idItem="121" itemcode="0121" nameit="CFG 4" standard="1.981*3.353*36" quantityincase="33"></div>
    
</div>
        <div id="wrapper">
            



    <!-- MAIN -->
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>구매전표관리</h2>

<!-- 발주, 통관/입고 버튼들 ==================================================================================== -->
                            <ul class="ul-button" style="">
                                <li>
                                    <div class="div-btn-header" onclick="balju_new()"><span class="span-title">신규(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_save()"><span class="span-title">저장(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_del()"><span class="span-title">삭제(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_row_add()"><span class="span-title">행추가(N)</span></div>
                                </li>
                                <li>
                                    <div class="div-btn-header" onclick="balju_row_del()"><span class="span-title">행삭제(N)</span></div>
                                </li>

                                <li>
                                    <div class="div-btn-header" onclick="opentpopuppayment()"><span class="span-title">지급</span></div>
                                </li>

                            </ul>
<div class="fixedScroll">
<!-- 전표리스트 ==================================================================================== -->
                                <table id="grid1"></table>
                                <div id="grid1_pager"></div>
<!-- 전표 ======================================================================================== -->
                                <table class="responsive-table tb_bill tablepopup none_border" style="width: unset">
                                    <tbody>
                                        <tr>
                                            <td>전표번호</td>
                                            <td><input type="text" id="jpno" readonly="readonly" />차수<input type="text" id="chasu" readonly="readonly" />공통전표<input type="text" id="cjpno" readonly="readonly" /></td>
                                            <td>전표구분</td>
                                            <td><select id="gucd" disabled="disabled"></select></td>
                                        </tr>
                                        <tr>
                                            <td>발주일자</td>
                                            <td><input type="text" id="jpdt" class="datecombo"/></td>
                                            <td>발주 담당</td>
                                            <td><input id="userid" type="hidden"/><input id="usernm" type="text"/><input type="button" value="검색" onclick="pop_user($('#usernm').val(), 'userid', 'usernm')" /></td>
                                        </tr>
                                        <tr>
                                            <td>거래사명</td>
                                            <td><input id="custcd" type="hidden"/><input id="custnm" type="text"/><input type="button" value="검색" onclick="pop_cust($('#custnm').val(), 'custcd', 'custnm', 'tel')" /></td>
                                            <td>고객사 연락처</td>
                                            <td><input id="tel" type="text"/></td>
                                        </tr>
                                        <tr>   
                                            <td>거래조건/TERMS</td>
                                            <td><select id="termcd"></select></td>
                                            <td>입고 창고</td>
                                            <td><select id="whcd"></select></td>
                                        </tr>
                                        <tr>
                                            <td>계약일(P/I date)</td>
                                            <td><input id="pidt" type="text"  class="datecombo"/></td>
                                            <td>미지급금</td>
                                            <td><input id="janamt" type="text" class="inputmoney inputmoney-manager" style="width: 100%" /></td>
                                        </tr>
                                        <tr>
                                            <td>P/I no</td>
                                            <td><input id="pino" type="text" /></td>
                                            <td>발주 확인</td>
                                            <td><input id="bcheckdt" type="text" class="datecombo" /></td>
                                        </tr>
                                        <tr>
                                            <td>Payment</td>
                                            <td><select id="paycd"></select></td>
                                            <td>L/C, T/T date</td>
                                            <td><input id="paydt" type="text"  class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>L/C no</td>
                                            <td><input id="lcno" type="text" /></td>
                                            <td>신용장만기일(E/D)</td>
                                            <td><input id="mandt" type="text"  class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>B/L no</td>
                                            <td><input id="blno" type="text" /></td>
                                            <td>선적기일(S/D)</td>
                                            <td><input id="shipdt" type="text"   class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>AMT</td>
                                            <td><input id="amt" type="text" /></td>
                                            <td>출항예정일(ETD)</td>
                                            <td><input id="chuldt" type="text"  class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>TOLERANCE %</td>
                                            <td><input id="tolper" type="text" style="width: 33px" /></td>
                                            <td>입항예정일(ETA)</td>
                                            <td><input id="ipdt" type="text" class="datecombo"/></td>
                                        </tr>
                                        <tr>
                                            <td>TOLERANCE AMT</td>
                                            <td><input id="tolamt" type="text" /></td>
                                            <td>CON 반납기일(F/T)</td>
                                            <td><input id="conbandt" type="text"  class="datecombo" onchange="bindcontainerday(this)" /></td>
                                        </tr>
                                        <tr>
                                            <td>USANCE</td>
                                            <td><input id="usance" type="text"/></td>
                                            <td>운송사/선사</td>
                                            <td><input id="shipnm" type="text"/></td>
                                        </tr>
                                        <tr>
                                            <td>발주 비고</td>
                                            <td colspan="3"><input id="rmk" type="text"/></td>
                                        </tr>
                                    </tbody>
                                </table>
<!-- 구매전표상세 ==================================================================================== -->
                                <table id="grid2"></table>
                                <div id="grid2_pager"></>
</div>
				    </div>
			    </div>
		    </div>
	    </div> 
    </div>
    <!-- //MAIN -->


    <script>
        var jpno = 'P20190624001';
        $(document).ready(function () {
            $.jgrid.defaults.responsive = true;
            //jpno = $('#jpno').val();
            //if (jpno == '') jpno = '';
            $('#termcd').zentSetCombo('C001', '', '==선택==');
            $('#curcd').zentSetCombo('C002', '', '==선택==');
            $('#whcd').zentSetComboWhcd('', '==선택==');
            $('#paycd').zentSetCombo('C003', '', '==선택==');
            $('#gucd').zentSetCombo('C006', '', '==선택==');
            var string_scd   = combo_code_string('C010', '', '==선택==');
            var string_curcd = combo_code_string('C002', '', '==선택==');
            var string_ckcd  = combo_code_string('C005', '', '==선택==');
            //=====================================================================
            //grid setting
            //=====================================================================
            jQuery("#grid1").jqGrid({
                colNames: ['전표번호', '구분', '차수', '공통전표', 'TERMS', '발주담당', '거래사명', '입고창고', 'P/I date', '입항예정일', '통관예정일', '통관확인',
                    '입고확인', '품목명', '규격', '매수', '수량(B)', 'B/L no', 'C/K', 'F/T', 'CON 반납일', '입고요청일', '입고일', '발주비고'],
                colModel: [
                      { name: "jpno", index: "jpno", width: 100 }
                    , { name: "gucd", index: "gucd", width: 100 }
                    , { name: "chasu", index: "chasu", width: 100 }
                    , { name: "cjpno", index: "cjpno", width: 100 }
                    , { name: "termcd", index: "termcd", width: 100 }
                    , { name: "usernm", index: "usernm", width: 100 }
                    , { name: "custnm", index: "custnm", width: 100 }
                    , { name: "whnm", index: "whnm", width: 100 }
                    , { name: "pidt", index: "pidt", width: 100 }
                    , { name: "ipdt", index: "ipdt", width: 100 }
                    , { name: "tongdt", index: "tongdt", width: 100 }
                    , { name: "passdt", index: "passdt", width: 100 }
                    , { name: "inchecktime", index: "inchecktime", width: 100 }
                    , { name: "itemnm", index: "itemnm", width: 100 }
                    , { name: "spec", index: "spec", width: 100 }
                    , { name: "qty", index: "qty", width: 100 }
                    , { name: "boxqty", index: "boxqty", width: 100 }
                    , { name: "blno", index: "blno", width: 100 }
                    , { name: "ckcd", index: "shipdt", width: 100 }
                    , { name: "ftdt", index: "chuldt", width: 100 }
                    , { name: "conbandt", index: "ipdt", width: 100 }
                    , { name: "inyodt", index: "inyodt", width: 100 }
                    , { name: "incheckdt", index: "incheckdt", width: 100 }
                    , { name: "rmk", index: "rmk", width: 100 }
                ],

                //forceFit: true,
                //cellEdit: true,
                //cellsubmit: 'clientArray',
                onSelectRow: function (rowid, status, e) {
                    jpno = $('#grid1').jqGrid('getCell', rowid, 'jpno');
                    balju_selone();
                },
                //rowNum: 10,
                //rowList: [10, 20, 30],
                //pager: '#pager2',
                //sortname: 'id',
                viewrecords: true,
                //sortorder: "desc",
                height : 100,
                caption: ""
            });
            jQuery("#grid1").jqGrid('navGrid', '#grid1_pager', { edit: false, add: false, del: false });


            var lastsel;
            jQuery("#grid2").jqGrid({
                colNames: ['mode', '전표', '번호', '품목코드', '품목명', '규격', '매수', '수량(B)', '수정전표', '화폐단위', '단가', '공급가액', '부가세', '합계 금액', '수량(C)', 'SQM', '항목비고',
                    '품목통관 예정일', '품목 통관일', 'PORT', 'CON No', '원산지증명서', 'C/K', 'F/T', 'CON반납일',
                    '입고요청일', '입고확인', '시리얼 No', 'PROD code', 'CASE nom', 'PROD date'
                ],
                //formatter: {
                //    number: { decimalSeparator: ".", thousandsSeparator: ",", decimalPlaces: 4, defaultValue: '0.00' }
                //},
                colModel: [
                      { name: "mode", index: "mode", width: 100, editable: false }
                    , { name: "jpno", index: "jpno", width: 100, editable: false }
                    , { name: "jpseq", index: "jpseq", width: 100, editable: false }
                    , { name: "itemcd", index: "itemcd", width: 100, editable: false }
                    , { name: "itemnm", index: "itemnm", width: 100, editable: true, sortable: false, resizable: false}
                    , { name: "spec", index: "spec", width: 100, editable: false }
                    , { name: "qty", index: "qty", width: 100, editable: false }
                    , { name: "boxqty", index: "boxqty", width: 100, editable: true }
                    , { name: "scd", index: "scd", width: 100, editable: true, formatter: "select", edittype: "select", editoptions: { value: string_scd } }
                    , { name: "curcd", index: "curcd", width: 100, editable: true, formatter: "select", edittype: "select", editoptions: { value: string_curcd } }
                    , { name: "unitprice", index: "unitprice", width: 100, editable: true }
                    , { name: "supplyamt", index: "supplyamt", width: 100, editable: true }
                    , { name: "vat", index: "vat", width: 100, editable: true }
                    , { name: "totamt", index: "totamt", width: 100, editable: true, formatter: "int"
                    }  //editoptions 종료, 칼럼정의 종료
                    , { name: "conqty", index: "conqty", width: 100, editable: true }
                    , { name: "sqm", index: "sqm", width: 100, editable: true }
                    , { name: "rmk", index: "rmk", width: 100, editable: true }
                    , { name: "tongdt", index: "tongdt", width: 100, editable: true }
                    , { name: "passdt", index: "passdt", width: 100, editable: true }
                    , { name: "port", index: "port", width: 100, editable: true }
                    , { name: "conno", index: "conno", width: 100, editable: true }
                    , { name: "docno", index: "docno", width: 100, editable: true }
                    , { name: "ckcd", index: "ckcd", width: 100, editable: true, formatter: "select", edittype: "select", editoptions: { value: string_ckcd } } 
                    , { name: "ftdt", index: "ftdt", width: 100, editable: true }
                    , { name: "conbandt", index: "conbandt", width: 100, editable: true }
                    , { name: "inyodt", index: "inyodt", width: 100, editable: true }
                    , { name: "incheckdt", index: "incheckdt", width: 100, editable: true }
                    , { name: "sno", index: "sno", width: 100, editable: true }
                    , { name: "prodcd", index: "prodcd", width: 100, editable: true }
                    , { name: "casenom", index: "casenom", width: 100, editable: true }
                    , { name: "proddt", index: "proddt", width: 100, editable: true }
                ],
                onSelectRow: function (rowid, status, e) {
                    var $this = $(this);

                    //$this.jqGrid('setGridParam', { cellEdit: true });
                    //$this.jqGrid('editCell', iRow, iCol, true);
                    //$this.jqGrid('setGridParam', { cellEdit: false });
                    //if (rowid && rowid !== lastsel) {
                    //    jQuery('#grid2').jqGrid('restoreRow', lastsel);
                    //    jQuery('#grid2').jqGrid('editRow', rowid, true);
                    //    lastsel = rowid;
                    //}
                },
                //loadonce: true,
                //gridview: true,
                forceFit: true,
                shrinkToFit: false,
                rownumbers: true,                datatype: 'json',                //viewrecords: false,                //height: 'auto',                cellEdit: true,                //editurl: null,                //cellurl: null,
                //cellsubmit: 'clientArray',
                //afterSaveCell: function (rowid, cellname, value, iRow, iCol) {
                //    //if (cellname == "totamt") {
                //    //    var totamt = value;
                //    //    if (totamt == '0' || totamt == '') return;
                //    //    var supplyamt = parseInt(totamt / 1.1);
                //    //    var vat = totamt - supplyamt;
                //    //    $("#grid2").jqGrid('setRowData', rowid, { 'supplyamt': supplyamt });
                //    //    $("#grid2").jqGrid('setRowData', rowid, { 'vat': vat });
                //    //}
                //},
                //afterEditCell: function (rowid, cellname, value, iRow, iCol) {
                //    //if (cellname == 'tongdt') { $("#" + iRow + "_tongdt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //if (cellname == 'passdt') { $("#" + iRow + "_passdt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //if (cellname == 'ftdt') { $("#" + iRow + "_ftdt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //if (cellname == 'conbandt') { $("#" + iRow + "_conbandt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //if (cellname == 'inyodt') { $("#" + iRow + "_inyodt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //if (cellname == 'indt') { $("#" + iRow + "_indt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //if (cellname == 'proddt') { $("#" + iRow + "_proddt", "#grid2").datepicker({ dateFormat: "yy.mm.dd" }); }
                //    //$("#" + rowid + "_" + cellname).blur(function () {
                //    //    $("#tong_grid").jqGrid("saveCell", iRow, iCol);
                //    //});
                //},
                ///*
                //afterEditCell: function (id, name, val, iRow, iCol) {
                //    if (name == 'invdate') {
                //        jQuery("#" + iRow + "_invdate", "#list").datepicker({ dateFormat: "yy-mm-dd" });
                //    }
                //},
                //*/
                //ondblClickRow: function (rowid, row, col) {
                //    //var cm = jQuery("#grid2").jqGrid("getGridParam", "colModel");
                //    //if (cm[col].name == "itemnm") {
                //    //    var searchword = $('#grid2').jqGrid('getCell', rowid, 'itemnm');
                //    //    var cjpno = $('#cjpno').val();
                //    //    var gucd = $('#gucd').val();
                //    //    if (gucd == "B") {
                //    //        pop_item('', 'grid2', rowid);
                //    //    }
                //    //    else {
                //    //        pop_item_buy('', 'grid2', rowid, cjpno);
                //    //    }
                //    //}
                //    //return false;
                //},
                //rowNum: 10,
                //rowList: [10, 20, 30],
                //pager: '#pager2',
                //sortname: 'id',

                //sortorder: "desc",
                height: 80,
                caption: ""
            });
            jQuery("#grid2").jqGrid('navGrid', '#grid2_pager', { edit: false, add: false, del: false });
            $("#grid2 > .ui-jqgrid-titlebar").hide();
            $("#grid2  > .ui-jqgrid-titlebar").hide();
            $("#grid2 > .ui-jqgrid-titlebar").hide();

            fn_search();
        });

        //===============================================================
        // 검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'jpno': jpno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $('#grid1')[0].addJSONData(JSON.parse(data.d));
                    var count = $("#grid1").getGridParam("reccount");
                    if (count > 0) {
                        var rowid = $("#grid1").getDataIDs()[0];
                        var cjpno = $('#grid1').getCell(rowid, 'cjpno');
                        $('#cjpno').val(cjpno);
                    }
                    else {
                        $('#cjpno').val('');
                    }
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function balju_selone() {
            var param = JSON.stringify({ 'jpno': jpno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    $('#jpno').val(result[0].jpno);
                    $('#chasu').val(result[0].chasu);
                    $('#gucd').val(result[0].gucd);
                    $('#jpdt').val(result[0].jpdt);
                    $('#userid').val(result[0].userid);
                    $('#usernm').val(result[0].usernm);
                    $('#custcd').val(result[0].custcd);
                    $('#custnm').val(result[0].custnm);
                    $('#tel').val(result[0].tel);
                    $('#termcd').val(result[0].termcd);
                    $('#whcd').val(result[0].whcd);
                    $('#pidt').val(result[0].pidt);
                    $('#janamt').val(result[0].janamt);
                    $('#pino').val(result[0].pino);
                    $('#bcheckdt').val(result[0].bcheckdt);
                    $('#paycd').val(result[0].paycd);
                    $('#paydt').val(result[0].paydt);
                    $('#lcno').val(result[0].lcno);
                    $('#mandt').val(result[0].mandt);
                    $('#blno').val(result[0].blno);
                    $('#shipdt').val(result[0].shipdt);
                    $('#amt').val(result[0].amt);
                    $('#chuldt').val(result[0].chuldt);
                    $('#tolper').val(result[0].tolper);
                    $('#ipdt').val(result[0].ipdt);
                    $('#tolamt').val(result[0].tolamt);
                    $('#conbandt').val(result[0].conbandt);
                    $('#usance').val(result[0].usance);
                    $('#shipnm').val(result[0].shipnm);
                    $('#rmk').val(result[0].rmk);
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            balju_select_detail();
        }
        function balju_select_detail() {
            var param = JSON.stringify({ 'jpno': jpno });

            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_detail_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $('#grid2')[0].addJSONData(JSON.parse(data.d));
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }

        function tong_selone(tongno) {
            var param = JSON.stringify({ 'tongno': tongno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/tong_selone",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //초기화 
                    var result = JSON.parse(data.d);
                    $('#t_tongno').val(result[0].tongno);
                    $('#t_jpno').val(jpno);
                    $('#paycd').val(result[0].paycd);
                    $('#lcno').val(result[0].lcno);
                    $('#amt').val(result[0].amt);
                    $('#tolper').val(result[0].tolper);
                    $('#tolamt').val(result[0].tolamt);
                    $('#usance').val(result[0].t_usance);
                    $('#paydt').val(result[0].paydt);
                    $('#mandt').val(result[0].mandt);
                    $('#t_shipdt').val(result[0].blno);
                    $('#shipdt').val(result[0].shipdt);
                    $('#chuldt').val(result[0].chuldt);
                    $('#ipdt').val(result[0].ipdt);
                    $('#conbandt').val(result[0].conbandt);
                    $('#shipnm').val(result[0].shipnm);
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    //alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
            tong_detail_select(tongno);
        }
        function tong_detail_select(tongno) {
            var param = JSON.stringify({ 'tongno': tongno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/tong_detail_search",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $('#tong_grid')[0].addJSONData(JSON.parse(data.d));
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function tong_detail_select_new() {
            var param = JSON.stringify({ 'jpno': jpno });
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/tong_detail_search_new",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    $('#tong_grid')[0].addJSONData(JSON.parse(data.d));
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
        function balju_init() {
            $('#jpno').val('');
            $('#chasu').val('');
            $('#gucd').val('');
            $('#jpdt').val('');
            $('#userid').val('');
            $('#usernm').val('');
            $('#custcd').val('');
            $('#custnm').val('');
            $('#tel').val('');
            $('#termcd').val('');
            $('#whcd').val('');
            $('#pidt').val('');
            $('#janamt').val('');

            $('#pino').val('');
            $('#bcheckdt').val('');
            $('#paycd').val('');
            $('#paydt').val('');
            $('#lcno').val('');
            $('#mandt').val('');
            $('#blno').val('');
            $('#shipdt').val('');
            $('#amt').val('');
            $('#chuldt').val('');
            $('#tolper').val('');
            $('#ipdt').val('');
            $('#tolamt').val('');
            $('#conbandt').val('');
            $('#usance').val('');
            $('#shipnm').val('');
            $('#rmk').val('');
            $('#grid2').clearGridData();
        }
        //===============================================================
        // 버튼~~(구매전표)
        //===============================================================
        function balju_new() {
            balju_init();
        }
        var param_del = [];
        function balju_save() {
            //var rowid_list = jQuery("#grid2").jqGrid('getDataIDs');
            //for (var i = 0; i < rowid_list.length; i++) {
            //    var rowid = rowid_list[i];
            //    //$('#grid2').jqGrid('saveRow', rowid);
            //    //$("#grid2").saveRow(rowid, true, 'clientArray');
            //    $("#grid2").jqGrid('saveRow', rowid);
            //}
            //return;
            //$('#grid2').jqGrid('saveRow', capturedIdOfRowInEditMode);
            //$("#grid2").saveRow(jqMFPLastRowId, true, 'clientArray');
            //alert('111');
            var param = {};
            param.jpno = $.trim($("#jpno").val());
            param.chasu = $.trim($("#chasu").val());
            param.cjpno = $.trim($("#cjpno").val());
            param.gucd = $.trim($("#gucd").val());
            param.jpdt = $.trim($("#jpdt").val());
            param.termcd = $.trim($("#termcd").val());
            param.pidt = $.trim($("#pidt").val());
            param.userid = $.trim($("#userid").val());
            param.custcd = $.trim($("#custcd").val());
            param.whcd = $.trim($("#whcd").val());
            param.janamt = $.trim($("#janamt").val());
            param.pino = $.trim($("#pino").val());
            param.bcheckdt = $.trim($("#bcheckdt").val());
            param.paycd = $.trim($("#paycd").val());
            param.paydt = $.trim($("#paydt").val());
            param.lcno = $.trim($("#lcno").val());
            param.amt = $.trim($("#amt").val());
            param.tolper = $.trim($("#tolper").val());
            param.tolamt = $.trim($("#tolamt").val());
            param.usance = $.trim($("#usance").val());
            param.mandt = $.trim($("#mandt").val());
            param.blno = $.trim($("#blno").val());
            param.shipdt = $.trim($("#shipdt").val());
            param.chuldt = $.trim($("#chuldt").val());
            param.ipdt = $.trim($("#ipdt").val());
            param.conbandt = $.trim($("#conbandt").val());
            param.shipnm = $.trim($("#shipnm").val());
            param.rmk = $.trim($("#rmk").val());
            //if (param.jpdt   == '') { alert('발주일자를 입력해주세요!'); return; }
            //if (param.userid == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
            var param = JSON.stringify(param);
            //validate check == detail
            var param2 = [];
            for (var i = 0; i < param_del.length; i++) {
                param2.push(param_del[i]);
            }
            var row = $('#grid2').getRowData();
            for (var i = 0; i < row.length; i++) {
                param2.push(row[i]);
            }
            param2 = JSON.stringify(param2);
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_save",
                data: JSON.stringify({ 'param': param, 'param2': param2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        jpno = result.val;
                        balju_init();
                        fn_search();
                        balju_selone();
                        alert('저장되었습니다');
                    }
                    else { alert("저장오류!"); return; }

                },
                error: function (request, status, error) {
                    //alert(100);
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function balju_del() {  
            var param = {};
            param.jpno = $.trim($("#jpno").val());
            if (param.jpno == '') {
                alert('해당 전표는 등록되지 않은 전표 입니다!'); return;
            }
            var param = JSON.stringify(param);
            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/balju_del",
                data: JSON.stringify({ 'param': param }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //var table = $('#grid21').DataTable();
                    //table.clear().rows.add(JSON.parse(data.d)).draw();
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        balju_init();
                        var count = $("#grid1").getGridParam("reccount");
                        if (count > 0) {
                            var rowid = $("#grid1").getDataIDs()[0];
                            var cjpno = $('#grid1').getCell(rowid, 'cjpno');
                            $('#cjpno').val(cjpno);
                            jpno = $('#grid1').getCell(rowid, 'jpno');
                        }
                        else {
                            $('#cjpno').val('');
                        }
                        fn_search();
                        alert('삭제 되었습니다');
                    }
                    else { alert("저장오류!"); return; }
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function balju_row_add() {
            var rowData = {
                      "mode"      : 'I'
                    , "jpno"      : ''
                    , "jpseq"     : ''
                    , "itemcd"    : ''
                    , "itemnm"    : ''
                    , "spec"      : ''
                    , "qty"       : ''
                    , "boxqty"    : ''
                    , "scd"       : ''
                    , "curcd"     : ''
                    , "unitprice" : ''
                    , "supplyamt" : ''
                    , "vat"       : ''
                    , "totamt"    : ''
                    , "conqty"    : ''
                    , "sqm"       : ''
                    , "rmk"       : ''
                    , "tongdt"    : ''
                    , "passdt"    : ''
                    , "port"      : ''
                    , "conno"     : ''
                    , "docno"     : ''
                    , "ckcd"      : ''
                    , "ftdt"      : ''
                    , "conbandt"  : ''
                    , "inyodt"    : ''
                    , "indt"      : ''
                    , "sno"       : ''
                    , "prodcd"    : ''
                    , "casenom"   : ''
                    , "proddt"    : '' 

            }
            var rowid = $("#grid2").getGridParam("reccount"); // 페이징 처리 시 현 페이지의 Max RowId 값
            $("#grid2").jqGrid("addRowData", rowid + 1, rowData, 'last'); // 마지막 행에 Row 추가
        }
        function balju_row_del() {
            var rowid = $('#grid2').jqGrid('getGridParam', 'selrow');
            if (rowid == undefined) { alert('선택된 행이 없습니다'); return; }

            var row = $("#grid2").jqGrid('getRowData', rowid);
            if (row.jpseq != '') {
                row.mode = 'D';
                param_del.push(row);
            }
            $("#grid2").jqGrid("delRowData", rowid); // 행 삭제
        }
        //===============================================================
        // 버튼~~(통관전표)
        //===============================================================
        function tong_new() {
            if (jpno == '') { alert('구매전표가 존재하지 않습니다'); return; }
            tong_init();
            tong_detail_select_new();
        }
        function tong_save() {
            if (jpno == '') { alert('구매전표가 존재하지 않습니다'); return; }
            //validate check == master
            var param = {};
            param.tongno = $.trim($('#t_tongno').val());
            param.jpno = jpno;
            param.paycd = $.trim($('#paycd').val());
            param.lcno = $.trim($('#lcno').val());
            param.amt = $.trim($('#amt').val());
            param.tolper = $.trim($('#tolper').val());
            param.tolamt = $.trim($('#tolamt').val());
            param.t_usance = $.trim($('#usance').val());
            param.paydt = $.trim($('#paydt').val());
            param.mandt = $.trim($('#mandt').val());
            param.blno = $.trim($('#blno').val());
            param.shipdt = $.trim($('#shipdt').val());
            param.chuldt = $.trim($('#chuldt').val());
            param.ipdt = $.trim($('#ipdt').val());
            param.conbandt = $.trim($('#conbandt').val());
            param.shipnm = $.trim($('#shipnm').val());

            //if (param.orderdt == '') { alert('발주일자를 입력해주세요!'); return; }
            //if (param.userid == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
            //if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
            //if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
            var param = JSON.stringify(param);
            //validate check == detail
            var param2 = [];
            var row = $('#tong_grid').getRowData();

            for (var i = 0; i < row.length; i++) {
                param2.push(row[i]);
            }
            param2 = JSON.stringify(param2);

            $.ajax({
                type: "POST",
                url: "/page2/page21_svc.asmx/tong_save",
                data: JSON.stringify({ 'param': param, 'param2': param2 }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    //var table = $('#grid21').DataTable();
                    //table.clear().rows.add(JSON.parse(data.d)).draw();
                    var result = JSON.parse(data.d);
                    if (result.code == "OK") {
                        //alert(result.val);
                        tong_init();
                        tong_select();
                    }
                    else { alert("저장오류!"); return; }

                },
                error: function (request, status, error) {
                    //alert(100);
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
        function tong_del() {
        }
        //===============================================================
        // 기타 함수
        //===============================================================
        function pop_result_item_grid(param) {
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm );
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'spec', param.spec);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'qty', param.qty);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        }
        function pop_result_item_grid2(param) {
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemcd', param.itemcd);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'itemnm', param.itemnm);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'spec', param.spec);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'qty', param.qty);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'boxqty', param.boxqty);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'curcd', param.curcd);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'unitprice', param.unitprice);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'supplyamt', param.supplyamt);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'vat', param.vat);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'totamt', param.totamt);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'conqty', param.conqty);
            $("#" + pop_item_name).jqGrid('setCell', pop_item_row, 'sqm', param.sqm);
        }
    </script>

    <div class="htr_bill" style="display: none; width: 140px; position: absolute; top: 0; background: #d8d6d3; padding: 5px; border: 1px solid;">
    </div>


                </div>




</body>
</html>
