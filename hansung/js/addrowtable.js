var pageindex = 0;
var leftmenuindex = 0;
$(document).ready(function () {
    //called when key is pressed in textbox
    $(".numberinput").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    });
   
});
function submitdatadelete(table, obj) {
    var r = confirm("Are you sure!");
    if (r === false) {
        return false;
    } 
    var row = $("." + table).find(".tr-active");
    if (row.length <= 0)
        return false;
    var data = $(row).attr("iditem");
    var rs = "none";
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/updatedelete",
        data: "{id:'" + data + "',obj:'" + obj + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {
        rs = response.d;
        if (rs === "ok")
            $(row).remove();
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}
function submitdata(data, obj, action,table) {
    var id = -1;

    if (action === "create")
        id = -1;
    else {
        var row = $("." + table).find(".tr-active");
        id = $(row).attr("iditem");
    }
    var rs = "none";
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/savadata",
        data: "{json:'" + data + "',obj:'" + obj + "',id:'" + id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async:false,
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

function chooseItem(a,b) {
    var vl = $(a).html();
    $(b).html(vl);
    $('.div-popup').hide();
}
function Addrow2(table, idpopup) {
   
    var json = [];
    $("#" + idpopup + " .td-data").each(function (index) {
        var value = "";
        var objinput = "";
        if ($(this).find('.p-input').length > 0) {
   
            var p = $(this).find('.p-input');
            objinput = $(p).attr('data-sql');
            if ($(p).find('span').length <= 0)
                value = $(p).html();
            else
                value = $(p).find('span').html();
        }
        else {
    
            var pip = $(this).find('input[type=text]');
            objinput = $(pip).attr('class');
            value = $(pip).val();
        }
        var i = {
            name_class: objinput,
            value: value
        };
        json.push(i);
       
    });

    if ($("#savedata").attr("action") === "create") {
     
        getrowtable(table, json);
    }
    else
        Editrowtable(table, json);
    $("#" + idpopup).modal('toggle');
}

function Editrowtable(table, json) {
    var row = $("." + table).find(".tr-active");
    $(row).find("td").each(function (index) {
        var data = $(this).attr('class').split('-')[1];
        var vl = "";
         for (var j = 0; j < json.length; j++) {
                if (data === json[j].name_class) {
                    vl = json[j].value;
                    $(this).html(vl);
                    break;
                }
            
        }
      
    });
    
}
function getrowtable(table, json) {
    var leng = $("." + table + " .item-insert").length;
    var idlast = parseFloat(leng) - 1;
    var id = parseFloat(leng) + 1;
    var tr = "<tr class='item-insert'>";
    $("." + table + " th").each(function (index) {
        var data = $(this).attr('data-input');
        var vl = "";
        if (data === "id")
            vl = id;
        else {
            for (var j = 0; j < json.length; j++) {
                if (data === json[j].name_class) {
                    vl = json[j].value;
                    break;
                }
            }
        }
        tr += "<td class='tdtb-" + data + "'>" + vl + "</td>";
    
    });
    tr += "</tr>";
    if (leng <= 0)
        $(tr).prependTo($("." + table + " tbody"));
    else
        $(tr).insertAfter($("." + table + " .item-insert:eq(" + idlast + ")"));
    selectrow(table);
}
function openEdit2(table, idpoup) {
  
    if ($("." + table).find(".tr-active").length <= 0)
        return false;

    $("." + table + " .tr-active td").each(function (index) {
        var vl = $(this).html();
        var classtd = $(this).attr('class-data').split('-')[1];
      
        $("#" + idpoup + " .td-data").each(function (index) {
            var objinput = "";
            if ($(this).find('.p-input').length > 0) {
                var p = $(this).find('.p-input');
                objinput = $(p).attr('data-sql');
                if (classtd === objinput) {
                    $(p).html(vl);
                    
                }
            }
            else if ($(this).find(".select-op").length > 0) {
                var sl = $(this).find(".select-op");
                objinput = $(sl).attr('data-sql');
                
                if (classtd === objinput) {
                   
                    $(sl).find("option").each(function (index) {
                        console.log($(this).text());
                        if ($(this).text() == vl)
                            $(this).prop("selected", "selected"); 
                    });
                
                }
         
                
            }
            else {
                var pip = $(this).find('input[type=text]');
                objinput = $(pip).attr('data-sql');
                if (classtd === objinput) {
                    $(pip).val(vl);
            
                }
            
            }
         
        });
    });
    $("#savedata").attr("action", "update");
    $("#" + idpoup).modal('toggle');
}
function uploadfile() {
    $('.fileupload').trigger('click');
}
function deleterow(table) {
    if ($("." + table).find(".tr-active").length <= 0)
        return false;
    $("." + table).find(".tr-active").remove();
}

function addrow(table, numrow) {
    var leght = $("." + table + " th").length;
    for (var i = 0; i < numrow; i++) {

        var tr = "<tr>";
        $("." + table + " th").each(function (index) {
            var c = $(this).attr("class");
            tr += "<td class='" + c + "'></td>";
        });
        
        tr += "</tr>";
        $(tr).appendTo($("." + table + " tbody"));
    }

}
function addrowFollowpopup(table, json, idpoup) {
    resetinput();
    var action =$("#savedata").attr("savedata");
    var leght = $("." + table + " th").length;
    var tr = "<tr class='new-item'>";
    for (var j = 0; j < leght; j++) {
        if ($("." + table + " th:eq("+j+")").attr('data-ip') === json[j].name)
            tr += "<td data='" + json[j].name+"'>" + json[j].vl+"</td>";
        }
    tr += "</tr>";
    if (action === "create")
        $(tr).prependTo($("." + table + " tbody"));
    else {
        var active = $("." + table).find(".tr-active");
        $(active).html($(tr).html());
    }
    $('#' + idpoup).modal('toggle');
    var newnb = 1;
    $("." + table + " .new-item").each(function (index) {
        var a = $(this).find("td:eq(0)");
        if ($(a).attr("data") === "order") {
            $(a).html(newnb);

        }
        newnb++;
    });
    selectrow(table);
}
function openEdit(table, idpoup) {
    resetinput();
    if ($("." + table).find(".tr-active").length <= 0)
        return false;
   
    $("." + table + " .tr-active td").each(function (index) {
        var data = $(this).attr("data");
        if (data === "input-order" || data === "input-worker") {
            $("." + data).html($(this).html());
        }
        else
            $("." + data).val($(this).html());
    });
    $('#' + idpoup).modal('toggle');
    $("#savedata").attr("savedata", "update");
}
function resetinput() {
    $(".tbsale tr").each(function (index) {
        var vl = $(this).find("td:eq(1)");
        var a = $(vl).find("input[type=text]").length;
        if (a > 0) {
                $(vl).find("input[type=text]").val('');
        }
        else {
            $(vl).find(".p-input").html('');
        }
      
    });
}
function copyclass(table) {
 
    $(".duplicate").each(function (index) {
        var tr = "<tr>" + $(this).html() + "</tr>";
        console.log($(tr).find("td:eq(1)").html(''))
        $(tr).find("td:eq(1)").html('');
        $(tr).appendTo("."+table+" tbody");
    });
    
}
function modifyrow(table) {
    if ($("." + table).find(".tr-active").length <= 0)
        return false;

    var o = $("." + table).find(".tr-active").clone();
    $("." + table + " tr").removeClass("tr-active");
    var ordernumber = $(o).find(".ordernumber");
    var strnumber = ordernumber.html().toString();
    var array = strnumber.split('-');
    var lastIt = array[array.length - 1];

    lastIt = parseFloat(lastIt) + 1;
    if (lastIt < 10)
        lastIt = "0" + lastIt;
    array[array.length - 1] = lastIt;
    ordernumber.html(array.toString().replace(/,/g, "-"));
  
    $(o).prependTo("." + table + " tbody");
    selectrow(table);
}
function openchoose(classopen) {
    $(".div-popup").hide();
    $("." + classopen).show();
}
function openpopupIndex(idpopup, table) {
   
    $('.select-op').val(-1);
    $('#' + idpopup).modal({
        show: 'false'
    });
   
}
function choosecompany() {
    if ($(".cpnchose").val !== "")
        $('.questionctm').show();
}
function openpopup(idpopup) {

    $('.select-op').val(-1);
    $("#" + idpopup + " .td-data").each(function (index) {
      if ($(this).find('.p-input').length > 0) {
          var p = $(this).find('.p-input');
            if ($(p).find('span').length <= 0)
               $(p).html('');
            else
               $(p).find('span').html('');
        }
        else {
                 $(this).find('input[type=text]').val('');
        }
      
    });
    if ($(".input-employeecode").length > 0) {
        var emp = $(".item-insert").length;
        var num = parseFloat(emp) + 1;
        if (num < 10)
            num = "0" + num;
        $(".input-employeecode").html("W" + num);
    }
    $('#' + idpopup).modal({
        show: 'false'
    });
    
    $("#savedata").attr("action", "create");
}
function clearIndex() {

    $(".table2 .column-200").html('');
    $(".table3 td").html('');
    $(".tabledata2 td").html('');
}

function editnumbercodeIndex() {
    var code = $("#th-code").html().split('-');
    var lastIt = code[code.length - 1];
    lastIt = parseFloat(lastIt) + 1;
    if (lastIt < 10)
        lastIt = "0" + lastIt;
    code[code.length - 1] = lastIt;
    $("#th-code").html(code.toString().replace(/,/g, "-"))
}
function popupaddrow(table, numrow) {

    clearIndex();
    $("." + table + " tr").removeClass("tr-active");
    var chars = ["A", "B", "C", "D", "E", "F", "G"];
    var leght = $("." + table + " th").length;
    var d = new Date();
    var month = d.getMonth() + 1;
    var newchar = "A";

    var pline = $(".new-line").length;

    newchar = chars[pline];

    var p = $(".new-line").length + 1;
    if (p < 10)
        p = "0" + p;
    if (month < 10)
        month = "0" + month;
    var date = d.getDate();
    if (date < 10)
        date = "0" + date;
    var lenip = $(".table-popup input[type=text]").length;

    var newcode = d.getFullYear().toString() + month.toString() + date.toString();
    for (var i = 0; i < numrow; i++) {
        var tr = "<tr class='new-line tr-active'>";
        for (var j = 0; j < leght; j++) {
            if (j === 0)
                tr += "<td class='ordernumber'>P" + newcode + newchar + "-01</td>";
            else {
                var index = parseFloat(j) - 1;
                var vl = $(".table-popup input[type=text]:eq(" + index + ")").val();
                tr += "<td>" + vl + "</td>";
            }
        }
        tr += "</tr>";
        $(tr).prependTo($("." + table + " tbody"));
    }
    selectrow(table);

    $('#newItem').modal('toggle');

}
function selectrow(table) {
    $("." + table + " tr").click(function () {
        if ($(this).find("th").length > 0)
            return false;
        $("." + table + " tr").removeClass("tr-active");
        $(this).addClass("tr-active");
    });
}

function clickchangerow(tableclick, tbchange) {
    $("." + tableclick + " tr").click(function () {
        var id = $(this).index() + 1;

        $("." + tableclick + " tr").removeClass("tr-active");
        $(this).addClass("tr-active");
        $("." + tbchange + " tr").removeClass("tr-active");
        $("." + tbchange + " tr:eq(" + id + ")").addClass("tr-active");
        return false;
    });
}
function includeHTML(indexx) {
    var tmp = indexx;
    var z, i, elmnt, file, xhttp;
    /* Loop through a collection of all HTML elements: */
    z = document.getElementsByTagName("*");
    for (i = 0; i < z.length; i++) {
        elmnt = z[i];
        /*search for elements with a certain atrribute:*/
        file = elmnt.getAttribute("w3-include-html");
        if (file) {
            /* Make an HTTP request using the attribute value as the file name: */
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4) {
                    if (this.status === 200) {

                        elmnt.innerHTML = this.responseText;

                    }
                    if (this.status === 404) { elmnt.innerHTML = "Page not found."; }
                    /* Remove the attribute, and call this function once more: */
                    elmnt.removeAttribute("w3-include-html");

                    includeHTML();
                    $(".metismenu li:eq(" + tmp + ")").addClass("li-menu-active");
                }
            }
            xhttp.open("GET", file, true);
            xhttp.send();
            /* Exit the function: */

            return;
        }
    }


}
function includeheadmenu(index) {
    var z, i, elmnt, file, xhttp;
    /* Loop through a collection of all HTML elements: */
    z = document.getElementsByTagName("*");
    for (i = 0; i < z.length; i++) {
        elmnt = z[i];
        /*search for elements with a certain atrribute:*/
        file = elmnt.getAttribute("w3-include-html-headmenu");
        if (file) {
            /* Make an HTTP request using the attribute value as the file name: */
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4) {
                    if (this.status === 200) { elmnt.innerHTML = this.responseText; }
                    if (this.status === 404) { elmnt.innerHTML = "Page not found."; }
                    /* Remove the attribute, and call this function once more: */
                    elmnt.removeAttribute("w3-include-html-headmenu");
                    includeHTML();
                }
            }
            xhttp.open("GET", file, true);
            xhttp.send();
            /* Exit the function: */
            return;
        }
    }
}

