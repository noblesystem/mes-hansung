function editpayment() {
    var o = $(".table1 .tr-active");
    if (o.length === 0)
        return false;
    var codebill = $(o).attr("codeid");
    var data = getdetailObj("payment", "codebill", codebill);
    var json = JSON.parse(data);
    var ctm = $(o).find(".tradingmission").html();
    for (var i = 0; i < json.length; i++) {
        json[i].customer = ctm;
        json[i].employer = findnameworker(json[i].employer);
        json[i].paymentdate = convertdate(json[i].paymentdate);
    }
   
    openpopup("poppayment");
    binddatapayment("tbpayment", json[0], codebill);
    setselectoption(".tbpayment .sl_employer", json[0].employer);
}
function binddatapayment(table, json, codebill) {
    var cen = $(".table1 .tr-active").attr("currency");
    $(".tbpayment").attr("codeid", json.codeid);
     $(".tbpayment .td-data").each(function (index) {
        var qr = $(this).attr("data-sql");
         var vl = json[qr];
         if (moneyl.indexOf(qr) > -1)
             vl =cen+ convertnumbertostring(vl);
         if ($(this).hasClass("pinput"))
           $(this).find(".p-input").html(vl);
         else if ($(this).hasClass("data-input"))
             $(this).find("input[type=text]").val(vl);
         else if ($(this).hasClass("select-dt"))
             $(this).find(".select-op option:contains("+vl+")").prop("selected",true);
    });
    $(".tbpayment .employer").val(json["employerstr"]);
    $("#savepayment").attr("idedit", json["id"]);
}
function getdatatd(o) {
    var vl = "";

    if ($(o).hasClass("data-input"))
        vl = $(o).find("input[type=text]").val();
    else if ($(o).hasClass("pinput"))
        vl = $(o).find(".p-input").html();
    else if ($(o).hasClass("data-auto"))
        vl = $(o).html();
    else if ($(o).hasClass("select-check")) {
        if ($(o).find(".check-option").is("checked"))
            vl = 1;
    }
    else if ($(o).hasClass("select-dt")) {
        //$("#myDropdown option:contains(Option 2)").attr('selected', 'selected');
        vl = $(o).find(":selected").text();
    }
    return vl;
}
function saveserinum() {
    var data = [];
    var codeparent = "";
    codeparent = $("#PopupSerialNo").attr("shipId");
    var p = [];
    $(".srnumber-tr").each(function (index) {
   
        var nb = $(this).find(".srnumber").html();
        p.push(nb);
        var i = {
            name: "serinumber",
            vl: nb
        };
       
        data.push(i);
    });

    var rs = savedata("serienumber", JSON.stringify(data), codeparent);
    var a = "<select>";
    for (var i = 0; i < p.length; i++) {
        a += "<option>" + p[i] + "</option>";
    }
    a += "</select>";
    $(a).appendTo(".sl_seri_serinumber");
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

    popenload("popupdetail");
    var rs = savedata("detailbuy", JSON.stringify(data), codebill);
    var js = JSON.parse(rs);
    $('.table3 tbody').empty();
    var rs2 = getdetailObj("detailbillbuy", "codebill", codebill);
    if (rs2 !== "") {
        var js2 = JSON.parse(rs2);
        for (var i = 0; i < js2.length; i++) {
            js2[i].codeitem = returncode(js2[i].codeitem, 4);
            js2[i].nameitem = returnnameitem(js2[i].nameitem);

            ("table3", js2[i], $(this).attr("codeid"));
            Listbinddatadetailbill("tabledata2", js2[i], $(this).attr("codeid"));
        }
       

    }
    sortorder("table3");
    closepopenload();
}
    function findatatdww(o, a) {
        var vl = "";

        $(a).find(' .td-data').each(function (index) {
            var qr = $(this).attr('data-sql');
            if (qr === o) {

                vl = $(this).html();
            }
        });
        return vl;
    }
