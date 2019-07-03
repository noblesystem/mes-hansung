var accentMap = { "ẚ": "a", "Á": "a", "á": "a", "À": "a", "à": "a", "Ă": "a", "ă": "a", "Ắ": "a", "ắ": "a", "Ằ": "a", "ằ": "a", "Ẵ": "a", "ẵ": "a", "Ẳ": "a", "ẳ": "a", "Â": "a", "â": "a", "Ấ": "a", "ấ": "a", "Ầ": "a", "ầ": "a", "Ẫ": "a", "ẫ": "a", "Ẩ": "a", "ẩ": "a", "Ǎ": "a", "ǎ": "a", "Å": "a", "å": "a", "Ǻ": "a", "ǻ": "a", "Ä": "a", "ä": "a", "Ǟ": "a", "ǟ": "a", "Ã": "a", "ã": "a", "Ȧ": "a", "ȧ": "a", "Ǡ": "a", "ǡ": "a", "Ą": "a", "ą": "a", "Ā": "a", "ā": "a", "Ả": "a", "ả": "a", "Ȁ": "a", "ȁ": "a", "Ȃ": "a", "ȃ": "a", "Ạ": "a", "ạ": "a", "Ặ": "a", "ặ": "a", "Ậ": "a", "ậ": "a", "Ḁ": "a", "ḁ": "a", "Ⱥ": "a", "ⱥ": "a", "Ǽ": "a", "ǽ": "a", "Ǣ": "a", "ǣ": "a", "Ḃ": "b", "ḃ": "b", "Ḅ": "b", "ḅ": "b", "Ḇ": "b", "ḇ": "b", "Ƀ": "b", "ƀ": "b", "ᵬ": "b", "Ɓ": "b", "ɓ": "b", "Ƃ": "b", "ƃ": "b", "Ć": "c", "ć": "c", "Ĉ": "c", "ĉ": "c", "Č": "c", "č": "c", "Ċ": "c", "ċ": "c", "Ç": "c", "ç": "c", "Ḉ": "c", "ḉ": "c", "Ȼ": "c", "ȼ": "c", "Ƈ": "c", "ƈ": "c", "ɕ": "c", "Ď": "d", "ď": "d", "Ḋ": "d", "ḋ": "d", "Ḑ": "d", "ḑ": "d", "Ḍ": "d", "ḍ": "d", "Ḓ": "d", "ḓ": "d", "Ḏ": "d", "ḏ": "d", "Đ": "d", "đ": "d", "ᵭ": "d", "Ɖ": "d", "ɖ": "d", "Ɗ": "d", "ɗ": "d", "Ƌ": "d", "ƌ": "d", "ȡ": "d", "ð": "d", "É": "e", "Ə": "e", "Ǝ": "e", "ǝ": "e", "é": "e", "È": "e", "è": "e", "Ĕ": "e", "ĕ": "e", "Ê": "e", "ê": "e", "Ế": "e", "ế": "e", "Ề": "e", "ề": "e", "Ễ": "e", "ễ": "e", "Ể": "e", "ể": "e", "Ě": "e", "ě": "e", "Ë": "e", "ë": "e", "Ẽ": "e", "ẽ": "e", "Ė": "e", "ė": "e", "Ȩ": "e", "ȩ": "e", "Ḝ": "e", "ḝ": "e", "Ę": "e", "ę": "e", "Ē": "e", "ē": "e", "Ḗ": "e", "ḗ": "e", "Ḕ": "e", "ḕ": "e", "Ẻ": "e", "ẻ": "e", "Ȅ": "e", "ȅ": "e", "Ȇ": "e", "ȇ": "e", "Ẹ": "e", "ẹ": "e", "Ệ": "e", "ệ": "e", "Ḙ": "e", "ḙ": "e", "Ḛ": "e", "ḛ": "e", "Ɇ": "e", "ɇ": "e", "ɚ": "e", "ɝ": "e", "Ḟ": "f", "ḟ": "f", "ᵮ": "f", "Ƒ": "f", "ƒ": "f", "Ǵ": "g", "ǵ": "g", "Ğ": "g", "ğ": "g", "Ĝ": "g", "ĝ": "g", "Ǧ": "g", "ǧ": "g", "Ġ": "g", "ġ": "g", "Ģ": "g", "ģ": "g", "Ḡ": "g", "ḡ": "g", "Ǥ": "g", "ǥ": "g", "Ɠ": "g", "ɠ": "g", "Ĥ": "h", "ĥ": "h", "Ȟ": "h", "ȟ": "h", "Ḧ": "h", "ḧ": "h", "Ḣ": "h", "ḣ": "h", "Ḩ": "h", "ḩ": "h", "Ḥ": "h", "ḥ": "h", "Ḫ": "h", "ḫ": "h", H: "h", "̱": "h", "ẖ": "h", "Ħ": "h", "ħ": "h", "Ⱨ": "h", "ⱨ": "h", "Í": "i", "í": "i", "Ì": "i", "ì": "i", "Ĭ": "i", "ĭ": "i", "Î": "i", "î": "i", "Ǐ": "i", "ǐ": "i", "Ï": "i", "ï": "i", "Ḯ": "i", "ḯ": "i", "Ĩ": "i", "ĩ": "i", "İ": "i", i: "i", "Į": "i", "ı": "i", "į": "i", "Ī": "i", "ī": "i", "Ỉ": "i", "ỉ": "i", "Ȉ": "i", "ȉ": "i", "Ȋ": "i", "ȋ": "i", "Ị": "i", "ị": "i", "Ḭ": "i", "ḭ": "i", I: "i", "ı": "i", "Ɨ": "i", "ɨ": "i", "Ĵ": "j", "ĵ": "j", J: "j", "̌": "j", "ǰ": "j", "ȷ": "j", "Ɉ": "j", "ɉ": "j", "ʝ": "j", "ɟ": "j", "ʄ": "j", "Ḱ": "k", "ḱ": "k", "Ǩ": "k", "ǩ": "k", "Ķ": "k", "ķ": "k", "Ḳ": "k", "ḳ": "k", "Ḵ": "k", "ḵ": "k", "Ƙ": "k", "ƙ": "k", "Ⱪ": "k", "ⱪ": "k", "Ĺ": "a", "ĺ": "l", "Ľ": "l", "ľ": "l", "Ļ": "l", "ļ": "l", "Ḷ": "l", "ḷ": "l", "Ḹ": "l", "ḹ": "l", "Ḽ": "l", "ḽ": "l", "Ḻ": "l", "ḻ": "l", "Ł": "l", "ł": "l", "Ł": "l", "̣": "l", "ł": "l", "̣": "l", "Ŀ": "l", "ŀ": "l", "Ƚ": "l", "ƚ": "l", "Ⱡ": "l", "ⱡ": "l", "Ɫ": "l", "ɫ": "l", "ɬ": "l", "ɭ": "l", "ȴ": "l", "Ḿ": "m", "ḿ": "m", "Ṁ": "m", "ṁ": "m", "Ṃ": "m", "ṃ": "m", "ɱ": "m", "Ń": "n", "ń": "n", "Ǹ": "n", "ǹ": "n", "Ň": "n", "ň": "n", "Ñ": "n", "ñ": "n", "Ṅ": "n", "ṅ": "n", "Ņ": "n", "ņ": "n", "Ṇ": "n", "ṇ": "n", "Ṋ": "n", "ṋ": "n", "Ṉ": "n", "ṉ": "n", "Ɲ": "n", "ɲ": "n", "Ƞ": "n", "ƞ": "n", "ɳ": "n", "ȵ": "n", N: "n", "̈": "n", n: "n", "̈": "n", "Ó": "o", "ó": "o", "Ò": "o", "ò": "o", "Ŏ": "o", "ŏ": "o", "Ô": "o", "ô": "o", "Ố": "o", "ố": "o", "Ồ": "o", "ồ": "o", "Ỗ": "o", "ỗ": "o", "Ổ": "o", "ổ": "o", "Ǒ": "o", "ǒ": "o", "Ö": "o", "ö": "o", "Ȫ": "o", "ȫ": "o", "Ő": "o", "ő": "o", "Õ": "o", "õ": "o", "Ṍ": "o", "ṍ": "o", "Ṏ": "o", "ṏ": "o", "Ȭ": "o", "ȭ": "o", "Ȯ": "o", "ȯ": "o", "Ȱ": "o", "ȱ": "o", "Ø": "o", "ø": "o", "Ǿ": "o", "ǿ": "o", "Ǫ": "o", "ǫ": "o", "Ǭ": "o", "ǭ": "o", "Ō": "o", "ō": "o", "Ṓ": "o", "ṓ": "o", "Ṑ": "o", "ṑ": "o", "Ỏ": "o", "ỏ": "o", "Ȍ": "o", "ȍ": "o", "Ȏ": "o", "ȏ": "o", "Ơ": "o", "ơ": "o", "Ớ": "o", "ớ": "o", "Ờ": "o", "ờ": "o", "Ỡ": "o", "ỡ": "o", "Ở": "o", "ở": "o", "Ợ": "o", "ợ": "o", "Ọ": "o", "ọ": "o", "Ộ": "o", "ộ": "o", "Ɵ": "o", "ɵ": "o", "Ṕ": "p", "ṕ": "p", "Ṗ": "p", "ṗ": "p", "Ᵽ": "p", "Ƥ": "p", "ƥ": "p", P: "p", "̃": "p", p: "p", "̃": "p", "ʠ": "q", "Ɋ": "q", "ɋ": "q", "Ŕ": "r", "ŕ": "r", "Ř": "r", "ř": "r", "Ṙ": "r", "ṙ": "r", "Ŗ": "r", "ŗ": "r", "Ȑ": "r", "ȑ": "r", "Ȓ": "r", "ȓ": "r", "Ṛ": "r", "ṛ": "r", "Ṝ": "r", "ṝ": "r", "Ṟ": "r", "ṟ": "r", "Ɍ": "r", "ɍ": "r", "ᵲ": "r", "ɼ": "r", "Ɽ": "r", "ɽ": "r", "ɾ": "r", "ᵳ": "r", "ß": "s", "Ś": "s", "ś": "s", "Ṥ": "s", "ṥ": "s", "Ŝ": "s", "ŝ": "s", "Š": "s", "š": "s", "Ṧ": "s", "ṧ": "s", "Ṡ": "s", "ṡ": "s", "ẛ": "s", "Ş": "s", "ş": "s", "Ṣ": "s", "ṣ": "s", "Ṩ": "s", "ṩ": "s", "Ș": "s", "ș": "s", "ʂ": "s", S: "s", "̩": "s", s: "s", "̩": "s", "Þ": "t", "þ": "t", "Ť": "t", "ť": "t", T: "t", "̈": "t", "ẗ": "t", "Ṫ": "t", "ṫ": "t", "Ţ": "t", "ţ": "t", "Ṭ": "t", "ṭ": "t", "Ț": "t", "ț": "t", "Ṱ": "t", "ṱ": "t", "Ṯ": "t", "ṯ": "t", "Ŧ": "t", "ŧ": "t", "Ⱦ": "t", "ⱦ": "t", "ᵵ": "t", "ƫ": "t", "Ƭ": "t", "ƭ": "t", "Ʈ": "t", "ʈ": "t", "ȶ": "t", "Ú": "u", "ú": "u", "Ù": "u", "ù": "u", "Ŭ": "u", "ŭ": "u", "Û": "u", "û": "u", "Ǔ": "u", "ǔ": "u", "Ů": "u", "ů": "u", "Ü": "u", "ü": "u", "Ǘ": "u", "ǘ": "u", "Ǜ": "u", "ǜ": "u", "Ǚ": "u", "ǚ": "u", "Ǖ": "u", "ǖ": "u", "Ű": "u", "ű": "u", "Ũ": "u", "ũ": "u", "Ṹ": "u", "ṹ": "u", "Ų": "u", "ų": "u", "Ū": "u", "ū": "u", "Ṻ": "u", "ṻ": "u", "Ủ": "u", "ủ": "u", "Ȕ": "u", "ȕ": "u", "Ȗ": "u", "ȗ": "u", "Ư": "u", "ư": "u", "Ứ": "u", "ứ": "u", "Ừ": "u", "ừ": "u", "Ữ": "u", "ữ": "u", "Ử": "u", "ử": "u", "Ự": "u", "ự": "u", "Ụ": "u", "ụ": "u", "Ṳ": "u", "ṳ": "u", "Ṷ": "u", "ṷ": "u", "Ṵ": "u", "ṵ": "u", "Ʉ": "u", "ʉ": "u", "Ṽ": "v", "ṽ": "v", "Ṿ": "v", "ṿ": "v", "Ʋ": "v", "ʋ": "v", "Ẃ": "w", "ẃ": "w", "Ẁ": "w", "ẁ": "w", "Ŵ": "w", "ŵ": "w", W: "w", "̊": "w", "ẘ": "w", "Ẅ": "w", "ẅ": "w", "Ẇ": "w", "ẇ": "w", "Ẉ": "w", "ẉ": "w", "Ẍ": "x", "ẍ": "x", "Ẋ": "x", "ẋ": "x", "Ý": "y", "ý": "y", "Ỳ": "y", "ỳ": "y", "Ŷ": "y", "ŷ": "y", Y: "y", "̊": "y", "ẙ": "y", "Ÿ": "y", "ÿ": "y", "Ỹ": "y", "ỹ": "y", "Ẏ": "y", "ẏ": "y", "Ȳ": "y", "ȳ": "y", "Ỷ": "y", "ỷ": "y", "Ỵ": "y", "ỵ": "y", "ʏ": "y", "Ɏ": "y", "ɏ": "y", "Ƴ": "y", "ƴ": "y", "Ź": "z", "ź": "z", "Ẑ": "z", "ẑ": "z", "Ž": "z", "ž": "z", "Ż": "z", "ż": "z", "Ẓ": "z", "ẓ": "z", "Ẕ": "z", "ẕ": "z", "Ƶ": "z", "ƶ": "z", "Ȥ": "z", "ȥ": "z", "ʐ": "z", "ʑ": "z", "Ⱬ": "z", "ⱬ": "z", "Ǯ": "z", "ǯ": "z", "ƺ": "z", "２": "2", "６": "6", "Ｂ": "B", "Ｆ": "F", "Ｊ": "J", "Ｎ": "N", "Ｒ": "R", "Ｖ": "V", "Ｚ": "Z", "ｂ": "b", "ｆ": "f", "ｊ": "j", "ｎ": "n", "ｒ": "r", "ｖ": "v", "ｚ": "z", "１": "1", "５": "5", "９": "9", "Ａ": "A", "Ｅ": "E", "Ｉ": "I", "Ｍ": "M", "Ｑ": "Q", "Ｕ": "U", "Ｙ": "Y", "ａ": "a", "ｅ": "e", "ｉ": "i", "ｍ": "m", "ｑ": "q", "ｕ": "u", "ｙ": "y", "０": "0", "４": "4", "８": "8", "Ｄ": "D", "Ｈ": "H", "Ｌ": "L", "Ｐ": "P", "Ｔ": "T", "Ｘ": "X", "ｄ": "d", "ｈ": "h", "ｌ": "l", "ｐ": "p", "ｔ": "t", "ｘ": "x", "３": "3", "７": "7", "Ｃ": "C", "Ｇ": "G", "Ｋ": "K", "Ｏ": "O", "Ｓ": "S", "Ｗ": "W", "ｃ": "c", "ｇ": "g", "ｋ": "k", "ｏ": "o", "ｓ": "s", "ｗ": "w" }
var normalize = function (term) {
    var ret = "";
    for (var i = 0; i < term.length; i++) {
        ret += accentMap[term.charAt(i)] || term.charAt(i);
    }
    return ret;
}
function setautocompleat(o, lobj) {
    $(o).autocomplete({
        source: function (request, response) {
            var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
            response($.grep(lobj, function (value) {
                value = value.label || value.value || value;
                return matcher.test(value) || matcher.test(normalize(value));
            }));
        }

    });
}

