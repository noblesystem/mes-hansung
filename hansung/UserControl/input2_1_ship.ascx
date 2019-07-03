<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="input2_1_ship.ascx.cs" Inherits="hansung.UserControl.input2_1_ship" %>
<style>
    .tb_bill_ship_select_new td {
        background-color: #fff !important;
    }

    .new_began {
        border: none !important;
    }
</style>
<script>
    var sl_port = '<select class="sl-option sl-port" data-sql="port"><option value="-1" class="op-default"></option><option>I</option><option>B</option></select>';
    var sl_size = '<select class="sl-option sl-sizefit" data-sql="sizefit"><option value="-1" class="op-default"></option><option value="20">20 ft</option><option value="40">40 ft</option></select>';
    function bindcolorEdit() {
        $(".tabledetailOrderCtrup  .data_insert").each(function (index) {
            var b = $(this).find(".confirmreceiptday").find("input[type=text]").val();
            var c = $(this).find(".conreturnday").find("input[type=text]").val();
            if (b !== "" && c === "") {
                $(this).find(".conreturnday").css("background-color", "red");
            }
        });
    }
    function create_new_ship() {
        var o = $(".table1 .tr-active");
        if (o.length <= 0)
            return false;
        var firstShip = $(".table2 .tr_ship:eq(0)").find(".ship_9").html();
        if (firstShip !== "")
            return false;
        var terms = $(o).find(".terms_main").html();
        if (terms === "내수") {
            create_new_ship_internal();
            return false;
        }
        $(".tb_bill_ship_select_new").remove();
        $(".tabledetailOrderCtrup tbody").empty();
        $(".tabledetailItem tbody").empty();
        var order = 1;
        $(".table3 .it-insert").each(function (index) {
            var obj = $(this);
            var code = $(this).attr("codeid");
            var itname = $(this).attr("nameitem");
            var standar = $(this).attr("standard");
            var qltbox = $(this).attr("bitem");
            var itemcode = $(this).attr("codeitem");
            var shipId = $(this).attr("shipId");
            var data = [];
            $(obj).find("td").each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = $(this).html();
                var i = {
                    name: qr,
                    vl: vl
                }
                data.push(i);
            })
            var j = {
                name: 'itemname',
                vl: itname
            };
            var k = {
                name: 'standard',
                vl: standar
            };
            var m = {
                name: 'qltbox',
                vl: qltbox
            };
            data.push(j);
            data.push(k);
            data.push(m);
            createnewRow_ship(data, code, order, shipId);
            createnewRow_ship_table_item(data, code, order, itemcode, shipId);
            order++;
        });
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        var sumtotalamount = $('.sumtotalamount').html();
        openpopup("popupdetail_ship");
        $('.input-money-amt').html(sumtotalamount);

        var code = $(o).find("td:eq(0)").html();
        $("#th-code").html(code + "-01");

        $(".input-orderbill").html(code + "-01");
        addmoreShip();
        openserinumber_ship();
    }
    function editdetailship() {
        $(".tabledetailOrderCtrup tbody").empty();
        $(".tabledetailItem tbody").empty();
        var order = 1;
        createnewRow_shipEdit();
        $(".table3 .it-insert").each(function (index) {
            var obj = $(this);
            var code = $(this).attr("codeid");
            var itname = $(this).attr("nameitem");
            var standar = $(this).attr("standard");
            var qltbox = $(this).attr("bitem");
            var itemcode = $(this).attr("codeitem");
            var shipId = $(this).attr("shipId");
            var data = [];
            $(obj).find("td").each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = $(this).html();
                var i = {
                    name: qr,
                    vl: vl
                }
                data.push(i);
            })
            var j = {
                name: 'itemname',
                vl: itname
            };
            var k = {
                name: 'standard',
                vl: standar
            };
            var m = {
                name: 'qltbox',
                vl: qltbox
            };
            data.push(j);
            data.push(k);
            data.push(m);
            createnewRow_ship_table_item(data, code, order, itemcode, shipId);
            order++;
        });

        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        var sumtotalamount = $('.sumtotalamount').html();
        $('.input-money-amt').html(sumtotalamount);
        var o = $(".table1 .tr-active");
        var code = $(o).find("td:eq(0)").html();
        $("#th-code").html(code + "-01");

        //$(".input-orderbill").html(code + "-01");
        bindbox_ship();

    }
    function bindbox_ship() {
        $(".tabledetailItem .data_insert").each(function (index) {
            var c = $(this).attr("codeid");
            var one = findbox_ship(c, "shipone");
            var two = findbox_ship(c, "ship_2");
            var thee = findbox_ship(c, "ship_3");
            $(this).find(".shipone").val(one);
            $(this).find(".ship_2").val(two);
            $(this).find(".ship_3").val(thee);
        })
    }
    function findbox_ship(code, ship) {
        var rs = "0";
        $(".tabledata2 .it-insert").each(function (index) {
            var c = $(this).attr("codeid");
            var s = $(this).attr("ship");
            if (c === code && s === ship) {
                rs = $(this).attr("bitem");
                return false;
            };

        })
        return rs;
    }
    function createnewRow_shipEdit() {
        var data_port = [];
        var data_size = [];
        var order = 1;
        var Lship = [];
        var Lorder = [];
        $(".tabledata2 .it-insert").each(function (index) {
            var obj = $(this);
            var code = $(this).attr("codeid");
            var itname = $(this).attr("nameitem");
            var standar = $(this).attr("standard");
            var qltbox = $(this).attr("bitem");
            var ship = $(this).attr("ship");
            var ooo = $(this).find(".new-index").html();
            var shipId = $(this).attr("shipId");
            Lship.push(ship);
            Lorder.push(ooo);
            var data = [];
            $(obj).find("td").each(function (index) {
                var qr = $(this).attr("data-sql");
                var vl = $(this).html();
                if (qr === "port")
                    data_port.push(vl);
                else if (qr === "sizefit")
                    data_size.push(vl);
                var i = {
                    name: qr,
                    vl: vl
                }
                data.push(i);
            })
            var j = {
                name: 'itemname',
                vl: itname
            };
            var k = {
                name: 'standard',
                vl: standar
            };
            var m = {
                name: 'qltbox',
                vl: qltbox
            };
            data.push(j);
            data.push(k);
            data.push(m);
            createnewRow_ship(data, code, order, shipId);
            order++;
        });

        $('.tabledetailOrderCtrup .tr_new').each(function (index) {
            $(this).attr("ship", Lship[index]);
            $(this).find(".ordship").html(Lorder[index]);
            if (data_port[index] !== "")
                setselectoptionselect($(this).find(".sl-port"), data_port[index]);
            if (data_size[index] !== "")
                setselectoptionselect($(this).find(".sl-sizefit"), data_size[index]);
        })
        openserinumber_ship();
    }
    function openserinumber_ship() {
        $('.seri_serinumber').click(function () {
            $('.seri_serinumber').removeClass("sl_seri_serinumber");
            if ($(this).find("select").length > 0)
                return false;
            $(this).addClass("sl_seri_serinumber");

            $(".tableseriOrder tbody").empty();
            var p = $(this).parent();
            var shipIp = $(p).attr("shipid");
            var c = $(p).attr("codeid");
            var s = $(p).attr("ship");
            var box = findbox_tr(c, s);
            var citem = finditemcode_tr(c, s)
            var port = $(p).find(".sl-port").find(":selected").text();
            var warehouse = $(".table1 .tr-active").find(".warehouse").html();
            var tradingmission = $(".table1 .tr-active").find(".tradingmission").html();
            var ordernumber = $(".table1 .tr-active").find(".ordernumber").html();
            var product_name = $(".itemname").html();
            var product_code = $(".codeitem ").html();
            var quantityincase = $(".quantityincase").html();
            var confirmreceiptday  = $(".confirmreceiptday ").html();

            $("#PopupSerialNo .qltB").html(box)
            $("#PopupSerialNo .warehouse").html(warehouse)
            var vld = findclassdata_ship($(p), "confirmreceiptday");

            if (vld === "")
                return false;

            var oo = 1;
            var tb1contractdate = convertdate_yy(vld);

            for (var i = 0; i < box; i++) {
                var b = oo;
                if (b < 10)
                    b = "0" + b;
                var sr = tb1contractdate.replace(/\./g, "") + port + citem + "-" + b;
                var tr = "<tr class='srnumber-tr'><td>" + oo + "</td><td>" + tradingmission + "</td>"+
                            "<td>" + product_code + "</td>"+
                            "<td>" + product_name + "</td>"+
                            "<td>" + quantityincase + "</td>"+
                            "<td class='srnumber'>" + sr + "</td><td>" + confirmreceiptday + "</td>"+
                    "<td> " + ordernumber + "</td><td>2</td><td><a href='' download='" +sr+".txt' class='btn btn-success btn-sm saveRfidPrint'>개별인쇄</a></td></tr > ";
                $(tr).appendTo(".tableseriOrder tbody");
                oo++;
            }

            $("#PopupSerialNo").attr("shipId", shipIp);
            $("#PopupSerialNo").modal("toggle");
        });
    }
    function findclassdata_ship(o, c) {
        var rs = "";
        $(o).find(".td-data-a").each(function (index) {
            var qr = $(this).attr("data-sql");
            if (qr === c) {
                rs = $(this).find("input[type=text]").val();
                return false;
            }
        })
        return rs;
    }
    function createnewRow_ship_table_item(data, code, order, itemcode, shipid) {

        if (order < 10)
            order = "0" + order;

        var row = "<tr class='data_insert tr_new' codeid='" + code + "' itemcode='" + itemcode + "' shipId='" + shipid + "'><td>" + order + "</td>";
        var txt_port = "";
        var txt_size = "";
        var txtbox = "";
        $(".tabledetailItem .thdata").each(function (index) {
            var a = $(this).attr("data-input");
            var vl = getdatajson(a, data);
            if ($(this).hasClass("t_qltbox"))
                txtbox = vl;

            if ($(this).hasClass("datetime"))
                row += '<td class="td-data-a data-input au-itemcode class80" data-sql="' + a + '"><input type="text" class="datecombo class100" value="' + vl + '" ></td>';
            else if ($(this).hasClass("select_dt_port")) {
                row += '<td class="td-data-a select-dt not-null select_dt_port sl-noempty" data-sql="' + a + '">' + sl_port + '</td>';

            }
            else if ($(this).hasClass("select_sizefit")) {
                txt_size = vl;
                row += '<td class="td-data-a select-dt not-null sl-noempty" data-sql="' + a + '">' + sl_size + '</td>';
            }
            else if ($(this).hasClass("data-input"))
                row += '<td><input type="text"  data-sql="' + a + '" class="td-data-a select-dt class100" value="' + vl + '" ></td>';
            else if ($(this).hasClass("shipone"))
                row += '<td><input type="text" onblur="autosetship(this)" data-sql="' + a + '" class="td-data-a select-dt class50 td-center ' + a + '" value="' + txtbox + '"></td>';
            else if ($(this).hasClass("ships"))
                row += '<td><input type="text" data-sql="' + a + '" class="td-data-a ships class50 td-center ' + a + '"></td>';
            else
                row += '<td  class="td-data-a ' + a + '"  data-sql="' + a + '">' + vl + '</td>'

        })

        row += "</tr>";

        $(row).appendTo(".tabledetailItem tbody");

    }
    function autosetship(o) {
        var vl = $(o).val();
        var p = $(o).parent().parent();
        var t = $(p).find(".qltbox").html();
        if (vl === "")
            vl = 0;
        if (parseInt(vl) < parseInt(t)) {
            var n = parseInt(t) - parseInt(vl);
            $(p).find(".ship2").val(n);
        }

    }
    function createnewRow_ship(data, code, order, shipId) {

        if (order < 10)
            order = "0" + order;
        order = order + "-1";
        var row = "<tr class='data_insert tr_new' codeid='" + code + "' ship='' shipId='" + shipId + "'><td class='ordship'>" + order + "</td>";
        var txt_port = "";
        $(".tabledetailOrderCtrup .thdata").each(function (index) {
            var a = $(this).attr("data-input");
            var vl = getdatajson(a, data);
            if ($(this).hasClass("datetime")) {
                var c = "";
                if (a === "containerday")
                    c = "subcontainerday";
                row += '<td class="td-data-a data-input class95 ' + a + '" data-sql="' + a + '"><input type="text" class="datecombo class95 ' + c + '" value="' + vl + '" ></td>';

            } else if ($(this).hasClass("select_dt_port")) {
                txt_port = vl;
                row += '<td class="td-data-a select-dt not-null sl-noempty" data-sql="' + a + '">' + sl_port + '</td>';
            }
            else if ($(this).hasClass("select_sizefit"))
                row += '<td class="td-data-a select-dt  sl-noempty" data-sql="' + a + '">' + sl_size + '</td>';
            else if ($(this).hasClass("data-input"))
                row += '<td class="td-data-a data-input" data-sql="' + a + '"><input type="text" class="class100" value="' + vl + '" ></td>';
            else {
                row += '<td class="td-data-a not-null seri_' + a + '" data-sql="' + a + '">' + vl + '</td>'
            }

        })

        row += "</tr>";
        $("#buybill_ship").attr("codeid", "");
        $(row).appendTo(".tabledetailOrderCtrup tbody");
        //if (txt_port !== "") {
        //    setselectoptionselect($(row).find(".sl-port"), txt_port);
        //}
    }
    function getdatajson(o, json) {

        var vl = "";
        for (var i = 0; i < json.length; i++) {
            if (json[i].name === o) {
                vl = json[i].vl;
                return vl;
            }
        }
        return vl;
    }
    function infor_ship(tr) {
        var data = [];
        $(tr).find(".td-nonreset").each(function (index) {
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
    function get_infor_ship(tr) {
        var data = [];
        $(tr).find(".td-reset").each(function (index) {
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
    function saveship() {
        var data = [];
        //var rs = checkdatanull_ctr_header("tb_bill_ship");
        var codebill = $(".table1 .tr-active").attr("codeid");
        //if (!rs)
        //    return false;
        var infobill = infor_ship($(".tb_bill_ship_select"));
        $(".tabledetailOrderCtrup .data_insert").each(function (index) {
            var codeid = $(this).attr("codeid");
            var json = convertdata_tr($(this));
            var ship = "shipone";
            var ordship = $(this).find(".ordship").html();
            if ($(this).attr("ship")) {
                ship = $(this).attr("ship");
            }
            var ship_ctn = "";
            if (ship === "shipone")
                ship_ctn = get_infor_ship($(".tb_bill_ship .tb_bill_ship_select"));
            else {
                var o = findship_tr(codeid, ship);
                ship_ctn = get_infor_ship($(o));
            }
            var qltBox = findbox_tr(codeid, ship);
            var i = {
                name: "ship",
                vl: ship
            }
            var cid = {
                name: "codeid",
                vl: codeid
            }
            var box = {
                name: "qltBox",
                vl: qltBox
            }
            var indexbox = {
                name: "indexbox",
                vl: ordship
            }
            var srnb = [];
            var slsrnb = $(this).find(".seri_serinumber").find("select");
            if (slsrnb.length > 0) {
                $(slsrnb).find("option").each(function (index) {
                    srnb.push($(this).text());

                })
            }
            var serinumber = {
                name: "serinumber",
                vl: srnb.toString()
            }

            json.push(i);
            json.push(cid);
            json.push(box);
            json.push(indexbox);
            setserinumber(json, srnb.toString())

            for (var k = 0; k < ship_ctn.length; k++) {
                var h = {
                    name: ship_ctn[k].name,
                    vl: ship_ctn[k].vl
                };
                json.push(h);
            }
            data.push(json)
        })
        popenload("popupdetail_ship");
        var rs = "none";
        $.ajax({
            type: "POST",
            //getListOfCars is my webmethod   
            url: "/ServiceApi.asmx/savadatabill_ship",
            data: "{jsondetail:'" + JSON.stringify(data) + "',codebill:'" + codebill + "',inforbill:'" + JSON.stringify(infobill) + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json", // dataType is json format
            success: OnSuccess,
            error: OnErrorCall
        });
        function OnSuccess(response) {
            rs = response.d;
            location.reload();
        }
        function OnErrorCall(request, status, error) {

        }
        return rs;
    }
    function setserinumber(json, vl) {
        for (var i = 0; i < json.length; i++) {
            if (json[i].name === "serinumber") {
                json[i].vl = vl;
                return false;
            }
        }
    }
    function bindcontainerday(o) {
        var p = $(o).parent().parent();
        var vl = $(o).val();

        if ($(p).hasClass('tb_bill_ship_select_new')) {

            var code = $(p).attr("codeid");
            var ship = $(p).attr("ship");
            binddatercv(code, ship, vl)
        }
        else {
            $(".tabledetailOrderCtrup .data_insert").each(function (index) {
                var s = $(this).attr("ship");
                if (s === "shipone") {
                    $(this).find(".subcontainerday").val(vl);
                }
            })
        }
    }
    function binddatercv(code, ship, vl) {
        $(".tabledetailOrderCtrup .data_insert").each(function (index) {
            var c = $(this).attr("detailcode");
            var s = $(this).attr("ship");
            if (ship === "shipone") {
                if (c === code && s === "shipone") {
                    $(this).find(".subcontainerday").val(vl);
                }
            }
            else if (c === code && s === ship) {
                 $(this).find(".subcontainerday").val(vl);
            }
        });
    }
    function EditShip() {
         var om = $(".table1 .tr-active");
        if (om.length <= 0)
            return false;
        var terms = $(om).find(".terms_main").html();
        if (terms === "내수") {
            Edit_internal();
            return false;
        }
        $(".tb_bill_ship .tb_bill_ship_select_new").remove();
        inforship_edit();
        $(".table2 .tr_ship").each(function (index) {
            var o = $(this);
            var codeid = $(o).attr("codeid");
            if (index > 0) {
                var jsonL = [];
                $(".table2 th").each(function (index) {
                    var qr = $(this).attr("data-sql");
                    var vl = $(o).find("td:eq(" + index + ")").html();
                    var i = {
                        name: qr,
                        vl: vl
                    }
                    jsonL.push(i);
                })
                addrowship_edit($(o).attr("ship"), $(o).attr("bitem"), jsonL, codeid);
            }

        });
        editdetailship();
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        addmoreShip();
        $("#popupdetail_ship").modal("toggle");
        bindcolorEdit();

    }
    function addrowship_edit(ship, qltbox, jsonL, detailcode) {

        var a = $(".tb_bill_ship .tb_bill_ship_select").clone();
        $(a).removeClass("tb_bill_ship_select");
        $(a).addClass("tb_bill_ship_select_new");
        $(a).attr("detailcode", detailcode);
        $(a).attr("ship", ship);
        $(a).attr("qltbox", qltbox);

        $(a).find(".datecombo").removeClass("hasDatepicker");
        $(a).find(".datecombo").attr("id", null)
        //resetrow($(a));
        var cpan = $(a).find(".td-nonreset").length;
        $(a).find(".td-nonreset").hide();
        $(a).find(".td-began").html('');
        $(a).find(".td-began").addClass("new_began")
        $(a).find(".td-began").show();
        $(a).find(".new_began").attr("colspan", cpan);
       // $(a).find(".input-orderbill").html(findneworder());

        $(a).find(".td-data").each(function (index) {
            var dtquery = $(this).attr('data-sql');
            var vl = finddatainJson(dtquery, jsonL);
            if ($(this).hasClass('data-input'))
                $(this).find("input[type=text]").val(vl);
            else if ($(this).hasClass('select-dt')) {
                var obj = $(this).find(".select-op");
                setselectbytext(obj, vl);
            }
            else if ($(this).hasClass('pinput')) {
                $(this).find(".p-input").html(vl);
            }

        });

        $(a).appendTo(".tb_bill_ship tbody");

    }
    function finddatainJson(name, json) {
        var rs = "";
        for (var i = 0; i < json.length; i++) {
            if (name === json[i].name) {
                rs = json[i].vl;
                return rs;
            }

        }
        return rs;
    }
    function inforship_edit() {
        var o = $(".table2 .tr_ship:eq(0)");
        $(".table2 th").each(function (index) {
            var qr = $(this).attr("data-sql");
            var vl = $(o).find("td:eq(" + index + ")").html();
            binddataEditship(qr, vl, "tb_bill_ship");
        })
    }
    function binddataEditship(name, vl, table) {

        var data = [];
        $("." + table + " .td-data").each(function (index) {
            var dtquery = $(this).attr('data-sql');
            if (dtquery === name) {
                if ($(this).hasClass('data-input'))
                    $(this).find("input[type=text]").val(vl);
                else if ($(this).hasClass('select-dt')) {
                    var obj = $(this).find(".select-op");

                    setselectbytext(obj, vl);
                }
                else if ($(this).hasClass('pinput')) {

                    $(this).find(".p-input").html(vl);
                }

                return false;
            }
        });


    }
    function addmoreShip2(o) {
        var ship = $(o).attr("data-sql");
        var parent = $(o).parent().parent().attr("codeid");
        if ($(o).val() > 0) {
            var rs = findshipExited(parent, ship);
            if (!rs)
                return false;

            var a = $(".tb_bill_ship .tb_bill_ship_select").clone();
            $(a).removeClass("tb_bill_ship_select");
            $(a).addClass("tb_bill_ship_select_new");
            $(a).attr("detailcode", parent);
            $(a).attr("ship", ship);
            $(a).attr("qltbox", $(o).val());
            $(a).find(".datecombo").removeClass("hasDatepicker");
            $(a).find(".datecombo").attr("id", null)
            resetrow($(a));
            var cpan = $(a).find(".td-nonreset").length;
            $(a).find(".td-nonreset").hide();
            $(a).find(".td-began").html('');
            $(a).find(".td-began").addClass("new_began")
            $(a).find(".td-began").show();
            $(a).find(".new_began").attr("colspan", cpan);
            //$(a).find(".input-orderbill").html(findneworder());
            $(a).appendTo(".tb_bill_ship tbody");

            findshipItem(parent, ship);

            $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        }
        else {
            deleteship(parent, ship)
        }
    }
    function addmoreShip() {
        $(".ships").on('keyup', function (e) {
            if (e.keyCode == 13) {
                addmoreShip2($(this));
                return false;
            }
        });
    }
    function deleteship(c, s) {
        $(".tb_bill_ship .tb_bill_ship_select_new").each(function (index) {
            var code = $(this).attr("detailcode");
            var ship = $(this).attr("ship");
            if (code === c && ship === s) {
                $(this).remove();
                return false;
            }
        });
        $(".tabledetailOrderCtrup .data_insert").each(function (index) {
            var code = $(this).attr("codeid");
            var ship = $(this).attr("ship");
            if (code === c && ship === s) {
                $(this).remove();
                return false;
            }
        });
    }
    function findshipItem(c, s) {
        var sorder = s.split('_')[1];
        $(".tabledetailOrderCtrup .data_insert").each(function (index) {
            var code = $(this).attr("codeid");
            if (code === c) {
                var clone = $(this).clone();
                $(clone).attr("ship", s);
                $(clone).find(".datecombo").removeClass("hasDatepicker");
                $(clone).find(".datecombo").attr("id", null)
                var a = $(clone).find(".ordship").html().split('-')[0];
                $(clone).find(".ordship").html(a + "-" + sorder);
                resetrowAll($(clone));
                $(clone).appendTo(".tabledetailOrderCtrup tbody");
                return false;
            }
        })
    }
    function findneworder() {
        var a = $(".tb_bill_ship_select .input-orderbill").html().split('-')[0];
        var c = $(".input-orderbill").length;
        if (c < 10)
            c = "0" + c;
        return a + "-" + c;
    }
    function findshipExited(code, ship) {
        var b = true;
        $(".tb_bill_ship_select_new").each(function (index) {
            var c = $(this).attr("detailcode");
            var s = $(this).attr("ship");
            if (c === code && s === ship) {
                b = false;
                return false;
            }
        });
        return b;
    }
    function findship_tr(code, ship) {
        var o;
        $(".tb_bill_ship_select_new").each(function (index) {
            var c = $(this).attr("detailcode");
            var s = $(this).attr("ship");
            if (c === code && s === ship) {
                o = $(this);
                return false;
            }
        });
        return o;
    }
    function findbox_tr(code, ship) {
        var o = "";
        try {
            $(".tabledetailItem .data_insert").each(function (index) {
                var c = $(this).attr("codeid");
                if (c === code) {
                    o = $(this).find("." + ship).val();;
                    return false;
                }
            });
        }
        catch{ }
        return o;
    }
    function finditemcode_tr(code, ship) {
        var o = "";
        $(".tabledetailItem .data_insert").each(function (index) {
            var c = $(this).attr("codeid");
            if (c === code) {
                o = $(this).attr("itemcode");
                return false;
            }
        });
        return o;
    }
</script>
<div class="modal" id="popupdetail_ship">
    <div class="modal-dialog" style="margin: 0; width: 100%;">
        <div class="modal-content" style="overflow: auto">

            <div class="modal-body none_border">
                <div id="tb_name_item">
                    <table class="responsive-table tabledetailItem" style="width: unset; float: left; margin-top: 10px;">
                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45" data-type="numberorder">번호</th>
                                <th scope="col" class="class100 thdata auto-input t_itemname" data-input="itemname">품목명</th>
                                <th scope="col" class="class110 thdata auto-input t_standard" data-input="standard">규격</th>
                                <th scope="col" class="class85 thdata t_qltbox" data-input="qltbox">수량(B)</th>
                                <th scope="col" class="class85 thdata shipone" data-input="shipone">1차</th>
                                <th scope="col" class="class85 thdata ships" data-input="ship_2">2차</th>
                                <th scope="col" class="class85 thdata ships" data-input="ship_3">3차</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div id="tb_bill_sh" style="margin-top: 10px; margin-bottom: 15px;">
                    <!-- == 발주정보 == -->

                    <!-- == 통관정보 == -->
                    <table class="responsive-table tb_bill_ship">
                        <tbody>
                            <tr>
                                <td>통관/입고번호</td>
                                <td><input id="t_tongno" type="text" style="width: 83px" readonly="readonly"/></td>
                                <td>지급방법</td>
                                <td><select id="t_paycd"></select></td>
                                <td>L/C no</td>
                                <td><input id="t_lcno" type="text" /></td>
                            </tr>
                            <tr>
                                <td>AMT 전체금액</td>
                                <td><input id="t_amt" type="text" /></td>
                                <td>T/%</td>
                                <td><input id="t_tolper" type="text" style="width: 33px" /></td>
                                <td>TOL/AMT</td>
                                <td><input id="t_tolamt" type="text" /></td>
                            </tr>
                            <tr>
                                <td>USANCE</td>
                                <td><input id="t_usane" type="text"/></td>
                                <td>L/C, T/T date</td>
                                <td><input id="t_paydt" type="text" /></td>
                                <td>신용장만기일</td>
                                <td><input id="t_mandt" type="text" /></td>
                            </tr>
                            <tr>
                                <td>B/L no</td>
                                <td><input id="t_blno" type="text" /></td>
                                <td>선적기일</td>
                                <td><input id="t_shipdt" type="text"  /></td>
                                <td>출항예정일</td>
                                <td><input id="t_chuldt" type="text" /></td>
                            </tr>
                            <tr>
                                <td>입항예정일</td>
                                <td><input id="t_ipdt" type="text"/></td>
                                <td>CON반납기일</td>
                                <td><input id="t_conbandt" type="text" onchange="bindcontainerday(this)" /></td>
                                <td>운송사/선사</td>
                                <td><input id="shipnm" type="text"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="tb_content_update" style="margin-top: 10px">
                    <!-- == 통관상세 == -->
                    <table class="responsive-table tabledetailOrderCtrup">
                        <thead>
                            <tr>
                                <th scope="col" class="class45" data-type="numberorder">순번</th>
                                <th scope="col" class="class100 thdata datetime">구매전표</th>
                                <th scope="col" class="class100 thdata datetime">구매순번</th>
                                <th scope="col" class="class100 thdata datetime">품목명</th>
                                <th scope="col" class="class100 thdata datetime">매수</th>
                                <th scope="col" class="class100 thdata datetime">수량(B)</th>
                                <th scope="col" class="class100 thdata datetime">단가</th>
                                <th scope="col" class="class100 thdata datetime">공급가액</th>
                                <th scope="col" class="class100 thdata datetime">부가세</th>
                                <th scope="col" class="class100 thdata datetime">합계금액</th>
                                <th scope="col" class="class100 thdata datetime">수량(C)</th>
                                <th scope="col" class="class100 thdata datetime">SQM</th>
                                <th scope="col" class="class100 thdata datetime">항목비고</th>
                                <th scope="col" class="class100 thdata datetime">통관 예정일</th>
                                <th scope="col" class="class100 thdata datetime th_white">품목 통관일</th>
                                <th scope="col" class="class40 thdata select_dt_port">PORT</th>
                                <th scope="col" class="class100 thdata data-input th_white">CON No</th>
                                <th scope="col" class="class100 thdata datetime th_white">원산지증명서</th>
                                <th scope="col" class="thdata select_sizefit th_white">C/K</th>
                                <th scope="col" class="thdata datetime th_white">F/C</th>
                                <th scope="col" class="class90 thdata datetime th_white">CON반납일</th>
                                <th scope="col" class="class90 thdata datetime">입고요청일</th>
                                <th scope="col" class="class90 thdata datetime th_white">입고확인</th>
                                <th scope="col" class="class130 thdata t_serinumber th_white">시리얼 No</th>
                                <th scope="col" class="thdata t_prodcode class75 th_white">PROD code</th>
                                <th scope="col" class="thdata t_casenom class75 th_white">CASE nom</th>
                                <th scope="col" class="thdata t_proddate class75 th_white">PROD date</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>


            <!-- Modal footer -->
            <div class="modal-footer">
                <ul class="ul-button" style="">
                    <li class="li-right" style="float: right; padding-right: 0">
                        <div>
                            <p class="p_empty er_bill" style="float: left; line-height: 30px; margin-right: 20px;"></p>
                            <div class="div-btn-header" onclick="saveship()"><span class="span-title">저장</span></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#bd_totamt').keypress(function (e) {
            if (e.keyCode == 13) {
                var totamt = $("#bd_totamt").val();
                if (totamt == '0' || totamt == '') return;

                var supplyamt = parseInt(totamt / 1.1);
                var vat = totamt - supplyamt;
                $("#bd_supplyamt").val(supplyamt);
                $("#bd_vat").val(vat);
                //공급가액, 부가세 구하기
            }
        });
        $('#bd_itemnm').keypress(function (e) {
            if (e.keyCode == 13) {
                pop_item($('#bd_itemnm').val(), 'bd_itemcd', 'bd_itemnm', 'bd_standard', 'bd_qty', 'bd_unitprice');
            }
        });
        //SQM
        //ENTER
        var table =$('#tong_grid').DataTable({
            columns: [
                  { data: "orderno" }
                , { data: "orderseq" }
                , { data: "itemnm" }
                , { data: "standard" }
                , { data: "qty" }
                , { data: "bqty" }
                , { data: "unitprice" }
                , { data: "supplyamt" }
                , { data: "vat" }
                , { data: "totamt" }
                , { data: "conqty" }
                , { data: "sqm" }
                , { data: "rmk" }
                , { data: "tongno" }
                , { data: "tongseq" }
                , { data: "tongdt" }
                , { data: "port" }
                , { data: "conno" }
                , { data: "docno" }
                , { data: "c/k" }
                , { data: "f/c" }
                , { data: "conbandt" }
                , { data: "inyodt" }
                , { data: "indt" }
                , { data: "sno" }
                , { data: "prodcd" }
                , { data: "casenom" }
                , { data: "proddt" }
            ],
            //"language": {
            //    "search": ""
            //},
            //"order": [[1, "desc"]],
            searching: false, paging: false, info: false, buttons: [], ordering: false,
            "scrollX": true,
            "initComplete": function (settings, json) {
                //$('#tong_grid_filter input').addClass('form-control');
                //$("#tong_grid_filter input").attr("placeholder", "검색");
            },
            "columnDefs": [
                {
                    "targets": [1],
                    "visible": false,
                    "searchable": false
                },
                {
                    "targets": [2],
                    "visible": false
                }
            ],
        });
        
        table.columns(1).visible(false);
        table.columns(2).visible(false);
        //table.columns(3).visible(false);
    });
    $('#tong_grid tbody').on('click', 'tr', function () {
        var table = $('#tong_grid').DataTable();
        //var a = table.cell({ row: this.parentNode.rowIndex, column: this.cellIndex }).data();
        var row = table.row(this).data();
        var r = {};
        //var data = table.row(this).data().map(function (item, index) {
        //    r['col' + index] = item;
        //});
        if ($(this).hasClass('selected')) {
            //$(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        //row data를 뿌려준다..
        $('#bd_rowindex').val(table.row(this).index());
        $('#bd_orderno').val(row.orderno);
        $('#bd_orderseq').val(row.orderseq);
        $('#bd_itemcd').val(row.itemcd);
        $('#bd_itemnm').val(row.itemnm);
        $('#bd_standard').val(row.standard);
        $('#bd_qty').val(row.qty);
        $('#bd_boxqty').val(row.boxqty);
        $('#bd_curcd').val(row.curcd);
        $('#bd_unitprice').val(row.unitprice);
        $('#bd_supplyamt').val(row.supplyamt);
        $('#bd_vat').val(row.vat);
        $('#bd_totamt').val(row.totamt);
        $('#bd_conqty').val(row.conqty);
        $('#bd_sqm').val(row.sqm);
        $('#bd_rmk').val(row.rmk);

    });
    function show_tong(tongno) {
        var orderno = $('#tongno').val();
        if (orderno == '') { alert('구매전표 정보가 없습니다'); return; }

        $("#popupdetail_ship").modal("toggle");
        $('#b_termcd').zentSetCombo('C001', '', '==선택==');
        $('#b_curcd').zentSetCombo('C002', '', '==선택==');
        $('#bd_curcd').zentSetCombo('C002', '', '==선택==');
        $('#b_whcd').zentSetComboWhcd('', '==선택==');
        tong_init();
        tong_init_detail();
        if (orderchasu != '') {
            tong_selone(orderno, orderchasu);
            tong_select_detail(orderno, orderchasu);
        }
    }
    function tong_selone(orderno) {
        var param = JSON.stringify({ 'orderno': orderno });
        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/tong_selone",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                //초기화 
                var result = JSON.parse(data.d);
                $('#b_orderno').val(result[0].orderno);
                $('#b_orderdt').val(result[0].orderdt);
                $('#b_usercd').val(result[0].usercd);
                $('#b_usernm').val(result[0].usernm);
                $('#b_custcd').val(result[0].custcd);
                $('#b_custnm').val(result[0].custnm);
                $('#b_tel').val(result[0].tel);
                $('#b_termcd').val(result[0].termcd);
                $('#b_whcd').val(result[0].whcd);
                $('#b_contractdt').val(result[0].contractdt);
                $('#b_curcd').val(result[0].curcd);
                $('#b_janamt').val(result[0].janamt);
                $('#b_pino').val(result[0].pino);
                $('#b_bcheckdt').val(result[0].bcheckdt);
                $('#b_rmk').val(result[0].rmk);
            },
            error: function (request, status, error) {
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                //alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });

    }
    function tong_select_detail(orderno) {
        var param = JSON.stringify({ 'orderno': orderno });
        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/tong_detail_search",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                var myTable = $('#tong_grid').DataTable();
                myTable.clear().rows.add(JSON.parse(data.d)).draw();
            },
            error: function (request, status, error) {
                //alert(100);
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }
    function tong_init() {
        $('#b_orderno').val('');
        $('#b_orderdt').val('');
        $('#b_usercd').val('');
        $('#b_usernm').val('');
        $('#b_custcd').val('');
        $('#b_custnm').val('');
        $('#b_tel').val('');
        $('#b_termcd').val('');
        $('#b_whcd').val('');
        $('#b_contractdt').val('');
        $('#b_curcd').val('');
        $('#b_janamt').val('');
        $('#b_pino').val('');
        $('#b_bcheckdt').val('');
        $('#b_rmk').val('');

        //tong_grid
        $('#tong_grid').DataTable().clear().draw();;
        //var myTable = $('#tong_init_detail').DataTable();
        //myTable.clear().rows.add(JSON.parse(data.d)).draw();
    }

    function tong_init_detail() {
        $('#bd_orderno').val('');
        $('#bd_orderseq').val('');
        $('#bd_itemcd').val('');
        $('#bd_itemnm').val('');
        $('#bd_standard').val('');
        $('#bd_qty').val('');
        $('#bd_boxqty').val('');
        $('#bd_curcd').val('');
        $('#bd_unitprice').val('');
        $('#bd_supplyamt').val('');
        $('#bd_vat').val('');
        $('#bd_totamt').val('');
        $('#bd_conqty').val('');
        $('#bd_sqm').val('');
        $('#bd_rmk').val('');
    }

    function tong_new() {
        tong_init_detail();
    }
    function tong_del() {
        var table = $('#tong_grid').DataTable();
        table.row('.selected').remove().draw(false);
        tong_init_detail();
    }
    function tong_add(mode) {
        var table = $('#tong_grid').DataTable();
        var row = {};
        row.orderno = $.trim($('#bd_orderno').val());
        row.orderseq = $.trim($('#bd_orderseq').val());
        row.itemcd = $.trim($('#bd_itemcd').val());
        row.itemnm = $.trim($('#bd_itemnm').val());
        row.standard = $.trim($('#bd_standard').val());
        row.qty = $.trim($('#bd_qty').val());
        row.boxqty = $.trim($('#bd_boxqty').val());
        row.curcd = $.trim($('#bd_curcd').val());
        row.unitprice = $.trim($('#bd_unitprice').val());
        row.supplyamt = $.trim($('#bd_supplyamt').val());
        row.vat = $.trim($('#bd_vat').val());
        row.totamt = $.trim($('#bd_totamt').val());
        row.conqty = $.trim($('#bd_conqty').val());
        row.sqm = $.trim($('#bd_sqm').val());
        row.rmk = $.trim($('#bd_rmk').val());
        //validate 
        if (row.itemcd == '') { alert('품목을 입력해주세요!'); return; }
        if (row.itemnm == '') { alert('품목을 입력해주세요!'); return; }
        if (row.standard == '') { alert('규격을 입력해주세요!'); return; }
        if (row.qty == '') { alert('매수를 입력해주세요!'); return; }
        if (row.boxqty == '') { alert('수량(B)를 입력해주세요!'); return; }
        if (row.curcd == '') { alert('화폐단위를 입력해주세요!'); return; }
        if (row.unitprice == '') { alert('단가를 입력해주세요!'); return; }
        if (row.supplyamt == '') { alert('공급가액을 입력해주세요!'); return; }
        if (row.vat == '') { alert('부가세를 입력해주세요!'); return; }
        if (row.totamt == '') { alert('합계금액을 입력해주세요!'); return; }


        if (mode == "A") {
            table.row.add(row).draw(false);
            tong_init_detail();
        }
        if (mode == "U") {
            var rowindex = $('#bd_rowindex').val();
            if (rowindex == "") {
                return;
            }
            //var temp = table.row('tr-active').data();
            //var temp = table.rows('.tr-active').data();
            //table.dataTable().fnUpdate(temp, 1);
            table.row(rowindex).data(row).draw();
        }
    }

    function tong_save() {
        //validate check == master
        var param = {};
        param.orderno = $.trim($('#b_orderno').val());
        param.orderdt = $.trim($('#b_orderdt').val()); // *
        param.usercd = $.trim($('#b_usercd').val()); // *
        param.usernm = $.trim($('#b_usernm').val()); // *
        param.custcd = $.trim($('#b_custcd').val()); // *
        param.custnm = $.trim($('#b_custnm').val()); // *
        param.tel = $.trim($('#b_tel').val());
        param.termcd = $.trim($('#b_termcd').val());
        param.whcd = $.trim($('#b_whcd').val()); // *
        param.contractdt = $.trim($('#b_contractdt').val());
        param.curcd = $.trim($('#b_curcd').val());
        param.janamt = $.trim($('#b_janamt').val());
        param.pino = $.trim($('#b_pino').val());
        param.bcheckdt = $.trim($('#b_bcheckdt').val());
        param.rmk = $.trim($('#b_rmk').val());
        if (param.orderdt == '') { alert('발주일자를 입력해주세요!'); return; }
        if (param.usercd == '') { alert('담당자를 입력해주세요!'); return; }
        if (param.usernm == '') { alert('담당자를 입력해주세요!'); return; }
        if (param.custcd == '') { alert('거래처를 입력해주세요!'); return; }
        if (param.custnm == '') { alert('거래처를 입력해주세요!'); return; }
        if (param.whcd == '') { alert('창고를 선택해주세요!'); return; }
        var param = JSON.stringify(param);
        //validate check == detail
        var param2 = [];
        var row = $('#tong_grid').DataTable().rows().data();
        alert(row.length);
        for (var i = 0; i < row.length; i++) {
            param2.push(row[i]);
        }
        param2 = JSON.stringify(param2);

        $.ajax({
            type: "POST",
            url: "/page2/page21_svc.asmx/tong_save",
            data: JSON.stringify({ 'param': param, 'param2': param2 }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                //var table = $('#grid21').DataTable();
                //table.clear().rows.add(JSON.parse(data.d)).draw();
                var result = JSON.parse(data.d);
                if (result.code == "OK") {
                    //alert(result.val);
                    tong_init();
                    tong_init_detail();
                    tong_selone(result.val);
                    tong_select_detail(result.val);
                }
                else { alert("저장오류!"); return; }

            },
            error: function (request, status, error) {
                //alert(100);
                //alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
    }

</script>