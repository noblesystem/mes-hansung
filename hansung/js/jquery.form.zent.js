/*
 * jQuery Form Plugin
 * version: 2.17 (06-NOV-2008)
 * @requires jQuery v1.2.2 or later
 *
 * Examples and documentation at: http://malsup.com/jquery/form/
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * Revision: $Id$
 */
;(function($) {
//===================================================================
//
// MY LIBRARY(ZENT) 
//
//===================================================================
/**
 * setDom - 조회시
 */
$.fn.zentMakeDom = function(argDom) {
	var str = "<xml><url/><usp/><gu/><comcd/><data></data></xml>";
	var dom = new ActiveXObject("Microsoft.XMLDOM");
	// 인자값이 없을 경우.
	if(argDom == undefined)
	{
		dom.loadXML(str);
		var oNewNode = dom.createNode(1, "zrow", "");
		this.each(function() {
			var cid = this.id;
			if (cid.substring(0, 3) == "si_") cid = cid.substring(3);
			if (cid.substring(0, 3) == "dp_") return;
			oNewNode.appendChild(dom.createNode(1, cid, ""));
			oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());

			var t = $(this).attr("class");
			if (t == 'num' || t == "number"){
				oNewNode.selectSingleNode("//" + cid + "").setAttribute("dbcoltype","numeric");
				oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());
				if (oNewNode.selectSingleNode("//" + cid + "").text == "") 
					oNewNode.selectSingleNode("//" + cid + "").text = "0";
			}
			/*
			else if (t == "chk")
			{
				debugger;
				oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());
			}
			*/
			else oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());
		});
		dom.selectSingleNode("//data").appendChild(oNewNode);
		return dom;
	}
	
	if(argDom.selectNodes("//zrow").length == 1)	// zrow에 추가
	{
		dom = argDom;
		this.each(function() {
			var cid = this.id;
			if (cid.substring(0, 3) == "si_")
			{
				cid = cid.substring(3);
			}
			if (cid.substring(0, 3) == "dp_") return;
			var oNewNode = dom.createNode(1, cid, "");
			oNewNode.text = $.trim($(this).zentRealVal());	
			var t = $(this).attr("class");
			if (t == 'num' || t == "number"){
				oNewNode.setAttribute("dbcoltype","numeric");
				oNewNode.text = $.trim($(this).zentRealVal());
				if (oNewNode.text == "") oNewNode.text = "0";
			}
			else { oNewNode.text = $.trim($(this).zentRealVal()); }
				
			dom.selectSingleNode("//zrow").appendChild(oNewNode);
		});
		return dom; 
	}

	if(argDom.selectNodes("//zrow").length == 0)	// zrow를 만들고 추가
	{
		dom.loadXML(str);
		var oNewNode = dom.createNode(1, "zrow", "");	
		this.each(function() {
			var cid = this.id;
			if (cid.substring(0, 3) == "si_")
			{
				cid = cid.substring(3);
			}
			if (cid.substring(0, 3) == "dp_") return;
			oNewNode.appendChild(dom.createNode(1, cid, ""));
			oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());
			
			var t = $(this).attr("class");
			if (t == 'num' || t == "number"){
				oNewNode.selectSingleNode("//" +cid + "").setAttribute("dbcoltype","numeric");
				oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());
				if (oNewNode.selectSingleNode("//" + cid + "").text == "")
					oNewNode.selectSingleNode("//" + cid + "").text = "0";
			}
			else 
				oNewNode.selectSingleNode("//" + cid + "").text = $.trim($(this).zentRealVal());
			
		});
		dom.selectSingleNode("//data").appendChild(oNewNode);
		return dom;
	}
};
//-----------------------------------------------
// getDom - pg_selone
//-----------------------------------------------
$.fn.zentSetData = function(data) {
	var formstr = "";
	var nodenm = "";
	var nodeval = "";

	if(data[0].length == 0)
	{
		alert("조회된 항목이 없습니다!");
		return;
	}
    return this.each(function() {
		var tag = this.tagName.toLowerCase();
		var css = $(this).attr('class');
		var type = $(this).attr('type');
		if (this.id != "" && this.id != undefined)
		{
			var fid  = (type == 'radio') ? $(this).attr('name') : this.id;
			if(data[0][fid] != undefined)
			{
				if (type == "radio"){
					$('input:radio[name="' + fid + '"][value="' + data[0][fid] + '"]').prop("checked", true);
				} 
				else {
					if (tag == 'textarea') {
						$(this).text(data[0][fid]);
					}
					else {
						if (fid == "num") {
							$(this).text(data[0][fid]);
						}
						else {
							$(this).val(data[0][fid]);
						}
					}

				}
			}
		}
    });
	/*
	if (Object.keys(data[0]).length > 1) {
		i = Object.keys(data[0]).length / 2;
	}

	for (i = i; i < Object.keys(data[0]).length; i++)
	{
		var id = Object.keys(data[0])[i];
		if(data[0][id] != undefined && $("#" + id)[0] != undefined)
		{
			var tag = $("#" + id)[0].tagName.toLowerCase();
			var type = $("#" + id)[0].tagName.toLowerCase();

			$("#" + id).val(data[0][id]);
			if (tag == 'textarea') {
				$("#" + id).text(data[0][id]);
			}
			else if (tag == 'input' && type=='radio') {
				setRadio(id, data[0][id]);
			}
			else if (tag == 'div') {
				$("#" + id).val(data[0][id]);
			}
			else {
				$("#" + id).val(data[0][id]);
			}
		}
	}
	*/

};

