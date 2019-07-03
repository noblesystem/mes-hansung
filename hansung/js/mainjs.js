var rightdata = ["quantityincase", "qltcase","qltcontainer","price", "pricesupply", "vat", "totalamount","sqm"];
var moneyl = ["price", "pricesupply", "vat", "totalamount", "sqm", "money", "cashT_T", "billL_C","feesmoney"];
var lcury = ["price", "pricesupply", "vat", "totalamount"];
var x_w, y_h;
$(document).ready(function () {

    $(".close_up_subpopup").mouseleave(function () {
        $(".group-btn").hide();
    });
});

function convertdata_tr(tr) {
    var data = [];
    $(tr).find(".td-data-a").each(function (index) {
        var dtquery = $(this).attr('data-sql');

        var vl = "";
        if ($(this).hasClass('data-input')) {

            vl = $(this).find("input[type=text]").val();
        }
        else if ($(this).hasClass('select-dt')) {
            var obj = $(this).find(".sl-option");
            vl = $(obj).find(":selected").text();

        }
        else if ($(this).hasClass('pinput')) {
            vl = $(this).find(".p-input").html();
        }
        else if ($(this).hasClass('select-check')) {
            vl = $(this).find(".check-option").prop('checked');
        }
        else
            vl = $(this).html();
        if (moneyl.indexOf(dtquery) > -1) {
            vl = convermoneytostr(vl);
            
        }
        var i = {
            name: dtquery,
            vl: vl
        };
        data.push(i);
    });
    return data;
}
function convermoneytostr(o) {
    var a = ["₩", "$"];
    for (var i = 0; i < a.length; i++) {
        o = o.replace(a[i], "");
    }
    return o;
}
function convertdata_tr_td_data(tr) {
    var data = [];
    $(tr).find(".td-data").each(function (index) {
        var dtquery = $(this).attr('data-sql');
        var vl = "";
       
        if ($(this).hasClass('data-input')) {

            vl = $(this).find("input[type=text]").val();
        }
        else if ($(this).hasClass('select-dt')) {
            var obj = $(this).find(".sl-option");
            vl = $(obj).find(":selected").text();

        }
        else if ($(this).hasClass('pinput')) {
            vl = $(this).find(".p-input").html();
        }
        else if ($(this).hasClass('select-check')) {
            vl = $(this).find(".check-option").prop('checked');
        }
        if (moneyl.indexOf(dtquery) > -1) {
            vl = convermoneytostr(vl);
        }
        var i = {
            name: dtquery,
            vl: vl
        };
        data.push(i);
    });
    return data;
}
function converdatatable_ctr(table) {
   var data = [];
    $("." + table + " .td-data").each(function (index) {
        var dtquery = $(this).attr('data-sql');
        var vl = "";

        if ($(this).hasClass('data-input')) {

            vl = $(this).find("input[type=text]").val();
        }
        else if ($(this).hasClass('select-dt')) {
            var obj = $(this).find(".select-op");
            vl = $(obj).find(":selected").text();

        }
        else if ($(this).hasClass('pinput')) {
            vl = $(this).find(".p-input").html();
        }
        else if ($(this).hasClass('select-check')) {
            vl = $(this).find(".check-option").prop('checked');
        }
        var i = {
            name: dtquery,
            vl: vl
        };
        data.push(i);
    });
    if (table === "tbship") {
        var i = {
            name: "codeid",
            vl: ""
        };
        data.push(i);
    }

    return JSON.stringify(data);
}
function checkdatanull_ctr_header(table) {
    var rs = true;
    $('.er_bill').html('');
  
    $("." + table + " .data-not-null-td").each(function (index) {
        var vl = "";
        var alerts = $(this).attr("note_alert");
        if ($(this).hasClass("data-input"))
            vl = $(this).find("input[type=text]").val();
        else if ($(this).hasClass("data-auto"))
            vl = $(this).html();
        else if($(this).hasClass("select-dt")) {
       
            vl = $(this).find('.select-op').find(":selected").text();
            if (vl === "Select one")
                vl = "";
        }
        else if ($(this).hasClass("pinput"))
            vl = $(this).find('.p-input').html();
       
        if (vl === "") {
        
            $('.er_bill').html(alerts +"을 입력하세요");
            rs = false;
            return false;
        }
    });
    return rs;
}
function  checkdatanull_detail_ctr_header(table) {
    var rs = true;
    $('.er_bill').html('');

    $("." + table + " .tr_new").each(function (index) {
      
        $(this).find(".not-null").each(function (index) {
          
            var vl = "";
            var alerts = $(this).attr("note_alert");
            if ($(this).hasClass("data-input"))
                vl = $(this).find("input[type=text]").val();
            else if ($(this).hasClass("data-auto"))
                vl = $(this).html();
            else if ($(this).hasClass("select-dt")) {

                vl = $(this).find('.sl-option').find(":selected").text();
                if (vl === "Select one")
                    vl = "";
            }
            else if ($(this).hasClass("pinput"))
                vl = $(this).find('.p-input').html();

            if (vl === "") {
          
                $('.er_bill').html(alerts + "을 입력하세요");
                rs = false;
                return false;
            }
        });
        if (rs === false)
            return false;
    });
       
    return rs;
}
function get_data_detail_ctr(table) {
    var rs = true;
    var data = [];

    $("." + table + " .data_insert").each(function (index) {
        var tmp = [];
        var codeid = $(this).attr("codeid");
        $(this).find(".td-data-a").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = $(this).html();
            if ($(this).hasClass("data-input")) {
                console.log(qr)
                vl = $(this).find("input[type=text]").val();
            }
            else if ($(this).hasClass("data-auto"))
                vl = $(this).html();
            else if ($(this).hasClass("select-dt")) {
             
                vl = $(this).find('.sl-option').find(":selected").text();
           
                if (vl === "Select one")
                    vl = "";
            }
            else if ($(this).hasClass("pinput"))
                vl = $(this).find('.p-input').html();
            var i = {
                name: qr,
                vl: vl
            };
            
            tmp.push(i);
           
        });
        var j = {
            name: "codeid",
            vl: codeid
        };
        tmp.push(j);
        data.push(tmp);
    });
    return JSON.stringify(data);
}
function resetrowAll(row) {
    $(row).find(".td-data-a").each(function (index) {
        var qr = $(this).attr("data-sql");
        
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("data-auto"))
            $(this).html('');
        else if ($(this).hasClass("sl-noempty"))
            $(this).find('.sl-option').val(-1);
        else if ($(this).hasClass("select-dt"))
            $(this).find('.sl-option').empty();
        else if ($(this).hasClass("pinput"))
            $(this).find('.p-input').html('');
        if (qr === "serinumber")
            $(this).html('');
    });
} 
function resetrow(row) {
    $(row).find(".td-reset").each(function (index) {
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("data-auto"))
            $(this).html('');
        else if ($(this).hasClass("sl-noempty"))
            $(this).find('.sl-option').val(-1);
        else if ($(this).hasClass("select-dt"))
            $(this).find('.sl-option').empty();
        else if ($(this).hasClass("pinput"))
            $(this).find('.p-input').html('');
    });
} 
function resetTrinput(tr) {
    $("." + tr + " td").each(function (index) {
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("data-auto"))
            $(this).html('');
        else if ($(this).hasClass("select-dt"))
            $(this).find('.sl-option').empty();
        else if ($(this).hasClass("pinput"))
            $(this).find('.p-input').html('');
    });
}
function openpopupupfile() {
    $('.fileup').trigger('click');
}
function getDataFromAttr(objTr, attr, vlattr) {
    var vl = "";
    $(objTr).find("td").each(function (index) {
        var qr = $(this).attr(attr);
        if (qr === vlattr) {
            vl = $(this).html();
            return false;
        }
    });
    return vl;
}
function getdatarow(table) {
    var data = [];
    $("." + table+" .data_insert").each(function (index) {
        var o = $(this);
        var tmp = [];
        $(o).find(".td-data-a").each(function (index) {
            var sql = $(this).attr("data-sql");
            var vl = "";
            if ($(this).hasClass("data-auto"))
                vl = $(this).html();
            else if ($(this).hasClass("data-input"))
                vl = $(this).find("input[type=text]").val();
            else if ($(this).hasClass("select-dt"))
                vl = $(this).find(".sl-option").find(":selected").text();
            else if ($(this).hasClass("pinput"))
                vl = $(this).find(".p-input").html();

            var i = {
                name: sql,
                vl: vl
            };
            tmp.push(i);
        });
        data.push(tmp);
    });
    return JSON.stringify(data);
}
function binddatafollowTh(table, json) {
    var tr = "<tr class='td-detail-order' codeid='" + json["id"]+"'>";
    $("." + table + " th").each(function (index) {
 
        var qr = $(this).attr("data-ip");
        var vl = json[qr];
        if (vl === undefined || vl===null)
            vl = "";
        tr += "<td class='td-data' data-qr='" + qr + "'>" + vl + "</td>";
    });
    $(tr).prependTo("." + table + " tbody");
}
function CreateNewRow(table) {
    var sl_opt = [];

    var tr = $("." + table + " .tr-input").clone();
    $(tr).removeClass("tr-input");
    $(tr).addClass("data_insert");
    $(tr).find(".rm-row").removeClass("datahidden");
    $(tr).insertBefore("." + table + " .tr-input");

    $("." + table + " .tr-input td").each(function (index) {
        if ($(this).hasClass("select-dt")) {
            var o = $(this).find(".sl-option").find(":selected").text();
            sl_opt.push(o);
            setselectbytext($(this).find(".sl-option"), "");

        }
        else if ($(this).hasClass("data-input")) {
            $(this).find("input[type=text]").val("");
        }
        else
            $(this).html("");
        $(this).find(".td-itemname").focus();
    });

    setautocompleat($(tr).find(".td-itemname"), items);
    $(tr).find(".sl-option").each(function (index) {
        setselectbytext(this, sl_opt[index]);
    });
}
function removeparent(o) {
    var obj = $(o).parent().parent().remove();
}
function addrownew(table) {
   
    var cc = checknull(table);
    if (cc === false)
        return false;
    var tr = "<tr class='td-detail-order' codeid=''><td></td>";
    $("." + table+" .td-data-a").each(function (index) {
        var qr = $(this).attr("data-sql");
        var vl = getdatatd($(this));

        tr += "<td class='td-data' data-sql='" + qr + "'>" + vl + "</td>";
    });
    tr += "<td class='remove' onclick='removerow(this)'>x</td></tr>";
    $(tr).appendTo("." + table+" tbody");
    resetinputpopup2(table);
    $('.td-itemname').focus();
    $('.au-itemcode').html('');
    $('.sl-standar').empty();
}
function includedatas(o, vl) {
  
    if ($(o).hasClass("data-input"))
        $(o).find("input[type=text]").val(vl);
    else if ($(o).hasClass("pinput"))
        $(o).find(".p-input").html(vl);
    else if ($(o).hasClass("select-check")) {
        if (vl === 'true')
            $(o).find(".check-option").prop("checked", true);
    }
    else if ($(o).hasClass("select-dt")) {
        //$("#myDropdown option:contains(Option 2)").attr('selected', 'selected');
        $(o).find("option:contains('" + vl + "')").prop("selected", true);
    }
}

