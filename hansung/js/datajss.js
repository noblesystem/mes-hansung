function editData(tablget, tablbind) {
  
    var o = $(".table1").find(".tr-active");
    if (o.length === 0)
        return false;
    var itemid = $(o).attr('codeid');
    $('.' + tablbind).attr("codeid", itemid);
    binddataEdit(tablget, tablbind);
    
    $("#newItem").modal("toggle");
}
function checkdatanull(o) {
    var rs = true;
    $("." + o + " .data-not-null").each(function (index) {
        var vl = "";
        if ($(this).hasClass("select-dt")) {
            var k = $(this).find(":selected").val();
            if (k === "-1") {
                  rs = false; return false;
            }
            else
                vl = $(this).find(":selected").text();
        }
        else if ($(this).hasClass("pinput")) {

            vl = $(this).find('.p-input').html();
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
function converdatatable(table) {

    var rs = checkdatanull(table);
    if (rs === false)
        return false;
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
        if (moneyl.indexOf(dtquery) > -1) {
            vl = convermoneytostr(vl);
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
function savedata(obj,data,id) {
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
function binddata(table, json, c) {
    var tr = "";
    if(c==="")
        tr = "<tr class='it-insert tr-active' codeid='" + json.codeid + "'>";
    else
        tr = "<tr class='it-insert tr-active' codeid='" + json.codeid + "'>";
    $("." + table + " th").each(function (index) {
        var dtquery = $(this).attr('data-input');

        var vl = json[dtquery];

        tr += "<td class='new-" + dtquery + " " + dtquery+ " '>"+vl+"</td>";
    });
    tr += "</tr>";
    if (c === "")
        $(tr).prependTo("." + table + " tbody");
    else {
        $("." + table + " .tr-active").remove();
        $(tr).prependTo("." + table + " tbody");
        //$(tr).insertAfter("." + table + " .tr-active");
    
    }

}
function Listbinddata(table, json) {
    var tr = "<tr class='it-insert' codeid='" + json.codeid + "' nameitem='" + json.nameitem + "' bitem='" + json.qltcase + "'>";
    $("." + table + " th").each(function (index) {
        var dtquery = $(this).attr('data-input');
        var datatype = $(this).attr('data-type');
        var vl = json[dtquery];
        if (vl === null)
            vl = "";
        if (datatype === "date-dt")
            vl = convertdate(vl);
        tr += "<td class='new-" + dtquery + "' data-sql='" + dtquery+"'>" + vl + "</td>";
    });
    tr += "</tr>";
    $(tr).prependTo("." + table + " tbody");
    
}
function sortorder(table) {

    var o = 1;
    $("." + table + " .it-insert").each(function (index) {
        if (o < 10)
            o = "0" + o;
        $(this).find(".new-index").html(o);
        o++;
    });
}
function binddataEdit(tableget, tablebin) {
   
    var trget = $("." + tableget + " .tr-active");
    var data = [];
    $(trget).find(" .new-td").each(function (index) {
        var dtquery = $(this).attr('data-sql');
        var vl = $(this).html();
        var i = {
            name: dtquery,
            vl: vl
        };
        data.push(i);
    });
   
    for (var i = 0; i < data.length; i++) {
        var n = data[i].name;
        var vl = data[i].vl;
        $("." + tablebin +" .td-data").each(function (index) {
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
}
function setselectbytext(select, txts) {
 
    $(select).find("option").each(function (index) {
        var txt = $(this).text();
        if (txt === txts) {
            $(this).prop("selected", true);
            return false;
        }
    })
}
function getdetailObj(obj, column, value, table) {
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
            rs = "";
        else
            rs = response.d;
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function getdetailbillbuy(value) {
    var rs;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/getdatadetailbillbuy",
        data: "{value:'" + value + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async:false,
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