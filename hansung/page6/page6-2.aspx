<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page6-2.aspx.cs" Inherits="hansung.page6.page6_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>불량전표조회</h2>
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
                colNames: ['전표번호', '불량처리담당', '불량처리창고',
                    '불량처리형식', '불량처리승인', '품목코드',
                    '품목명', '규격', '매수',
                    '수량(B)', '시리얼 No', '불량유형',
                    '불량처리비고'],
                colModel: [
                    { name: "stno", index: "stno", width: 100 }
                    , { name: "userid", index: "userid", width: 100 }
                    , { name: "outwhcd", index: "outwhcd", width: 100 }

                    , { name: "bccd", index: "bccd", width: 100 }
                    , { name: "apprdt", index: "apprdt", width: 100 }
                    , { name: "itemcd", index: "itemcd", width: 100 }

                    , { name: "itemnm", index: "itemnm", width: 100 }
                    , { name: "spec", index: "spec", width: 100 }
                    , { name: "qty", index: "qty", width: 100 }

                    , { name: "cqty", index: "cqty", width: 100 }
                    , { name: "sno", index: "sno", width: 100 }
                    , { name: "falsecd", index: "falsecd", width: 100 }

                    , { name: "rmk", index: "rmk", width: 100 }
                ],

                //forceFit: true,
                //cellEdit: true,
                //cellsubmit: 'clientArray',
                onSelectRow: function (rowid, status, e) {
                    saleno = $('#grid1').jqGrid('getCell', rowid, 'saleno');
                    //balju_selone();
                },
                ondblClickRow: function (rowid, row, col) {
                    var cm = jQuery("#grid1").jqGrid("getGridParam", "colModel");
                    if (cm[col].name != "itemname") {
                        var stno = $('#grid1').jqGrid('getCell', rowid, 'stno');
                        location.href = '/page6/page6-1.aspx?stno=' + stno;
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
            var param = JSON.stringify({ 'saleno': '' });
            $.ajax({
                type: "POST",
                url: "/page6/page6_svc_search.asmx/page62_search",
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