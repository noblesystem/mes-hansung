<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Datacommon.ascx.cs" Inherits="hansung.UserControl.Datacommon" %>
<script>

    var idemloyer = [];
    var emloyer = [];
    var ctmer = [];
    var accotctm = [];
    var idcpn = [];
    var items = [];
    var items_group = [];
    var iditems = [];
    var standar = [];
    var qltincase = [];
    var warehouse = [];
     var idwarehouse = [];
<%--        <%foreach (var i in employer)
    {%>
    emloyer.push('<%=i["name"].ToString()%>');
    idemloyer.push('<%=i["id"].ToString()%>');
        <%}%>
          <%foreach (var i in customer)
    {%>
    accotctm.push('<%=i["transactionaccountnumber"].ToString()%>');
    ctmer.push('<%=i["name"].ToString()%>');
    idcpn.push('<%=i["id"].ToString()%>');
        <%}%>
    <%foreach (var i in items)
    {%>
    if (items_group.indexOf('<%=i["itemname"].ToString()%>') == -1)
        items_group.push('<%=i["itemname"].ToString()%>');
        items.push('<%=i["itemname"].ToString()%>');
        iditems.push('<%=i["id"].ToString()%>');
    <%}%>
    <%foreach (var i in warehouse)
    {%>
        warehouse.push('<%=i["subname"].ToString()%>');
       idwarehouse.push('<%=i["id"].ToString()%>');
    <%}%>--%>
    $(document).ready(function () {
     
    })
    function bindstandar(name, select) {

        $('.' + select).empty();
      
        $(".it-item-box").each(function (index) {
            var nameit = $(this).attr("nameit");
            if (nameit === name) {
                var standar = $(this).attr("standard");
                var quantityincase = $(this).attr("quantityincase");
                var itemcode = $(this).attr("itemcode");
                var op = "<option quantityincase='" + quantityincase + "' itemcode='" + itemcode + "'>" + standar + "</option>";
                $(op).appendTo('.' + select);
            }
        });

    }
    function bindstandarparent(child, select) {

        var name = $(child).val();
        var parent = $(child).parent().parent();
        var selecta=$(parent).find('.' + select);
        $(selecta).empty();
        $(".it-item-box").each(function (index) {
            var nameit = $(this).attr("nameit");
            if (nameit === name) {
                var standar = $(this).attr("standard");
                var quantityincase = $(this).attr("quantityincase");
                var itemcode = $(this).attr("itemcode");
                var op = "<option quantityincase='" + quantityincase + "' itemcode='" + itemcode + "'>" + standar + "</option>";
                $(op).appendTo(selecta);
            }
        });

    }
    function getaccoutctm(name) {
        var index = ctmer.indexOf(name);
        return accotctm[index];
    }
    function bindqltincase(name,standar,c,ext) {
         $(".it-item-box").each(function (index) {
             var nameit = $(this).attr("nameit");
              var standard = $(this).attr("standard");
            if (nameit === name && standard===standar) {
                var quantityincase = $(this).attr("quantityincase");
                if (ext === "h")
                    $("." + c).html(quantityincase);
                else
                    $("." + c).val(quantityincase);
                return false;
            }
        });
    }
    function setautocustomer(o, c) {
        var a = [];

        var index = emloyer.indexOf(o);

        var id = idemloyer[index];
        $(".hidder-customer option").each(function (index) {
            var namectm = $(this).val();
            if (namectm === id)
                a.push($(this).attr('namectm'))
        })

        setautocompleat($('.' + c), a);
    }
    function findnameworker(id) {
        try {
            var indexname = idemloyer.indexOf(id.toString());
            return emloyer[indexname];
        }
        catch{
            return "";
        }
    }
    function findnameItem(id) {
        try {
            var indexname =iditems.indexOf(id.toString());
            return items[indexname];
        }
        catch{
            return "";
        }

    }
    function findnamewarehouse(id) {
        try {
            var indexname =idwarehouse.indexOf(id.toString());
            return warehouse[indexname];
        }
        catch{
            return "";
        }
    }
    function findnamecompany(id) {
        var indexname = idcpn.indexOf(id.toString());
        return ctmer[indexname];

    }
    function setautocustomertyle(idcode, c) {
        var a = [];

        $(".hidder-customer option").each(function (index) {
            var code = $(this).attr('code');
            if (code === idcode)
                a.push($(this).attr('namectm'))
        })

        setautocompleat($('.' + c), a);
    }
    function bindoptionctm(idcode, c) {
     
        $(".hidder-customer option").each(function (index) {
            var code = $(this).attr('code');
            if (code === idcode) {

                var o = '<option class="option-item">' + $(this).attr("namectm") + '</option>';
                $(o).appendTo("." + c);
            }

        })
    }
     function bindoptionctmfollowwk(idcode, c) {
     
        $(".hidder-customer option").each(function (index) {
            var code = $(this).val();
            if (code === idcode) {

                var o = '<option class="option-item" destinationphone="'+ $(this).attr('destinationphone')+'" phone="'+ $(this).attr('phonenumber')+'" transactionbalance="'+ $(this).attr('transactionbalance') +'" destinationaddress="'+ $(this).attr('destinationaddress') +'">' + $(this).attr("namectm") + '</option>';
                $(o).appendTo("." + c);
            }

        })
    }
    function bindoptionctmfollowAllwk(c) {
     
        $(".hidder-customer option").each(function (index) {
         
                var o = '<option class="option-item" phone="'+ $(this).attr('phonenumber')+'" transactionbalance="'+ $(this).attr('transactionbalance') +'">' + $(this).attr("namectm") + '</option>';
                $(o).appendTo("." + c);
          
        })
    }
    function binddatactm(name, c, style, get) {
        var index = ctmer.indexOf(name);
        var a = $(".hidder-customer option:eq(" + index + ")").attr(get);
        if (style === "h")
            $('.' + c).html(a);
        else if (style === "v")
            $('.' + c).val(a);
    }
    function bindoptionwarehouse(c) {
        var o = "";
        var l = c.split(',');
        for (var i = 0; i < warehouse.length; i++) {
            o += "<option>"+warehouse[i]+"</option>";
        }
        for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }
    function bindoptionworkers(c) {
        var o = "";
        var l = c.split(',');
        for (var i = 0; i < emloyer.length; i++) {
            o += "<option value='"+idemloyer[i]+"'>"+emloyer[i]+"</option>";
        }
        for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }

     function bindoptioncustomers(c) {
         var o = "";
         var l = c.split(',');
        for (var i = 0; i < ctmer.length; i++) {
            o += "<option>"+ctmer[i]+"</option>";
        }
       for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }
    function selectStroptioncustomers(idcpns,vl) {
        var o = "<select style='width:100%' class='sl-option'><option style='display:none'></option>";
         $(".hidder-customer option").each(function (index) {
             var code = $(this).attr('code');
             var n = $(this).attr('namectm');
             if (code === idcpns) {
                 if(n===vl)
                    o += '<option class="option-item" selected>' + $(this).attr("namectm") + '</option>';
                 else
                      o += '<option class="option-item">' + $(this).attr("namectm") + '</option>';

             }
        })
        o += "</select>";

        return o;
    }
     function selectStroptionworker(vl) {
        var o ="<select style='width:100%' class='sl-option'><option style='display:none'></option>";
       
         for (var i = 0; i < emloyer.length; i++) {
             if (vl === emloyer[i])
                 o += "<option selected>"+emloyer[i]+"</option>";
             else
                o += "<option>" + emloyer[i] + "</option>";
        }
         o += "</select>";

        return o;
    }
     function bindoptionwarehouse(c) {
         var o = "";
         var l = c.split(',');
        for (var i = 0; i < warehouse.length; i++) {
            o += "<option>"+warehouse[i]+"</option>";
        }
       for (var j = 0; j < l.length;j++)
            $(o).appendTo("." + l[j]);
    }
    function getinforItem(iditem) {
        var info = [];
          $(".it-item-box").each(function (index) {
            var idId = $(this).attr("iditem");
           
            if (parseInt(iditem) === parseInt(idId)) {
   
                var itemcode = $(this).attr("itemcode");
                var standard = $(this).attr("standard");
                var nameit = $(this).attr("nameit");
                info = {
                    itemcode: returncode(itemcode,4),
                    standard: standard,
                    nameit: nameit
                };
                return false;
            }
        });
        return info;
    }
</script>
<%--<select class="hidder-customer" style="display: none">
    <%foreach (var i in customer)
        {%>
    <option class="option-item op-customer" code="<%=i["idcode"].ToString()%>" destinationaddress="<%=i["destinationaddress"].ToString()%>" destinationphone="<%=i["destinationphone"].ToString()%>" value="<%=i["salesemployee"].ToString()%>" namectm="<%=i["name"].ToString()%>" address="" phonenumber="<%=i["phonenumber"].ToString() %>" transactionbalance="<%=i["transactionbalance"].ToString() %>"><%=i["phonenumber"].ToString() %></option>
    <%} %>
</select>
<div id="box-item" style="display:none">
    <%foreach (var i in items)
        {%>
            <div class="it-item-box" idItem="<%=i["id"].ToString() %>" itemcode="<%=i["itemcode"].ToString() %>" nameit="<%=i["itemname"].ToString() %>" standard="<%=i["standard"].ToString() %>" quantityincase="<%=i["quantityincase"].ToString() %>"></div>
    <%} %>
</div>--%>