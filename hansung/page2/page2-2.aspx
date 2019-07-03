<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page2-2.aspx.cs" Inherits="hansung.page2.page2_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2> 조회</h2>
<!-- 전표리스트 ==================================================================================== -->
                            <table id="grid1"></table>
                            <div id="grid1_pager"></>

				    </div>
			    </div>
		    </div>
	    </div> 
    </div>

    <script>
        $(document).ready(function () {

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
                    //balju_selone();
                },
                ondblClickRow: function (rowid, row, col) {
                    var cm = jQuery("#grid1").jqGrid("getGridParam", "colModel");
                    if (cm[col].name != "itemname") {
                        var jpno = $('#grid1').jqGrid('getCell', rowid, 'jpno');
                        location.href = '/page2/page2-1.aspx?jpno=' + jpno;
                    }
                },
                //rowNum: 10,
                //rowList: [10, 20, 30],
                //pager: '#pager2',
                //sortname: 'id',
                viewrecords: true,
                //sortorder: "desc",
                height: 100,
                caption: ""
            });
            jQuery("#grid1").jqGrid('navGrid', '#grid1_pager', { edit: false, add: false, del: false });
            fn_search();
        });
        //===============================================================
        // 검색
        //===============================================================
        function fn_search() {
            var param = JSON.stringify({ 'jpno': '' });
            $.ajax({
                type: "POST",
                url: "/page2/page2_svc_search.asmx/page22_search",
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
