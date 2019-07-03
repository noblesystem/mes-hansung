<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page3-2.aspx.cs" Inherits="hansung.page3.page3_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
	    <div class="row">
		    <div class="col-lg-12">
			    <div class="ibox ">
				    <div class="ibox-content">
					    <h2>영업전표조회</h2>
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
                colNames: ['전표번호', 'gucd', 'chasu', 'csaleno', '영업담당', '고객사명', '출고창고', '출고예정일', '승인확인', '출고확인', '품목명', '규격',
                    '매수', '수량(B)', '운송사', '차량번호', '운임', '수주비고'],
                colModel: [
                    { name: "saleno", index: "saleno", width: 100 }
                    , { name: "gucd", index: "gucd", width: 100 }
                    , { name: "chasu", index: "chasu", width: 100 }
                    , { name: "csaleno", index: "csaleno", width: 100 }
                    , { name: "usernm", index: "usernm", width: 100 }
                    , { name: "custnm", index: "custnm", width: 100 }
                    , { name: "whnm", index: "whnm", width: 100 }
                    , { name: "ydt", index: "ydt", width: 100 }
                    , { name: "checkdt", index: "checkdt", width: 100 }
                    , { name: "outdt", index: "outdt", width: 100 }
                    , { name: "itemnm", index: "itemnm", width: 100 }
                    , { name: "spec", index: "spec", width: 100 }
                    , { name: "qty", index: "qty", width: 100 }
                    , { name: "boxqty", index: "boxqty", width: 100 }
                    , { name: "carnm", index: "carnm", width: 100 }
                    , { name: "carno", index: "carno", width: 100 }
                    , { name: "carpayamt", index: "carpayamt", width: 100 }
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
                        var saleno = $('#grid1').jqGrid('getCell', rowid, 'saleno');
                        location.href = '/page3/page3-1.aspx?saleno=' + saleno;
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
                url: "/page3/page3_svc_search.asmx/page32_search",
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