function convertcode(o, number) {

    if (o.length < number) {
        var n = number - o.length;
        for (var i = 0; i < n; i++) {
            o = "0" + o;
        }
        
    }
    return o;
}
function setinputNumberAndchar(o, char) {
    $('.' + o).keypress(function (e) {
            //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            //alert(e.which)
                   if (e.which !== char)
                        return false;
            }
      
    });
}
function setinputmoney(o, char) {
    $('.' + o).keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
                return false;
        }
      
    });
}
function changeNumbermoney(o) {
    $('.'+o).change(function () {
         var om = convertnumbertostring(convertstringnumber($(this).val()));
        $(this).val(om);
    });
    
}
function convertstringnumber(o) {
    try {
        return o.replace(/,/g, '');
    }
    catch
    {
        return o;
    }
}

function savedatas(table, objsave, idpopup, tablepopup) {
    var json = [];
    var newitem = $("." + table+" .new-item").length + 1;
    var i = {
        name: 'order',
        vl: ''
    };
    json.push(i);

    $("." + tablepopup + " tr").each(function (index) {

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
        else if (b > 0)
        {
            var opt = $(vl).find(".select-op");
            name = $(opt).attr('data-sql');
            vls = $(opt).find(":selected").text();
   
        }
        else{
     
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

    var action = $("#savedata").attr("action");
    var rs = submitdata(JSON.stringify(json), objsave, action, table);
    if ("." + table.length > 0) {
        if (parseInt(rs) > -1) {
            AddrowClent(table, idpopup, rs);
        }
    }
    return rs;
}
function AddrowClent(table, idpopup, item) {
   
    var json = [];
    $("#" + idpopup + " .td-data").each(function (index) {
        var value = "";
        var objinput = "";
        var b = $(this).find(".select-op").length;
        if ($(this).find('.p-input').length > 0) {

            var p = $(this).find('.p-input');
            objinput = $(p).attr('data-sql');
            if ($(p).find('span').length <= 0)
                value = $(p).html();
            else
                value = $(p).find('span').html();
        }
        else if (b > 0) {
            var opt = $(this).find(".select-op");
            objinput = $(opt).attr('data-sql');
            value = $(opt).find(":selected").text();
        }
        else {

            var pip = $(this).find('input[type=text]');
            objinput = $(pip).attr('data-sql');
            value = $(pip).val();
        }
        var i = {
            name_class: objinput,
            value: value
        };
        json.push(i);

    });
   
    if ($("#savedata").attr("action") === "create") {
        Newrowtable(table, json, item);
    }
    else
        Updatetable(table, json, item);
    $("#" + idpopup).modal('toggle');
}
function Newrowtable(table, json, item) {
    var leng = $("." + table + " .item-insert").length;
    var idlast = parseFloat(leng) - 1;
    var id = parseFloat(leng) + 1;
    var tr = "<tr class='item-insert' idItem='" + item+"'>";
    $("." + table + " th").each(function (index) {
        var classs = $(this).attr('class');
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
        tr += "<td class-data='tdtb-" + data + "' class='" + classs +"'>" + vl + "</td>";

    });
    tr += "</tr>";
    if (leng <= 0)
        $(tr).prependTo($("." + table + " tbody"));
    else
        $(tr).insertAfter($("." + table + " .item-insert:eq(" + idlast + ")"));
    selectrow(table);
}
function Updatetable(table, json, item) {

    var row = $("." + table).find(".tr-active");
    $(row).attr("iditem", item);
    $(row).find("td").each(function (index) {
        var data = $(this).attr('class-data').split('-')[1];
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
function findata(obj) {
     $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/findata",
        data: "{obj:'" + data + "',column:'" + obj + "',value:'" + id + "'}",
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
}
function countdata(table, code,vl) {
    var c = 0;
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/countdata",
        data: "{table:'" + table + "',code:'" + code + "',vl:'" + vl + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {
        c = response.d;
       
    }
    function OnErrorCall(request, status, error) {

    }
    return c;
}
function convertnumbertostring(nStr) {
    
    try {
        var t = nStr.toString();
        var e = "";
        var s = "";
        var j = 0;

        for (var i = t.length - 1; i >= 0; i--) {
            if (j == 3) {
                e += ",";
                j = 0;
            }
            j++;
            e += t.charAt(i);

        }
        for (var j = e.length - 1; j >= 0; j--) {

            s += e.charAt(j);

        }
        return s;
    }
    catch (err) {
        return "";
    }
}
function calcuTOLERANCEAMT(o) {
    var p = $(o).parent().parent();
    var a = convertstringnumber($(p).find('.input-money-amt').html());
    a = convermoneytostr(a);
    var b = convertstringnumber($(p).find('.old-tlcnb').val());
    if (a === "")
        a = 0;
    if (b === "")
        b = 0;
    var c = (a * b) / 100;

    $('.input-tlcmoney').html(convertnumbertostring(c));
    $(".old-tlcnb").val(b);
}
function saverowInput(tr,table) {
    var data = [];
    var idbill = $('.' + tr).attr("bill");
    var j = {
        name: "idbill",
        vl: ""
    };
    var m = {
        name: "iditem",
        vl: ""
    };
    var l = {
        name: "codeitem",
        vl: ""
    };
    
    data.push(j);
    data.push(m);
    data.push(l);
    $('.'+tr+' .td-data').each(function (index) {
        var name = "";
        var vl = "";
        if ($(this).hasClass("td-input")) {
            var ip = $(this).find("input[type=text]");
            name = $(ip).attr("data-sql");
            vl = $(ip).val();
        }
        else if ($(this).hasClass("td-option")) {
            var op = $(this).find(".sl-option");
            var osl = $(op).find(":selected");
            name = $(op).attr("data-sql");
            vl = $(osl).text();
        }
        else if ($(this).hasClass("pp-input")) {
            var pp = $(this).find(".p-input");
            name = $(pp).attr("data-sql");
            vl = $(pp).html();
        }
        var i = {
            name: name,
            vl: vl
        };
        data.push(i);
    });
    Adddetail(JSON.stringify(data),table, "createnew", idbill);
}
function Adddetail(data, obj, item, idbill) {
    $.ajax({
        type: "POST",
        //getListOfCars is my webmethod   
        url: "/ServiceApi.asmx/savadata",
        data: "{json:'" + data + "',obj:'" + obj + "',id:'" + idbill + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json", // dataType is json format
        async: false,
        success: OnSuccess,
        error: OnErrorCall
    });
    function OnSuccess(response) {
        var o = JSON.parse(response.d);

        var order = $('.table3 item-insert').length + 1;
        var code = o[2].vl;

        if (code.length < 4) {
            var n = 4 - code.length;
            for (var m = 0; m < n; m++)
                code = "0" + code;
        }
        var tr = "<tr>" +
            "<td>" + order + "</td>" +
            "<td>" + code + "</td>" +
            "<td>" + o[3].vl + "</td>" +
            "<td>" + o[4].vl + "</td>" +
            "<td>" + o[5].vl + "</td>" +
            "<td>" + o[6].vl + "</td>" +
            "<td class='datahidden'>" + convertnumbertostring(Math.floor(o[7].vl)) + "</td>" +
            "<td class='datahidden'>" + convertnumbertostring(Math.floor(o[8].vl)) + "</td>" +
            "<td class='datahidden'>" + convertnumbertostring(Math.floor(o[9].vl)) + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[10].vl)) + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[11].vl)) + "</td>" +
            "<td class='datahidden'>" + o[12].vl + "</td>" +
            "<td>" + o[13].vl + "</td>" +
            "</td>";

        var tr2 = "<tr>" +
            "<td>" + order + "</td>" +
            "<td>" + code + "</td>" +
            "<td>" + o[3].vl + "</td>" +
            "<td>" + o[4].vl + "</td>" +
            "<td>" + o[5].vl + "</td>" +
            "<td>" + o[6].vl + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[7].vl)) + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[8].vl)) + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[9].vl)) + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[10].vl)) + "</td>" +
            "<td>" + convertnumbertostring(Math.floor(o[11].vl)) + "</td>" +
            "<td>" + o[12].vl + "</td>" +
            "<td>" + o[13].vl + "</td>" +
            "</td>";
        $(tr).insertAfter(".tr-input");
        $(tr2).prependTo(".table3 tbody");
        $(".tr-input").find("input[type=text]").val('');
        $(".tr-input").find(".sl-standar .option-item").hide();
  
    }
    function OnErrorCall(request, status, error) {

    }
    return rs;
}

function convertdatetime(d) {

    if (d === "")
        return d;
    var a = new Date(d);
    var m = parseInt(a.getMonth()) + 1;

    if (a.getFullYear() === 1970) {
        return "";
    }
    return a.getFullYear() + "." + m + "." + a.getDate() + " " + a.getHours()+ ":" + a.getMinutes();
}
function convertdate(d) {
    
    if (d === "")
        return d;
    var a = new Date(d);
    var m = parseInt(a.getMonth()) + 1;
    var dd = parseInt(a.getDate());
    if (m < 10)
        m = "0" + m;
    if (dd < 10)
        dd = "0" + dd;
    if (a.getFullYear() === 1970) {
        return "";
    }

    return a.getFullYear()+"."+m+"."+dd;
}
function convertdate_yy(d) {

    if (d === "")
        return d;
    var a = new Date(d);
    var m = parseInt(a.getMonth()) + 1;
    var dd = parseInt(a.getDate());
    if (m < 10)
        m = "0" + m;
    if (dd < 10)
        dd = "0" + dd;
    if (a.getFullYear() === 1970) {
        return "";
    }

    return a.getFullYear().toString().substr(-2) + "." + m + "." + dd;
}