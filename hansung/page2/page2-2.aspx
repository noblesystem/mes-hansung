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
<input id='filter' class='k-textbox'/>
                        <div id="grid1"></div>
                        <div id="spd1"></div>
				    </div>
			    </div>
		    </div>
	    </div> 
    </div>

    <script>
        function page22_pop(jpno) {
            var popUrl = "/page2/page2-2-pop.aspx?jpno=" + jpno;
            var popOption = "width=800, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
            var page22pop = window.open(popUrl, "page22pop", popOption);
            if (page22pop) page22pop.focus();
        }

        $(document).ready(function () {
			$("#grid1").kendoGrid({
                dataSource: {
                      schema: {
                        model: {
                            fields: {
                                  jpno		    : { type : "string" }
                                , gucd          : { type : "string" }
                                , chasu         : { type : "string" }
                                , cjpno         : { type : "string" }
                                , termcd        : { type : "string" }
                                , usernm        : { type : "string" }
                                , custnm        : { type : "string" }
                                , whnm          : { type : "string" }
                                , pidt          : { type : "string" }
                                , ipdt          : { type : "string" }
                                , tongdt        : { type : "string" }
                                , passdt        : { type : "string" }
                                , inchecktime   : { type : "string" }
                                , itemnm        : { type : "string" }
                                , spec          : { type : "string" }
                                , qty           : { type : "string" }
                                , boxqty        : { type : "string" }
                                , blno          : { type : "string" }
                                , ckcd          : { type : "string" }
                                , ftdt          : { type : "string" }
                                , conbandt      : { type : "string" }
                                , inyodt        : { type : "string" }
                                , incheckdt     : { type : "string" }
                                , inchecktime   : { type : "string" }
                                , rmk           : { type : "string" }
                            }
                        }
                    }
                }
                , columns: [
                      { field : "jpno"       , title : '전표번호'		, hidden : false , width : 100 }
                    , { field : "gucd"       , title : '구분'			, hidden : true  , width : 100 }
                    , { field : "chasu"      , title : '차수'			, hidden : true  , width : 100 }
                    , { field : "cjpno"      , title : '공통전표'		, hidden : true  , width : 100 }
                    , { field : "termcd"     , title : 'TERMS'		    , hidden : false , width : 100 }
                    , { field : "usernm"     , title : '발주담당'		, hidden : false , width : 200 }
                    , { field : "custnm"     , title : '거래사명'		, hidden : false , width : 100 }
                    , { field : "whnm"       , title : '입고창고'		, hidden : false , width : 100 }
                    , { field : "pidt"       , title : 'P/I date'		, hidden : false , width : 100 }
                    , { field : "ipdt"       , title : '입항예정일'	    , hidden : false , width : 100 }
                    , { field : "tongdt"     , title : '통관예정일'	    , hidden : false , width : 100 }
                    , { field : "passdt"     , title : '통관확인'		, hidden : false , width : 100 }
                    , { field : "inchecktime", title : '입고확인'		, hidden : false , width : 100 }
                    , { field : "itemnm"     , title : '품목명'		    , hidden : false , width : 100 }
                    , { field : "spec"       , title : '규격'			, hidden : false , width : 100 }
                    , { field : "qty"        , title : '매수'			, hidden : false , width : 100 }
                    , { field : "boxqty"     , title : '수량(B)'		, hidden : false , width : 100 } 
                    , { field : "blno"       , title : 'B/L no'		    , hidden : false , width : 100 }
                    , { field : "ckcd"       , title : 'C/K'			, hidden : false , width : 100 }
                    , { field : "ftdt"       , title : 'F/T'			, hidden : false , width : 100 }
                    , { field : "conbandt"   , title : 'CON 반납일'	    , hidden : false , width : 100 }
                    , { field : "inyodt"     , title : '입고요청일'	    , hidden : false , width : 100 }
                    , { field : "incheckdt"  , title : '입고일'		    , hidden : false , width : 100 }
                    , { field : "rmk"        , title : '발주비고'		, hidden : false , width : 100 }    
                ]
                , columnMenu    : true
                , columnMenu    : {
                      columns    : true
                    , filterable : true
                    , sortable   : true
                    , messages   : {
                          columns   : '컬럼선택'
                        , filter    : '필터적용'
                        , sortAscending  : '오름차순'
                        , sortDescending : '내림차순'
                        }
                }
                //, filterable    : { mode : 'row' } 
                , selectable    : "row" //row, multiple
                , scrollable    : true
                , change        : grid1_change
                , dataBound     : grid1_dataBound
                //, reorderable   : true //컬럼 헤더이동
                , resizable     : true  //컬럼넓이 조정
                //, change    : grid1_change
                //, width     : 450
                , height    : 300
                //, filterable: grid_filterable
            });

            //grid1 filter
            $('#filter').on('input', function (e) {
                var grid = $('#grid1').data('kendoGrid');
                var columns = grid.columns;

                var filter = { logic: 'or', filters: [] };
                columns.forEach(function (x) {
                  if (x.field) {
                    var type = grid.dataSource.options.schema.model.fields[x.field].type;
                    if (type == 'string') {
                      filter.filters.push({
                        field: x.field,
                        operator: 'contains',
                        value: e.target.value
                      })
                    }
                    else if (type == 'number') {
                      if (isNumeric(e.target.value)) {
                        filter.filters.push({
                          field: x.field,
                          operator: 'eq',
                          value: e.target.value
                        });
                      }    

                    } else if (type == 'date') {
                      var data = grid.dataSource.data();
                      for (var i=0;i<data.length ; i++){
                        var dateStr = kendo.format(x.format, data[i][x.field]);
                        // change to includes() if you wish to filter that way https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes
                        if(dateStr.startsWith(e.target.value)){
                          filter.filters.push({
                            field: x.field,
                            operator:'eq',
                            value: data[i][x.field]
                          })
                        }
                      }
                    } else if (type == 'boolean' && getBoolean(e.target.value) !== null) {
                      var bool = getBoolean(e.target.value);
                      filter.filters.push({
                        field: x.field,
                        operator: 'eq',
                        value: bool
                      });
                    }               
                  }
                });
                grid.dataSource.filter(filter);
            });

            $("#spd1").dxDataGrid({
                columns: [
                    { 
                        width: "auto", 
                        cellTemplate: function(container, options) { 
                            //container.text(dataGrid.pageIndex() * dataGrid.pageSize() + options.rowIndex); 
                            //var totCount = this.totalCount();
                            container.text(options.rowIndex + 1); 
                        } 
                    }
                    , { dataField :	"jpno"       , caption : '전표번호'		, width : 100 }
                    , { dataField :	"gucd"       , caption : '구분'			, width : 100 }
                    , { dataField :	"chasu"      , caption : '차수'			, width : 100 }
                    , { dataField :	"cjpno"      , caption : '공통전표'		, width : 100 }
                    , { dataField :	"termcd"     , caption : 'TERMS'		, width : 100 }
                    , { dataField :	"usernm"     , caption : '발주담당'		, width : 100 }
                    , { dataField :	"custnm"     , caption : '거래사명'		, width : 100 }
                    , { dataField :	"whnm"       , caption : '입고창고'		, width : 100 }
                    , { dataField :	"pidt"       , caption : 'P/I date'		, width : 100 }
                    , { dataField :	"ipdt"       , caption : '입항예정일'	, width : 100 }
                    , { dataField :	"tongdt"     , caption : '통관예정일'	, width : 100 }
                    , { dataField :	"passdt"     , caption : '통관확인'		, width : 100 }
                    , { dataField :	"inchecktime", caption : '입고확인'		, width : 100 }
                    , { dataField :	"itemnm"     , caption : '품목명'		, width : 100 }
                    , { dataField :	"spec"       , caption : '규격'			, width : 100 }
                    , { dataField :	"qty"        , caption : '매수'			, width : 100 }
                    , { dataField :	"boxqty"     , caption : '수량(B)'		, width : 100 }
                    , { dataField :	"blno"       , caption : 'B/L no'		, width : 100 }
                    , { dataField :	"ckcd"       , caption : 'C/K'			, width : 100 }
                    , { dataField :	"ftdt"       , caption : 'F/T'			, width : 100 }
                    , { dataField :	"conbandt"   , caption : 'CON 반납일'	, width : 100 }
                    , { dataField :	"inyodt"     , caption : '입고요청일'	, width : 100 }
                    , { dataField :	"incheckdt"  , caption : '입고일'		, width : 100 }
                    , { dataField :	"rmk"        , caption : '발주비고'		, width : 100 }
                ]
                , searchPanel: { visible: true, width: 300, placeholder: "Search..." }
                , headerFilter: { visible: true }
                , filterRow: { visible: true, applyFilter: "auto" }
                , showColumnLines: true
                , showRowLines: true
                //, rowAlternationEnabled: true
                , showBorders: true
                , hoverStateEnabled: true
                , selection: { mode: "single" }
                , onCellDblClick: function(e) {
                    if (e.rowType == 'data' && e.column.dataField != "jpno") {
                        var jpno = this.cellValue(e.rowIndex, "jpno");
                        location.href = '/page2/page2-1.aspx?jpno=' + jpno;
                    }
                    if (e.rowType == 'data' && e.column.dataField == "itemnm") {
                        var jpno = this.cellValue(e.rowIndex, "jpno");
                        page22_pop(jpno);
                    }
                }
            }).dxDataGrid("instance");

            fn_search();
        });
        //===============================================================
        // grid event
        //===============================================================
        var grid1_change = function(e) {
            //alert(1);
            //var a = e.values;
            //var b = e.container;
            //var c = e.model;
            //var cell = e.container;
            //var col   = cell.find('input');
            //var colid = col.id;
            //var colval  = col.val();
            //var row = this.select();
            //var model = e.model;



            var grid = e.sender;
            var index = grid.select().index();
            var colname = grid.thead.find('th')[index].getAttribute("data-title");
            var colid   = grid.thead.find('th')[index].getAttribute("data-field");

            if (colid == 'itemnm') {
                var row = this.select();
                jpno = this.dataItem(row[0]).jpno;
                page22_pop(jpno);
            }
        }
        var grid1_dataBound = function(e) {
            var grid = this;
            grid.tbody.find("tr").dblclick(function(e) {
                var row = grid.dataItem(this);
                var jpno = row.jpno;
                var cellIndex = e.target.cellIndex;
                var colid = grid.thead.find('th')[cellIndex].getAttribute("data-field");
                if (colid == 'itemnm') {
                    page22_pop(row.jpno);
                }
                if (colid == 'jpno') {
                    location.href = '/page2/page2-1.aspx?jpno=' + jpno;
                }
            });
        }
        //alert("Column Name: " + this.getColumnByIndex(args.cell.index())["headerText"]);// returns the corresponding column name
        //alert("Cell Value: " + args.cell.text());// returns the corresponding cell value
        //alert("Selected cell index: " + args.cell.index());//returns the corresponding cell index
        //alert("OrderID column corresponding to the selected cell: " + this.getCurrentViewData()[args.cell.closest("tr").index()].OrderID);//returns the corresponding OrderID value.           
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
                    data = JSON.parse(data.d);
                    var grid = $('#grid1').data('kendoGrid');
                    grid.dataSource.data(data);

                    $("#spd1").dxDataGrid({ dataSource: data }); //dev
                },
                error: function (request, status, error) {
                    //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                    alert("code = " + request.status + " error = " + error); // 실패 시 처리
                }
            });
        }
    </script>
</asp:Content>
