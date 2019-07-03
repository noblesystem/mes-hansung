function cretenewbill() {
    $('.tbinput').attr("codeid", "");
    openpopup('newItem');
}
function opentpopuppayment() {
    var o = $(".table1").find(".tr-active");
    if (o.length === 0)
        return false;
    var acc = $(o).attr("accbank");
    var code = $(o).find("td:eq(0)").html();
    var tradingmission = $(o).find(".tradingmission").html();
   
    openpopup('poppayment');
    $('.input-codeorder').html(code);
    $('.pm-customer').html(tradingmission);
    $('.paymentaccount').html(acc);
}
function savepayment() {
    var o = $(".table1").find(".tr-active");
 
    var codebill = $(o).attr("codeid");
    var data = converdatatable('tbpayment');
    if (data === false)
        return false;
  
    var rs = savedata("payment", data, codebill);
    $("#poppayment").modal("toggle");
}
function savebill() {
    var c = checkselect('table1');
    if (c === 0)
        c = "";
    var data = converdatatable('tbinput');
    if (data === false)
        return false;
    var rs = savedata("billbuy", data, c);
    if (c !== "")
        $(".table1").find(".tr-active").remove();
    binddata("table1", JSON.parse(rs));
    $("#newItem").modal("toggle");
    selectrowandactiveInput("table1", "table3");
}

