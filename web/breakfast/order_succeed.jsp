<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>锡货超市</title>
    <link href="${pageContext.request.contextPath}/breakfast/css/public.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}breakfast/css/base.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}breakfast/js/jquery_cart.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}breakfast/css/buyConfirm.css"/>
    <script src="${pageContext.request.contextPath}breakfast/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}breakfast/js/unslider.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}breakfast/js/index.js" type="text/javascript"></script>
    <script type="text/javascript">

        window.onload = function () {
            new tab('test4-input-input_tab1-input_tab2', '-');
        }

        function tab(o, s, cb, ev) { //tab换类
            var $ = function (o) {
                return document.getElementById(o)
            };
            var css = o.split((s || '_'));
            if (css.length != 4) return;
            this.event = ev || 'onclick';
            o = $(o);
            if (o) {
                this.ITEM = [];
                o.id = css[0];
                var item = o.getElementsByTagName(css[1]);
                var j = 1;
                for (var i = 0; i < item.length; i++) {
                    if (item[i].className.indexOf(css[2]) >= 0 || item[i].className.indexOf(css[3]) >= 0) {
                        if (item[i].className == css[2]) o['cur'] = item[i];
                        item[i].callBack = cb || function () {
                        };
                        item[i]['css'] = css;
                        item[i]['link'] = o;
                        this.ITEM[j] = item[i];
                        item[i]['Index'] = j++;
                        item[i][this.event] = this.ACTIVE;
                    }
                }
                return o;
            }
        }

        tab.prototype = {
            ACTIVE: function () {
                var $ = function (o) {
                    return document.getElementById(o)
                };
                this['link']['cur'].className = this['css'][3];
                this.className = this['css'][2];
                try {
                    $(this['link']['id'] + '_' + this['link']['cur']['Index']).style.display = 'none';
                    $(this['link']['id'] + '_' + this['Index']).style.display = 'block';
                } catch (e) {
                }
                this.callBack.call(this);
                this['link']['cur'] = this;
            }
        }
    </script>
</head>

<body>

<!--  导航条    start-->
<div class="yHeader">
    <div class="shop_Nav">
        <div class="pullDown">
            <h2 class="pullDownTitle"><i></i>全部商品分类</h2>
        </div>

        <ul class="Menu_box">
            <li><a href="" target="_blank" class="yMenua">首页</a></li>
            <li><a href="" target="_blank">大划算</a></li>
            <li><a href="" target="_blank">抢拍</a></li>
            <li><a href="" target="_blank">锡货专场</a></li>
            <li><a href="" target="_blank">锡货超市</a></li>
        </ul>
        <div class="fr r_icon"><i class="i01"></i><span>30天退货</span><i class="i02"></i><span>满59包邮</span></div>
    </div>
</div>
<!--  导航条    end-->


<div class="banner_red_top">


</div>


<!--订单提交body部分开始-->


<div class="border_top_cart">

    <div class="container payment-con">
        <form target="_blank" action="#" id="pay-form" method="post">
            <div class="order-info">
                <div class="msg">
                    <h3>您的订单已提交成功～</h3>
                    <p></p>

                    <p class="post-date">成功付款后，7天发货</p>
                </div>
                <div class="icon-box">
                    <i class="iconfont"><img src="/breakfast/images/yes_ok.png"></i>
                </div>
            </div>

            <div class="xm-plain-box">
                <!-- 选择支付方式 -->
                <div>
                    <img src="${pageContext.request.contextPath}/breakfast/images/${imgName}"/>
                </div>

<script src="js/base.min.js"></script>

<script type="text/javascript" src="js/buyConfirm.js"></script>

</div>


<!--订单提交body部分结束-->




</body>
</html>
