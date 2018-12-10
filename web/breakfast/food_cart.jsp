<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 47315
  Date: 2018/6/14
  Time: 0:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/breakfast/js/uni_armorwidget_wrapper.js"></script>
	<meta charset="jdk">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>点餐服务</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/main_a79c03f.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/cartAlert_69d76b3.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/common_4840c98.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/citybar_2daccc1.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/landing_26d4e9b.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/muti_60d05dd.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/registerDialog_77e55d3.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/search_cae56fa.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/addressEditDialog_be19f67.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/nav_92fb35c.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/basicinfo_c3e4798.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/menucommon_bebb0ee.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/tab_b3d88c8.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/popCarousel_89218b2.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/filter_4847ffc.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/setmeal_864a85e.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/list_3b46847.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/collect_35cd19e.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/backtop_e064524.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/footer_bf9a09d.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/menu_f039732.css">
</head>
<body>
<div id="content" class="clearfix">
	<div class="main">
		<section class="breadcrumb">
			<a href="${pageContext.request.contextPath}/selectAll">首页</a>
			<i>&gt;</i>
			<span>${shop.shopName}</span>
		</section>
		<section class="basicinfo">
			<div class="b-img fl">
				<img width="198" height="120"
					 src="${shop.imageUrl}"
					 data-src="${shop.imageUrl}"/>
			</div>
			<div class="b-info fl">
				<div class="one-line">
					<h2>${shop.shopName}</h2>
				</div>
				<div class="all-show">
					<h2>${shop.shopName}</h2>
				</div>
				<span class="cert-icon"><img
						src="${pageContext.request.contextPath}/breakfast/images/certificated_s.png"></span>
				<dl>
					<dt>
						餐饮
					</dt>
					<dd class="rate-con">
						<span class="rate"> <span class="rate-inner" style="width:${shop.shopStar*14.4}px"></span></span>
						<fmt:formatNumber type="number" value="${shop.shopStar}" pattern="0.0" maxFractionDigits="1" />分
					</dd>
				</dl>
				<dl>
					<dt>
						<i class="icon icon-time"></i>接单时间:&nbsp;
					</dt>
					<dd class="bussinessStatus">
						<span>${shop.workTime}</span>
						<strong class="doing">营业中</strong>
					</dd>
				</dl>
				<dl>
					<dt>
						<i class="icon icon-address"></i>商户地址:&nbsp;
					</dt>
					<dd>
						市府东路6幢1-101号
					</dd>
				</dl>
				<div class="overall">
					<h3 class="title">总体评分</h3>
					<div class="rate-info">
						<div class="rate-num">

						</div>
						<p class="pos"><span class="rate"> <span class="rate-inner"
																 style="width:${shop.shopStar*14.4}px"></span> </span></p>
						<p><span>共${shopEvaluateList.size()}条评价</span></p>
					</div>
					<table class="rate-table">
						<tbody>
						<tr>
							<td width="30px">5分</td>
							<td width="150px"><span class="pnum"> <span class="pnum-inner" style="width:100px"></span> </span>
							</td>
							<td>25人</td>
						</tr>
						<tr>
							<td>4分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:20px"></span> </span></td>
							<td>5人</td>
						</tr>
						<tr>
							<td>3分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:8px"></span> </span></td>
							<td>2人</td>
						</tr>
						<tr>
							<td>2分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:8px"></span> </span></td>
							<td>2人</td>
						</tr>
						<tr>
							<td>1分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:4px"></span> </span></td>
							<td>1人</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="b-cost fr">
				<div class="b-value">

					<strong class="b-num">30</strong>
				</div>
				<p class="b-label">配送费</p>
			</div>
			<div class="b-divider fr"></div>
			<div class="b-price fr">
				<div class="b-value">

					<strong class="b-num">120</strong>
				</div>
				<p class="b-label">起送价</p>
			</div>
			<div class="b-divider fr"></div>
			<div class="b-totime fr">
				<div class="b-value">
					<strong class="b-num"> 1小时</strong>
					<span class="num-unit"></span>
				</div>
				<p class="b-label">平均送达时间</p>
			</div>
		</section>
		<div class="main-l">
			<div class="annouce">
				<span class="sound-icon"></span>
				<span>今日下单可选择今日-6.09配送</span>
			</div>
			<section class="menu-tab clearfix">
				<ul>
					<li class="txt  curr"><a href="${pageContext.request.contextPath}/findAllFoodById.action?sid=${shop.sid}">菜单</a>
					</li>
					<li class="txt "><a href="${pageContext.request.contextPath}/findEvaluateBySid.action?sid=${shop.sid}">评价</a>
					</li>
					<li class="txt "><a href="/shopui/shopcertificate?shop_id=1963600524">资质</a></li>
				</ul>
			</section>
			<section class="menu-filter-wrapper">
				<section class="menu-filter clearfix">
					<div>


						<c:forEach items="${foodSortList}" var="foodSort" varStatus="vs">
							<a class="filter-item" category_id="502034244" href="javascript:void(0)"
							   data="${vs.count-1}">
								<span class="item-name"
									  title="${foodSort.sortName}">&nbsp;&nbsp;&nbsp;${foodSort.sortName}&nbsp;&nbsp;&nbsp;</span>
								<em class="item-num">(${foodSort.foodList.size()})</em>
							</a>
						</c:forEach>


					</div>
					<div class="bottomArr" data-node="bottomArr"></div>
				</section>
				<section class="menu-filter-fix clearfix hide" id="menuFilter">
					<div class="menu-filter clearfix menu-filter-fix-list">
						<div>


							<c:forEach items="${foodSortList}" var="foodSort" varStatus="vs">
								<a class="filter-item" href="javascript:void(0)" data="${vs.count-1}"> <span
										class="item-name"
										title="${foodSort.sortName}">&nbsp;&nbsp;&nbsp;${foodSort.sortName}&nbsp;&nbsp;&nbsp;</span>
									<em class="item-num">(${foodSort.foodList.size()})</em> </a>
							</c:forEach>


						</div>
						<div class="bottomArr" data-node="bottomArr"></div>
					</div>
				</section>
			</section>
			<section class="menu-list">


				<c:forEach items="${foodSortList}" var="foodSort" varStatus="vs">
					<div class="list-wrap" id="menu_${vs.count}" orderlimit=${foodSort.foodList.size()}>
						<div class="list-status">
							<span class="title">${foodSort.sortName}</span>
						</div>
						<div class="list clearfix">
							<ul>

								<c:forEach items="${foodSort.foodList}" var="food">
									<li class="list-item"
										data="${food.fid}$${food.fname}$${food.fprice}$2$1$1$8888888$$1977302578$0$${food.fid}"
										data-sid="item_${food.fid}" dishlimit="1" leftnum="9999" dishactflag="1"
										dishactivityid="502034244" orderlimit="8" >
										<figure class="headimg fl">
											<div class="bg-img"
												 style="background: url('${food.imageUrl}') center center no-repeat;background-size:cover;-webkit-background-size:cover;-o-background-size:cover;-moz-background-size:cover;-ms-background-size:cover;"></div>
										</figure>
										<div class="info fl">
											<h3 data-title="${food.fname}"
												data-content="温馨提示：图片仅供参考，请以实物为准；高峰时段及恶劣天气，请提前下单。">
													${food.fname}</h3>
											<div class="info-desc">
												<p class="m-hot-value"><span class="sales-count">3人推荐</span><span
														class="divider"></span> <span
														class="sales-count">月售${food.foodSales}份</span></p>
												<p class="m-hot-value"><span class="stock-count">库存9999份</span></p>
											</div>
											<div class="m-price">
												<span class="activityprice"><strong>${food.fprice}</strong></span>&nbsp;&nbsp;
												<del><strong>${food.fprice}</strong></del>&nbsp;&nbsp;
											</div>
										</div>
										<div class="m-sel-icon" unselectable="on">
											<div class="select-con">
												<strong class="minusfrcart" data-node="minusfrcart"></strong>
												<strong class="select_count">0</strong>
												<strong class="addtocart dishSelectElem" data-node="addtocart"></strong>
											</div>
										</div>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</c:forEach>

			</section>
		</div>
		<div class="side">
			<section class="menu-collect clearfix" id="widget-menu-collect">
				<div class="collect-btn " data-node="collectBtn" from="menu">
					<i></i>
					<span data-node="collectTxt">收藏商户</span>
				</div>
			</section>
			<section id="shop-notice" class="notice clearfix">
				<p class="warp"></p>
				<h2>商家公告</h2>
				<p class="notice-desc" data-node="shop-notice"></p>
				<textarea data-node="hiddenText" style="display:none">&lt;br /&gt;${shop.shopNotice}</textarea>
			</section>
			<section class="notice-float" style="display:none">
				<p class="warp"></p>
				<h2>商家公告</h2>
				<p class="notice-desc" data-node="shop-notice-2"></p>
			</section>
			<div class="map">
				<div id="MapHolder" class="mapHolder"></div>
				<div id="mapLoading">
					<img src="./img/loading_50c5e3e.gif">
				</div>
			</div>
			<section node-data="sourceinfo" class="sourceinfo-mode">
				<div>
					<p class="icon_infop">配送服务由<span>&nbsp;张氏龙虾馆&nbsp;</span>提供</p>
				</div>
			</section>
			<section id="fill_diff-section" state="non-trigger">
				<div id="fill_diff_bear" status="left"></div>
				<div id="fill_diff_table"></div>
			</section>
			<section class="cart-section cart-fix" id="cart-section">
				<div class="menu-cart menu-cart-box-shadow">
					<div class="cc-warp hide">
						<div class="title">
							<span class="txt">购物车</span>
							<span class="clear-cart">清空</span>
						</div>
						<div class="cart-panel">

							<form id="formId" action="${pageContext.request.contextPath}/commitOrders.action?sid=${shop.sid}" method="post">
								<table>
									<tbody class="item-list" data-node="item-list">
									<tr>
										<td class="item-name">菜品</td>
										<td class="item-count">份数</td>
										<td class="item-price">单价</td>
										<td class="item-delete"></td>
									</tr>
									</tbody>
									<thead class="cart-head">
									</thead>
								</table>
							</form>

						</div>
					</div>
					<div class="cart-bar">
						<span class="cart-logo fl"></span>
						<span class="cart-desc " id="cartIsEmpty">购物车是空的</span>
						<span class="cart-desc fl" id="cartAmout" style="display: none;"></span>
						<span class="cart-desc cart-cha fr" id="cartCha" style="display: none;">还差5元起送</span>
						<span class="cart-desc submit fr" id="cartSubmit" style="display: none;"> 选好了</span>
					</div>
				</div>
			</section>
		</div>
		<div class="backtop-section" id="backtop-section">
			<div class="appdown" data-node="appdown">
				<a id="backTop" class="back-top-action v-hide" href="javascript:;"></a>
				<i data-node="appdown-img" class="appdown-img" usemap="#planetmap"
				   style="display: block; width: 65px; height: 60px;"></i>
				<a id="feedback" class="feedback" href="javascript:;"></a>
				<map name="planetmap" id="planetmap">
					<area shape="rect" coords="88,35,100,45" id="appdownClose" href="javascript:;">
				</map>
			</div>
		</div>
	</div>