function closedropdow(o) {

    $("." + o).slideToggle();
    //alert($("." + o).is(':visible'))
    //if (!$("." + o).is(':visible')) {
    //    $("." + o).slideToggle();
    //}
    //$(".group-btn").hide();
}
function setselectoption(c, vl) {
     $(""+c+" option:contains('" + vl + "')").prop("selected", true);

}
function setselectoptionselect(c, vl) {
   $(c).find("option:contains('" + vl + "')").prop("selected", true);

}
function dulicatelick() {
    $(".table3 tr").click(function () {

        $(".table3 tr").removeClass("tr-active");
        $(".tabledata2 tr").removeClass("tr-active");
        var c = $(this).attr("codeid");
        $(this).addClass("tr-active");
        $(".tabledata2 tr").each(function (index) {
            var cc = $(this).attr("codeid");
            if (cc === c)
                $(this).addClass("tr-active");
        });
    });
}
function resetinputpopup2(table) {
    $("." + table + " .td-data-a").each(function (index) {
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("select-dt"))
            $(this).find(".select-op option:eq(0)").prop("selected", true);
    });
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
function newcodefile(c, n) {
    var chars = ["A", "B", "C", "D", "E", "F", "G"];
    var rs = "";
    var k = $(n).val().replace(/\./g,"");

    var g = c + k;
    var o = $('.table1 .it-insert');
   
    var a = $(o).find(".ordernumber").html();
  
    try {
        for (var i = 1; i < a.length; i++) {
            var m = chars.indexOf(a[i]);
            if (m !== -1) {

                var b = a.split(chars[m]);

                if (g === b[0]) {
             
                    rs = g + chars[m + 1] + "01";
                    $(n).val(rs);
                    return false;
                }
            }

        }
    }
    catch{}
       
    if (rs === "")
        rs = g + "A01";
    $(n).val(rs);
} 
function newcodenotChar(c, n) {

    var chars = ["A", "B", "C", "D", "E", "F", "G"];
    var rs = "";
    var k = $(n).val().replace(/\./g, "");

    var g = c + k;
    var o = $('.table1 .it-insert');

    var a = $(o).find(".ordernumber").html();

    try {
        for (var i = 1; i < a.length; i++) {
            var m = "";
            if (m !== -1) {

                var b = a.split(chars[m]);

                if (g === b[0]) {

                    rs = g + "01";
                    $(n).val(rs);
                    return false;
                }
            }

        }
    }
    catch{ }

    if (rs === "")
        rs = g + "01";
    $(n).val(rs);
} 
function resetinputpopup(table) {
    $("." + table + " .td-data").each(function (index) {
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("select-dt"))
            $(this).find(".select-op option:eq(0)").prop("selected", true);
    });
}
function createbill(popup, tb) {
    resetinputpopup("tbinput");
    $('.table1 tr').removeClass("tr-active");
    $(".table3 tbody").empty(); 
    $(".tabledata2 tbody").empty();
    $(".table2 .td-data").html('');
    $("."+tb).attr("codeid", "");
    $("#" + popup).modal("toggle");
}
function converdataftable(table) {
    var rs = checkdatanull(table);
  
    if (rs === false)
        return false;
    var data = [];
    $("." + table + " .td-data").each(function (index) {
        var dtquery = $(this).attr('data-sql');
        var vl = "";
        if ($(this).hasClass('data-input'))
            vl = $(this).find("input[type=text]").val();
        else if ($(this).hasClass('select-dt')) {
            var obj = $(this).find(".select-op");
            vl = $(obj).find(":selected").text();

        }
        else if ($(this).hasClass('pinput')) {
            vl = $(this).find(".p-input").html();
        }
        else if ($(this).hasClass('select-check')) {
            vl = $(this).find(".check-option").prop('checked');
        }
        var i = {
            name: dtquery,
            vl: vl
        };
        data.push(i);
    });
    return JSON.stringify(data);
}
function binddetailbill() {
    var codebill = $(".table3 .it-insert").attr("codeid")
    var rs2 = getdetailObj("detailbillbuy", "codebill", codebill);
  
}
function cretenewsalse(tablesave) {
    var data = converdataftable('tbinput');
    
    if (data === false)
        return false;
    popenload("newItem");
    var c = $(".tbinput").attr("codeid");
    var rs = savedata("billbuy", data, c);
    binddata("table1", JSON.parse(rs),c);
    closepopenload();
    if (c === "") {
        openEditdetail();
        $('.table2 .td-data').html('');
    }

    selectrbill();
    //$("#newItem").modal("toggle");
    //selectrbillOrder();
    //openEditdetail();

}
function openEditdetail() {
    $(".td-detail-order").remove();
    $("#popupdetail").modal("toggle");

    if ($(".table3 .it-insert").length <= 0)
        return false;
    $(".table3 .it-insert").each(function (index) {
        var o = $(this);
        var tr = "<tr class='td-detail-order'><td></td>";
        $(".tr-input .td-data-a").each(function (index) {
            var qr = $(this).attr('data-sql');
            var vl = findatatd(qr, o);
            if (qr === "qltincase" || qr === "qltcase" || qr === "totalamount")
                tr += "<td class='td-data txt-inputs' data-sql='" + qr + "'><input type='text' class='txt-input td-right numberinput' value='" + vl + "'></td>";
            else
                tr += "<td class='td-data' data-sql='" + qr + "'>" + vl + "</td>";
        });
        tr += "<td class='remove' onclick='removerow(this)'>x</td></tr>";
        $(tr).insertAfter(".tr-input");

    });

}
function removerow(o) {
    $(o).parent().remove();
}
function checkselect(table) {
    var o = $("." + table).find(".tr-active");
    var rs = o.length;

    if (rs > 0) {
        rs = $(o).attr("codeid");
    }

    return rs;
}
function binddataship(table, json, codebill) {
    
    var row = "<tr class='tr_ship' codebill='" + codebill + "' codeid='" + json.codeid + "' ship='" + json.shipnum + "' bitem='" + json.qltbox +"'>";
    $(".table2 th").each(function (index) {
        var qr = $(this).attr("data-sql");
        var vl = json[qr];
        if (vl === null)
            vl = "";
        row += "<td class='ship_" + index+"'>"+vl+"</td>";
    });
    row += "</tr>";
    $(row).appendTo(".table2 tbody");
}
function get_ship_buy(o,t,codebill) {
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/findata_ship",
        data: "{value:'" + o + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        success: OnSuccess,

        error: OnErrorCall
    });
    function OnSuccess(response) {
        if (response.d !== "") {
            var rs = response.d;
            if (rs !== "") {
                var js = JSON.parse(rs);
                var jship = JSON.parse(rs);
                var location = [];

                for (var h = 1; h < jship.length; h++) {
                    if (jship[h].shipnum === "shipone")
                        jship.splice(1, h);

                }

                for (var m = 0; m < jship.length; m++) {

                    jship[m].money = convertnumbertostring(jship[0].money);
                    jship[m].tolerancemoney = convertnumbertostring(jship[0].tolerancemoney);
                    bindship(jship[m], codebill);
                }
                for (var i = 0; i < js.length; i++) {
                   
                    if (t !== "내수")
                        Listbinddatadetailbill("tabledata2", js[i], "1");
                    else {
                  
                        Listbinddatadetailbill("tabledata4", js[i], "1");
                       
                    }
                }
            }
            bindcolor();
            historyShip();
        }
      
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}