function opensubship() {
    var o = $(".table1").find(".tr-active");
    if (o.length === 0)
        return false;
    var itemid = $(o).attr('iditem');
    $("#subship").attr("idbill", itemid);
    $('#inforcontainer').modal('toggle');
    $("#subship").modal("toggle");
}
function savefirstShip() {
    var c = checkselect('table1');
    if (c === 0)
        c = "";
    var data = converdatatable('tbship');
    if (data === false)
        return false;
    var rs;
    var codeid = $(".tbship").attr("codeid");
    var codebill = $(".table1 .tr-active").attr('codeid');
    if (codeid === "")
        rs = savedata("ship", data, codebill);
    else
        rs = savedata("Editcarship", data, codeid);
    try {
        var jsrs = JSON.parse(rs);
    }
    catch{
        console.log();
    }
    var rs2 = getdetailObj("ship", "codebill", codebill);
    console.log(rs2)
    var jj = JSON.parse(rs2);
    jj[0]["datebeginpayment"] = convertdate(jj[0]["datebeginpayment"]);      
    binddataCar("table2", jj[0], codeid);
    $("#inforcontainer").modal("toggle");
}
function getjsondata(table) {
    var json = [];
    $("." + table + " tr").each(function (index) {
        var name = "";
        var vls = "";
        var vl = $(this).find(".td-data");
        var a = $(vl).find(".p-input").length;
        var b = $(vl).find(".select-op").length;
        if (a > 0) {
            var obj1 = $(vl).find(".p-input");
            if ($(obj1).find('span').length <= 0)
                vls = $(obj1).html();
            else
                vls = $(obj1).find('span').html();

            name = $(obj1).attr('data-sql');
        }
        else if (b > 0) {
            var opt = $(vl).find(".select-op");
            name = $(opt).attr('data-sql');
            vls = $(opt).find(":selected").text();

        }
        else {

            var obj = $(vl).find("input[type=text]");
            vls = $(obj).val();
            name = $(obj).attr('data-sql');
        }
        if (name !== undefined) {
            var data = {
                name: name,
                vl: vls
            };
            json.push(data);
        }
    });
    if (table === "tbship") {
        var data = {
            name: 'codeid',
            vl: ''
        };
        json.push(data);
        var ow = $(".table1").find(".tr-active");
        var codebill = $(ow).attr("codeid");
        var data2 = {
            name: 'codebill',
            vl: codebill
        };
        json.push(data2);
    }
    return JSON.stringify(json);
}
function submitdatabill(data, obj,id) {
   
    var rs = "none";
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/savadata",
        data: "{json:'" + data + "',obj:'" + obj + "',id:'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {
        rs = response.d;

    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function savesubship(){
    var id = $("#subship").attr("idbill");
    var rs = getjsondata('tbsubship');
    var o = submitdatabill(rs, "subship", id);
    $(".tbsubship tr").each(function (index) {
        if ($(this).hasClass('datahidden') === false) {
            var n = $(this).find("td:eq(0)").html();
            var vl = $(this).find(".td-data").find("input[type=text]").val();
            var tr = "<tr><td scope='col' class='column-50 cl-title'>" + n + "</td><td scope='col'>"+vl+"</td></tr>";
            $(tr).appendTo('.table2 tbody');
        }
    });
    $("#subship").modal("toggle");
}
function openpopupship() {
    var c = checkselect('table1');
    if (c === 0)
        return false;
    var codeid = $('.table2').attr("codeid");
    $(".table2 .td-data").each(function (index) {
        var qr = $(this).attr("data-sql");
        var vl = $(this).html();
        $(".tbship .td-data").each(function (index) {
            var qr2 = $(this).attr("data-sql");
            if (qr2 === qr) {
                includedata($(this), vl);
                return false;
            }
        });

    });
    $('.tbship').attr('codeid', codeid);
    $("#inforcontainer").modal("toggle");
}

function newship() {
    $(".old-nbship").val('');
    $(".old-Duedate").val('');
    $(".input-DepartureDate").val('');
    $(".old-Dateofarrival").val('');
    $(".old-containerdate").val('');
    $(".old-shipname").val('');
    $(".old-remark").val('');
}
function Editinforcontainer(table) {

    var o = $("." + table + " .tr-active");
    if (o.length <= 0)
        return false;
    var code = $(o).find("td:eq(0)").html();
    $("#th-code").html(code + "-01");
    $(".input-orderbill").html(code + "-01");
    var iditem = $(o).attr("iditem");

    $(".tbship").attr("bill", iditem);

    $('#inforcontainer').modal({
        show: 'false'
    });

}
function Listbinddatadetailbill(table, json) {
    var tr = "<tr class='it-insert' codeid='" + json.codeid + "' nameitem='" + json.nameitem + "' bitem='" + json.qltcase + "'>";
    $("." + table + " th").each(function (index) {
        if ($(this).hasClass("index-order") === false) {
            var dtquery = $(this).attr('data-input');
            var datatype = $(this).attr('data-type');
            var vl = json[dtquery];
            if (vl === null)
                vl = "";
            if (datatype === "date-dt")
                vl = convertdate(vl);

            tr += "<td class='td-data "+dtquery+"' data-sql='" + dtquery + "'>" + vl + "</td>";
        }
        else {
            tr += "<td class='new-index'></td>";
        }
    });
    tr += "</tr>";
    $(tr).prependTo("." + table + " tbody");

}
function selectrbill() {

    $(".table1 tr").click(function () {
        $(".table1 tr").removeClass("tr-active");
        if ($(this).find("th").length > 0)
            return false;

        else if ($(this).hasClass("tr-active") === false) {
            $(".table3 tbody").empty();
            var rs = getdetailObj("ship", "codebill", $(this).attr("codeid"));
            var rs2 = getdetailObj("detailbillbuy", "codebill", $(this).attr("codeid"));
            if (rs !== "") {
                var js = JSON.parse(rs);
                js[0]["datebeginpayment"] = convertdate(js[0]["datebeginpayment"]);      
                binddataCar("table2", js[0], $(this).attr("codeid"));
                
            }
            if (rs2 !== "") {
                var js2 = JSON.parse(rs2);
                for (var i = 0; i < js2.length; i++) {
                    js2[i].codeitem = returncode(js2[i].codeitem, 4);
                    js2[i].nameitem = returnnameitem(js2[i].nameitem);
                    Listbinddatadetailbill("table3", js2[i], $(this).attr("codeid"));
                }
            }
        }

        $(this).addClass("tr-active");

    });

}
function resetship() {

    $("#th-code").html('');
    $(".ship-Payment").html('');
    $(".ship-not").html('');
    $(".ship-money").html('');
    $(".ship-tlcnb").html('');
    $(".ship-tlcmoney").html('');
    $(".ship-usc").html('');
    $(".ship-creatdate").html('');
    $(".ship-nbship").html('');
    $(".ship-duedate").html('');
    $(".ship-darpdate").html('');
    $(".ship-arrdate").html('');
    $(".ship-condate").html('');
    $(".ship-nameship").html('');
    $(".ship-remark").html('');
    $(".ship-dpbegan").html('');
}
function getdetail(obj, column, value, table) {
   
    $('.trsum').remove();
    $('.tabledata2 .it-insert').remove();
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/getdata",
        data: "{obj:'" + obj + "',column:'" + column + "',value:'" + value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {

        if (response.d === "")
            return false;
        var rs = JSON.parse(response.d);
        var order = rs.length;
        for (var i = 0; i < rs.length; i++) {
            var o = rs[i];
            var code = o.codeitem;
            if (code === null)
                code = "";
            else if (code.length < 4) {
                var n = 4 - code.length;
                for (var m = 0; m < n; m++)
                    code = "0" + code;
            }
            var tr = "<tr class='item-insert' codeid='" + o.codeid + "'>" +
                "<td class='order'>" + order + "</td>" +
                "<td class='getorder'>" + code + "</td>" +
                "<td class='getname'>" + o.nameitem + "</td>" +
                "<td class='getstandar'>" + o.standard + "</td>" +
                "<td class='getqlincae'>" + o.quantityincase + "</td>" +
                "<td class='qltcase'>" + o.qltcase + "</td>" +
                "<td class='price td-right'>" + convertnumbertostring(Math.floor(o.price)) + "</td>" +
                "<td class='priceandvat td-right'>" + convertnumbertostring(Math.floor(o.priceandvat)) + "</td>" +
                "<td class='monetvat td-right'>" + convertnumbertostring(Math.floor(o.monetvat)) + "</td>" +
                "<td class='totalmoney td-right'>" + convertnumbertostring(Math.floor(o.totalmoney)) + "</td>" +
                "<td class='sqltcontainer'>" + convertnumbertostring(Math.floor(o.qltcontainer)) + "</td>" +
                "<td class='sqm'>" + o.sqm + "</td>" +
                "<td class='getremark'>" + o.remark + "</td>" +
                "</td>";

            $(tr).prependTo("." + table + " tbody");

            order--;
            Listbinddata('tabledata2', o);
        }
        sumdetail();
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function sumdetail() {

    var sumqlt = 0;
    var sumpriceandvat = 0;
    var summonetvat = 0;
    var sumtotalmoney = 0;
    var sumsqm = 0;
    var sumqltcontainer = 0;
    $(".table3 .item-insert").each(function (index) {
        var qlt = convertstringnumber($(this).find('.qltcase').html());
        var qltcontainer = convertstringnumber($(this).find('.sqltcontainer').html());
        var priceandvat = convertstringnumber($(this).find('.priceandvat').html());
        var monetvat = convertstringnumber($(this).find('.monetvat').html());
        var totalmoney = convertstringnumber($(this).find('.totalmoney').html());
        var sqm = convertstringnumber($(this).find('.sqm').html());

        sumqltcontainer = parseFloat(sumqltcontainer) + parseFloat(qltcontainer);
        sumqlt = parseFloat(sumqlt) + parseFloat(qlt);
        sumpriceandvat = parseFloat(sumpriceandvat) + parseFloat(priceandvat);
        summonetvat = parseFloat(summonetvat) + parseFloat(monetvat);
        sumtotalmoney = parseFloat(sumtotalmoney) + parseFloat(totalmoney);
        sumsqm = parseFloat(sumsqm) + parseFloat(sqm);
    
        
    });
    var f = $(".table3 .item-insert:eq(0)");
    var trsum = "<tr class='trsum'><td>합계</td>";
    $(f).find("td").each(function (index) {
        var vl = "";

        if ($(this).hasClass("qltcase"))
            vl = convertnumbertostring(sumqlt);
        else if ($(this).hasClass("qltcase"))
            vl = convertnumbertostring(sumqlt);
        else if ($(this).hasClass("priceandvat"))
            vl = convertnumbertostring(sumpriceandvat);
        else if ($(this).hasClass("monetvat"))
            vl = convertnumbertostring(summonetvat);
        else if ($(this).hasClass("totalmoney"))
            vl = convertnumbertostring(sumtotalmoney);
        else if ($(this).hasClass("sqltcontainer"))
            vl = convertnumbertostring(sumqltcontainer);
        else if ($(this).hasClass("sqm"))
            vl = convertnumbertostring(sumsqm);

        if (index > 0)
            trsum += "<td class='td-right'>" + vl + "</td>";

    });
    trsum += "</tr>";
    $(trsum).appendTo(".table3 tbody");
}
function getdetailship(obj, column, value) {
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/getdata",
        data: "{obj:'" + obj + "',column:'" + column + "',value:'" + value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {

        if (response.d === "")
            return false;
        var rs = JSON.parse(response.d);

        $("#th-code").html(rs[0].orderbill);
        $(".ship-Payment").html(rs[0].paymentoption);
        $(".ship-not").html(rs[0].note);
        $(".ship-money").html(rs[0].money);
        $(".ship-tlcnb").html(rs[0].tolerancepercent);
        $(".ship-tlcmoney").html(rs[0].tolerancemoney);
        $(".ship-usc").html(rs[0].usance);
        $(".ship-creatdate").html(convertdate(rs[0].creditduedate));
        $(".ship-nbship").html(rs[0].numbership);
        $(".ship-duedate").html(convertdate(rs[0].duedate));
        $(".ship-darpdate").html(convertdate(rs[0].departuredate));
        $(".ship-arrdate").html(convertdate(rs[0].dateofarrival));
        $(".ship-condate").html(convertdate(rs[0].conDuedate));
        $(".ship-nameship").html(rs[0].shipname);
        $(".ship-remark").html(rs[0].remark);
        $(".ship-dpbegan").html(convertdate(rs[0].datebeginpayment));

    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function getdetailsubship(obj, column, value) {
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/getdata",
        data: "{obj:'" + obj + "',column:'" + column + "',value:'" + value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {

        if (response.d === "")
            return false;
        var h = ["B/L no", "선적기일(S/D)", "출항예정일(ETD)", "입항예정일(ETA)", "CON 반납기일(F/T)", "운송사/선사", "발주 비고"];
        var v = ["numbership", "duedate", "departuredate", "dateofarrival", "conDuedate", "shipname", "remark"];
        var dt = ["duedate", "departuredate", "dateofarrival", "conDuedate"];
        var rs = JSON.parse(response.d);
        if (rs.length > 0) {
            for (var i = 0; i < rs.length; i++) {
                var o = rs[i];
                for (var j = 0; j < h.length; j++) {
                    var vl = o[v[j]];
              
                    if (dt.indexOf(v[j]) !== -1) {
                
                        vl = convertdate(vl);
                    }
                    var tr = "<tr><td scope='col' class='column-50 cl-title'>" + h[j] + "</td>" + "<td>"+vl+"</td></tr>";
                    $(tr).appendTo(".table2 tbody");
                }
            }
        }
      

    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function getdetailsubdetail(obj, column, value) {
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/getdata",
        data: "{obj:'" + obj + "',column:'" + column + "',value:'" + value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {

        if (response.d === "")
            return false;
        var o = JSON.parse(response.d);
        createRow("tabledata2", o);
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function createRow(table, json) {
   
    for (var i = 0; i < json.length; i++) {
        var o = json[i];
       
        var tr = "<tr>";
        $("." + table + " th").each(function (index) {
            var dtsql = $(this).attr("data-sql");
            datatype = $(this).attr("data-type");
            var vl = o[dtsql];
            if (datatype === "date-dt") {
                if (vl !== "" && vl !== null && vl !=="1970.1.1")
                vl = convertdate(vl);
            }
            if (vl === null)
                vl = "";
            tr += "<td>" + vl + "</td>";
        });
        tr += "</tr>";
        $(tr).prependTo(".tabledata2 tbody");
    }
}
function editbillbuy() {
    openEdit('table1', 'tbinput', 'newItem');
    selectcustomer($('.sl-employer'), "");
    var o = $(".table1 .tr-active");
    var vl = $(o).find(".tradingmission").html();
    $(".sl-tradingmission option:contains(" + vl + ")").prop("selected", true);
}
function openEditdetailbuy() {
    $(".td-detail-order").remove();
    $("#popupdetail").modal("toggle");

    if ($(".table3 .it-insert").length <= 0)
        return false;
 
        $(".table3 .it-insert").each(function (index) {
            var codeid = $(this).attr('codeid');
            var o = $(this);
            var tr = "<tr class='td-detail-order' codeid='" + codeid + "'><td></td>";
            $(".tr-input .td-data-a").each(function (index) {
                var qr = $(this).attr('data-sql');
                var vl = findatatdww(qr, o);
                if (qr === "qltincase" || qr === "qltcase" || qr === "totalamount")
                    tr += "<td class='td-data txt-inputs' data-sql='" + qr + "'><input type='text' class='txt-input td-right numberinput' value='" + vl + "'></td>";
                else
                    tr += "<td class='td-data' data-sql='" + qr + "'>" + vl + "</td>";
            });
            tr += "<td class='remove' onclick='removerow(this)'>x</td></tr>";
            $(tr).insertAfter(".tr-input");

        });
    
}
function findatatdww(o,a) {
    var vl = "";
    
    $(a).find(' .td-data').each(function (index) {
        var qr = $(this).attr('data-sql');
        if (qr === o) {
        
            vl = $(this).html();
        }
    });
    return vl;
}
function savedetailbill() {
    var data = [];
   
    $(".td-detail-order").each(function (index) {
        var tmp = [];
        var codeid = $(this).attr("codeid");
        
        $(this).find(".td-data").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = $(this).html();
            if ($(this).hasClass("txt-inputs")) {
                vl = $(this).find(".txt-input").val();
        
            }
            else {
                vl = $(this).html();
            }
            var i = {
               
                name: qr,
                vl: vl
            };
           
            tmp.push(i);
        });
        var c = {
            name: "codeid",
            vl: codeid
        };
        tmp.push(c);
        data.push(tmp);
    });
 
    var codebill = $(".table1 .tr-active").attr('codeid');
    var rs = savedata("detailbuy", JSON.stringify(data), codebill);
    var js = JSON.parse(rs);
    $('.table3 tbody').empty();
    var rs2 = getdetailObj("detailbillbuy", "codebill", codebill);
    if (rs2 !== "") {
        var js2 = JSON.parse(rs2);
        for (var i = 0; i < js2.length; i++) {
            js2[i].codeitem = returncode(js2[i].codeitem, 4);
            js2[i].nameitem = returnnameitem(js2[i].nameitem);
            Listbinddatadetailbill("table3", js2[i], $(this).attr("codeid"));
        }
    }
    $("#popupdetail").modal("toggle");
}
function openEditdetailbill(table) {
    $(".tabledetail .tmp-line").remove();
    var o = $("." + table).find(".tr-active");
    if (o.length === 0)
        return false;
    var id = $(o).attr("iditem");
   
    $('.table3 .item-insert').each(function (index) {
        var codeid = $(this).attr("codeid");
        var newitemcode = $(this).find(".getorder").html();
        var itemname = $(this).find(".getname").html();
        var standar = $(this).find(".getstandar").html();
        var qltincase = $(this).find(".getqlincae").html();
        var qltcase = $(this).find(".qltcase").html();
        var totalprice = $(this).find(".totalmoney").html();
        var qltcontainer = $(this).find(".sqltcontainer").html();
        var remark = $(this).find(".getremark").html();
        var sl = '<select class="sl-option-item sl-standar-sub data-not-null">';
        $('.sl-standar .op-item').each(function (index) {
            var txt = $(this).attr('nitem');
            var st = "";
            if (txt === itemname) {
                if ($(this).text() === standar)
                    st = "selected";
                sl += '<option ' + st+' class="option-item op-item" itemcode="' + $(this).attr('itemcode') + '" qlt="' + $(this).attr('qlt') + '" nitem="' + $(this).attr('nitem') + '" value="' + $(this).attr('id') + '">' + $(this).text() + '</option>';
            }
        });
        sl+='</select>';
        var tr = '<tr class="tmp-line" codeid="' + codeid +'">' + '<td class="order">1</td>' +
            '<td class="newitemcode">' + newitemcode+'</td>' +
            '<td class="itemname">' + itemname +'</td>' +
            '<td>' + sl +'</td>' +
            '<td><input type="text" value="' + qltincase +'" class="txt-input-new qltincase td-right data-not-null numberinput"></td>' +
            '<td><input type="text" value="' + qltcase +'" class="txt-input-new qltcase td-right data-not-null numberinput"></td>' +
            '<td><input type="text" value="' + totalprice +'" class="txt-input-new totalprice td-right data-not-null"></td>' +
            '<td><input type="text" value="' + qltcontainer +'" class="txt-input-new qltcontainer td-right data-not-null numberinput"></td>' +
            '<td><input type="text" value="' + remark + '" class="txt-input-new remark "></td></tr>';
        $(tr).insertAfter(".tabledetail .tr-input");
    });
    openpopup('popdetail');
    revalidate();
}
function inclucdedetailbill() {
    var c = checknull('tabledetail');
    if (c === false)
        return c;
    var nb = $('.tmp-line').length + 1;
    var tr = "<tr class='tmp-line'>";
    var optionsl = $(".sl-standar").find(":selected");
    var optionsize = '<select class="sl-option-item sl-standar-sub data-not-null">';
    optionsize += '<option class="option-item op-item" itemcode="' + $(optionsl).attr('itemcode') + '" qlt="' + $(optionsl).attr('qlt') + '" nitem="' + $(optionsl).attr('nitem') + '" value="' + $(optionsl).attr('value') + '">' + $(optionsl).text() + '</option>';
   
    $(".sl-standar option").each(function (index) {

        if ($(this).css('display') !== 'none' && $(this).text() !== $(optionsl).text() && $(this).text() !== "") {
            optionsize += '<option  class="option-item op-item" itemcode="' + $(this).attr('itemcode') + '" qlt="' + $(this).attr('qlt') + '" nitem="' + $(this).attr('nitem') + '" value="' + $(this).attr('value') +'">' + $(this).text()+'</option>';
        }
    });
    optionsize += '</select>';
   
    $(".tabledetail .td-data").each(function (index) {
        if ($(this).hasClass("datahidden") === false) {
            var vl = "";
            var cl = "";
            var notnull = "";
            if ($(this).hasClass('order'))
                vl = '<td class="order">' + nb + '</td>';
            else if ($(this).hasClass('itemcode'))
                vl = '<td class="newitemcode">' + $(this).html() + '</td>';
            else if ($(this).hasClass('td-option')) {

                vl ="<td>"+ optionsize+"</td>";
            }
            else if ($(this).hasClass('td-input')) {
                  
                var obj = $(this).find(".txt-input");
                if ($(obj).hasClass('data-not-null'))
                    notnull = "td-right data-not-null";
                if ($(obj).hasClass('numberinput'))
                    notnull += " numberinput";
                if ($(obj).hasClass('td-itemname'))
                    vl = '<td class="itemname">' + $(obj).val() + '</td>';
                else {
                    cl = obj.attr('data-sql');
                    vl = '<td><input type="text" value="' + $(obj).val() + '" class="txt-input-new ' + cl+' '+notnull+'"/></td>';
                }
            }
            tr += vl;
        }
        
    });
    tr += "<tr>";
    $(tr).insertAfter(".tabledetail .tr-input");
    $(".tabledetail .td-auto").html('');
    $(".tabledetail .txt-input").val('');
    $(".sl-standar .op-item").hide();
    $(".sl-standar-sub").change(function () {
        var pr = $(this).parent().parent();
        var id = $(this).find(":selected");
        var newcode = convertcode($(id).attr("itemcode"), 4);
        var code = $(pr).find(".newitemcode");
        code.html(newcode);
        var qlt = $(id).attr("qlt");

    });
    $(".numberinput").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });
    $(".tr-input .td-itemname").focus();
    $(".sl-standar").val(-1);
}
function revalidate() {
    $(".sl-standar-sub").change(function () {
        var pr = $(this).parent().parent();
        var id = $(this).find(":selected");
        var newcode = convertcode($(id).attr("itemcode"), 4);
        var code = $(pr).find(".newitemcode");
        code.html(newcode);
        var qlt = $(id).attr("qlt");

    });
    $(".numberinput").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });
}
function savelistItem() {
    var data = [];
    if ($('.tabledetail .tmp-line').length <= 0)
        return false;
    var codebill = $('.table1 .tr-active').attr('codeid');
    $('.tabledetail .tmp-line').each(function (index) {
        var codeid = $(this).attr("codeid");
        var newitemcode = $(this).find(".newitemcode").html();
        var itemname = $(this).find(".itemname").html();
        var standar = $(this).find(".sl-standar-sub").find(":selected").text();
        var qltincase = $(this).find(".qltincase").val();
        var qltcase = $(this).find(".qltcase").val();
        var totalprice = $(this).find(".totalprice").val();
        var qltcontainer = $(this).find(".qltcontainer").val();
        var remark = $(this).find(".remark").val();
        if (newitemcode === "" || itemname === "" || standar === "" || qltincase === "" || qltcase === "" || totalprice === "" || qltcontainer === "") {
            return false;
        }
        else {
            var i = {
                codeid: codeid,
                codebill: codebill,
                newitemcode: newitemcode,
                itemname: itemname,
                standar: standar,
                qltincase: qltincase,
                qltcase: qltcase,
                totalprice: totalprice,
                qltcontainer: qltcontainer,
                remark: remark
            };
            data.push(i);
        }
    });
    
    var rs = submitdatabill(JSON.stringify(data), "detailbuy", "-1");
    $(".table3 .item-insert").remove();
  
    getdetail("detailbillbuy", "codebill", codebill, 'table3');

    $("#popdetail").modal('toggle');
}

function checknull(o) {
    var rs = true;
    $("." + o + " .data-not-null").each(function (index) {
        var vl = "";
        if ($(this).hasClass("sl-option")) {
            vl = $(this).find(":selected").text();
        }
        else {
            vl = $(this).val();
        }
        if (vl === "") {
            $(this).focus();
            rs = false; return false;
        }
    });
    return rs;
}
function savesubdetail() {
    var data = [];
    
    var idbill = $('.table1 .tr-active').attr('codeid');
    $('.tablesubdetail .item-sub-detail').each(function (index) {
        var codeid = $(this).attr("codeid");
        var codeidsub = $(this).attr("codeidsub");
        var dateclearance = $(this).find(".dateclearance").val();
        var customsday = $(this).find(".customsday").val();
        var port = $(this).find(".sl-port").find(":selected").text();
        var containernumber = $(this).find(".containernumber").val();
        var daycertificate = $(this).find(".daycertificate").val();
        var sizefit = $(this).find(".sl-sizefit").find(":selected").val();
        var containerday = $(this).find(".containerday").html();
        var conreturnday = $(this).find(".conreturnday").val();

        var requestday = $(this).find(".requestday").val();
        var confirmreceiptday = $(this).find(".confirmreceiptday").val();
        var serinumber = $(this).find(".serinumber").val();
        var prodcode = $(this).find(".prodcode").val();

        var casenom = $(this).find(".casenom").val();
        var proddate = $(this).find(".proddate").val();
        var i = {
         
            codeid: codeid,
       
            dateclearance: dateclearance,
            customsday: customsday,
            port: port,
            containernumber: containernumber,
            daycertificate: daycertificate,
            sizefit: sizefit,
            containerday: containerday,
            conreturnday: conreturnday,
            requestday: requestday,
            confirmreceiptday: confirmreceiptday,
            serinumber: serinumber,
            prodcode: prodcode,
            casenom: "",
            proddate: proddate
        };
        data.push(i);
    });
 
    var rs = submitdatabill(JSON.stringify(data), "subdetailbuybill", "-1");
    getdetail("detailbillbuy", "codebill", idbill, 'table3');

    $("#popdetail").modal('toggle');
}
function opensubdetail(ftdate) {
    var o = $(".table1 .tr-active");
    if (o.length <= 0)
        return false;
    $('.item-sub-detail').remove();
    var condate=$(".ship-condate").html();
    var order = 1;
    var slport ='<select class="sl-option sl-port" data-sql="port"><option></option><option value="1">I</option><option value="2">B</option></select>';
    var fit = '<select class="sl-option sl-sizefit" data-sql="sizefit"><option></option><option value="20">20 ft</option><option value="40">40 ft</option></select>';
    $(".tabledata2 .it-insert").each(function (index) {
        var r = $(this);
        var nameit = $(this).attr("nameitem");
        var bitem = $(this).attr("bitem");
        var tr = "<tr class='item-sub-detail' codeid='" + $(r).attr('codeid') +"' codeidsub=''><td>" + order + "</td>";
        $(".tablesubdetail th").each(function (index) {

            var vl = "";
            if (index > 0) {
                var type = $(this).attr("date-type");
                var typesql = $(this).attr("data-sql");
                $(r).find("td").each(function (index) {
                   var typesqlw = $(this).attr("data-sql");
               
                    if (typesql === typesqlw) {
                       
                        vl = $(this).html();
                        return false;
                    }
                });
                if (type === "data-date")
                    tr += "<td>" + '<input type="text" value="'+vl+'" class="txt-input datecombo ' + typesql + '"/>' + "</td>";
                else if (type === "data-select") {

                    if (typesql === "port")
                        tr += "<td>" + slport + "</td>";
                    else if (typesql === "sizefit") {

                        tr += "<td>" + fit + "</td>";
                    }
                }
                else if (type === "data-auto") {
                    if (typesql === "containerday")
                        tr += "<td class='" + typesql+"'>" + condate + "</td>";
                    else if (typesql === "itemname") {
                        tr += "<td>" + nameit + "</td>";
                    }
                    else if (typesql === "qltB") {
                        tr += "<td>" + bitem + "</td>";
                    }
                }
                else if (type === "data-input") {

                    tr += "<td class='" + typesql +"'><input type='text'/></td>";
                }
                else {
                    tr += "<td></td>";
                    
                }
            }
        });

        tr += "</tr>";
        $(tr).appendTo('.tablesubdetail tbody');
        order++;
    });
    $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
    openpopup('popsubdetail');
}
