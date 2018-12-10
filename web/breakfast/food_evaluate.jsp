<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
	<script type="text/javascript" src="https://passport.baidu.com/passApi/js/uni_armorwidget_wrapper.js"></script>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
	<title>先动手麻辣香锅外卖_先动手麻辣香锅电话|先动手麻辣香锅网上订餐|先动手麻辣香锅菜单 - 城市外卖 - 百度外卖</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/main_a79c03f.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/cartAlert_69d76b3.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/common_4840c98.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/citybar_2daccc1.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/landing_26d4e9b.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/muti_60d05dd.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/registerDialog_77e55d3.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/search_cae56fa.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/addressEditDialog_be19f67.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/search_b1f3d15.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/nav_92fb35c.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/menu_f039732.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/basicinfo_c3e4798.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/tab_b3d88c8.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/menucommon_bebb0ee.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/popCarousel_89218b2.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/comside_c4ef93e.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/backtop_e064524.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/backtop_e064524.css"/>
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/breakfast/css/footer/footer_bf9a09d.css"/>
</head>
<body>

<div id="content" class="clearfix">
	<div class="main">
		<section class="breadcrumb">
			<a href="/waimai">首页</a>
			<i>></i>
			<span>张氏龙虾馆</span>
		</section>
		<section class="basicinfo">
			<div class="b-img fl">
				<img width="198" height="120"
					 src="${shop.imageUrl}"
					 data-src="${pageContext.request.contextPath}/breakfast/images/aaa.jpg"
					 onerror="this.src='${pageContext.request.contextPath}/breakfast/images/shopcard_loading.png'">
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
					</dt>
					<dd class="rate-con">
						<span class="rate"> <span class="rate-inner"
												  style="width:${shop.shopStar*14.4}px"></span></span> <fmt:formatNumber
							type="number" value="${shop.shopStar}" pattern="0.0" maxFractionDigits="1"/>分
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
																 style="width:${shop.shopStar*14.4}px"></span> </span>
						</p>
						<p><span>共${pageInfo.total}条评价</span></p>
					</div>
					<table class="rate-table">
						<tbody>
						<tr>
							<td width="30px">5分</td>
							<td width="150px"><span class="pnum"> <span class="pnum-inner" style="width:${shop.shopStarList[4]/pageInfo.total*140}px"></span> </span>
							</td>
							<td>${shop.shopStarList[4]}人</td>
						</tr>
						<tr>
							<td>4分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:${shop.shopStarList[3]/pageInfo.total*140}px"></span> </span></td>
							<td>${shop.shopStarList[3]}人</td>
						</tr>
						<tr>
							<td>3分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:${shop.shopStarList[2]/pageInfo.total*140}px"></span> </span></td>
							<td>${shop.shopStarList[2]}人</td>
						</tr>
						<tr>
							<td>2分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:${shop.shopStarList[1]/pageInfo.total*140}px"></span> </span></td>
							<td>${shop.shopStarList[1]}人</td>
						</tr>
						<tr>
							<td>1分</td>
							<td><span class="pnum"> <span class="pnum-inner" style="width:${shop.shopStarList[0]/pageInfo.total*140}px"></span> </span></td>
							<td>${shop.shopStarList[0]}人</td>
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
			<section class="menu-tab clearfix">
				<ul>
					<li class="txt "><a href="${pageContext.request.contextPath}/findAllFoodById?sid=${shop.sid}">菜单</a>
					</li>
					<li class="txt  curr"><a
							href="${pageContext.request.contextPath}/findEvaluateBySid?sid=${shop.sid}">评价</a></li>
					<li class="txt "><a href="javascript:void(0)">资质</a></li>
				</ul>
			</section>
			<section class="comment-list" id="comment-list">
				<div class="comment-con" data-node="commCon">

					<c:forEach items="${pageInfo.list}" var="shopEvaluate">
						<div class="list clearfix"><!--class="rate-inner"-->
							<div class="top-section"><span class="user-name">${shopEvaluate.evaluateName}</span> <span
									class="rate">                    <span class="rate-inner"
																		   style="width:${shopEvaluate.star*14.4}px"></span>                </span> ${shopEvaluate.star}分<span
									class="delivery-time">                                    </span> <span
									class="fr"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${shopEvaluate.evaluatTime}" ></fmt:formatDate></span></div>
							<div class="mid-section"><p>${shopEvaluate.evaluateContent}</p></div>
						</div>
					</c:forEach>

				</div>
				<div class="more-comment" data-node="moreCom" style="display:none;">
					正在加载请稍候
				</div>
				<div class="pagination" data-node="pagination" style="">
					<div class="mod-page">
						<!-- 上一页 -->
						<c:if test="${pageInfo.prePage > 0}">
							<a href="${pageContext.request.contextPath}/findEvaluateBySid?sid=${shop.sid}&page=${pageInfo.prePage}" data-page="-" class="mod-page-item mod-page-item-prev">&nbsp;</a>
						</c:if>
						<!-- 分页列表 -->
						<c:forEach begin="${start}" end="${end}"  var="num">
							<a href="${pageContext.request.contextPath}/findEvaluateBySid?sid=${shop.sid}&page=${num}" data-page="1" class="mod-page-item ${pageInfo.pageNum == num ? 'mod-page-item-active' : ''}">${num}</a>
						</c:forEach>
						<!-- 下一页 -->
						<c:if test="${pageInfo.pageNum < pageInfo.pages}">
							<a href="${pageContext.request.contextPath}/findEvaluateBySid?sid=${shop.sid}&page=${pageInfo.nextPage}" data-page="+" class="mod-page-item mod-page-item-next">&nbsp;</a>
						</c:if>
					</div>
				</div>
			</section>
		</div>
		<div class="side">
			<section class="comside">
				<div class="overall">
					<h3 class="title">总体评分</h3>
					<div class="rate-info">
						<div class="rate-num"><fmt:formatNumber type="number" value="${shop.shopStar}" pattern="0.0"
																maxFractionDigits="1"/></div>
						<p class="pos">
