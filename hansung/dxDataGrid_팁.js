var spd2 = $("#spd2").dxDataGrid("instance");
// grid에 데이타 넣기
$("#spd2").dxDataGrid({ dataSource: JSON.parse(data.d) });
// grid 행 모두 가져오기
var row = spd2.getDataSource().items();
// 선택된 행 정보 가져오기
var rowid = spd2.getSelectedRowKeys(); 
//그리드 행 지우기
spd2.deleteRow(rowid);
// 그리드 cell 정보 가져오기
spd2.cellValue(pop_item_row, 'itemcd', param.itemcd);
//=================================================================
//그리드 필터
//=================================================================
, searchPanel: { visible: true, width: 300, placeholder: "Search..." }
, headerFilter: { visible: true }
, filterRow: { visible: true, applyFilter: "auto" }

//=================================================================
//그리드 이벤트 
//=================================================================
, onCellDblClick: function(e) {
	if (e.rowType == 'data' && e.column.dataField != "itemnm") {
		var jpno = $(this).cellValue(e.rowIndex, "jpno");
		alert(jpno);
		location.href = '/page2/page2-1.aspx?jpno=' + jpno;
	}
}
//=================================================================
//Dialog Box
//=================================================================
var result = DevExpress.ui.dialog.confirm("Duplicate Year. Are you sure?", "Confirm changes");
result.done(function (dialogResult) {
    if (dialogResult) {
        skipValidationCheck = true;
        $("#gridContainer").dxDataGrid("instance").saveEditData();
    }
});

// 동기적으로 데이타 로딩하는 방법 알아내야 함
// 데이타 컬럼 주 일부가 삭제되지 않음(select 다시 할때)
//================================================================
//Kendo grid 
//================================================================
var data = $("#gaugeMetricTable").data("kendoGrid").dataSource.data();