function Listbinddatadetailbill(table, json,flat) {
    var currency = $(".table1 .tr-active").attr("currency");
    var bitem = "";
    var ship = "";
    var oo = "";
    var shipId = "";
    if (flat === "1") {
        shipId = json.id;
        bitem = json.qltbox;
        ship = json.shipnum;
        oo = json.indexbox;
    }
    else
        bitem = json.qltcase;
    var tr = "<tr class='it-insert' codeid='" + json.codeid + "' nameitem='" + json.nameitem + "' bitem='" + bitem + "' codeitem='" + json.codeitem + "' standard='" + json.standard + "' ship='" + ship + "' shipId='" + shipId+"'>";
        $("." + table + " th").each(function (index) {
            if ($(this).hasClass("index-order") === false) {
                var dtquery = $(this).attr('data-input');
                var r = ""; 
                if (rightdata.indexOf(dtquery) !== -1)
                    r = "td-right";
                var datatype = $(this).attr('data-type');
                var vl = json[dtquery];
                if (vl === null)
                    vl = "";
                if (datatype === "date-dt")
                    vl = convertdate(vl);
                if (datatype === "date-sl") {
                    if(vl!=="")
                        vl = selectseri(vl);
                }
                if (lcury.indexOf(dtquery) !== -1)
                    vl = currency + " " + convertnumbertostring(vl);
                else if (moneyl.indexOf(dtquery) !== -1)
                    vl =convertnumbertostring(vl);
                tr += "<td class='td-data " + dtquery + " "+r+"' data-sql='" + dtquery + "'>" + vl + "</td>";
            }
            else {
                tr += "<td class='new-index'>"+oo+"</td>";
            }
        });
        tr += "</tr>";
        $(tr).appendTo("." + table + " tbody");

}
function selectseri(vl) {
    try {
        var l = vl.split(',');
        var bg = l.length - 1;
        var sl = "<select style='min-width: 100%;'>";
        for (var j = bg; j >= 0; j--) {
            sl += "<option>" + l[j] + "</option>";
        }
        sl += "</select>";
        return sl;
    }
    catch{
        return "";
    }
}
    function addrowdata() {
        var cc = checknull('tabledetailOrder');
        if (cc === false)
            return false;
        var tr = "<tr class='td-detail-order' codeid=''><td></td>";
        $(".tabledetailOrder .td-data-a").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = getdatatd($(this));

            tr += "<td class='td-data' data-sql='" + qr + "'>" + vl + "</td>";
        });
        tr += "<td class='remove' onclick='removerow(this)'>x</td></tr>";
        $(tr).appendTo(".tabledetailOrder tbody");
        resetinputpopup2('tabledetailOrder');
        $('.td-itemname').focus();
        $('.au-itemcode').html('');
        $('.sl-standar').empty();
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
    function includedata(o, vl) {
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
            $(o).find("option:contains(" + vl + ")").prop("selected", true);
        }
}
function strport(o) {
    var t = ["I", "B"];
    var slport = '<select class="sl-option sl-port" data-sql="port"><option></option>';
    for (var i = 0; i < t.length; i++) {
        var selected = "";
        if (t[i] === o)
            selected = "selected";
        slport += "<option " + selected + ">" + t[i] + "</option>";
    }
   
    return slport;
}
function fitsize(o) {
    var t = ["20", "40"];
    var slport = '<select class="sl-option sl-sizefit" data-sql="sizefit"><option></option>';
    for (var i = 0; i < t.length; i++) {
        var selected = "";
        if (t[i] === o)
            selected = "selected";
        slport += "<option " + selected + " value='" + t[i]+"'>" + t[i] + " ft</option>";
    }

    return slport;
}
function opensubdetail(ftdate) {
    var o = $(".table1 .tr-active");
    if (o.length <= 0)
        return false;
    $('.item-sub-detail').remove();
    var condate = $(".ship-condate").html();
    var order = 1;
       $(".tabledata2 .it-insert").each(function (index) {
        var r = $(this);
        var nameit = $(this).attr("nameitem");
           var bitem = $(this).attr("bitem");
           var itemcode = $(this).attr("codeitem");
        
           var tr = "<tr class='item-sub-detail' codeid='" + $(r).attr('codeid') + "' codeidsub='' itemcode='" + itemcode +"'><td>" + order + "</td>";
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
                    tr += "<td>" + '<input type="text" value="' + vl + '" class="txt-input datecombo ' + typesql + '"/>' + "</td>";
                else if (type === "data-select") {

                    if (typesql === "port")
                        tr += "<td>" + strport(vl) + "</td>";
                    else if (typesql === "sizefit") {

                        tr += "<td>" + fitsize(vl) + "</td>";
                    }
                }
                else if (type === "data-sl")
                    tr += "<td class='serinumber'>"+vl+"</td>";
                else if (type === "data-auto") {
                    if (typesql === "containerday")
                        tr += "<td class='" + typesql + "'>" + condate + "</td>";
                    else if (typesql === "itemname") {
                        tr += "<td>" + nameit + "</td>";
                    }
                    else if (typesql === "qltB") {
                        tr += "<td class='qltB'>" + bitem + "</td>";
                    }
                }
                else if (type === "data-input") {

                    tr += "<td><input type='text' class='" + typesql + "' value='"+vl+"'/></td>";
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
    $(".serinumber").click(function () {
        var parent =  $(this).parent();
        var qltB = $(parent).find(".qltB").html();
        var confirmreceiptday = $(parent).find(".confirmreceiptday").val();
        var port = $(parent).find(".sl-port").find(":selected").text();
        var itemcode = $(parent).attr("itemcode");
        var codeid = $(parent).attr("codeid");
   
        if (confirmreceiptday!=="")
            openserinumber(qltB, confirmreceiptday, port, itemcode, codeid);
    });
}
function openserinumber(qltB, confirmreceiptday, port, itemcode, codeid, cuctomer) {

    $("#popsubdetail").modal("toggle");
    var c = checkselect('table1');
   
    if (c === 0)
        return false;
    var od = 1;
    var warehouse = "";
    var tradingmission = "";
    var p = confirmreceiptday.replace(/\./g, "");
    p = p + port + itemcode;
   
    $('.table1 .tr-active .new-td').each(function (index) {
        var sql = $(this).attr("data-sql");
         if (sql === "warehouse") {
               warehouse = $(this).html();
        }
         else if (sql === "tradingmission") {
             tradingmission = $(this).html();
         }
            
    });
    $(".qltB").html(qltB);
    $(".warehouse").html(warehouse);
    $(".tableseriOrder tbody").empty();
    var ordernumber = $(".table1 .tr-active").find(".ordernumber").html();
     for (var i = 0; i < qltB; i++) {
        var h = od;
        if (od < 10)
            h = "0" + h;
        var tr = "<tr class='srnumber-tr' codeparent='" + codeid + "'><td>" + od + "</td>";
         tr += "<td>" + tradingmission+"</td>";
        tr += "<td class='srnumber'>" + p + "-"+h+ "</td>";
        tr += "<td>" + ordernumber + "</td>";
        tr += "<td></td>";
        tr += "</tr>";
        $(tr).appendTo(".tableseriOrder tbody");
        od++;
       
    };
    openpopup('PopupSerialNo');
}
function savesubdetail() {
    var data = [];
    
    var idbill = $('.table1 .tr-active').attr('codeid');
            popenload("popsubdetail"); 
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
            casenom: casenom,
            proddate: proddate
        };
        data.push(i);
    });
 
    var rs = savedata("subdetailbuybill", JSON.stringify(data), "");
    var rs2 = getdetailObj("detailbillbuy", "codebill", idbill);
    $('.table3 tbody').empty();
    $('.tabledata2 tbody').empty();
    if (rs2 !== "") {
        var js2 = JSON.parse(rs2);
        for (var i = 0; i < js2.length; i++) {

            js2[i].codeitem = returncode(js2[i].codeitem, 4);
            js2[i].nameitem = returnnameitem(js2[i].nameitem);
            Listbinddatadetailbill("table3", js2[i], $(this).attr("codeid"));
            Listbinddatadetailbill("tabledata2", js2[i], $(this).attr("codeid"));
        }
    }
    sortorder('table3');
    sortorder('tabledata2');
    sumdata(JSON.parse(rs2), ["price", "pricesupply", "vat", "totalamount", "sqm", "qltcase"], "table3");
    closepopenload();
 
}
function savefirstShip() {
    var c = checkselect('table1');
    if (c === 0)
        c = "";
    var data = converdatatable('tbship');

    if (data === false)
        return false;
    popenload("inforcontainer"); 
    var rs;
    var codeid = $(".tbship").attr("codeid");
    var codebill = $(".table1 .tr-active").attr('codeid');
   
        rs = savedata("ship", data, codebill);
   
    try {
        var jsrs = JSON.parse(rs);
    }
    catch{
        console.log();
    }
    var rs2 = getdetailObj("ship", "codebill", codebill);
   
    var jj = JSON.parse(rs2);
    jj[0].money = convertnumbertostring(jj[0].money);
    jj[0].tolerancemoney = convertnumbertostring(jj[0].tolerancemoney);
    bindship(jj[0], codeid);
   
    closepopenload();
    opensubdetail();

}
function opentpopuppayment() {
    var o = $(".table1").find(".tr-active");
    if (o.length === 0)
        return false;
    var acc = $(o).attr("accbank");
    var code = $(o).find("td:eq(0)").html();
    var terms = $(o).attr("terms");
    var tradingmission = $(o).find(".tradingmission").html();
    if (terms !== "내수")
        terms = "외수";
    openpopup('poppayment');
    $('.input-codeorder').html(code);
    $('.pm-customer').html(tradingmission);
    $('.paymentaccount').html(acc);
    setselectoption(".select_terms", terms);
    $('#savepayment').attr("idedit","0");
 
}
function savepayment() {
    var o = $(".table1").find(".tr-active");

    var codebill = $(o).attr("codeid");
    var data = converdatatable('tbpayment');
    if (data === false)
        return false;
    var idedit = $("#savepayment").attr("idedit");
    if(idedit==="0")
        var rs = savedata("payment", data, codebill);
    else
        var rs2 = savedata("editpayment", data, codebill);
    $("#poppayment").modal("toggle");
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
    var sumamt = $(".sumtotalamount").html();
    $('.input-money-amt').html(sumamt);
}