
function opennewcreate() {
    resetcar();
    $('.table1 tr').removeClass("tr-active");
    $(".table3 tbody").empty();
    $(".table2 .td-data").html('');
    resetinputpopup('tbinput');
    $("#newItem").modal("toggle");

}
function openpaymentOrder() {
    var c = checkselect('table1');
    if (c === 0)
        return false;
    var t = $('.tablepay .it-insert').length;
    if (t > 0)
        return false;
    resetinputpopup('poppayment');
    $("#poppayment").modal("toggle");
    var code = $('.table1 .tr-active .orderdate').html();
    $('#poppayment .input-codeorder').html(code);
    var customercompany = $('.table1 .tr-active .customercompany').html();
    $('#poppayment .pm-customer').html(customercompany);
    var acc = getaccoutctm(customercompany);
    $('#poppayment .paymentaccount').html(acc);
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
function returnnameitem(o) {
    var index = iditems.indexOf(o);
    var name = items[index];
    return name;
}
function Listbinddatadetail(table, json) {

    var tr = "<tr class='it-insert' codeid='" + json.codeid + "' nameitem='" + json.nameitem + "' bitem='" + json.qltcase + "'>";
    $("." + table + " th").each(function (index) {
        if ($(this).hasClass("index-order") === false) {
            var dtquery = $(this).attr('data-input');
            var datatype = $(this).attr('data-type');
            var r = "";
            if (rightdata.indexOf(dtquery) !== -1)
                r = "td-right";
            var vl = json[dtquery];
            if (vl === null)
                vl = "";
            if (datatype === "date-dt")
                vl = convertdate(vl);
            if (moneyl.indexOf(dtquery) !== -1) {
                vl = convertstringnumber(vl);
                vl = convertnumbertostring(vl);
            }
            
            tr += "<td class='td-data "+r+"' data-sql='" + dtquery + "'>" + vl + "</td>";
        }
        else {
            tr += "<td class='new-index'></td>";
        }
    });
    tr += "</tr>";
    $(tr).prependTo("." + table + " tbody");

}
function removerow(o) {
    $(o).parent().remove();
}
function savedetailOrder() {
    var data = [];

    $(".td-detail-order").each(function (index) {
        var tmp = [];
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
        data.push(tmp);
    });
    var codebill = $(".table1 .tr-active").attr('codeid');
    var rs = savedata("detailorder",JSON.stringify(data), codebill);
    var js = JSON.parse(rs);
    $('.table3 tbody').empty();
 
    for (var i = 0; i < js.length; i++) {

         js[i].itemcode = returncode(js[i].itemcode, 4);
        Listbinddatadetail("table3", js[i]);
    }
    sortorder("table3");
    sumdata(js, ["pricesupply", "vat", "totalamount", "sqm", "qltcase"], "table3");
    $("#popupdetail").modal("toggle");
}
function addrowdata() {
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
                    tr += "<td class='td-data txt-inputs' data-sql='" + qr + "'><input type='text' class='txt-input td-right numberinput' value='"+vl+"'></td>";
                else
                     tr += "<td class='td-data' data-sql='"+qr+"'>" + vl + "</td>";
            });
        tr += "<td class='remove' onclick='removerow(this)'>x</td></tr>";
        $(tr).insertAfter(".tr-input");

    });
  
}
function findatatd(o,a) {
    var vl = "";

    $(a).find(' .td-data').each(function (index) {
        var qr = $(this).attr('data-sql');
        if (qr === o) {

            vl = $(this).html();
        }
    });
    return vl;
}
function resetcar() {
    $('.table2 .td-data').each(function (index) {
        $(this).html('');
    });
}
function getdatanosort(obj, column, value, table) {
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/getdatanosort",
        data: "{obj:'" + obj + "',column:'" + column + "',value:'" + value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {
        if (response.d === "")
            rs = "";
        else
            rs = response.d;
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function selectrbillOrder() {
   
    $(".table1 tr").click(function () {
       
        if ($(this).find("th").length > 0)
            return false;
        else if ($(this).hasClass("tr-active") === false) {
           
            $(".table1 tr").removeClass("tr-active");
            $(".table3 tbody").empty();
            $(".table2 tbody").empty();
            resetcar();
            var rs = getdatanosort("carship", "codebill", $(this).attr("codeid"));
            var rs2 = getdetailObj("detailorder", "codebill", $(this).attr("codeid"));
            var pm = getdetailObj("paymentOrder", "codebill", $(this).attr("codeid"));
            if (rs !== "") {
                var js = JSON.parse(rs);
                for (var i = 0; i < js.length; i++) {
                    js[i].deliveryworker = findnameworker(js[i].deliveryworker);
                    js[i].company = findnamecompany(js[i].company); 
                    js[i].verifyingacceptance = convertdate(js[i].verifyingacceptance);
                    js[i].shippingtime = convertdatetime(js[i].shippingtime);
                    js[i].rate = convertnumbertostring(js[i].rate);
                    binddataCar("table2", js[i], $(this).attr("codeid"));
                }
            }
            if (pm !== "") {
                var jspm = JSON.parse(pm);
         
                for (var i = 0; i < jspm.length; i++) {
                    jspm[i].paymentdate = convertdate(jspm[i].paymentdate);
                    jspm[i].employer = findnameworker(jspm[i].employer);
                    jspm[i].customer = findnamecompany(jspm[i].customer); 
                    Listbinddatadetail("tablepay ", jspm[i], $(this).attr("codeid"));
                }
            }
            if (rs2 !== "") {
                var js2 = JSON.parse(rs2);
              
                for (var i = 0; i < js2.length; i++) {
                  
                    js2[i].itemcode = returncode(js2[i].itemcode, 4);
                    js2[i].itemname = findnameItem(js2[i].itemid);
                    Listbinddatadetail("table3", js2[i], $(this).attr("codeid"));
                }
            }
        }
        
        $(this).addClass("tr-active");
        sortorder("table3");
        sumdata(JSON.parse(rs2), ["pricesupply", "vat", "totalamount", "sqm", "qltcase"], "table3");
    });

}
function opennewCar() {
  
    var c = checkselect('table1');
    if (c === 0)
        return false;
    var orderdate = $('.table1 .tr-active').find(".orderdate").html();
    resetinputpopup('tbinputCar');
    $("#newCar").modal("toggle");
    var now = new Date(Date.now());
    var dNow = new Date();
    var formatted = now.getFullYear() + "." + (dNow.getMonth() + 1) + "." + dNow.getDate()+"  "+ now.getHours() + ":" + now.getMinutes() ;
    $(".input-shippingtime").html(formatted);
    var o= $(".codetranfer").length;
    var n = o;
    if (n < 10)
        n = "0" + n;
    var old = orderdate + "-" + n;
    $(".p-forwardingnumber").html(old);
    $('.tbinputCar').attr("codeid", "");
}
function cretenewsalse() {
    var c = checkselect('table1');
    if (c === 0)
        c = "";
    popenload("newItem");
    var data = converdatatable('tbinput');
    if (data === false)
        return false;
 
    var rs = savedata("orderbill", data, c);
    binddata("table1",JSON.parse(rs),c);
    closepopenload();
    selectrbillOrder();
    openEditdetail();
    
}
function cretenewpayment() {
    var c = checkselect('table1');
    if (c === 0)
        return false;
    var data = converdatatable('tbpayment');
    if (data === false)
        return false;
    var rs = savedata("paymentorder", data, c);
    
    $("#poppayment").modal("toggle");
}
function cretenewcar() {
    var c = checkselect('table1');
    if (c === 0)
        c = "";
    var data = converdatatable('tbinputCar');
    if (data === false)
        return false;
    var rs;
    var codeid = $(".tbinputCar").attr("codeid");
    var codebill = $(".table1 .tr-active").attr('codeid');
    if(codeid==="")
        rs = savedata("carship", data, codebill);
    else
        rs = savedata("Editcarship", data, codeid);
    try {
        var jsrs = JSON.parse(rs);
    }
    catch{
        console.log();
    }
    resetcar();
    var rs2 = getdetailObj("carship", "codebill", codebill);
 
    if (rs2 !== "") {
        var js = JSON.parse(rs2);

        for (var i = 0; i < js.length; i++) {

            js[i].deliveryworker = findnameworker(js[i].deliveryworker);
            js[i].company = findnamecompany(js[i].company);
            binddataCar("table2", js[i], $(this).attr("codeid"));
        }
    }

    $("#newCar").modal("toggle");
}
function binddataCar(table, json, codebill) {
    var tr = "<tr class='car_it'  box='" + json.qltBox + "' codeid='" + json.codeid + "' ship='" + json.ship + "' shipid='" + json.id + "' indexbox='" + json.indexbox +"'>";
    $(".table2 th").each(function (index) {
        var qr = $(this).attr("data-input");
        var vl = json[qr];
        if (vl === undefined || vl === null)
            vl = "";
        tr += "<td  qr='"+qr+"'>" + vl + "</td>";

    })
    tr += "</tr>";
    $(tr).appendTo(".table2 tbody");
}
function resetinputpopup2(table) {
    $("." + table + " .td-data-a").each(function (index) {
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("select-dt"))
            $(this).find(".select-op option:eq(0)").prop("selected", true);
    });
}
function resetinputpopup(table) {
    $("." + table +" .td-data").each(function (index) {
        if ($(this).hasClass("data-input"))
            $(this).find("input[type=text]").val('');
        else if ($(this).hasClass("select-dt"))
            $(this).find(".select-op option:eq(0)").prop("selected",true);
    });
}
function openEdit(table1, tbinput,idpopup) {
    var c = checkselect('table1');
    if (c === 0)
        return false;
    var rs = binddataEditsale(table1, tbinput);
   
    $("#" + idpopup).modal("toggle");
  
    var f = $('.sl-workers').find(":selected").val();
    bindoptionctmfollowwk(f, 'sl-companys');
    $(".sl-companys option:contains(" + rs.customercompany + ")").prop("selected", true);
    $(".frame option:contains(" + rs.frame + ")").prop("selected", true);
    var a = $(".sl-companys").find(":selected");
    if ($(a).val() === -1)
        return false;
    binddatactm($(a).text(), 'input-customercontacts', 'h', 'phonenumber');
    binddatactm($(a).text(), 'input-contactphone', 'h', 'destinationphone');
    binddatactm($(a).text(), 'input-destinationaddress', 'h', 'destinationaddress');

}
function binddataEditsale(tableget, tablebin) {

    var trget = $("." + tableget + " .tr-active");
    var data = [];
    var wk = {
        customercompany: '',
        frame:''
    };
    $(trget).find(" .new-td").each(function (index) {
    
        var dtquery = $(this).attr('data-sql');
        
        var vl = $(this).html();
        var i = {
            name: dtquery,
            vl: vl
        };
        data.push(i);
        if (dtquery === "customercompany") {
            wk.customercompany = vl;
         }
        if (dtquery === "frame") {
            wk.frame = vl;
        
        }
    });

    for (var i = 0; i < data.length; i++) {
        var n = data[i].name;
        var vl = data[i].vl;
        $("." + tablebin + " .td-data").each(function (index) {
            var dtquery = $(this).attr('data-sql');

            if (dtquery === n) {
                if ($(this).hasClass('data-input'))
                    $(this).find("input[type=text]").val(vl);
                else if ($(this).hasClass('select-dt')) {
                    var obj = $(this).find(".select-op");
                    setselectbytext(obj, vl);

                }
                else if ($(this).hasClass('pinput'))
                    $(this).find(".p-input").html(vl);
                if ($(this).hasClass('select-check')) {
                    if (vl.toLowerCase() === "true")
                        $(this).find(".check-option").prop("checked", true);

                }

            }
        });
    }
    return wk;
}
function openEditCar(table1, tbinput, idpopup) {
    var c = checkselect('table1');
    if (c === 0)
        return false;
    var codeid = $('.table2').attr("codeid");
    $(".table2 .td-data").each(function (index) {
        var qr = $(this).attr("data-sql");
        var vl = $(this).html();
        $("." + tbinput + " .td-data").each(function (index) {
            var qr2 = $(this).attr("data-sql");
            if (qr2 === qr) {
                includedata($(this), vl);
                return false;
            }
        });
        
    });
    $('.tbinputCar').attr('codeid', codeid);
    $("#" + idpopup).modal("toggle");
}
function getdatatd(o) {
    var vl = "";

    if ($(o).hasClass("data-input"))
        vl=$(o).find("input[type=text]").val();
    else if ($(o).hasClass("pinput"))
        vl = $(o).find(".p-input").html();
    else if ($(o).hasClass("data-auto"))
        vl = $(o).html();
    else if ($(o).hasClass("select-check")) {
        if ($(o).find(".check-option").is("checked"))
            vl =1;
    } 
    else if ($(o).hasClass("select-dt")) {
        //$("#myDropdown option:contains(Option 2)").attr('selected', 'selected');
        vl =$(o).find(":selected").text();
    } 
    return vl;
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
        $(o).find("option:contains("+vl+")").prop("selected", true);
    }
}
function checkselect(table) {
    var o = $("." + table).find(".tr-active");
    var rs = o.length;
  
    if (rs > 0) {
        rs = $(o).attr("codeid");
    }

    return rs;
}
function createnewcode(obj) {
    var chars = ["A", "B", "C", "D", "E", "F", "G"];
    var t = $(obj).val().replace(/\./g, "");

    var d = $(obj).val().replace(/\./g, "");
   
    d = "S" + d;
   
    var ctn = true;
    $(".table1 .it-insert").each(function (index) {
        var oldorder = $(this).find(".orderdate").html();
        for (var i = 0; i < chars.length; i++) {
            if (oldorder.indexOf(chars[i]) !== -1) {
                ctn = false;
                var o = oldorder.split(chars[i]);
                var ext = parseInt(o[1]) + 1;
                if (parseInt(ext) < 10)
                    ext = "01";
                d = "S" + t + chars[i + 1] + ext;
                return false;
            }
        }

    });
   
    if (ctn === true)
        d = d + chars[0] + "01";
    $(obj).val(d);
}