</div>

<footer id="baiducopy">
	<div class="footer-items">
		<div class="footer-items-snippet footer-item help">
			<h3>帮助</h3>
			<div class="text">
				<a href="/waimai?qt=contact">建议与反馈</a>
				<a href="/waimai?qt=helpusage">使用帮助</a>
				<a href="/waimai?qt=helpqa">常见问题</a>
				<a href="/waimai?qt=agreement">用户协议</a>
				<a href="/waimai?qt=agreement&amp;right=private">隐私政策</a>
				<a href="/waimai?qt=agreement&amp;right=1">权利声明</a>
			</div>
		</div>
		<div class="footer-items-snippet footer-item followus">
			<h3>关注我们</h3>
			<div class="text">
				<a href="http://tieba.baidu.com/f?kw=%B0%D9%B6%C8%CD%E2%C2%F4&amp;fr=ala0" target="_blank">官方论坛</a>
				<a href="http://weibo.com/waimai" target="_blank">新浪微博</a>
				<a href="/waimai?qt=about" target="_blank">关于我们</a>
				<a data-node="wechat" href="javascript:void(0);" class="wechat">微信公众号</a>
				<a href="/waimai?qt=agreement&amp;right=2" target="_blank">平台制度</a>
			</div>
		</div>
		<div class="footer-items-snippet footer-item">
			<h3>商务合作</h3>
			<div class="text">
				<a href="https://napos-kaidian.faas.ele.me/?from=baidu" target="_blank">商户入驻</a>
				<a href="/waimai?qt=agent" target="_blank">代理商合作</a>
			</div>
		</div>
		<div class="footer-items-contact footer-item">
			<h3><img src="${pageContext.request.contextPath}/breakfast/images/contact_84eeb9f.png" alt="图标"> 客服热线</h3>
			<em>10105777</em>
			<div class="text no-hover">
				<span>周一至周日7x24小时</span>
			</div>
		</div>
	</div>