<span class="rate">
<span class="rate-inner" style="width:${shop.shopStar*14.4}px"></span>
</span>
						</p>
						<p>
							<span>共${pageInfo.total}条评价</span>
						</p>
					</div>
					<table class="rate-table">
						<tr>
							<td width="30px">5分</td>
							<td width="150px">
<span class="pnum">
<span class="pnum-inner" style="width:${shop.shopStarList[4]/pageInfo.total*140}px"></span>
</span>
							</td>
							<td>${shop.shopStarList[4]}人</td>
						</tr>
						<tr>
							<td>4分</td>
							<td>
<span class="pnum">
<span class="pnum-inner" style="width:${shop.shopStarList[3]/pageInfo.total*140}px"></span>
</span>
							</td>
							<td>${shop.shopStarList[3]}人</td>
						</tr>
						<tr>
							<td>3分</td>
							<td>
<span class="pnum">
<span class="pnum-inner" style="width:${shop.shopStarList[2]/pageInfo.total*140}px"></span>
</span>
							</td>
							<td>${shop.shopStarList[2]}人</td>
						</tr>
						<tr>
							<td>2分</td>
							<td>
<span class="pnum">
<span class="pnum-inner" style="width:${shop.shopStarList[1]/pageInfo.total*140}px"></span>
</span>
							</td>
							<td>${shop.shopStarList[1]}人</td>
						</tr>
						<tr>
							<td>1分</td>
							<td>
<span class="pnum">
<span class="pnum-inner" style="width:${shop.shopStarList[0]/pageInfo.total*140}px"></span>
</span>
							</td>
							<td>${shop.shopStarList[0]}人</td>
						</tr>
					</table>
				</div>
			</section>
		</div>
		<div class="backtop-section" id="backtop-section">
			<div class="appdown" data-node="appdown">
				<a id="backTop" class="back-top-action v-hide" href="javascript:;"></a>
				<i data-node="appdown-img" class="appdown-img" usemap="#planetmap" style="display:block;"></i>
				<a id="feedback" class="feedback" href="javascript:;"></a>
				<map name="planetmap" id="planetmap">
					<area shape="rect" coords="88,35,100,45" id="appdownClose" href="javascript:;"/>
				</map>
			</div>
		</div>
	</div>

	<input type="hidden" id="bdstoken" name="bdstoken" value="5ffe1e1101edcc65b9f9bf5bd716c0c4">
	<input type="hidden" id="bindstoken" name="bindstoken" value="">
</div>
<div class="mask"></div>

</body>
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
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/main_27540a3.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/cartAlert_33a616a.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/lib_a8bf1bf.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/citybar_ce545ec.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/muti_7cec3bf.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/landing_af2d654.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/search_9fd8502.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/addressEditDialog_83dba56.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/search_ac8d22c.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/nav_26a027a.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/basicinfo_7b3c77c.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/tab_b9d5368.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/mustbuy_a90a62b.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/noresult_8b58ce9.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/popCarousel_b7eac1d.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/menucommon_de74ba3.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/comside_99661f4.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/feedback_5e6c6b4.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/backtop_3bb0645.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/breakfast/js/mod_4296a9b.js/footer_3efb8d8.js"></script>
<script type="text/javascript">!function () {
    require('waimai:widget/landing/muti/muti').init();
}();
!function () {// domready 后加载
    $(function () {
        require.async(['waimai:widget/common/userinfo/UserMgr'], function (user) {
            user.init();
        });
    });
}();
!function () {
    var nav = require("waimai:widget/common/nav/nav");
    nav.init({hashKey: null, recall_info: {"lat": null, "lng": null, "address": null}});
    nav.initSwitchaddr();
}();
!function () {
    require("waimai:widget/common/backtop/backtop").init();
}();
!function () {
    require("waimai:widget/common/footer/footer").init();
}();
!function () {
    require("wcommon:static/util/stat").init({
        da_trd: 'waimai',
        page: 'WaimaiMenuPg'
    });
    addNStat({
        da_trd: 'waimai',
        da_src: 'pageBk',
        da_act: 'show'
    });
}();
!function () {
    require("waimai:page/layout");
}();</script>
</html>
