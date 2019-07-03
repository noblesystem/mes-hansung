<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ship_internal.ascx.cs" Inherits="hansung.UserControl.ship_internal" %>
<script>
    var pmoption = '<select class="sl-option" data-sql="port"><option value="-1" class="op-default"></option><option>L/C</option><option>T/T</option></select>';
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
        createnewRow_shipEdit_itn()
        var wh = $('.table1 .tr-active').find('.warehouse').html();
        var itn_orderbill = $(".tabledetailOrderCtrup_internal .data_insert_itn:eq(0)").find(".itn_orderbill").html();
        $(".datecombo").datepicker({ dateFormat: 'yy.mm.dd' });
        $(".tabledetailOrderCtrup_internal .data_insert_itn").each(function (index) {
            var c = $(this).attr("codeid");
            var a = find_name_code(c);
             $(this).find('.itn_orderbill').html(itn_orderbill);
            $(this).find('.itn_warehouse').html(wh);
            $(this).attr("itemname", a.nameitem);
           $(this).attr("itemcode", a.codeitem);
        });
        openpopup("popupdetail_ship_internal");
        bindbox_ship_itn();
        addmoreShip_itn();

    }
    function find_name_code(code) {
        var rs = [];
         $(".tabledetailItem_internal .data_insert").each(function (index) {
            var c = $(this).attr("codeid");
             if (c === code) {
                 rs = {
                     codeitem: $(this).attr("itemcode"),
                     nameitem:$(this).find(".itemname").html()
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

        $(".tabledata4 .it-insert").each(function (index) {
            var c = $(this).attr("codeid");
            var s = $(this).attr("ship");
            if (c === code && s === ship) {
                rs = $(this).attr("bitem");

                return false;
            };

        })
        return rs;
    }
    function createnewRow_shipEdit_itn() {
        var data_port = [];
        var data_size = [];
        var order = 1;
        var Lship = [];
        var Lorder = [];
        var payment = $(".tabledata4 .it-insert:eq(0)").find(".paymentoption").html();
        $(".tabledata4 .it-insert").each(function (index) {
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
            createnewRow_ship_itn(data, code, order, shipId, shipId);
            order++;
        });

        $('.tabledetailOrderCtrup_internal .data_insert_itn').each(function (index) {
            $(this).attr("ship", Lship[index]);
            $(this).find(".ordship").html(Lorder[index]);
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
          
            var warehouse = $(".table1 .tr-active").find(".warehouse").html();
            var port = "B";
            if (warehouse === "인천창고")
                port="I"
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
        $(".tabledetailOrderCtrup_internal .data_insert_itn").each(function (index) {
            var code = $(this).attr("codeid");
            if (code === c) {
                var clone = $(this).clone();
                $(clone).attr("ship", s);
                $(clone).find(".datecombo").removeClass("hasDatepicker");
                $(clone).find(".datecombo").attr("id", null)
                var a = $(clone).find(".ordship").html().split('-')[0];
                $(clone).find(".ordship").html(a + "-" + sorder);
                resetrowAll($(clone));
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
    function createnewRow_ship_itn(data, code, order, ship,shipid) {
        if (order < 10)
            order = "0" + order;
        order = order + "-1";
        var row = "<tr class='data_insert_itn tr_new_int' codeid='" + code + "' ship='" + ship + "' shipId='"+shipid+"'><td class='ordship'>" + order + "</td>";
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

            } else if ($(this).hasClass("paymentoption")) {
                txt_port = vl;
                row += '<td class="td-data-a select-dt not-null sl-noempty ' + setdt + '" data-sql="' + a + '">' + pmoption + '</td>';
            }
            else if ($(this).hasClass("data-input"))
                row += '<td class="td-data-a data-input  ' + setdt + '" data-sql="' + a + '"><input type="text" class="class100" value="' + vl + '" ></td>';
            else
                row += '<td class="td-data-a not-null  ' + setdt + ' itn_' + a + '" data-sql="' + a + '">' + vl + '</td>'

        })

        row += "</tr>";
        $(row).appendTo(".tabledetailOrderCtrup_internal tbody");

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
            createnewRow_ship_itn(data, code, order, "shipone",shipId);
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
    function createnewRow_ship_table_item_itn(data, code, order, itemcode, shipId) {
        if (order < 10)
            order = "0" + order;

        var row = "<tr class='data_insert tr_new' codeid='" + code + "'  itemcode='" + itemcode + "' shipId='" + shipId + "'><td>" + order + "</td>";
        var txt_port = "";
        var txt_size = "";
        var txtbox = "";
        $(".tabledetailItem .thdata").each(function (index) {
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
    function get_infor_ship_itn(tr) {

        var data = [];
        console.log($(tr).find(".td-reset").length)
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
        var infobill = infor_ship_internal($(o_itn));

        $(".tabledetailOrderCtrup_internal .data_insert_itn").each(function (index) {
            var codeid = $(this).attr("codeid");
            var json = convertdata_tr($(this));
            var ship = "shipone";
            var ordship = $(this).find(".ordship").html();
            if ($(this).attr("ship")) {
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
            url: "/ServiceApi.asmx/savadatabill_ship_itn",
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
                    o = $(this).find("." + ship).val();;
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
                                <th style="text-align: center" class="thdata pinput notset" data-input="orderbill">통관/입고번호</th>
                                <th style="text-align: center" class="thdata pinput notset" data-input="warehouse">입고창고</th>
                                <%--<th data-input="paymentoption" class="thdata paymentoption notset">지급</th>
                                <th data-input="money" class="thdata class100 notset">AMT</th>--%>
                                <th scope="col" class="class90 thdata datetime td-reset" data-input="requestday">입고요청일</th>
                                <th scope="col" class="class90 thdata datetime th_white td-reset" data-input="confirmreceiptday">입고확인</th>

                                <th scope="col" class="class130 thdata t_serinumber th_white td-reset" data-input="serinumber">시리얼 No</th>
                                <th scope="col" class="thdata t_prodcode class75 th_white td-reset" data-input="prodcode">PROD code</th>
                                <th scope="col" class="thdata t_casenom class75 th_white td-reset" data-input="casenom">CASE nom</th>
                                <th scope="col" class="thdata t_proddate class75 th_white td-reset" data-input="proddate">PROD date</th>
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
