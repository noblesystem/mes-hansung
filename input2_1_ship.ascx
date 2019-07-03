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

                    <table class="responsive-table tb_bill_ship">
                        <thead>
                            <tr>
                                <th style="text-align: center">통관/입고번호</th>
                                <th>지급 지급방법</th>
                                <th>L/C no</th>
                                <th>AMT 전체금액</th>
                                <th class="th_white">T/% T %</th>
                                <th class="th_white">TOL/AMT T AMT</th>
                                <th style="font-size: 10px;">USANCE</th>
                                <th>L/C, T/T date</th>
                                <th>신용장만기일</th>
                                <th>B/L no</th>
                                <th>선적기일</th>
                                <th>출항예정일</th>
                                <th>입항예정일</th>
                                <th>CON반납기일</th>
                                <th>운송사/선사</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tb_bill_ship_select">
                                <td class="pinput td-data data-not-null-td class130 td-began td-nonreset" data-sql="orderbill" note_alert="통관/입고번호">
                                    <p class="p-input input-orderbill"></p>
                                </td>
                                <td class="td-data select-dt sl-noempty class50 data-not-null-td td-nonreset" data-sql="paymentoption" note_alert="지급">
                                    <select class="sl-option select-op sl-payment data-not-null">
                                        <option value="-1" class="op-default"></option>
                                        <option value="1">L/C</option>
                                        <option value="2">T/T</option>
                                    </select>
                                </td>
                                <td class="td-data data-input data-not-null-td class90 td-nonreset" data-sql="note" note_alert="L/C no">
                                    <input type="text" class="old-note data-not-null" style="width: 83px" />
                                </td>

                                <td class="td-data pinput data-not-null-td class100 td-nonreset" data-sql="money" note_alert="AMT">
                                    <p class="p-input input-money-amt td-right"></p>
                                </td>

                                <td class="td-data data-input data-not-null-td td-nonreset" data-sql="tolerancepercent" note_alert="T/%">
                                    <input type="text" class="numberinput tlcnb old-tlcnb data-not-null" style="width: 33px" />

                                </td>

                                <td class="td-data pinput class100 td-nonreset" data-sql="tolerancemoney">
                                    <p class="p-input input-tlcmoney numberinput"></p>
                                </td>

                                <td class="td-data data-input data-not-null-td td-nonreset" data-sql="usance" note_alert="USANCE">
                                    <input type="text" class="numberinput old-rsc class40" />
                                </td>

                                <td class="td-data data-input data-not-null-td td-nonreset" data-sql="datebeginpayment" note_alert="L/C, T/T date">
                                    <input type="text" class="datecombo class95" /></td>

                                <td class="td-data data-input data-not-null-td td-nonreset" data-sql="creditduedate" note_alert="신용장만기일">
                                    <input type="text" class="datecombo old-credit class95" />
                                </td>

                                <td class="td-data data-input data-not-null-td td-reset" data-sql="numbership" note_alert="B/L no">
                                    <input type="text" class="class83" />
                                </td>

                                <td class="td-data data-input data-not-null-td td-reset" data-sql="duedate" note_alert="선적기일">
                                    <input type="text" class="datecombo old-credit class95" /></td>

                                <td class="td-data data-input data-not-null-td td-reset" data-sql="departuredate" note_alert="출항예정일">
                                    <input type="text" class="datecombo old-credit class95" />

                                </td>
                                <td class="td-data data-input data-not-null-td td-reset" data-sql="dateofarrival" note_alert="입항예정일">
                                    <input type="text" class="datecombo old-credit class95" />
                                </td>
                                <td class="td-data data-input data-not-null-td td-reset" data-sql="conDuedate" note_alert="CON반납기일">
                                    <input type="text" class="datecombo old-credit class95" onchange="bindcontainerday(this)" /></td>
                                <td class="td-data data-input data-not-null-td td-reset" data-sql="nameshipname" note_alert="운송사/선사">
                                    <input type="text" class="class80" /></td>

                            </tr>
                        </tbody>
                    </table>

                </div>

                <div id="tb_content_update" style="margin-top: 10px">

                    <table class="responsive-table tabledetailOrderCtrup">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45" data-type="numberorder">번호</th>
                                <th scope="col" class="class100 thdata datetime" data-input="dateclearance">통관 예정일</th>
                                <th scope="col" class="class100 thdata datetime th_white" data-input="customsday">품목 통관일</th>
                                <th scope="col" class="class40 thdata select_dt_port" data-input="port">PORT</th>
                                <th scope="col" class="class100 thdata data-input th_white" class_item="class100" data-input="containernumber">CON No</th>
                                <th scope="col" class="class100 thdata datetime th_white" data-input="daycertificate">원산지증명서</th>
                                <th scope="col" class="thdata select_sizefit th_white" data-input="sizefit">C/K</th>
                                <th scope="col" class="thdata datetime th_white" data-input="containerday">F/C</th>
                                <th scope="col" class="class90 thdata datetime th_white" data-input="conreturnday">CON반납일</th>
                                <th scope="col" class="class90 thdata datetime" data-input="requestday">입고요청일</th>
                                <th scope="col" class="class90 thdata datetime th_white" data-input="confirmreceiptday">입고확인</th>

                                <th scope="col" class="class130 thdata t_serinumber th_white" data-input="serinumber">시리얼 No</th>
                                <th scope="col" class="thdata t_prodcode class75 th_white" data-input="prodcode">PROD code</th>
                                <th scope="col" class="thdata t_casenom class75 th_white" data-input="casenom">CASE nom</th>
                                <th scope="col" class="thdata t_proddate class75 th_white" data-input="proddate">PROD date</th>
                                <%-- <th scope="col"></th>--%>
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

                            <div class="div-btn-header" id="buybill_ship" onclick="saveship()"><span class="span-title">저장</span></div>
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>

                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>