//===================================================
// setCombo
//===================================================
$.fn.zentSetCombo = function(gbncd, sel_val, sel_name) {
    return this.each(function () {
        for (var i = 0; i < this.options.length; i++) this.options[i] = null;
        this.options.length = 0;

        var param = JSON.stringify({ gbncd: gbncd });
		if (sel_val == "" || sel_name == "") {
			var option = new Option();
			option.value = sel_val;
			option.text  = sel_name;
			this.options.add(option);
        }
        var result = [];
        $.ajax({
            type: "POST",
            url: "/websvc_common.asmx/combocode",
            data: JSON.stringify({ 'param': param }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                result = JSON.parse(data.d);

            },
            error: function (request, status, error) {
                //alert(100);
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                //alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
        for (var i = 0; i < result.length; i++) {
            var option = new Option();
            //alert(result[i].code + '-' + result[i].codenm);
            option.value = result[i].code;
            option.text = result[i].codenm;
            this.options.add(option);
            //$(this).append(option);
        }
    });
};
$.fn.zentSetComboWhcd = function (sel_val, sel_name) {
    return this.each(function () {
        for (var i = 0; i < this.options.length; i++) this.options[i] = null;
        this.options.length = 0;
        if (sel_val == "" || sel_name == "") {
            var option = new Option();
            option.value = sel_val;
            option.text = sel_name;
            this.options.add(option);
        }
        var result = [];
        $.ajax({
            type: "POST",
            url: "/websvc_common.asmx/combowhcd",
            //data: JSON.stringify({ 'param': '' }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                result = JSON.parse(data.d);

            },
            error: function (request, status, error) {
                //alert(100);
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                //alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
        for (var i = 0; i < result.length; i++) {
            var option = new Option();
            //alert(result[i].code + '-' + result[i].codenm);
            option.value = result[i].code;
            option.text = result[i].codenm;
            this.options.add(option);
            //$(this).append(option);
        }
    });
};
$.fn.zentSetComboGbncd = function (sel_val, sel_name) {
    return this.each(function () {
        for (var i = 0; i < this.options.length; i++) this.options[i] = null;
        this.options.length = 0;
        if (sel_val == "" || sel_name == "") {
            var option = new Option();
            option.value = sel_val;
            option.text = sel_name;
            this.options.add(option);
        }
        var result = [];
        $.ajax({
            type: "POST",
            url: "/websvc_common.asmx/combogbncd",
            //data: JSON.stringify({ 'param': '' }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (data) {
                result = JSON.parse(data.d);

            },
            error: function (request, status, error) {
                //alert(100);
                alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                //alert("code = " + request.status + " error = " + error); // 실패 시 처리
            }
        });
        for (var i = 0; i < result.length; i++) {
            var option = new Option();
            //alert(result[i].code + '-' + result[i].codenm);
            option.value = result[i].code;
            option.text = result[i].codenm;
            this.options.add(option);
            //$(this).append(option);
        }
    });
};
/*
$.fn.zentSetCombo = function(gbncd) {
    return this.each(function() {
		var str = "<xml><url/><usp/><gu/><comcd/><usercd/><data></data></xml>";
		var dom = new ActiveXObject("Microsoft.XMLDOM");
		dom.loadXML(str);
	 
		dom.selectSingleNode("//usp").text = "cd_ref_sel";
		dom.selectSingleNode("//url").text = "/include/FnWebSvc.asp";
		dom.selectSingleNode("//gu").text = "search";

		var oNewNode = dom.createNode(1, "zrow", "");
		oNewNode.appendChild(dom.createNode(1,"gbncd", ""));
		oNewNode.selectSingleNode("//gbncd").text = $.trim(gbncd);
		dom.selectSingleNode("//data").appendChild(oNewNode); 

		var rdom = XmlHttpCall(dom);
		this.length = 0;

		for (var i = 0; i < rdom.selectNodes("//z:row").length; i++)
		{
			var node = rdom.selectSingleNode("//rs:data").childNodes[i];
			var option = new Option();
			option.value = node.getAttribute("refcd");
			option.text = node.getAttribute("refnm");
			this.options.add(option);
		}
    });
};
*/
//-----------------------------------------------
// combo
//-----------------------------------------------
$.fn.zentSetComboUserDef = function(gbncd) {
    return this.each(function() {
		var str = "<xml><url/><usp/><gu/><comcd/><usercd/><data></data></xml>";
		var dom = new ActiveXObject("Microsoft.XMLDOM");
		dom.loadXML(str);
	 
		dom.selectSingleNode("//usp").text = "cd_ref_sel_user_def";
		dom.selectSingleNode("//url").text = "/include/FnWebSvcOpen.asp";
		dom.selectSingleNode("//gu").text = "search";

		var oNewNode = dom.createNode(1, "zrow", "");
		oNewNode.appendChild(dom.createNode(1,"gbncd", ""));

		oNewNode.selectSingleNode("//gbncd").text = $.trim(gbncd);
		dom.selectSingleNode("//data").appendChild(oNewNode); 

		var rdom = XmlHttpCall(dom);
		this.length = 0;

		for (var i = 0; i < rdom.selectNodes("//z:row").length; i++)
		{
			var node = rdom.selectSingleNode("//rs:data").childNodes[i];
			var option = new Option();
			option.value = node.getAttribute("refcd");
			option.text = node.getAttribute("refnm");
			this.options.add(option);
		}
    });
};
/**
 * setComboAll
 */
$.fn.zentSetComboAll = function(gbncd) {
    return this.each(function() {
		var str = "<xml><url/><usp/><gu/><comcd/><usercd/><data></data></xml>";
		var dom = new ActiveXObject("Microsoft.XMLDOM");
		dom.loadXML(str);
	 
		dom.selectSingleNode("//usp").text = "cd_ref_sel";
		dom.selectSingleNode("//url").text = "/include/FnWebSvc.asp";
		dom.selectSingleNode("//gu").text = "search";

		var oNewNode = dom.createNode(1, "zrow", "");
		oNewNode.appendChild(dom.createNode(1,"gbncd", ""));
		oNewNode.selectSingleNode("//gbncd").text = $.trim(gbncd);
		dom.selectSingleNode("//data").appendChild(oNewNode); 

		var rdom = XmlHttpCall(dom);

		this.length = 0;
		var option = new Option();
		option.value = "";
		option.text = "선택해주세요";
		this.options.add(option);

		for (var i = 0; i < rdom.selectNodes("//z:row").length; i++)
		{
			var node = rdom.selectSingleNode("//rs:data").childNodes[i];
			option = new Option();
			option.value = node.getAttribute("refcd");
			option.text = node.getAttribute("refnm");
			this.options.add(option);
		}

		this.value = "";
    });
};

/**
 * setComboAll
 */
$.fn.zentSetComboAllOpen = function(gbncd) {
    return this.each(function() {
		var str = "<xml><url/><usp/><gu/><comcd/><usercd/><data></data></xml>";
		var dom = new ActiveXObject("Microsoft.XMLDOM");
		dom.loadXML(str);
	 
		dom.selectSingleNode("//usp").text = "cd_ref_sel_login";
		dom.selectSingleNode("//url").text = "/include/FnWebSvcOpen.asp";
		dom.selectSingleNode("//gu").text = "search";

		var oNewNode = dom.createNode(1, "zrow", "");
		oNewNode.appendChild(dom.createNode(1,"gbncd", ""));
		oNewNode.selectSingleNode("//gbncd").text = $.trim(gbncd);
		dom.selectSingleNode("//data").appendChild(oNewNode); 

		var rdom = XmlHttpCall(dom);

		this.length = 0;
		var option = new Option();
		option.value = "";
		option.text = "선택해주세요";
		this.options.add(option);

		for (var i = 0; i < rdom.selectNodes("//z:row").length; i++)
		{
			var node = rdom.selectSingleNode("//rs:data").childNodes[i];
			option = new Option();
			option.value = node.getAttribute("refcd");
			option.text = node.getAttribute("refnm");
			this.options.add(option);
		}

		this.value = "";
    });
};


/**
 * INPUT CSS = num (정수)
 */
$.fn.zentSetFormMask = function() {
	this.each(function() {	
		if ($(this)[0].tagName.toUpperCase() == "TEXTAREA")
		{
			return;
		}
		if ($(this)[0].tagName.toUpperCase() == "BUTTON")
		{
			$(this).jqxButton({ width: '100px', height: '25px', theme: 'darkblue'});
			return;
		}
		if ($(this).attr("class") == "cmdbutton")
		{
			$("#btn_search").jqxButton({ width: '100px', height: '25px', theme: 'darkblue'});
			return;
		}
		if ($(this).attr("class") == "code")
		{
			//$(this).css("backgroundColor", "orange");
			//$(this).css("clolor", "black");
			$(this).css("width", "100px");
			// EVENT - keydown
			$(this).bind("keydown", function() {
				var KCode = window.event.keyCode;
				var CKey= window.event.ctrlKey;
				if (KCode==13) {
					$(this).val(this.value.toUpperCase());
					event.keyCode=9             //ENTER TO TAB
					event.returnValue=true;
				}
			});
			// EVENT - keydown
			$(this).bind("blur", function() {
				$(this).val(this.value.toUpperCase());
			});
		}
		if ($(this).attr("class") == "text")
		{
			$(this).css("ime-mode", "active");
			// EVENT - keydown
			$(this).bind("keydown", function() {
				var KCode = window.event.keyCode;
				var CKey= window.event.ctrlKey;
				if (KCode == 13) {
					event.keyCode = 9				//ENTER TO TAB
					//event.returnValue = true;		//주석처리사유 - 입력이 되지 않음
				}
			});
		}
		if ($(this).attr("class") == "yy")
		{
			$(this).css("width", "80px");
			// EVENT - keydown
			$(this).bind("keydown", function() {
				var KCode = window.event.keyCode;
				var CKey= window.event.ctrlKey;

				if (KCode==13) {
					event.keyCode=9             //ENTER TO TAB
					event.returnValue=true;
				}
			});
		}
		if ($(this).attr("class") == "combo")
		{
			this.readonly = "false";
			// EVENT - keydown
			$(this).bind("change", function() {
				event.keyCode=9					//ENTER TO TAB
				event.returnValue=true;
			});
			$(this).bind("keydown", function() {
				var KCode = window.event.keyCode;
				var CKey= window.event.ctrlKey;

				if (KCode==13) {
					event.keyCode=9             //ENTER TO TAB
					event.returnValue=true;
				}
			});
			/*
			$(this).bind("beforeactivate", function() {
				if(this.readOnly == true) { 
					r
				}
			});

			$(this).bind("beforecopy", function() {
				if(this.readOnly == true) { event.returnValue = false; return; }
			});
			$(this).bind("beforecut", function() {
				if(this.readOnly == true) { event.returnValue = false; return; }
			});
			$(this).bind("beforedeactivate", function() {
				if(this.readOnly == true) { event.returnValue = false; return; }
			});
			$(this).bind("beforeeditfocus", function() {
				if(this.readOnly == true) { event.returnValue = false; return; }
			});
			$(this).bind("beforepaste", function() {
				if(this.readOnly == true) { event.returnValue = false; return; }
			});
			*/
/*
		beforeactivate	null	Variant
		beforecopy	null	Variant
		beforecut	null	Variant
		beforedeactivate	null	Variant
		beforeeditfocus	null	Variant
		beforepaste	null	Variant
		beforeupdate	null	Variant
*/
		}
		if ($(this).attr("class") == "num")
		{
			// property 선언
			//this.realValue = "";

			// EVENT - keydown
			$(this).bind("keydown", function() {
			//$(this).keydown(function(event) {
			   // EVNET KEY CODE
			   var KCode = window.event.keyCode;
			   var CKey= window.event.ctrlKey;

//			   ' 0
//			   ' 1 - 9
//			   ' 1 - 9 (KEYPAD)
//			   ' pageup,pagedown,end,home,left,up,right,down
//			   ' backspace,tab,delete,insert
//			   ' control c,v,x
//			   ' enter
			   if (KCode==48 || KCode==96) {
				  if (this.value == "0")  {
					 event.returnValue=false;
				  }
			   }else if (KCode>48 && KCode<=57) {
				  event.returnValue=true;
			   }else if (KCode>96 && KCode<=105) {
				  event.returnValue=true;
			   }else if (KCode>=33 && KCode<=40) {
				  event.returnValue=true;
			   }else if (KCode==8 || KCode==9 || KCode==46 || KCode==45 || KCode==110 || KCode==190) {
				  event.returnValue=true;
			   }else if ((CKey==true) && (KCode==67 || KCode==86 || KCode==88)) {
				  event.returnValue=true;
			   }else if (KCode==13) {
				  event.keyCode=9             //ENTER TO TAB
				  event.returnValue=true;
			   }else if (KCode==189 || KCode==109) { //왼쪽 마이너스, 키보드마이너스
				  event.returnValue=true;	// minus
			   }else {
				  event.returnValue=false;
			   }
			});

			// EVENT - keyup
			$(this).bind("keyup", function() {
				// EVNET KEY CODE
				var KCode = window.event.keyCode;

				// pageup,pagedown,end,home,left,up,right,down
				// 16번 selection때문에 사용
				// enter
				// tab,click
				// -(minus),-(KEYPAD)
				// esc
				if (KCode>=33 && KCode<=40) {
					return;
				} else if (KCode==16 ) {
					return;
				//} else if (KCode==190 ) { // dot
				//	return;
				} else if (KCode==13 ) {
					return;
				} else if (KCode==9 || KCode==229) {
					return;
				} else if (KCode==27) {           
					$(this).val("");
					return;
				} else {
					var str = $.trim($(this).val());
					str = str.replace(/,/gi, "").replace(/ /gi, "");
					$(this).val(str.formatNumber());
			   }
			});
			// EVENT - keyup
			$(this).bind("focus", function() {
				// EVNET KEY CODE
				var str = $.trim($(this).val());
					str = str.replace(/,/gi, "").replace(/ /gi, "");
				if (str == "0")
				{
					$(this).val("");
				}
				$(this).select();
			});
			// EVENT - keyup
			$(this).bind("blur", function() {
				// EVNET KEY CODE
				var str = $.trim($(this).val());
					str = str.replace(/,/gi, "").replace(/ /gi, "");
				if (str == "")
				{
					$(this).val("0");
				}
			});

		}

		if ($(this).attr("class") == "cal")
		{
			$(this).width("70");
			if ($(this).length == 1)
			{
				$('<img src="/images/calendar.gif" onclick="Calendar2(\''+this.id+'\');"  style="cursor:hand;" align="absMiddle" border="0" />').insertAfter($(this));
			}
			else
			{
				$('<img src="/images/calendar.gif" onclick="Calendar2(\''+this.id+'\');"  style="cursor:hand;" align="absMiddle" border="0" />').insertAfter($(this));
			}
			// EVENT - blur
			$(this).bind("blur", function() {
				DateOnblur(this);
			}); 
			// EVENT - focus
			$(this).bind("focus", function() {
				DateOnfocus(this);
				//DateOnblur(this);
			});
			// EVENT - click
			$(this).bind("click", function() {
				DateOnfocus(this);
				//DateOnblur(this);
			});
			// EVENT - keydown
			$(this).bind("keydown", function() {
				var KCode = window.event.keyCode;
				var CKey= window.event.ctrlKey;

				if (KCode==13) {
					event.keyCode=9             //ENTER TO TAB
					event.returnValue=true;
				} else
				{
					event.returnValue=true;
				}
			});
		}
	});
};
/**
 * INPUT CSS = zentRealVal();
 */
$.fn.zentRealVal = function(val) {
	//num
	if(val == undefined) {
		if ($(this).attr("class") == "num")	{
			var str = $.trim($(this).val());
			return str.replace(/,/gi, "").replace(/ /gi, "");
		}
		//cal
		else if ($(this).attr("class") == "cal"){
			var str = $.trim($(this).val());
			return str.replace(/-/gi, "");
		}
		//cal
		else if ($(this).attr("class") == "code"){
			var str = $.trim($(this).val()); 
			return str.toUpperCase();
		}
		else if ($(this).attr("class") == "radio")
		{
			//alert("dd");
			//debugger;
			//$(this).attr("name")
		}
		else{
			if(typeof $(this).val() == "object") return $.trim($(this)[0].value);
			else return $.trim($(this).val());
		}
	}
	else {
		if ($(this).attr("class") == "num")
		{
			//var str = $.trim($(this).val(val));
			//var str = $(this).val(val);
			var str = String(val);
			str = str.replace(/,/gi, "").replace(/ /gi, "");
			$(this).val(str.formatNumber());

		}
		//cal
		else if ($(this).attr("class") == "cal")
		{
			//var str = $(this).val(val);
			$(this).val(val.formatDate());
		}
		else if ($(this).attr("class") == "radio")
		{
			//debugger;
			//$(this).attr("name")
		}
		else 
		{
			$(this).val(val);
		}
	}
};

/**
 * zentGetDate()
 */
$.fn.zentGetDate = function(b) { 
    return this.each(function() {
		$(this).val(g_serverdate);
    });
};

/**
 * Enables or disables any matching elements.
 */
$.fn.zentReadOnly = function(b) { 
    if (b == undefined) b = true;
    return this.each(function() {
		if ($(this).attr("class") == "combo") {
			this.disabled = b;
			$(this).css("backgroundColor", "white");
			this.style.color = "black";
		}
		else if ($(this).attr("class") == "button") {
			this.disabled = b;
		}
		else 
		{
			this.style.backgroundColor = "BlanchedAlmond";
			this.readOnly = b; 
		}
    });
};
//패턴체크후 Boolean 값 반환
$.fn.zentPattern = function(str) {
	var regx;
    if($(this).zentRealVal().length == 0 || $(this).zentRealVal() == null || $(this).zentRealVal() == "undefined") return false; 
    switch(str.toLowerCase())
    {
         case "number":
	 	    regx = /^[0-9]+$/;
		    break;
	    case "alpha":
		    regx = /^[a-zA-Z]+$/;
		    break;
	    case "alphanum":
		    regx = /^[a-zA-Z0-9]+$/;
		    break;
	    case "hangle":
		    regx = /^[가-힣]+$/;
		    break;
	    case "hanglenum":
		    regx = /^[가-힣0-9]+$/;
		    break;
		case "zipcode":
			regx = /[0-9]{3}-[0-9]{3}/;
			break;
		case "phone":
			regx = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
			break;
		case "hp":
			regx = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
			break;
		case "date":
			regx = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
			break;
	    case "url":
	 	    regx = /^((http|https|ftp|telnet|news):\/\/[a-z0-9-]+\.[][a-zA-Z0-9:&#@=_~%;\?\/\.\+-]+)$/gi;
		    break;
    }

    return regx.test($(this).zentRealVal()) ? true : false;
}
//길이체크 Boolean 값 반환
$.fn.zentLengthValid = function(len1, len2) {
    if($(this).zentRealVal().length == 0 || $(this).zentRealVal() == null || $(this).zentRealVal() == "undefined") return false; 

	if ($(this).zentRealVal().length >= len1 && $(this).zentRealVal().length <= len2)
	{
		return true;
	}
	else
	{
		return false;
	}
}
    //달력 INIT
    $.fn.dateinit = function(opt){
        var option = {
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월' ],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dateFormat: 'yy-mm-dd',  // 날짜형식  
            changeMonth: true,  // 월변경 가능
            changeFirstDay: false,
            changeYear: true, 
            hideIfNoPrevNext: true,
            //maxDate: '+0d',   // 오늘 부터 6년 후까지만.  +0d 오늘 이전 날짜만 선택
            yearRange: 'c-99:c+99', // 1990~2020년 까지
            onSelect: function(sDate, obj){   // function( 선택한 날짜, this)
            }
        };
        if (opt != undefined) {
            $(this).datepicker(opt); 
        }
        else {
            $(this).datepicker(option); 
        }
    };
//===================================================================
//
// MY LIBRARY(ZENT)
//
//===================================================================
})(jQuery);
