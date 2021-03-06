;
/*!waimai:widget/common/menucommon/cart/AddToCartAnim.js*/
define("waimai:widget/common/menucommon/cart/AddToCartAnim", function (t, i, e) {
	var n = t("wcommon:static/util/Browser");
	e.exports = {
		addAnim: function (t, i, e) {
			var o = {zIndex: 0, width: "120px", height: "120px"};
			$.extend(o, e), n.msie && /6\.0|7\.0|8\.0|9\.0/g.test(n.version) || !t;
			var a, d, f;
			a = t.clone(), d = $('<div class="anim-wrap"></div>').append(a), f = t.offset(), a.css({
				width: o.width,
				height: o.height,
				"z-index": 1e3
			}), d.css({
				position: "absolute",
				left: f.left,
				top: f.top,
				"z-index": o.zIndex
			}), d.appendTo($(document.body)), d.animate({
				left: i.left,
				top: i.top - 15,
				height: "20px",
				width: "20px"
			}, "5000", function () {
				d.remove(), $(".cart-logo").addClass("cart-logo-animate");
				var t = setTimeout(function () {
					clearTimeout(t), $(".cart-logo").removeClass("cart-logo-animate")
				}, 500)
			})
		}, addAnim_fill_diff: function (t, i) {
			(0 == i.left || 0 == i.top) && (i = $(".cart-section .cart-bar").offset());
			var e, n, o = t.find(".fill_diff_name").find("span"), a = t.find(".fill_diff_price").find("span"), d = "";
			o.each(function () {
				d += $(this).text()
			});
			var f = "<div class='addAnim_fill_diff'><span>" + d + "&nbsp;&nbsp;" + a.text() + "</span></div>";
			e = $('<div class="anim-wrap"></div>').append(f), n = t.offset(), e.css({
				position: "absolute",
				left: n.left,
				top: n.top
			}), e.appendTo($(document.body)), e.animate({
				left: i.left,
				top: i.top - 15,
				height: "20px",
				width: "20px"
			}, "5000", function () {
				e.remove()
			})
		}
	}
});
;
/*!waimai:widget/common/menucommon/cart/cart.js*/
define("waimai:widget/common/menucommon/cart/cart", function (t, i, e) {
	function a(t) {
		var i = new RegExp("(^|&)" + t + "=([^&]*)(&|$)", "i"), e = window.location.search.substr(1).match(i);
		return null != e ? unescape(e[2]) : null
	}

	function s() {
		for (var t = 0, i = C.find("input.item-count"), e = 0; e < i.length; e++) t += 1 * i.eq(e).val();
		return t
	}

	function n(t) {
		var i = $(t).closest(".item"), e = i.find("input.item-count"), a = {};
		return a.itemId = i.find("input:hidden").val(), a.itemCount = e.val() ? e.val() : 0, a
	}

	function c() {
		try {
			var t = f.getCarInfo(m);
			if (!t) return !1;
			if (!g.isInit()) return !1;
			if (!g.isRequireIdInCategory()) return !1;
			for (var e = !0, a = 0, s = 0; s < t.length; s++) {
				var n = g.getReguireId(t[s].uniqId);
				if (void 0 != n && 0 != n && (a = n, 0 != a && !g.haveCategory(t, a))) {
					e = !1;
					break
				}
			}
			return 1 == e ? !1 : ($(i).trigger("filter.requireSelect", a), !0)
		} catch (c) {
			return !1
		}
	}

	function o(e, o) {
		$("#cartSubmit").click(function () {
			$("#formId").submit();
		}), $("#cartCha").click(function (t) {
			t.stopPropagation()
		}), $(".cart-panel .item-list").delegate(".item-minus", "click", function (t) {
			$("#fill_diff-section").attr("state", "non-trigger");
			var e = n(this), a = $("[data-sid=item_" + e.itemId + "]"), s = a.attr("dishactflag"),
				c = a.attr("dishlimit"), o = a.attr("orderlimit"), r = a.attr("dishActivityId");
			e.itemCount--, $.extend(e, {
				dishactflag: s,
				dishlimit: c,
				orderlimit: o,
				elem: this,
				dishactid: r
			}), $(i).trigger("update.cart", e), t.stopPropagation()
		}), $(".cart-panel .item-list").delegate(".item-plus", "click", function (t) {
			if (s() + 1 > 999) return void h.tip("所点菜品数量过多");
			$("#fill_diff-section").attr("state", "non-trigger");
			var e = n(this), a = $("[data-sid=item_" + e.itemId + "]"), c = a.attr("dishactflag"),
				o = a.attr("dishlimit"), r = a.attr("orderlimit"), d = a.attr("dishActivityId");
			e.itemCount++, $.extend(e, {
				dishactflag: c,
				dishlimit: o,
				orderlimit: r,
				elem: this,
				dishactid: d
			}), $(i).trigger("update.cart", e), t.stopPropagation()
		}), $(".cart-panel .item-list").delegate(".item-count .item-count", "focusout", function () {
			if (s() > 999) return void h.tip("所点菜品数量过多");
			var t = n(this), e = $("[data-sid=item_" + t.itemId + "]"),
				a = (e.attr("dishactflag"), e.attr("dishlimit"), e.attr("orderlimit"), e.attr("dishActivityId"));
			$.extend(t, {
				dishactflag: e.attr("dishactflag"),
				dishlimit: e.attr("dishlimit"),
				orderlimit: e.attr("orderlimit"),
				elem: this,
				dishactid: a
			}), $(i).trigger("update.cart", t)
		}), $(".cart-panel .item-list").delegate(".item-count .item-count", "keypress", function (t) {
			var i = t.which;
			return i >= 48 && 57 >= i || 8 == i || 46 == i ? !0 : !1
		}), $(".cart-panel .item-list").delegate(".item-delete", "click", function (t) {
			$("#fill_diff-section").attr("state", "non-trigger");
			var e = n(this);
			e.itemCount = 0, $(i).trigger("update.cart", e), t.stopPropagation()
		}), $(".clear-cart").click(function (t) {
			$("#fill_diff-section").attr("state", "non-trigger"), $(i).trigger("clear.cart"), t.stopPropagation()
		}), _.delegate(".pointer", "click", function (t) {
			_.hasClass("cart-hide") ? (y.css("height", "auto"), y.css("visibility", "hidden"), y.css("data-height", y.height()), y.css("height", 0), y.css("visibility", "visible"), y.css("overflow", "hidden"), setTimeout(function () {
				y.css("height", y.attr("data-height")), setTimeout(function () {
					y.css("height", "auto"), y.css("overflow", "auto")
				}, 150)
			}, 0)) : "right" == $("#fill_diff_bear").attr("status") ? (t.stopPropagation(), $("#fill_diff_bear").trigger("click"), setTimeout(function () {
				y.css("overflow", "hidden"), y.css("height", y.height()), y.attr("data-height", y.height()), y.css("height", 0), setTimeout(function () {
					y.css("overflow", "auto")
				}, 500)
			}, 1e3)) : (y.css("overflow", "hidden"), y.css("height", y.height()), y.attr("data-height", y.height()), y.css("height", 0), setTimeout(function () {
				y.css("overflow", "auto")
			}, 500)), _.toggleClass("cart-hide")
		}), v.resize(function () {
			$(".cart-panel").css("max-height", .6 * v.height())
		})
	}

	function r() {
		y.show(), $("#cartIsEmpty").hide(), $("#cartAmout").show()
	}

	function d() {
		y.hide(), $(".cart-panel .item-list .item").remove(), $("#cartIsEmpty").show(), $("#cartAmout").hide(), $("#cartCha").hide(), $("#cartSubmit").hide(), $(".cart-bar").removeClass("pointer")
	}

	var i, m, l, u = t("wcommon:static/util/Cookie"), h = t("waimai:static/utils/GlobalTips"),
		p = t("wcommon:static/util"), f = t("waimai:static/utils/CartDataCenter"),
		g = (t("waimai:static/utils/store"), t("waimai:widget/common/mustbuy/mustbuy")),
		w = t("waimai:widget/common/ui/cartAlert/cartAlert"), _ = $(".menu-cart"), v = $(window), I = {},
		y = $(".menu-cart .cc-warp"), C = $("[data-node=item-list]"),
		k = {COOKIE_LNG_KEY: "wm_callbacklng", COOKIE_LAT_KEY: "wm_callbacklat", COOKIE_ADDR_KEY: "wm_callbackaddr"};
	i = e.exports = {
		init: function (t, i, e) {
			$(".cart-panel").css("max-height", .6 * v.height()), m = t, l = i, e = e, I.lng = decodeURIComponent(u.getRaw(k.COOKIE_LNG_KEY)), I.lat = decodeURIComponent(u.getRaw(k.COOKIE_LAT_KEY)), I.address = decodeURIComponent(u.getRaw(k.COOKIE_ADDR_KEY)), o(l, e)
		}, addItem: function (t) {
			$.isArray(t) || (t = [t]), t.length > 0 && r(), $.each(t, function (t, i) {
				if ($("#cartItem_" + i.itemId).length <= 0) {
					var e = [], a = i.itemName;
					i.itemName.length > 18 && (a = i.itemName.substring(0, 16) + "..."), e.push('<tr class="item normal-item hide" data-stockId="' + i.itemStockId + '" id="cartItem_' + i.itemId + '">'), e.push('<td class="item-name">' + p.encodeHTML(a) + "</td>"), e.push('<td class="item-count">'), e.push('<input type="hidden" name="fid" value="' + i.itemId + '" />'), e.push('<span class="item-minus" value="" type="button"></span>'), e.push('<input class="item-count" type="input" name="foodNumber" value="' + i.itemCount + '" />'), e.push('<span class="item-plus" value="" type="button"></span>'), e.push("</td>"), e.push('<td class="item-price">&#165;' + i.itemPrice + "</td>"), e.push('<td class="item-delete"><span class="item-delete-icon">×</span></td>'), e.push("</tr>");
					var s = $(e.join("")), n = $(".cart-panel .item-list"), c = n.find(".normal-item");
					c.length ? c.last().after(s) : n.append(s), s.show()
				}
			})
		}, updateItem: function (t) {
			$("#cartItem_" + t.itemId).find(".item-count").val(t.itemCount)
		}, delItem: function (t) {
			$("#cartItem_" + t.itemId).remove()
		}, clearCart: function () {
			d()
		}, setAmount: function (t) {
			return t.isEmpty ? void $(".cart-bar").removeClass("pointer") : ($(".cart-bar").addClass("pointer"), void(t.cha > 0 ? ($("#cartCha").show().html("差&nbsp;&#165;" + t.cha + "起送"), $("#cartSubmit").hide()) : ($("#cartCha").hide(), $("#cartSubmit").show())))
		}, setLocalPrice: function (t) {
			this.resetPremium(), $("#cartAmout").html("共&nbsp;&#165;" + t + " 元")
		}, setItemStockStatus: function (t) {
			var i = this;
			$.isArray(t) || (t = [t]), $.each(t, function (t, e) {
				e.itemDishType || (parseInt(e.itemCount) >= parseInt(e.itemStock) ? i.addItemStockTight(e) : i.removeItemStockTight(e))
			})
		}, addItemStockTight: function (t) {
			$.isArray(t) || (t = [t]), $.each(t, function (t, i) {
				$("#cartItem_" + i.itemId).not(".notify").find("td.item-count").append("<span class='item-notify'>库存" + i.itemCount + "份</span>"), $("#cartItem_" + i.itemId).addClass("notify"), $("#cartItem_" + i.itemId).find(".item-plus").attr("disabled", "disabled")
			})
		}, setFeatureStockTight: function (t) {
			$("[data-stockId=" + t.sid + "]").not(".notify").find("td.item-count").append("<span class='item-notify'>库存" + t.num + "份</span>"), $("[data-stockId=" + t.sid + "]").addClass("notify"), $("[data-stockId=" + t.sid + "]").find(".item-plus").attr("disabled", "disabled")
		}, setFeatureStockNormal: function (t) {
			$("[data-stockId=" + t + "]").removeClass("notify"), $("[data-stockId=" + t + "]").find(".item-notify").remove(), $("[data-stockId=" + t + "]").find(".item-plus").removeAttr("disabled")
		}, removeItemStockTight: function (t) {
			$.isArray(t) || (t = [t]), $.each(t, function (t, i) {
				$("#cartItem_" + i.itemId).removeClass("notify"), $("#cartItem_" + i.itemId).find(".item-notify").remove(), $("#cartItem_" + i.itemId).find(".item-plus").removeAttr("disabled")
			})
		}, addBoxPrice: function (t, i) {
			i = i || "餐盒费";
			var e = t.prices.box_price, a = t.prices.orig_send_price || 0, s = [];
			parseFloat(e) && (s.push('<tr class="item box-price">'), s.push('<td class="item-name">' + i + "</td>"), s.push('<td class="item-count"></td>'), s.push('<td class="item-price">&#165;' + parseFloat(e).toFixed(2) + "</td>"), s.push('<td class="item-delete"></td>'), s.push("</tr>")), s.push('<tr class="item send-price">'), s.push('<td class="item-name" colspan="2">配送费(不计入起送价)</td>'), s.push('<td class="item-price">&#165;' + a + "</td>"), s.push('<td class="item-delete"></td>'), s.push("</tr>"), this.resetBoxPrice(s.join(""))
		}, resetBoxPrice: function (t) {
			var i = $(".cart-panel .item-list"), e = i.find(".normal-item"), a = i.find(".box-price");
			sendP = i.find(".send-price"), a.remove(), sendP.remove(), e.length ? e.last().after(t) : i.append(t)
		}, addPremium: function (t) {
			var i = t.prices, e = t.discounts.discount_list, a = [];
			for (var s in e) {
				var n = e[s].type, c = e[s].desc, o = (e[s].amount, e[s].discount);
				(e[s].is_show_desc || e[s].is_show_amount || e[s].is_show_discount) && (a.push('<tr class="premium-item item ' + n + '">'), a.push(e[s].is_show_desc ? '<td colspan="2" class="item-name">' + c + ' <span class="' + n + '-min-icon premium-icon"><img src="https://static.waimai.baidu.com/static/forpc/' + n + '_s.png" /></span></td>' : '<td colspan="2" class="item-name"></td>'), a.push(e[s].is_show_discount ? '<td class="item-price">- &#165;' + parseFloat(o).toFixed(2) + "</td>" : '<td class="item-price"></td>'), a.push('<td class="item-delete"></td>'), a.push("</tr>"))
			}
			var r = parseFloat(i.total_price, 10), d = parseFloat(i.total_order_price, 10);
			r = 0 > r ? 0 : r, d != r ? $("#cartAmout").addClass("lh-normal").html('<span class="premium-price">共&nbsp;&#165;' + r.toFixed(2) + ' 元</span><br /><span class="premium-origin">原价&nbsp;<del>&#165;' + d.toFixed(2) + "</del> 元</span>") : $("#cartAmout").removeClass("lh-normal").html("共&nbsp;&#165;" + r.toFixed(2) + " 元");
			var m = $(a.join(""));
			this.resetPremium();
			var l = $(".cart-panel .item-list"), u = l.find(".normal-item");
			u.length ? u.last().after(m) : l.append(m)
		}, resetPremium: function () {
			$(".cart-panel .premium-item").remove()
		}
	}
});
;
/*!waimai:widget/common/menucommon/cert/cert.js*/
define("waimai:widget/common/menucommon/cert/cert", function (require, exports, module) {
	var noresult = require("waimai:widget/common/ui/noresult/noresult"),
		popCarousel = require("waimai:widget/common/ui/popCarousel/popCarousel"),
		GlobalTips = require("waimai:static/utils/GlobalTips"), Dialog = require("jsmod/ui/dialog"),
		dialogTpl = [function (_template_object) {
			var _template_fun_array = [], fn = function (__data__) {
				var _template_varName = "";
				for (var name in __data__) _template_varName += "var " + name + '=__data__["' + name + '"];';
				eval(_template_varName), _template_fun_array.push('<div class="jubao-detail">    <div class="jb-title">        <button class="closeBtn">╳</button>        举报商户资质    </div>    <form class="jb-form">        <input type="hidden" name="fid" value="', "undefined" == typeof shopId ? "" : baidu.template._encodeHTML(shopId), '"/>        <table class="jb-table">            <tr>                <td width="80" align="right"><span class="red-text">*</span>举报类型：</td>                <td>                    <p><label><input name="zizhi" type="checkbox" value="商家从业资质照片"> 商家从业资质照片</label></p>                    <p class="jb-type"><label><input name="zizhi" type="checkbox" value="商家实景照片"> 商家实景照片</label></p>                </td>            </tr>            <tr>                <td align="right"><span class="red-text">*</span>信息描述：</td>                <td>                    <textarea name="message" rows="3" placeholder="您的举报很重要！商户资质证照有问题？商户实景图与实际不符？"></textarea>                </td>            </tr>            <tr>                <td align="right">联系电话：</td>                <td>                    <input name="telphone" type="text" placeholder="请输入手机号">                    <p class="tip-text">如果方便，请留下您的联系方式，我们将严格保密</p>                </td>            </tr>            <tr>                <td></td>                <td>                    <span class="submit-btn" data-node="submit">提交</span>                </td>            </tr>        </table>    </form></div>'), _template_varName = null
			}(_template_object);
			return fn = null, _template_fun_array.join("")
		}][0], POST_AJAX = "/shopui/shopcomplain",
		xiamenAptitudeImage = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMkAAAAYCAYAAABQpNmPAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4JpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpCMTc1MUI2OTdFMjA2ODExODIyQUU3NTZERTExMkJBMyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDowOEJGQkI4MzkyQzIxMUU2OTJDNEU5RTM0NzZERjIwRiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDowOEJGQkI4MjkyQzIxMUU2OTJDNEU5RTM0NzZERjIwRiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxNSAoTWFjaW50b3NoKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjRjODgyNWQ2LWU2ZjItNDA2MS1iMWUzLWQ3ZGM5YmFmM2ZhNyIgc3RSZWY6ZG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmUwYWE1N2E3LWRiMGQtMTE3OS05YjhiLWQ0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",
		popDialog, cert = function () {
		};
	cert.prototype.init = function (e, t, a) {
		this.$el = $("#cert-list"), this.isLogin = 2 == e ? 0 : 1, this.shopId = t, this.initContent(), this.initAptitude(a)
	}, cert.prototype.initContent = function () {
		this.bindEvent()
	}, cert.prototype.initAptitude = function (wdata) {
		if ("131" === wdata.city_id) {
			var $certShopSafetyInfoContainer = $(".cert-shop-safety-info-container");
			if ($certShopSafetyInfoContainer.attr("class")) {
				var beijingAptitudeTpl = [function (_template_object) {
					var _template_fun_array = [], fn = function (__data__) {
						var _template_varName = "";
						for (var name in __data__) _template_varName += "var " + name + '=__data__["' + name + '"];';
						eval(_template_varName), _template_fun_array.push('<div class="cert-shop-safety-info clearfix">    <div class="check_result">        ');
						var aptitudeImgClass = "beijingAptitude" + level;
						_template_fun_array.push("        ");
						var placeLevel = "";
						_template_fun_array.push("        ");
						var manageLevel = "";
						switch (_template_fun_array.push("        "), level.substring(0, 1)) {
							case"A":
								placeLevel = "优秀";
								break;
							case"B":
								placeLevel = "良好";
								break;
							case"C":
								placeLevel = "一般"
						}
						switch (_template_fun_array.push("        "), level.substring(1, 2)) {
							case"1":
								manageLevel = "一般";
								break;
							case"2":
								manageLevel = "良好";
								break;
							case"3":
								manageLevel = "优秀"
						}
						_template_fun_array.push('        <div class="', "undefined" == typeof aptitudeImgClass ? "" : baidu.template._encodeHTML(aptitudeImgClass), ' beijingAptitudeImg"> </div>    </div>    <div class="info-content">        <div class="info-content-title">监督检查结果：        </div>        <div class="info-content-item">        场所等级&nbsp:&nbsp        <span  style="color: red">            ', "undefined" == typeof placeLevel ? "" : baidu.template._encodeHTML(placeLevel), '        </span>        &nbsp&nbsp&nbsp&nbsp        管理等级&nbsp:&nbsp        <span  style="color: red">            ', "undefined" == typeof manageLevel ? "" : baidu.template._encodeHTML(manageLevel), "        </span>        </div>        "), last_evaluation_date && (_template_fun_array.push("            "), last_evaluation_date = last_evaluation_date.replace(/\//g, "-"), _template_fun_array.push('            <div class="info-content-item">检查日期：', "undefined" == typeof last_evaluation_date ? "" : baidu.template._encodeHTML(last_evaluation_date), "</div>        ")), _template_fun_array.push("        "), license_id && _template_fun_array.push('            <div class="info-content-item">许可证号：', "undefined" == typeof license_id ? "" : baidu.template._encodeHTML(license_id), "</div>        "), _template_fun_array.push("        "), shop_name && _template_fun_array.push('            <div class="info-content-item">食品经营者名称：', "undefined" == typeof shop_name ? "" : baidu.template._encodeHTML(shop_name), "</div>        "), _template_fun_array.push("        "), shop_addr && _template_fun_array.push('            <div class="info-content-item">经营场所：', "undefined" == typeof shop_addr ? "" : baidu.template._encodeHTML(shop_addr), "</div>        "), _template_fun_array.push("        "), remark && _template_fun_array.push('            <div class="info-content-item">经营范围：', "undefined" == typeof type ? "" : baidu.template._encodeHTML(type), "；", "undefined" == typeof remark ? "" : baidu.template._encodeHTML(remark), "</div>        "), _template_fun_array.push("        "), validity_term && _template_fun_array.push('            <div class="info-content-item">许可证有效期：', "undefined" == typeof validity_term ? "" : baidu.template._encodeHTML(validity_term), "</div>        "), _template_fun_array.push("        "), owner_name && _template_fun_array.push('            <hr style="border: 1px dashed silver;margin-bottom: 20px;"  />            <div class="info-content-item">负责人：', "undefined" == typeof owner_name ? "" : baidu.template._encodeHTML(owner_name), "</div>        "), _template_fun_array.push('        <div class="hide">            <hr style="border: 1px dashed silver;margin-bottom: 20px;"  />            <div class="info-content-item">数据来源：北京市食品药品监督管理局 &nbsp&nbsp&nbsp&nbsp 举报投诉电话: 010-12331</div>        </div>    </div></div>'), _template_varName = null
					}(_template_object);
					return fn = null, _template_fun_array.join("")
				}][0], bjAptitudeFromBTpl = [function (_template_object) {
					var _template_fun_array = [], fn = function (__data__) {
						var _template_varName = "";
						for (var name in __data__) _template_varName += "var " + name + '=__data__["' + name + '"];';
						eval(_template_varName), _template_fun_array.push('<div class="cert-shop-safety-info clearfix">    <div class="info-content">        <div class="info-content-item">许可证号：', "undefined" == typeof license_number ? "" : baidu.template._encodeHTML(license_number), '</div>        <div class="info-content-item">食品经营者名称：', "undefined" == typeof license_name ? "" : baidu.template._encodeHTML(license_name), '</div>        <div class="info-content-item">经营场所：', "undefined" == typeof business_place ? "" : baidu.template._encodeHTML(business_place), '</div>        <div class="info-content-item">许可证有效期：', "undefined" == typeof license_validdate ? "" : baidu.template._encodeHTML(license_validdate), '</div>        <div class="hide">            <hr style="border: 1px dashed silver;margin-bottom: 20px;"  />            <div class="info-content-item">数据来源：北京市食品药品监督管理局 &nbsp&nbsp&nbsp&nbsp 举报投诉电话: 010-12331</div>        </div>    </div></div>'), _template_varName = null
					}(_template_object);
					return fn = null, _template_fun_array.join("")
				}][0];
				wdata.shop_safety_info ? $certShopSafetyInfoContainer.append(beijingAptitudeTpl(wdata.shop_safety_info)) : wdata.aptitude && $certShopSafetyInfoContainer.append(bjAptitudeFromBTpl(wdata.aptitude))
			}
		}
		if ("194" === wdata.city_id) {
			wdata.shop_safety_info.xiamenAptitudeImage = xiamenAptitudeImage;
			var $certShopSafetyInfoContainer = $(".cert-shop-safety-info-container");
			if ($certShopSafetyInfoContainer.length > 0) {
				var xiamenAptitudeTpl = [function (_template_object) {
					var _template_fun_array = [], fn = function (__data__) {
						var _template_varName = "";
						for (var name in __data__) _template_varName += "var " + name + '=__data__["' + name + '"];';
						eval(_template_varName), _template_fun_array.push('<div class="cert-shop-safety-info clearfix">    <div class="check_result">        ');
						var aptitudeImgClass = "xiamenAptitude" + level;
						_template_fun_array.push("        ");
						var placeLevel = "";
						switch (_template_fun_array.push("        "), level) {
							case 3:
								placeLevel = "优秀";
								break;
							case 2:
								placeLevel = "良好";
								break;
							case 1:
								placeLevel = "一般"
						}
						_template_fun_array.push('        <div class="', "undefined" == typeof aptitudeImgClass ? "" : baidu.template._encodeHTML(aptitudeImgClass), ' xiamenAptitudeImg"> </div>    </div>    <div class="total-info-content">        <div class="first-info-content">            <div class="info-content-title">食品安全动态评定结果：<span  style="color: red">', "undefined" == typeof placeLevel ? "" : baidu.template._encodeHTML(placeLevel), "</span></div>            "), license_number && _template_fun_array.push('                <div class="info-content-item">许可证号：', "undefined" == typeof license_number ? "" : baidu.template._encodeHTML(license_number), "</div>            "), _template_fun_array.push("            "), shop_name && _template_fun_array.push('                <div class="info-content-item">食品经营者名称：', "undefined" == typeof shop_name ? "" : baidu.template._encodeHTML(shop_name), "</div>            "), _template_fun_array.push("            "), shop_addr && _template_fun_array.push('                <div class="info-content-item">经营场所：', "undefined" == typeof shop_addr ? "" : baidu.template._encodeHTML(shop_addr), "</div>            "), _template_fun_array.push("            "), type && _template_fun_array.push('                <div class="info-content-item">经营范围：', "undefined" == typeof type ? "" : baidu.template._encodeHTML(type), "</div>            "), _template_fun_array.push("            "), subject_form && _template_fun_array.push('                <div class="info-content-item">主体业态：', "undefined" == typeof subject_form ? "" : baidu.template._encodeHTML(subject_form), "</div>            "), _template_fun_array.push("            "), validity_term_start && validity_term && _template_fun_array.push('                <div class="info-content-item">许可证有效期：', "undefined" == typeof validity_term_start ? "" : baidu.template._encodeHTML(validity_term_start), " ~ ", "undefined" == typeof validity_term ? "" : baidu.template._encodeHTML(validity_term), "</div>            "), _template_fun_array.push("            "), supervision && _template_fun_array.push('                <div class="info-content-item">属地监管所：', "undefined" == typeof supervision ? "" : baidu.template._encodeHTML(supervision), "</div>            "), _template_fun_array.push('        </div>        <div class="second-info-content">            '), license_id && _template_fun_array.push('                <div class="info-content-item">社会信用代码或注册号：', "undefined" == typeof license_id ? "" : baidu.template._encodeHTML(license_id), "</div>            "), _template_fun_array.push("            "), owner_name && _template_fun_array.push('                <div class="info-content-item">负责人：', "undefined" == typeof owner_name ? "" : baidu.template._encodeHTML(owner_name), "</div>            "), _template_fun_array.push('        </div>        <div class="third-info-content">            <div class="info-content-item">数据来源：<a href="http://www.xmscjg.gov.cn/" target="_blank"><img class="certImage" src="', "undefined" == typeof xiamenAptitudeImage ? "" : baidu.template._encodeHTML(xiamenAptitudeImage), '" style="padding-right: 8px"></a>举报投诉电话：0592-12331</div>        </div>    </div></div>'), _template_varName = null
					}(_template_object);
					return fn = null, _template_fun_array.join("")
				}][0];
				$certShopSafetyInfoContainer.append(xiamenAptitudeTpl(wdata.shop_safety_info))
			}
		}
		"233" === wdata.city_id && $(".btm-section").append("。如有食品安全问题，请向西安市食品药监局投诉，举报电话 ：029-12331")
	}, cert.prototype.renderNull = function () {
		noresult.show("此商户暂无认证信息", this.$commCon)
	}, cert.prototype.checkForm = function (e) {
		for (var t = ["zizhi", "message"], a = {
			zizhi: "请选择举报类型~",
			message: "请填写信息描述~"
		}, n = e.find("form"), i = n.serialize(), p = !0, o = 0, d = t.length; d > o; o++) {
			if (-1 == i.indexOf(t[o])) return p = !1, void GlobalTips.tip(a[t[o]]);
			n.find("[name=" + t[o] + "]").val() || (p = !1, GlobalTips.tip(a[t[o]]))
		}
		return p
	}, cert.prototype.submitDialog = function (e) {
		for (var t = e.find("form"), a = t.serializeArray(), n = {}, i = 0, p = a.length; p > i; i++) n[a[i].name] = n[a[i].name] ? n[a[i].name] + "," + a[i].value : a[i].value;
		$.ajax({
			url: POST_AJAX, type: "post", dataType: "json", data: n, success: function (e) {
				0 == e.error_no ? (GlobalTips.tip("举报成功，谢谢您的举报！"), popDialog.hide()) : GlobalTips.tip(e.error_msg || "网络错误")
			}
		})
	}, cert.prototype.bindEvent = function () {
		var e = this;
		$('[data-node="imgList"]').on("click", function (e) {
			var t, a, n = [];
			"img" === e.target.tagName.toLowerCase() && (t = $(e.target).data("index"), a = $(e.target).parents('[data-node="imgList"]'), n = a.find("img").map(function () {
				return {src: $(this).attr("src"), rsrc: $(this).attr("data-real-src")}
			}), new popCarousel({data: n, index: t}))
		}), e.$el.find('[data-node="jubao"]').on("click", function () {
			if (e.isLogin) {
				var t = dialogTpl({shopId: e.shopId});
				popDialog = new Dialog({html: t}), popDialog.show();
				var a = popDialog.getElement();
				a.on("click", "[data-node=submit]", function () {
					e.checkForm(a) && e.submitDialog(a)
				})
			} else require.async(["waimai:widget/common/userinfo/UserMgr"], function (e) {
				e.login({url: window.location.href})
			})
		})
	}, exports = module.exports = new cert
});
;
/*!waimai:widget/common/menucommon/collect/collect.js*/
define("waimai:widget/common/menucommon/collect/collect", function (t, o, i) {
	var n = "/waimai/user/favorite/add?display=json", a = "/waimai/user/favorite/del?display=json",
		e = t("waimai:static/utils/GlobalTips"), c = function () {
		};
	c.prototype.init = function (t, o) {
		this.$el = $("#widget-menu-collect"), this.shopId = t, this.favLabel = o, this.$colBtn = this.$el.find('[data-node="collectBtn"]'), this.$colTxt = this.$el.find('[data-node="collectTxt"]'), this.bindEvent()
	}, c.prototype.bindEvent = function () {
		var o = this;
		$("[data-node=loginImmediate]").on("click", function () {
			window.location = "https://passport.baidu.com/v2/?login&u=" + window.location.href
		}), this.$el.on("click", '[data-node="collectBtn"]', function (i) {
			var c = $(this).attr("from");
			addNStat({da_trd: "waimai", da_src: "pageMarketBk.collection" + c, da_act: "click"});
			var s = $(i.currentTarget);
			if (2 == o.favLabel) t.async(["waimai:widget/common/userinfo/UserMgr"], function (t) {
				t.login({url: window.location.href})
			}); else {
				var l = $("#bdstoken").val();
				$.ajax(s.hasClass("select") ? {
					url: a,
					dataType: "json",
					data: {shop_id: o.shopId, bdstoken: l},
					success: function (t) {
						0 == t.error_no ? (o.$colBtn.removeClass("select"), o.$colTxt.html("收藏商户"), e.tip("取消收藏成功")) : e.tip("取消收藏失败")
					},
					error: function () {
						e.tip("取消收藏失败")
					}
				} : {
					url: n, dataType: "json", data: {shop_id: o.shopId, bdstoken: l}, success: function (i) {
						0 == i.error_no ? (o.$colBtn.addClass("select"), o.$colTxt.html("已收藏"), e.tip("收藏成功")) : 1102 == i.error_no ? t.async(["waimai:widget/common/userinfo/UserMgr"], function (t) {
							t.login({url: window.location.href})
						}) : e.tip("收藏失败")
					}, error: function () {
						e.tip("收藏失败")
					}
				})
			}
		})
	}, o = i.exports = new c
});
;
/*!waimai:widget/common/menucommon/comment/comment.js*/
define("waimai:widget/common/menucommon/comment/comment", function (require, exports, module) {
	var COMMENT_AJAX = "/waimai/comment/getshop?display=json", util = require("wcommon:static/util"),
		commTpl = [function (_template_object) {
			var _template_fun_array = [], fn = function (__data__) {
				var _template_varName = "";
				for (var name in __data__) _template_varName += "var " + name + '=__data__["' + name + '"];';
				eval(_template_varName), _template_fun_array.push("");
				for (var i = fromIdx, len = Math.min(fromIdx + 20, commentCon.length); len > i; i++) {
					var item = commentCon[i];
					if (_template_fun_array.push('    <div class="list clearfix">        <div class="top-section">                <span class="user-name">', "undefined" == typeof item.pass_name ? "" : baidu.template._encodeHTML(item.pass_name), '</span>                <span class="rate">                    <span class="rate-inner" style="width:', "undefined" == typeof(14.4 * item.score) ? "" : baidu.template._encodeHTML(14.4 * item.score), 'px"></span>                </span>                ', "undefined" == typeof item.score ? "" : baidu.template._encodeHTML(item.score), '分                <span class="delivery-time">                    送餐时间：', "undefined" == typeof item.cost_time ? "" : baidu.template._encodeHTML(item.cost_time), '分钟                </span>                <span class="fr">', "undefined" == typeof item.create_time ? "" : baidu.template._encodeHTML(item.create_time), '</span>        </div>        <div class="mid-section">            <p>', "undefined" == typeof item.content ? "" : baidu.template._encodeHTML(item.content), "</p>        </div>        "), item.recommend_dishes && item.recommend_dishes.length) {
						_template_fun_array.push('            <div class="btm-section">                推荐商品：                ');
						for (var j = 0, lenDish = item.recommend_dishes.length; lenDish > j; j++) _template_fun_array.push('                <span class="rec-dish">', "undefined" == typeof item.recommend_dishes[j] ? "" : baidu.template._encodeHTML(item.recommend_dishes[j]), "</span>                ");
						_template_fun_array.push("            </div>        ")
					}
					_template_fun_array.push("    </div>")
				}
				_template_fun_array.push(""), _template_varName = null
			}(_template_object);
			return fn = null, _template_fun_array.join("")
		}][0], Pagination = require("jsmod/ui/pagination"),
		noresult = require("waimai:widget/common/ui/noresult/noresult"), comment = function () {
		};
	comment.prototype.init = function (t) {
		this.data = t || {}, this.$el = $("#comment-list"), this.$commCon = this.$el.find("[data-node=commCon]"), this.$moreCom = this.$el.find("[data-node=moreCom]"), this.$pagination = this.$el.find("[data-node=pagination]"), this.initContent(), this.initPagination()
	}, comment.prototype.initOpt = function () {
		return {page: 1, count: 60, currIndex: 0}
	}, comment.prototype.initContent = function () {
		return this.data.content && this.data.content.length ? (this.opt = this.initOpt(), this.$commCon.html(commTpl({
			commentCon: this.data.content,
			fromIdx: 0
		})), this.opt.currIndex += 20, void this.bindEvent()) : void this.renderNull()
	}, comment.prototype.renderContent = function () {
		0 == this.opt.currIndex ? ($("body").scrollTop(0), this.$commCon.html(commTpl({
			commentCon: this.data.content,
			fromIdx: this.opt.currIndex
		}))) : this.$commCon.append(commTpl({
			commentCon: this.data.content,
			fromIdx: this.opt.currIndex
		})), this.opt.currIndex += 20
	}, comment.prototype.renderNull = function () {
		noresult.show("此商户暂无评论数据", this.$commCon)
	}, comment.prototype.initPagination = function () {
		var t = parseInt(this.data.comment_num, 10), e = this, n = this.opt.count, o = Math.ceil(t / n);
		this.pagin || o >= 2 && (this.pagin = new Pagination(this.$pagination[0], {
			pageCount: Math.ceil(t / n),
			maxShowPage: 10,
			preventInitEvent: !0,
			textLabel: ["", "&nbsp;", "&nbsp;", ""]
		}), $(this.pagin).on("page", function (t, n) {
			e.loadNew(n.page + 1)
		}))
	}, comment.prototype.loadNew = function (t) {
		var e = this.opt.count, n = this;
		$.ajax({
			url: COMMENT_AJAX,
			dataType: "json",
			data: {shop_id: n.data.release_id, page: t || 0, count: e},
			success: function (t) {
				0 == t.error_no ? (n.data.content = t.result.content, n.opt.currIndex = 0, n.renderContent()) : GlobalTips.topTip(t.error_msg, !0)
			},
			error: function () {
				GlobalTips.topTip("网络错误！", !0)
			}
		})
	}, comment.prototype.bindEvent = function () {
		var t = this;
		$(window).on("scroll", function () {
			setTimeout(function () {
				var e = $("body").height(), n = $(window).height();
				$(window).scrollTop() + n >= e - 300 && t.opt.currIndex < t.data.content.length && t.renderContent(), t.opt.currIndex >= t.data.content.length - 1 && t.$pagination.show()
			}, 500)
		})
	}, exports = module.exports = new comment
});
;
/*!waimai:widget/common/menucommon/fill_diff/fill_diff.js*/
define("waimai:widget/common/menucommon/fill_diff/fill_diff", function (require, exports, module) {
	function bear_to_left() {
		var t = 1 * cartDC.getAmount().productAmount, e = 1 * cartDC.getAmount().packFee,
			i = 1 * cartDC.getAmount().takeOutPrice, a = (t + e) / i, d = 0;
		$(".menu-cart").hasClass("cart-hide") && ($(".menu-cart").find(".pointer").trigger("click"), d = 200), setTimeout(function () {
			a >= N && 1 > a && (0 != settime_picker && (clearTimeout(settime_picker), settime_picker = 0), $fill_diff_table.css("display", "inline-block"), $fill_diff_bear.css("background-image", "url(" + bear_right_img + ")"), $fill_diff_bear.attr("status", "right"), $fill_diff.css("left", fill_diff_left - 225 + "px"))
		}, d)
	}

	function bear_to_right() {
		var t = 1 * cartDC.getAmount().productAmount, e = 1 * cartDC.getAmount().packFee,
			i = 1 * cartDC.getAmount().takeOutPrice, a = (t + e) / i;
		$fill_diff_bear.css("background-image", "url(" + bear_left_img + ")"), $fill_diff_bear.attr("status", "left"), $fill_diff.css("left", fill_diff_left + "px"), 0 == t ? ($fill_diff_table.css("display", "none"), $fill_diff.css("display", "none")) : settime_picker = setTimeout(function () {
			if ($fill_diff_table.css("display", "none"), N > a || a > 1) $fill_diff.css("display", "none"); else {
				var t = cartDC.getAmount(), e = cartDC.fetchItems();
				$.ajax({
					type: "POST",
					dataType: "json",
					url: "/shopui?qt=supplementary",
					data: {priceDifference: t.cha, wid: e.shop_id, products: e.products},
					success: function (t) {
						0 == t.error_no && 0 != t.result.length ? ($fill_diff_table.html(fill_diff_table_data({data: t.result})), new Tip({
							targets: ".fill_diff_name",
							className: "fill_diff_name_hover",
							trigger: "hover",
							targetType: "top",
							offset: {top: 0, left: 0}
						})) : $fill_diff.css("display", "none")
					}
				})
			}
		}, 1e3)
	}

	function moveToCart(t, e) {
		var i = t.find(e), a = 1 * i.attr("haveAttr"), d = i.attr("itemid"), f = "[data-sid=item_" + d + "]";
		if ($(".list-item").filter(f).find(".addtocart").eq(0).trigger("click", !0), 1 == a) {
			var l = i.attr("attrid"), n = d + "_" + l, r = "[data-id=" + n + "]", c = $(".s-item").filter(r).eq(0);
			c.siblings().removeClass("sec"), c.addClass("sec"), c.closest(".list-item").find(".submit-btn").eq(0).trigger("click", !0), setTimeout(function () {
				$(".list-item").filter(f).find(".list-item-overlay").css("display", "none")
			}, 100)
		}
	}

	function bindEvent() {
		$("body").delegate(".addAnim_fill_diff", "click", function (t) {
			t.stopPropagation()
		}), $fill_diff_bear.on("click", function (t) {
			var e = $fill_diff_bear.attr("status");
			"left" == e ? (addNStat({
				da_trd: "waimai",
				da_src: "bearBk",
				da_act: "click"
			}), bear_to_left()) : "right" == e && bear_to_right(), t.stopPropagation()
		}), $fill_diff.on("click", function (t) {
			t.stopPropagation()
		}), $("body").on("click", function () {
			var t = $fill_diff_bear.attr("status");
			"right" == t && bear_to_right()
		}), $window.on("resize", function () {
			var t = (document.body.offsetWidth - 980) / 2 + 130;
			$(".imageText").css("left", t), $(".cart-panel").css("max-height", .6 * $(window).height());
			var e = $fill_diff_bear.attr("status");
			cart_offset = 1 * $cart.offset().left, fill_diff_left = cart_offset - 86, "left" == e ? $fill_diff.css("left", fill_diff_left + "px") : "right" == e && $fill_diff.css("left", fill_diff_left - 225 + "px")
		}), $fill_diff.delegate(".fill_diff_add span", "click", function () {
			addNStat({
				da_trd: "waimai",
				da_src: "addToCartBk",
				da_act: "click"
			}), $("#cartSubmit").addClass("fillDiffClick");
			var t = 1 * $(this).parent().attr("item"), e = $(".cart-section .cart-bar").offset(),
				i = $(this).parent().parent();
			1 == t ? moveToCart(i, ".fill_diff_item") : 2 == t && (moveToCart(i, ".fill_diff_item_1"), moveToCart(i, ".fill_diff_item_2")), AddToCartAnim.addAnim_fill_diff($(this).parent().parent(), e)
		})
	}

	var util = require("wcommon:static/util"), exports, settime_picker = 0, $window = $(window),
		$fill_diff = $("#fill_diff-section"), $cart = $("#cart-section"), $menu_cart = $(".menu-cart"),
		$fill_diff_bear = $("#fill_diff_bear"), $fill_diff_table = $("#fill_diff_table"),
		$fill_diff_add = $(".fill_diff_add").find("span"), cart_offset = 1 * $cart.offset().left,
		fill_diff_left = cart_offset - 87,
		bear_right_img = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAABFCAYAAADdCmGFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2OEZGNjcxODI1MjA2ODExODIyQUZEMEI4M0VCMkI5QSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBMzg4RjI0NDhGMjQxMUU0QjRGMENBNzg1MjU2Mjg2QSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBMzg4RjI0MzhGMjQxMUU0QjRGMENBNzg1MjU2Mjg2QSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6Rjc3RjExNzQwNzIwNjgxMThDMTRENzRGMUY5M0Q3QkMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NjhGRjY3MTgyNTIwNjgxMTgyMkFGRDBCODNFQjJCOUEiLz4gPC9yZGY6RGVzY3Jp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",
		bear_left_img = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAABFCAYAAADdCmGFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo2OEZGNjcxODI1MjA2ODExODIyQUZEMEI4M0VCMkI5QSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpCN0ZEMUNENThGMTQxMUU0QjRGMENBNzg1MjU2Mjg2QSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCN0ZEMUNENDhGMTQxMUU0QjRGMENBNzg1MjU2Mjg2QSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6Rjc3RjExNzQwNzIwNjgxMThDMTRENzRGMUY5M0Q3QkMiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NjhGRjY3MTgyNTIwNjgxMTgyMkFGRDBCODNFQjJCOUEiLz4gPC9yZGY6RGVzY3Jp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",
		AddToCartAnim = require("waimai:widget/common/menucommon/cart/AddToCartAnim"),
		cartDC = require("waimai:static/utils/CartDataCenter"), Tip = require("jsmod/ui/fixElement/tip"), N = .6,
		fill_diff_table_data = [function (_template_object) {
			var _template_fun_array = [], fn = function (__data__) {
				var _template_varName = "";
				for (var name in __data__) _template_varName += "var " + name + '=__data__["' + name + '"];';
				eval(_template_varName), _template_fun_array.push("<table>    ");
				for (var i = 0; i < data.length; i++) _template_fun_array.push("    "), 1 == data[i].length ? _template_fun_array.push('    <tr>        <td class="fill_diff_name" data-content="', "undefined" == typeof data[i][0].name ? "" : baidu.template._encodeHTML(data[i][0].name), '">            <span class="fill_diff_item" haveAttr="', "undefined" == typeof data[i][0].have_attr ? "" : baidu.template._encodeHTML(data[i][0].have_attr), '" itemid="', "undefined" == typeof data[i][0].id ? "" : baidu.template._encodeHTML(data[i][0].id), '" attrid="', "undefined" == typeof data[i][0].attr_id ? "" : baidu.template._encodeHTML(data[i][0].attr_id), '">', "undefined" == typeof data[i][0].name ? "" : baidu.template._encodeHTML(data[i][0].name), '</span>        </td>        <td class="fill_diff_price">            <span>¥', "undefined" == typeof data[i][0].current_price.toFixed(1) ? "" : baidu.template._encodeHTML(data[i][0].current_price.toFixed(1)), '</span>        </td>        <td class="fill_diff_add" item="1">            <span></span>        </td>    </tr>        ') : 2 == data[i].length && _template_fun_array.push('    <tr>        <td class="fill_diff_name" data-content="', "undefined" == typeof data[i][0].name ? "" : baidu.template._encodeHTML(data[i][0].name), "+", "undefined" == typeof data[i][1].name ? "" : baidu.template._encodeHTML(data[i][1].name), '">            <span class="fill_diff_item_1" haveAttr="', "undefined" == typeof data[i][0].have_attr ? "" : baidu.template._encodeHTML(data[i][0].have_attr), '" itemid="', "undefined" == typeof data[i][0].id ? "" : baidu.template._encodeHTML(data[i][0].id), '" attrid="', "undefined" == typeof data[i][0].attr_id ? "" : baidu.template._encodeHTML(data[i][0].attr_id), '">', "undefined" == typeof data[i][0].name ? "" : baidu.template._encodeHTML(data[i][0].name), '</span>            <span class="fill_diff_item_plus">+</span>            <span class="fill_diff_item_2" haveAttr="', "undefined" == typeof data[i][1].have_attr ? "" : baidu.template._encodeHTML(data[i][1].have_attr), '" itemid="', "undefined" == typeof data[i][1].id ? "" : baidu.template._encodeHTML(data[i][1].id), '" attrid="', "undefined" == typeof data[i][1].attr_id ? "" : baidu.template._encodeHTML(data[i][1].attr_id), '">', "undefined" == typeof data[i][1].name ? "" : baidu.template._encodeHTML(data[i][1].name), '</span>        </td>        <td class="fill_diff_price">            <span>¥', "undefined" == typeof(1 * data[i][0].current_price + 1 * data[i][1].current_price).toFixed(1) ? "" : baidu.template._encodeHTML((1 * data[i][0].current_price + 1 * data[i][1].current_price).toFixed(1)), '</span>        </td>        <td class="fill_diff_add" item="2">            <span></span>        </td>    </tr>    '), _template_fun_array.push("    ");
				_template_fun_array.push("</table>"), _template_varName = null
			}(_template_object);
			return fn = null, _template_fun_array.join("")
		}][0];
	exports = module.exports = {
		init: function () {
			$fill_diff.css("left", fill_diff_left + "px"), bindEvent()
		}
	}
});
;
/*!waimai:widget/common/menucommon/map/map.js*/
define("waimai:widget/common/menucommon/map/map", function (a, n) {
	function o() {
		var a = {};
		a.lng = decodeURIComponent(C.getRaw(M.COOKIE_LNG_KEY)), a.lat = decodeURIComponent(C.getRaw(M.COOKIE_LAT_KEY)), a.address = decodeURIComponent(C.getRaw(M.COOKIE_ADDR_KEY)), w = a
	}

	function e(a, n) {
		if (a) {
			if ("mypos" == n) var o = new BMap.Icon(_, new BMap.Size(32, 32)); else var o = new BMap.Icon(f, new BMap.Size(26, 26));
			var e = new BMap.Marker(a, {icon: o});
			u.addOverlay(e), h.push(a)
		}
	}

	function t() {
		h.length > 1 && u.setViewport(h)
	}

	function i() {
		if (shop_lng && shop_lat) {
			var a = u.getMapType().getProjection(), n = new BMap.Pixel(shop_lng, shop_lat);
			d = a.pointToLngLat(n)
		} else d = new BMap.Point(116.395645, 39.929986)
	}

	function p() {
		if (w.lat && w.lng && "null" != w.lat && "null" != w.lng) {
			var a = u.getMapType().getProjection(), n = new BMap.Pixel(w.lng, w.lat);
			r = a.pointToLngLat(n)
		}
	}

	function c() {
		if (d && r) {
			var a = new BMap.Polyline([d, r], {strokeColor: "red", strokeWeight: 4, strokeOpacity: .5});
			u.addOverlay(a), l()
		}
	}

	function l() {
		function a() {
			this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT, this.defaultOffset = new BMap.Size(10, 10)
		}

		var n = u.getDistance(d, r).toFixed(0);
		"NaN" == n && (n = 0), a.prototype = new BMap.Control, a.prototype.initialize = function (a) {
			var o = document.createElement("div");
			return o.appendChild(document.createTextNode("距离 " + n + " 米")), o.className = "mapTopCtrl", a.getContainer().appendChild(o), o
		};
		var o = new a;
		u.addControl(o)
	}

	function m() {
		u = new BMap.Map("MapHolder", {enableMapClick: !1}), i(), e(d, "shoppos"), u.centerAndZoom(d, 15), p(), e(r, "mypos"), c(), t(), u.enableScrollWheelZoom(), u.enableContinuousZoom()
	}

	function s() {
		function a() {
			$("#MapHolder").show(), $(".map .max").show(), $(".map #mapLoading").hide(), m()
		}

		!function () {
			window.BMap ? a() : setTimeout(s, 10)
		}()
	}

	var d, r, u, w, g = (a("wcommon:static/util/DataHelper"), a("wcommon:static/util")),
		_ = "https://stc1.waimai.baidu.com/static/waimai/widget/common/menucommon/map/mypos_30a008a.png",
		f = "https://static.waimai.baidu.com/static/waimai/widget/common/menucommon/map/target_60a5d87.png", h = [],
		C = a("wcommon:static/util/Cookie"),
		M = {COOKIE_LNG_KEY: "wm_callbacklng", COOKIE_LAT_KEY: "wm_callbacklat", COOKIE_ADDR_KEY: "wm_callbackaddr"};
	n.init = function (a, n) {
		shop_lat = a, shop_lng = n, o(), s(), g.loadCss("https://api.map.baidu.com/res/13/bmap.css")
	}
});
;
/*!waimai:widget/common/menucommon/notice/notice.js*/
define("waimai:widget/common/menucommon/notice/notice", function (o, t, e) {
	var a = !0, i = {
		cacheData: "", showFlag: !0, shopNotice: "", limitLen: 200, init: function () {
			var o = this;
			o.cacheData = "", o.$el = $("#shop-notice");
			var t = o.$el.find('[data-node="hiddenText"]').text();
			t = t ? t : "本店欢迎您下单，用餐高峰请提前下单，谢谢！", t = t.length > 300 ? t.substr(0, 296) + "..." : t, o.$el2 = $(".notice-float"), o.shopNotice2 = o.$el2.find('[data-node="shop-notice-2"]'), o.shopNotice = o.$el.find('[data-node="shop-notice"]');
			o.$el.find('[data-node="shop-noticeEvt"]');
			o.$el.on("click", '[data-node="shop-noticeEvt"]', $.proxy(o.shopNoticeEvt, o)), o.$el2.on("click", '[data-node="shop-noticeEvt"]', $.proxy(o.shopNoticeEvt, o)), "" != t ? t.length < o.limitLen ? (o.shopNotice.html(t), o.shopNotice2.html(t)) : (o.cacheData = t, t = t.replace(" ", "*"), t = t.substr(0, o.limitLen), t = t.replace("*", ""), o.shopNotice.html(t + '<br/><a class="notice-a" data-node="shop-noticeEvt">查看更多</a>'), o.shopNotice2.html(t + '<br/><a class="notice-a" data-node="shop-noticeEvt">查看更多</a>'), o.showFlag = !1) : o.shopNotice.html("本店欢迎您下单，用餐高峰请提前下单，谢谢！"), $(window).bind("scroll", function () {
				{
					var t = $(window).scrollTop();
					$("body").height(), $(window).height()
				}
				o.$sourceinfo = $('[node-data="sourceinfo"]');
				var e = o.$sourceinfo.offset().top;
				t > e ? (a = !1, o.$el2.fadeIn("slow")) : a || (o.$el2.fadeOut("slow"), a = !0)
			})
		}, shopNoticeEvt: function () {
			var o = this;
			if (0 == o.showFlag) o.shopNotice.html(o.cacheData + '<br/><a class="notice-a" data-node="shop-noticeEvt">收起</a>'), o.shopNotice2.html(o.cacheData + '<br/><a class="notice-a" data-node="shop-noticeEvt">收起</a>'), o.showFlag = !0; else {
				var t = o.cacheData.substr(0, i.limitLen);
				o.shopNotice.html(t + '<br/><a class="notice-a" data-node="shop-noticeEvt">查看更多</a>'), o.shopNotice2.html(t + '<br/><a class="notice-a" data-node="shop-noticeEvt">查看更多</a>'), o.showFlag = !1
			}
		}
	};
	e.exports = {
		init: function () {
			i.init()
		}
	}
});
;
/*!waimai:widget/common/menucommon/premiumnotice/premiumnotice.js*/
define("waimai:widget/common/menucommon/premiumnotice/premiumnotice", function () {
});