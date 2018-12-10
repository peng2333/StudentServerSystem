<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>锡货超市</title>
	<link href="css/public.css" type="text/css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/base.css"/>
	<script type="text/javascript" src="js/jquery_cart.js"></script>
	<link rel="stylesheet" type="text/css" href="css/checkOut.css" />
</head>

<body>
<div class="banner_red_top"></div>

<div class="container">
	<form id="checkoutForm" action="${pageContext.request.contextPath}/addFoodOrder.action" method="post">
		<div class="checkout-box">

			<div class="checkout-box-ft">
				<!-- 商品清单 -->
				<div id="checkoutGoodsList" class="checkout-goods-box">
					<div class="xm-box">
						<div class="box-hd">
							<h2 class="title">确认订单信息</h2>
						</div>
						<div class="box-bd">
							<dl class="checkout-goods-list">
								<dt class="clearfix">
									<span class="col col-1">商品名称</span>
									<span class="col col-2">购买价格</span>
									<span class="col col-3">购买数量</span>
									<span class="col col-4">小计（元）</span>
								</dt>
								<c:set var="pSum" value="0.0"></c:set>
								<c:forEach items="${Vo2List}" var="vo2">
									<dd class="item clearfix">
										<div class="item-row">
											<div class="col col-1">
												<div class="g-pic">
													<img src="${vo2.food.imageUrl}"
													     srcset="${vo2.food.imageUrl}"
													     width="40" height="40"/>
												</div>
												<div class="g-info">
													<a href="#">
															${vo2.food.fname} </a>
												</div>
											</div>
											<c:set value="${pSum+vo2.priceSum}" var="pSum"/>
											<div class="col col-2">${vo2.priceSum}元</div>
											<div class="col col-3">${vo2.foodNumber}</div>
											<div class="col col-4">${vo2.priceSum}元</div>
										</div>
									</dd>
								</c:forEach>

							</dl>
							<div class="checkout-count clearfix">
								<div class="checkout-count-extend xm-add-buy">
									<h2 class="title">备注:</h2></br>
									<input type="text" name="ordersRemark"/>

								</div>
								<!-- checkout-count-extend -->
								<div class="checkout-price">
									<ul>

										<li>
											订单总额：<span>${pSum}元</span>
										</li>
										<li>
											活动优惠：<span>-0元</span>
											<script type="text/javascript">
												checkoutConfig.activityDiscountMoney = 0;
												checkoutConfig.totalPrice = 244.00;
											</script>
										</li>
										<li>
											优惠券抵扣：<span id="couponDesc">-0元</span>
										</li>
										<li>
											运费：<span id="postageDesc">0元</span>
										</li>
									</ul>
									<p class="checkout-total">应付总额：<span><strong
											id="totalPrice">${pSum}</strong>元</span></p>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- 商品清单 END -->

				<div class="checkout-confirm">

					<a href="${pageContext.request.contextPath}/findAllFoodById?sid=${sid}" class="btn btn-lineDakeLight btn-back-cart">返回商家</a>
					<input type="submit" class="btn btn-primary" value="立即下单" id="checkoutToPay"/>
				</div>
			</div>
		</div>

	</form>

</div>


<div>


	<script src="js/base.min.js"></script>
	<script type="text/javascript" src="js/address_all.js"></script>
	<script type="text/javascript" src="js/checkout.min.js"></script>
</div>


<!-- 底部 -->
<div class="footer_v2013 bottom-about">
	<div class="w">
		<p class="foot_p1">
			<a href="#">首页</a>|<a href="#">招聘英才</a>|<a href="#">广告合作</a>|<a href="#">联系我们</a>|<a href="#">关于我们</a>
		</p>
		<pre>
    经营许可证：苏B2-20130223备案许可证：苏ICP备13041162号-1360网站安全检测平台
    ?2013-2014 无锡太湖云电商网络科技发展有限公司   版权所有
                </pre>
	</div>
	<p>
		<a href="#"><img src="images/bottom_img01.png"></a>
		<a href="#"><img src="images/bottom_img02.png"></a>
		<a href="#"><img src="images/bottom_img03.png"></a>
		<a href="#"><img src="images/bottom_img04.png"></a>
		<a href="#"><img src="images/bottom_img05.png"></a>
		<a href="#"><img src="images/bottom_img06.png"></a>
		<a href="#"><img src="images/bottom_img07.png"></a>
		<a href="#"><img src="images/bottom_img08.png"></a>
		<a href="#"><img src="images/bottom_img09.png"></a>
	</p>
</div>
<!-- 底部 -->
<div class="fixed-buttons">
	<ul>
		<li><a href="#" class="fixed-weixin"><img src="images/fixed_weixin.png"/>
			<div class="weixin-pic"><img src="images/weixin_big.jpg"></div>
		</a></li>
		<li><img id="imgBtn-to-top" src="images/back_top.png"/></li>
	</ul>
</div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/unslider.min.js" type="text/javascript"></script>
<script src="js/index.js" type="text/javascript"></script>

</body>
</html>