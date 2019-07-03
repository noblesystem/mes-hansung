function calculatormoney() {
    var p = $(".packesize").val();
    if (p === "")
        p = 0;
    var ps = $(".td-qual").val();
    if (ps === "")
        ps = 0;
    var sizes = $('.sl-standar').find(":selected").text();
    if (sizes === "")
        sizes = "0*0";
    var a = $(".inputmoney").val().replace(/,/g, "");
    if (a === "")
        a = 0;
    var b = parseFloat(a) / 11;
    var c = Math.floor(b);
    var d = c * 10;
   
    var size = sizes.split('*');
   
    var s1 = parseFloat(size[0]) / 1000;
    var s2 = parseFloat(size[1]) / 1000;
    var s = s1 * s2;

    var t = s * p * ps * 10.764;
  
    var e = Math.floor(d / t);
    if (e.toString() === 'NaN')
        e = 0;
    $(".vat").val(convertnumbertostring(c));
    $(".suplypr").val(convertnumbertostring(d));
    $(".price").val(convertnumbertostring(e));
}
function calculatormoneyBill_buy(o) {

    var parent = $(o).parent().parent();
    var p = $(parent).find(".packesize").val();
    if (p === "")
        p = 0;
    var ps = $(parent).find(".td-qual").val();
    if (ps === "")
        ps = 0;
    var sizes = $(parent).find('.sl-standar-ctr').find(":selected").text();
    if (sizes === "")
        sizes = "0*0";
    var a = $(parent).find(".inputmoney").val().replace(/,/g, "");
    if (a === "")
        a = 0;
    var b = parseFloat(a) / 11;
    var c = Math.floor(b);
    var d = c * 10;

    var size = sizes.split('*');

    var s1 = parseFloat(size[0]) / 1000;
    var s2 = parseFloat(size[1]) / 1000;
    var s = s1 * s2;

    var t = s * p * ps * 10.764;

    var e = Math.floor(d / t);
    if (e.toString() === 'NaN')
        e = 0;
    $(parent).find(".vat_ctr").html(convertnumbertostring(c));
    $(parent).find(".pricesupply-ctr").html(convertnumbertostring(d));
    $(parent).find(".price-ctr").html(convertnumbertostring(e));
   
    calSQMbill_buy(o);
}
function calSQMbill_buy(o) {

    var parent = $(o).parent().parent();
    var sizes = $(parent).find('.sl-standar-ctr').find(":selected").text();
  
    if (sizes === "")
        sizes = "0*0";
    var size = sizes.split('*');
    var s1 = parseFloat(size[0]) / 1000;
    var s2 = parseFloat(size[1]) / 1000;
    var s = s1 * s2;

    var ps = $(parent).find(".td-qual").val();
    if (ps === "")
        ps = 0;

    var t = s * ps;
    var e = Math.floor(t);
    if (e.toString() === 'NaN')
        e = 0;

    $(parent).find(".sqm_ctr").html(convertnumbertostring(e));
}
function calSQM() {
    
    var sizes = $('.sl-standar').find(":selected").text();
    if (sizes === "")
        sizes = "0*0";
    var size = sizes.split('*');
    var s1 = parseFloat(size[0]) / 1000;
    var s2 = parseFloat(size[1]) / 1000;
    var s = s1 * s2;
  
    var ps = $(".td-qual").val();
    if (ps === "")
        ps = 0;
   
    var t = s * ps;
    var e = Math.floor(t);
    if (e.toString() === 'NaN')
        e = 0;

    $(".sumpake").val(convertnumbertostring(e));
}