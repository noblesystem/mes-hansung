<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ship_internal_3_1.ascx.cs" Inherits="hansung.UserControl.ship_internal_3_1" %>
<script>
    function new_car() {
        $(".tabledetailOrderCtrup_internal tbody").empty();
        $(".tabledetailItem_internal tbody").empty();
        var order = 1;
        var o = $(".table1 .tr-active");
     
        if (o.length <= 0)
            return false;
        var c = $(".table2 .car_it");
           if (c.length > 0)
            return false;
         
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
            createnewRow_ship_table_item_itn(data, code, order, itemcode, shipId, qltbox);
            order++;
        });
        createnewRow_car_itn();
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        openpopup("popupdetail_ship_internal");
        addmoreShip_itn();
        setinputmoney("inputmoney", ",");
        changeNumbermoney("inputmoney");
    }
    function Edit_internal() {
        $(".tabledetailOrderCtrup_internal tbody").empty();
        $(".tabledetailItem_internal tbody").empty();
        var order = 1;
        var o = $(".table1 .tr-active");
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
            createnewRow_ship_table_item_itn(data, code, order, itemcode, shipId);
            order++;
        });

        $(".table2 .car_it").each(function (index) {
            var idbox = $(this).attr('indexbox');
            if (idbox < 10)
                idbox = "0" + idbox;
            var tr = "<tr class='data_insert_itn tr_new_int' box='" + $(this).attr('box') + "' codeid='" + $(this).attr('codeid') + "' ship='" + $(this).attr("ship") + "' shipid='" + $(this).attr('shipid') + "'><td class='ordship'>" + idbox + "</td>";
            $(this).find("td").each(function (index) {
                var qr = $(this).attr("qr");
                var vl = $(this).html().trim();
                if (qr === "company") {
                    var ctm = selectStroptioncustomers("3",vl);
                    tr += '<td class="td-data-a select-dt not-null notset" data-sql="company">' + ctm + '</td>';
                }
                else if (qr === "deliveryworker") {
                    var opt = selectStroptionworker(vl);
                    tr += '<td class="td-data-a select-dt not-null notset" data-sql="deliveryworker">' + opt + '</td>';
                }
                else if (qr === "verifyingacceptance") {
                    tr += '<td class="td-data-a data-input class95 " data-sql="verifyingacceptance"><input type="text" class="datecombo class95 td-reset" value="' + vl + '" ></td>';
                }
                else if (qr === "shippingtime") {
                    tr += '<td class="td-data-a pinput class95 td-reset" data-sql="shippingtime"><p class="p-input shippingtime td-reset">' + vl + '</p></td>';
                }
                else if (qr === "numberofvehicles") {
                    tr += '<td class="td-data-a data-input  td-reset" data-sql="numberofvehicles"><input type="text" class="class100" value="' + vl + '"></td>';
                }
                else if (qr === "rate") {
                    tr += '<td class="td-data-a data-input  td-reset" data-sql="rate"><input type="text" class="class100 inputmoney" value="' + vl + '"></td>';
                }
                     else if (qr === "numbill") {
                    tr += '<td class="td-data-a not-null  notset itn_numbill" data-sql="numbill">' + vl + '</td>';
                }
                else
                    tr += "<td>" + vl.trim() + "</td>";
            });
            tr += "</tr>";

            $(tr).appendTo(".tabledetailOrderCtrup_internal tbody")
        })
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        bindbox_ship_itn();
        setinputmoney("inputmoney", ",");
        changeNumbermoney("inputmoney");
        $("#popupdetail_ship_internal").modal("toggle");
        //bindbox_ship_itn();
        addmoreShip_itn();

    }
    function find_name_code(code) {
        var rs = [];
        $(".tabledetailItem_internal .data_insert").each(function (index) {
            var c = $(this).attr("codeid");
            if (c === code) {
                rs = {
                    codeitem: $(this).attr("itemcode"),
                    nameitem: $(this).find(".itemname").html()
                }

                return false;
            }
        });
        return rs;
    }
    function bindbox_ship_itn() {
        $(".tabledetailItem_internal .data_insert").each(function (index) {
            var c = $(this).attr("codeid");
            var one = findbox_ship_itn(c, "shipone");
            var two = findbox_ship_itn(c, "ship_2");
            var thee = findbox_ship_itn(c, "ship_3");
            $(this).find(".shipone").val(one);
            $(this).find(".ship_2").val(two);
            $(this).find(".ship_3").val(thee);
        })
    }
    function findbox_ship_itn(code, ship) {
        var rs = "0";
        $(".table2 .car_it").each(function (index) {
            var c = $(this).attr("codeid");
            var s = $(this).attr("ship");
            if (c === code && s === ship) {
                rs = $(this).attr("box");

                return false;
            };

        })
        return rs;
    }
    function createnewRow_car_itn() {
        var data_port = [];
        var data_size = [];
        var order = 1;
        var Lship = [];
        var Lorder = [];
        var payment = $(".table3 .it-insert:eq(0)").find(".paymentoption").html();
        $(".table3 .it-insert").each(function (index) {
            var obj = $(this);
            var code = $(this).attr("codeid");
            var itname = $(this).attr("nameitem");
            var standar = $(this).attr("standard");
            var qltbox = $(this).attr("bitem");
            var ship = "shipone";
            var ooo = $(this).find(".new-index").html();
            var shipId = "";
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
            createnewRow_ship_itn(data, code, order, shipId, shipId, qltbox);
            order++;
        });
        var or = $(".table1 .tr-active .ordernumber").html() + "-01";
        $('.tabledetailOrderCtrup_internal .data_insert_itn').each(function (index) {
            $(this).attr("ship", Lship[index]);
            $(this).find(".ordship").html(Lorder[index]);
            $(this).find(".itn_numbill").html(or);
            setselectoptionselect($(this).find(".sl-option"), payment);

        })
        openserinumber_ship_itn();
    }
    function openserinumber_ship_itn() {
        $('.itn_serinumber').click(function () {
            $('.itn_serinumber').removeClass("sl_seri_serinumber");
            if ($(this).find("select").length > 0)
                return false;
            $(this).addClass("sl_seri_serinumber");

            $(".tableseriOrder tbody").empty();
            var p = $(this).parent();
            var shipIp = $(p).attr("shipid");
            var c = $(p).attr("codeid");
            var s = $(p).attr("ship");
            var box = findbox_tr_itn(c, s);
            var citem = $(p).attr("itemcode");
            var port = "K";
            var warehouse = $(".table1 .tr-active").find(".warehouse").html();
            var tradingmission = $(".table1 .tr-active").find(".tradingmission").html();
            var ordernumber = $(".table1 .tr-active").find(".ordernumber").html();

            $("#PopupSerialNo .qltB").html(box)
            $("#PopupSerialNo .warehouse").html(warehouse)
            var vld = findclassdata_ship_itn($(p), "confirmreceiptday");

            if (vld === "")
                return false;

            var oo = 1;
            var tb1contractdate = convertdate_yy(vld);

            for (var i = 0; i < box; i++) {
                var b = oo;
                if (b < 10)
                    b = "0" + b;
                var sr = tb1contractdate.replace(/\./g, "") + port + citem + "-" + b;
                var tr = "<tr class='srnumber-tr'><td>" + oo + "</td><td>" + tradingmission + "</td><td class='srnumber'>" + sr + "</td><td>" + ordernumber + "</td><td></td></tr>";
                $(tr).appendTo(".tableseriOrder tbody");
                oo++;
            }
            $("#PopupSerialNo").attr("shipId", shipIp);
            $("#PopupSerialNo").modal("toggle");
        });
    }
    function finditemcode_tr_itn(code, ship) {
        var o = "";
        $(".tabledetailItem_internal .data_insert").each(function (index) {
            var c = $(this).attr("codeid");
            if (c === code) {
                o = $(this).attr("itemcode");
                return false;
            }
        });
        return o;
    }
    function findclassdata_ship_itn(o, c) {
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
    function deleteship_itn(c, s) {
        $(".tabledetailOrderCtrup_internal .data_insert_itn").each(function (index) {
            var code = $(this).attr("codeid");
            var ship = $(this).attr("ship");
            if (code === c && ship === s) {
                $(this).remove();
                return false;
            }
        });

    }
    function addmoreShip2_int(o) {
        var ship = $(o).attr("data-sql");
        var parent = $(o).parent().parent().attr("codeid");
        if ($(o).val() > 0) {

            var rs = findshipExited_itn(parent, ship);

            if (!rs)
                return false;

            findshipItem_itn(parent, ship);

            $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        }
        else {
            deleteship_itn(parent, ship)
        }
    }
    function findshipItem_itn(c, s) {
        var sorder = s.split('_')[1];
        var order = $(".table1 .tr-active .ordernumber").html() + "-01";
        $(".tabledetailOrderCtrup_internal .data_insert_itn").each(function (index) {
            var code = $(this).attr("codeid");
            if (code === c) {
                var clone = $(this).clone();
                $(clone).attr("ship", s);
                resetrow($(clone));
                $(clone).find(".datecombo").removeClass("hasDatepicker");
                $(clone).find(".datecombo").attr("id", null)

                $(clone).find(".shippingtime").html(getnowcarTime());
                $(clone).find(".itn_numbill").html(order);
                var a = $(clone).find(".ordship").html().split('-')[0];
                $(clone).find(".ordship").html(a + "-" + sorder);

                $(clone).appendTo(".tabledetailOrderCtrup_internal tbody");
                return false;
            }
        })
    }
    function findshipExited_itn(code, ship) {
        var b = true;
        $(".tr_new_int").each(function (index) {
            var c = $(this).attr("codeid");
            var s = $(this).attr("ship");
            if (c === code && s === ship) {
                b = false;
                return false;
            }
        });
        return b;
    }
    function addmoreShip_itn() {
        $(".ships_itn").on('keyup', function (e) {
            if (e.keyCode == 13) {
                addmoreShip2_int($(this));
                return false;
            }
        });
    }
    function createnewRow_ship_itn(data, code, order, ship, shipid, box) {

        if (order < 10)
            order = "0" + order;
        order = order + "-1";
        var row = "<tr class='data_insert_itn tr_new_int' box='" + box + "' codeid='" + code + "' ship='" + ship + "' shipId='" + shipid + "'><td class='ordship'>" + order + "</td>";
        var txt_port = "";
        $(".tabledetailOrderCtrup_internal .thdata").each(function (index) {
            var a = $(this).attr("data-input");
            var vl = getdatajson(a, data);
            var setdt = "notset";
            if ($(this).hasClass("td-reset"))
                setdt = "td-reset";
            if ($(this).hasClass("datetime")) {
                var c = "";
                if (a === "containerday")
                    c = "subcontainerday";
                row += '<td class="td-data-a data-input class95 ' + setdt + '" data-sql="' + a + '"><input type="text" class="datecombo class95 ' + c + '" value="' + vl + '" ></td>';

            } else if ($(this).hasClass("company")) {
                var ctm = selectStroptioncustomers("3");
                row += '<td class="td-data-a select-dt not-null ' + setdt + '" data-sql="' + a + '">' + ctm + '</td>';
            }
            else if ($(this).hasClass("deliveryworker")) {
                var opt = selectStroptionworker();
                row += '<td class="td-data-a select-dt not-null ' + setdt + '" data-sql="' + a + '">' + opt + '</td>';
            }
            else if ($(this).hasClass("rate")) {
                row += '<td class="td-data-a data-input not-null td-right td-reset ' + setdt + '" data-sql="' + a + '"><input type="text" class="class100 inputmoney" value="' + vl + '" ></td>';
            }
            else if ($(this).hasClass("shippingtime")) {

                row += '<td class="td-data-a pinput  ' + setdt + '" data-sql="' + a + '"><p class="p-input shippingtime">' + getnowcarTime() + '</p></td>';
            }
            else if ($(this).hasClass("data-input"))
                row += '<td class="td-data-a data-input  ' + setdt + '" data-sql="' + a + '"><input type="text" class="class100" value="' + vl + '" ></td>';
            else
                row += '<td class="td-data-a not-null  ' + setdt + ' itn_' + a + '" data-sql="' + a + '">' + vl + '</td>'

        })

        row += "</tr>";
        $(row).appendTo(".tabledetailOrderCtrup_internal tbody");

    }
    function getnowcarTime() {
        var now = new Date(Date.now());
        var dNow = new Date();
        var formatted = now.getFullYear() + "." + (dNow.getMonth() + 1) + "." + dNow.getDate() + "  " + now.getHours() + ":" + now.getMinutes();
        return formatted;
    }
    function create_new_ship_internal() {
        $(".tabledetailOrderCtrup_internal tbody").empty();
        $(".tabledetailItem_internal tbody").empty();
        var order = 1;
        var o = $(".table1 .tr-active");
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
            createnewRow_ship_itn(data, code, order, "shipone", shipId);
            createnewRow_ship_table_item_itn(data, code, order, itemcode, shipId)
            order++;
        });
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        openpopup("popupdetail_ship_internal");
        var sumtotalamount = $('.sumtotalamount').html();
        var code = $(o).find("td:eq(0)").html();
        $(".itn_orderbill").html(code + "-01");
        $('.itn_money').html(sumtotalamount);
        addmoreShip_itn();
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
    function createnewRow_ship_table_item_itn(data, code, order, itemcode, shipId, box) {

        if (order < 10)
            order = "0" + order;

        var row = "<tr class='data_insert tr_new' qltbox='" + box + "' codeid='" + code + "'  itemcode='" + itemcode + "' shipId='" + shipId + "'><td>" + order + "</td>";
        var txt_port = "";
        var txt_size = "";
        var txtbox = "";
        $(".tabledetailItem_internal .thdata").each(function (index) {
            var a = $(this).attr("data-input");
            var vl = getdatajson(a, data);
            if ($(this).hasClass("t_qltbox"))
                txtbox = vl;

            if ($(this).hasClass("datetime"))
                row += '<td class="td-data-a data-input class80" data-sql="' + a + '"><input type="text" class="datecombo class100" value="' + vl + '" ></td>';
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
                row += '<td><input type="text" data-sql="' + a + '" class="td-data-a select-dt class50 td-center ' + a + '" value="' + txtbox + '"></td>';
            else if ($(this).hasClass("ships"))
                row += '<td><input type="text" data-sql="' + a + '" class="td-data-a ships_itn class50 td-center ' + a + '"></td>';
            else
                row += '<td  class="td-data-a ' + a + '"  data-sql="' + a + '">' + vl + '</td>'

        })

        row += "</tr>";

        $(row).appendTo(".tabledetailItem_internal tbody");

    }
    function infor_ship_internal(tr) {
        var data = [];

        $(tr).find(".notset").each(function (index) {
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
            else {

                vl = $(this).html();

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
    function get_infor_ship_itn(tr) {

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
    function saveship_internal() {
        var data = [];
        //var rs = checkdatanull_ctr_header("tb_bill_ship");
        var codebill = $(".table1 .tr-active").attr("codeid");
        //if (!rs)
        //    return false;
        var o_itn = $(".tabledetailOrderCtrup_internal .data_insert_itn:eq(0)")
        $(".tabledetailOrderCtrup_internal .data_insert_itn").each(function (index) {
            var codeid = $(this).attr("codeid");
            var json = convertdata_tr($(this));

            var ship = "shipone";
            var ordship = $(this).find(".ordship").html();
            if ($(this).attr("ship") !== ship) {
                ship = $(this).attr("ship");
            }

            var qltBox = findbox_tr_itn(codeid, ship);
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
            var slsrnb = $(this).find(".itn_serinumber").find("select");
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
            setserinumber_itn(json, srnb.toString())
            data.push(json)
        })

        var rs = "none";
        $.ajax({
            type: "POST",
            //getListOfCars is my webmethod   
            url: "/ServiceApi.asmx/savadatabill_car_itn",
            data: "{jsondetail:'" + JSON.stringify(data) + "',codebill:'" + codebill + "'}",
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
    function setserinumber_itn(json, vl) {
        for (var i = 0; i < json.length; i++) {
            if (json[i].name === "serinumber") {
                json[i].vl = vl;
                return false;
            }
        }
    }
    function findbox_tr_itn(code, ship) {
        var o = "";
        try {
            $(".tabledetailItem_internal .data_insert").each(function (index) {
                var c = $(this).attr("codeid");
                if (c === code) {
                    o = $(this).find("." + ship).val();
                    return false;
                }
            });
        }
        catch{ }
        return o;
    }

</script>

<div class="modal" id="popupdetail_ship_internal">
    <div class="modal-dialog" style="margin: 0; width: 100%;">
        <div class="modal-content" style="overflow: auto">

            <div class="modal-body none_border">
                <div>
                    <table class="responsive-table tabledetailItem_internal" style="width: unset; float: left; margin-top: 10px;">
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

                <div style="margin-top: 10px">

                    <table class="responsive-table tabledetailOrderCtrup_internal">

                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center;" class="class45 notset" data-type="numberorder">번호</th>
                                <th style="text-align: center" class="thdata notset" data-input="numbill">통관/입고번호</th>
                                <th data-input="company" class="thdata company">운송사</th>
                                <th data-input="numberofvehicles" class="thdata class100 data-input td-reset">차량번호</th>
                                <th scope="col" class="class90 thdata td-reset data-input rate" data-input="rate">운임</th>
                                <th scope="col" class="class90 thdata datetime th_white td-reset" data-input="verifyingacceptance">승인 확인</th>
                                <th scope="col" class="class90 thdata th_white  deliveryworker" data-input="deliveryworker">출고확인</th>
                                <th scope="col" class="class100 thdata pinput shippingtime th_white td-reset" data-input="shippingtime">출고시간</th>

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

                            <div class="div-btn-header" id="buybill_ship_itn" onclick="saveship_internal()"><span class="span-title">저장</span></div>
                            <div class="div-btn-header" data-dismiss="modal" style="margin-right: 0"><span class="span-title">취소</span></div>

                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </div>
</div>