</footer>
<div class="mask"></div>
<script>
    $(function () {
        $(".dishSelectElem").click(function () {
            alert(111);
        });
    })
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js"></script>
<script type="text/javascript">require.resourceMap({
    "res": {
        "waimai:widget/common/userinfo/comp/registerDialog.js": {
            "url": "https://static.waimai.baidu.com/static/waimai/widget/common/userinfo/comp/registerDialog_ff8e4cd.js",
            "deps": ["wcommon:static/util/Cookie.js"]
        },
        "waimai:widget/common/userinfo/UserMgr.js": {
            "url": "https://static.waimai.baidu.com/static/waimai/widget/common/userinfo/UserMgr_e200a1f.js",
            "deps": ["waimai:widget/common/userinfo/comp/registerDialog.js", "wcommon:static/util/Cookie.js"]
        }
    }
});</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/main_27540a3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/cartAlert_33a616a.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/lib_a8bf1bf.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/citybar_ce545ec.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/muti_7cec3bf.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/landing_af2d654.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/search_9fd8502.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/addressEditDialog_83dba56.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/search_ac8d22c.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/nav_26a027a.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/basicinfo_7b3c77c.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/tab_b9d5368.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/mustbuy_a90a62b.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/noresult_8b58ce9.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/popCarousel_b7eac1d.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/menucommon_de74ba3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/filter_9c6f1bf.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/setmeal_f42603d.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/list_1ab1f8b.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/feedback_5e6c6b4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/backtop_3bb0645.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/footer_3efb8d8.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/breakfast/js/menu_20df260.js"></script>
<script type="text/javascript">!function () {
    require('waimai:widget/landing/muti/muti').init();
}();

!function () {
    require("waimai:widget/menu/list/list").init();
}();
!function () {
    require("waimai:widget/common/menucommon/collect/collect").init("1963600524", "0");
}();
!function () {
    require('waimai:widget/common/menucommon/notice/notice').init();
}();
!function () {
    require('waimai:widget/common/menucommon/fill_diff/fill_diff').init();
}();
!function () {
    require('waimai:widget/common/menucommon/cart/cart').init("1963600524", "", "");
}();
!function () {
    require("waimai:widget/common/backtop/backtop").init();
}();
!function () {
    require("waimai:page/menu").setCurShopInfo("1963600524", "张氏龙虾馆", "30", "120", "3");
}();
!function () {
    require("waimai:widget/common/footer/footer").init();
}();
!function () {
    require("wcommon:static/util/stat").init({
        da_trd: 'waimai',
        page: 'shopMenuPg'
    });
    addNStat({
        da_trd: 'waimai',
        da_src: 'pageBk',
        da_act: 'show'
    });
}();
!function () {
    require("waimai:page/layout");
}();
</script>
</body>
</html>