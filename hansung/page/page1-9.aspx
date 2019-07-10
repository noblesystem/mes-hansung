<%@ Page Title="" Language="C#" MasterPageFile="~/Mtpage.Master" AutoEventWireup="true" CodeBehind="page1-9.aspx.cs" Inherits="hansung.page.page1_9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<!-- MAIN -->
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox">
					<div class="ibox-content">
						<table width="100%">
							<tr>
								<td align="left">로케이션 관리</td>
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
								<td>구분</td>
								<td><select id="s_typecd"></td>
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
											<td>locno</td>
											<td>
												<input id="locno" type="text" readonly="readonly"/>
												<input id="mode" type="text" readonly="readonly"/>
											</td>
										</tr>
										<tr>
											<td>창고</td>
											<td><select id="whcd"></select></td>
										</tr>
										<tr>
											<td>구분</td>
											<td><select id="typecd"></select></td>
										</tr>
										<tr>
											<td>분류</td>
											<td><input id="typeno" type="text" /></td>
										</tr>
										<tr>
											<td>열</td>
											<td><input id="colno" type="text" /></td>
										</tr>
										<tr>
											<td>정렬순서</td>
											<td><input id="ordseq" type="text" /></td>
										</tr>
										<tr>
											<td>비고</td>
											<td><input id="rmk" type="text" /></td>
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
	<!-- //MAIN -->
<script>
	//===============================================================
	// 시작 셋팅 함수
	//===============================================================
	$(document).ready(function () {
		// combo
		$('#s_typecd').zentSetCombo('C025', '', '==선택==');
		$('#whcd').zentSetComboWhcd('', '==선택==');
		$('#typecd').zentSetCombo('C025', '', '==선택==');
		$('#useyn').zentSetCombo('C007', '', '==선택==');
		
		// grid
		fn_grid1();
    });
	//=====================================================================
	//grid setting
	//=====================================================================
	function fn_grid1(){
		$("#grid1").kendoGrid({
			dataSource: {
				schema: {
					model: {
						fields: {
							//type : "string", "number", "boolean", "date", "object", (Default) "default"
							locno           : { type : "string" }
							, whcd          : { type : "string" }
							, typecd        : { type : "string" }
							, typeno        : { type : "string" }
							, colno         : { type : "string" }
							, ordseq        : { type : "number" }
							, rmk           : { type : "string" }
							, useyn         : { type : "string" }
						}
					}
				}
			}
			, columns: [
				{ field : "locno"        , title : "대리키"    , hidden : true , width : 100 }
				, { field : "whcd"       , title : "창고"      , hidden : false , width : 100 }
				, { field : "typecd"     , title : "구분"      , hidden : false , width : 100 }
				, { field : "typeno"     , title : "분류"      , hidden : false , width : 100 }
				, { field : "colno"      , title : "열"        , hidden : false , width : 100 }
				, { field : "ordseq"     , title : "정렬순서"  , hidden : false , width : 100 }
				, { field : "rmk"        , title : "비고"      , hidden : false , width : 100 }
				, { field : "useyn"      , title : "사용여부"  , hidden : false , width : 100 }
			]
			, selectable: "row" //row, multiple
			, scrollable: true
			, resizable : true
			//, width     : 450
			, height    : 200
			, change    : function(e) {
				var row   = this.select();
				var locno = this.dataItem(row[0]).locno;
				fn_selone(locno);
			}
			
		});
		
		grid1 = $('#grid1').data('kendoGrid');
		fn_search();
	}
	
	//===============================================================
	//클릭이벤트
	//===============================================================
	function fn_onClick() {
	var grid1 = $("#grid1").data("kendoGrid");  
	var rowdata = grid1.dataItem(grid1.select());
	fn_selone(rowdata.seq);
	}

	//===============================================================
	//검색
	//===============================================================
	function fn_search() {
		var param = JSON.stringify({ 'typecd': $('#s_typecd').val() });
		$.ajax({
			type: "POST",
			url: "/page/page19_svc.asmx/search",
			data: JSON.stringify({ 'param': param }),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function (data) {
				data = JSON.parse(data.d);
				console.log(data);
				var grid = $('#grid1').data('kendoGrid');
				grid.dataSource.data(data);
				
				fn_init();
			},
			error: function (request, status, error) {
				alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				alert("code = " + request.status + " error = " + error); // 실패 시 처리
			}
		});
	}

	//===============================================================
	//상세화면
	//===============================================================
	function fn_selone(locno) {
		var param = JSON.stringify({ 'locno': locno });
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
				$('#locno').val(result[0].locno);
				$('#whcd').val(result[0].whcd);
				$('#typecd').val(result[0].typecd);
				$('#typeno').val(result[0].typeno);
				$('#colno').val(result[0].colno);
				$('#ordseq').val(result[0].ordseq);
				$('#rmk').val(result[0].rmk);
				$('#useyn').val(result[0].useyn);
				$('#locno').prop('readonly', true);
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
		$('#locno').val('');
		$('#mode').val('I');
		$('#whcd').val('');
		$('#typecd').val('');
		$('#typeno').val('');
		$('#colno').val('');
		$('#ordseq').val('');
		$('#rmk').val('');
		$('#useyn').val('Y');
	}
	
	//===============================================================
	// 신규
	//===============================================================
	function fn_new() {
		fn_init();
		
		$('#mode').val('I');
		$('#locno').prop('readonly', true);
		$('#useyn').val('Y');
	}
	
	//===============================================================
	// 저장
	//===============================================================
	function fn_save() {
		var param = {};
		param.mode   = $.trim($('#mode').val());
		param.locno  = $.trim($('#locno').val());
		param.whcd   = $.trim($('#whcd').val());
		param.typecd = $.trim($('#typecd').val());
		param.typeno = $.trim($('#typeno').val());
		param.colno  = $.trim($('#colno').val());
		param.ordseq = $.trim($('#ordseq').val());
		param.rmk    = $.trim($('#rmk').val());
		param.useyn  = $.trim($('#useyn').val());
		
		if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
		if (param.typecd == '') { alert('구분을 선택해주세요!'); return; }
		if (param.typeno == '') { alert('분류를 입력해주세요!'); return; }
		if (param.colno == '') { alert('열을 입력해주세요!'); return; }
		if (param.ordseq == '') { alert('정렬순서를 입력해주세요!'); return; }
		
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
					
					if (param.mode != "D") {
						fn_selone(result.val);
						alert('저장 되었습니다');
					}else if (param.mode == "D"){
						fn_new();
						alert('삭제 되었습니다');
					}
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
    //gbncd,codenm 검색조건 컬럼
    //gbncd, code, codenm, codeseq, useyn 검색시 보여줘야할 컬럼
    //gbncd,code 상세화면 조건 컬럼
    //gbncd, code, codenm, codeseq, useyn 상세화면 및 저장때 넘겨줘야할 컬럼

</script>
</asp:Content>