function selectrbill() {
   
    $(".table1 tr").click(function () {
        if ($(this).hasClass("tr-active"))
            return false;
        $(".table1 tr").removeClass("tr-active");
        if ($(this).find("th").length > 0)
            return false;
        else if ($(this).hasClass("tr-active") === false) {
    
            popenload("");
            $(".table2 tbody").empty();
            $(".table2 .td-data").html('');
            $(".table3 tbody").empty();
            $(".tabledata2 tbody").empty();
            $(".tabledata4 tbody").empty();
            var type_bill = $(this).find('.terms_main').html();
            var rs = get_ship_buy($(this).attr("codeid"), type_bill, $(this).attr("codeid"));
             var rs2 = getdetailbillbuy($(this).attr("codeid"));
            $(this).addClass("tr-active");
           
            if (type_bill === "내수") {
                $("#data1").hide();
                $(".tabledata4").show();
            }
            else {
                $("#data1").show();
                $(".tabledata4").hide();
            }
            if (rs2 !== "") {
                var js2 = JSON.parse(rs2);
                
                for (var i = 0; i < js2.length; i++) {
                    js2[i].codeitem = returncode(js2[i].codeitem, 4);
                    js2[i].nameitem = js2[i].itemname;
                    Listbinddatadetailbill("table3", js2[i],"0");
                    //Listbinddatadetailbill("tabledata2", js2[i], $(this).attr("codeid"));
                }
            }
            $(".table2 .tr_ship").each(function (index) {
                if (index > 0) {
                    for (var k = 0; k < 9; k++) {
                        $(this).find("td:eq(" + k + ")").html('');
                    }
                }
            });
        }
        historybill();
       
        sortorder('table3');
       
        if (rs2 !== "")
        sumdata(JSON.parse(rs2), ["pricesupply", "vat", "totalamount", "sqm","qltcase"], "table3");
        closepopenload();
        dulicatelick();
   
      
    });
   
}
function bindcolor() {

    $(".tabledata2 .it-insert").each(function (index) {
    
        var box = $(this).attr('bitem');

        if (box === "0")
            $(this).hide();
        var b = $(this).find(".confirmreceiptday").html();
        var c = $(this).find(".conreturnday").html();
        if (b !=="" && c === "")
         {
            $(this).find(".conreturnday").css("background-color", "red");
        }
    });
}
function sumdata(js, cl, table) {
    var currency = $(".table1 .tr-active").attr("currency");

    var sumvl = [];
    for (var n = 0; n < cl.length; n++) {
        sumvl.push(0);
    }
    for (var i = 0; i < js.length; i++) {
        for (var j = 0; j < cl.length; j++) {
            var t = convertstringnumber(js[i][cl[j]]);
            var vl = parseFloat(sumvl[j]) + parseFloat(t);
            sumvl[j]=vl;
        }
    }
    var sum = "<tr class='sumdata_qlt'><td>합계</td>";
   
    $("." + table + " th").each(function (index) {
        if (index > 0) {
           
            var dt = $(this).attr("data-input");
            var vl = "";
            var r = "";
            var m = "";
            if (rightdata.indexOf(dt) !== -1) {
                      r = "td-right";
            }
            
            var idex = cl.indexOf(dt);
            if (idex !== -1) {
                vl = sumvl[idex];
                if (lcury.indexOf(dt) !== -1)
                    vl = currency + " " + convertnumbertostring(vl);
                else if (moneyl.indexOf(dt) !== -1) {
                    vl = convertnumbertostring(vl);

                }
                sum += "<td class='sum" + dt + " " + r + "'>" + vl + "</td>";
            }
            else
                sum += "<td class='nosum'></td>";
        }
    });
    sum += "</tr>";
    $(sum).appendTo("." + table + " tbody");
}
function bindship(js, code) {

    js["departuredate"] = convertdate(js["departuredate"]);
    js["dateofarrival"] = convertdate(js["dateofarrival"]);
    js["conDuedate"] = convertdate(js["conDuedate"]);
    js["datebeginpayment"] = convertdate(js["datebeginpayment"]);
    js["creditduedate"] = convertdate(js["creditduedate"]);
    js["duedate"] = convertdate(js["duedate"]);
    js["shipname"] = findnameworker(js["shipname"]);
    
    binddataship("table2", js, code);
}
function returnnameitem(o) {
    var index = iditems.indexOf(o);
    var name = items[index];
    return name;
}
function returncode(o, n) {
    try {
        if (o.length < n) {
            var nb = n - o.length;
            for (var i = 0; i < nb; i++) {
                o = "0" + o;
            }
        }
        return o;
    }
    catch{
        return "";
    }
}
function openEdit(table1, tbinput, idpopup) {
   
    var c = checkselect('table1');
    if (c === 0)
        return false;
    binddataEdit(table1, tbinput);
    $("#" + idpopup).modal("toggle");
}
function editbillbuy() {
    openEdit('table1', 'tbinput', 'newItem');
    selectcustomer($('.sl-employer'), "");
    var o = $(".table1 .tr-active");
    var vl = $(o).find(".tradingmission").html();
    var codeid = $(o).attr("codeid");

    $(".tbinput").attr("codeid", codeid);
    $(".sl-tradingmission option:contains('" + vl + "')").prop("selected", true);
   
}
function binddatanew(table, json) {
    var tr = "<tr class='it-insert tr-active' codeid='" + json.codeid + "'>";
    $("." + table + " th").each(function (index) {
        var dtquery = $(this).attr('data-input');
        var vl = json[dtquery];
        tr += "<td class='new-" + dtquery + " " + dtquery + " '>" + vl + "</td>";
    });
    tr += "</tr>";
    $(tr).prependTo("." + table + " tbody");

}
function popenload(popupclose) {
    $("#loadscreen").modal("toggle");
    $("#" + popupclose).modal("toggle");
    setTimeout(function () { }, 2000);
    

}
function closepopenload() {

    setTimeout(function () { $("#loadscreen").modal("toggle"); }, 1000);
   
}