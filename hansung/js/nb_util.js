//====================================================================================
// 환경변수
//====================================================================================
var g_t = true; var g_f = false;

DevExpress.config({forceIsoDateParsing: true});
//DevExpress.ui.dxButton.defaultOptions({ 
DevExpress.ui.dxDataGrid.defaultOptions({ 
    options: {
        dateSerializationFormat: "yyyy.MM.dd"
    }
});

//====================================================================================
function checklogin() {
    var userid = getCookie('userid');
    if (userid != "" & userid != undefined) return 1;
    else return 0;
}

//====================================================================================

//====================================================================================
//콤보 가져오기 
/*
    사원정보
    거래처정보
    거래조건(공통코드) : 선택있게 끔
*/
var pop_param = [];

var pop_userid = '';
var pop_usernm = '';

var pop_custcd = '';
var pop_custnm = '';
var pop_custtel = '';


//=============================================================================
var pop_item_grid;
var pop_item_row;
//find item
function pop_item(searchword, grid, row) {
    pop_item_grid = grid;
    pop_item_row = row;
    var popUrl = "/popup/pop_item.aspx?searchword=" + escape(searchword);
    var popOption = "width=800, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
    var pop_item_win = window.open(popUrl, "pop_item", popOption);
    if (pop_item_win) pop_item_win.focus();
}
//find item(통관전표)
function pop_item_buy(searchword, grid, row, cjpno) {
    pop_item_grid = grid;
    pop_item_row = row;

    var popUrl = "/popup/pop_item_buy.aspx?cjpno=" + cjpno + "&searchword=" + escape(searchword);	//팝업창에 출력될 페이지 URL
    var popOption = "width=1400, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
    var pop_item_buy_win = window.open(popUrl, "pop_item_buy", popOption);
    if (pop_item_buy_win) pop_item_buy_win.focus();
}
//find item(판매전표)
function pop_item_sale(searchword, grid, row, csaleno) {
    pop_item_grid = grid;
    pop_item_row = row;

    var popUrl = "/popup/pop_item_sale.aspx?csaleno=" + csaleno + "&searchword=" + escape(searchword);	//팝업창에 출력될 페이지 URL
    var popOption = "width=1000, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
    var pop_item_sale_win = window.open(popUrl, "pop_item_sale", popOption);
    if (pop_item_sale_win) pop_item_sale_win.focus();
}
//=============================================================================
function pop_user(searchword, userid, usernm) {
    pop_userid = userid;
    pop_usernm = usernm;
    var popUrl = "/popup/pop_user.aspx?searchword=" + searchword;	//팝업창에 출력될 페이지 URL
    var popOption = "width=630, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
    var win1 = window.open(popUrl, "pop_user", popOption);
    if (win1) win1.focus();
}
function pop_cust(searchword, custcd, custnm, tel) {
    pop_custcd = custcd;
    pop_custnm = custnm;
    pop_custtel = tel;
    var popUrl = "/popup/pop_cust.aspx?searchword=" + searchword;
    var popOption = "width=630, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
    var win2 = window.open(popUrl, "pop_cust", popOption);
    if (win2) win2.focus();
}
function pop_result_user(param) {
    $("#" + pop_userid).val(param.userid);
    $("#" + pop_usernm).val(param.usernm)
}
function pop_result_cust(param) {
    $("#" + pop_custcd).val(param.custcd);
    $("#" + pop_custnm).val(param.custnm);
    $("#" + pop_custtel).val(param.tel);
}
//function pop_result_item(param) {
//    $("#" + pop_itemcd).val(param.itemcd);
//    $("#" + pop_itemnm).val(param.itemnm);
//    $("#" + pop_spec).val(param.spec);
//    $("#" + pop_itemqty).val(param.qty);
//    $("#" + pop_unitprice).val(param.unitprice);
//    $("#" + pop_sqm).val(param.unitprice);
//}

//jqGrid의 selectbox data 만들기
function combo_code_string(gbncd, sel_val, sel_name) {
    var param = JSON.stringify({ gbncd: gbncd });
    var result = [];
    result.push({code : '', codenm : '==선택=='});
    $.ajax({
        type: "POST",
        url: "/websvc_common.asmx/combocode",
        data: JSON.stringify({ 'param': param }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var json = JSON.parse(data.d);
            for (var i = 0; i < json.length; i++) {
                result.push(json[i]);
            }
        },
        error: function (request, status, error) {
            alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
        }
    });
    //var str = '';
    //if (sel_val == "" || sel_name == "") {
    //    str = sel_val + ':' + sel_name + ';';
    //}
    //for (var i = 0; i < result.length; i++) {
    //    if (result.length - 1 == i)
    //        str += result[i].code + ':' + result[i].codenm;
    //    else 
    //        str += result[i].code + ':' + result[i].codenm + ';';
    //}
    return result;
}
