<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/public.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/breakfast/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/breakfast/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/breakfast//css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/breakfast/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/breakfast/js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/breakfast/js/highcharts.js"></script>
    <title>首页</title>
</head>
<body>
<!-- 导航 开始 -->
<div class="index_nav">
    <div class="w1200 clearFloat">
        <div class="nav_center fl">
            <ul>
                <li><a class="add_bg" href="${pageContext.request.contextPath}/yestodayOrder">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/selectAll">所有商家</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- 导航 结束 -->
<!-- 轮播 开始 -->
<div class="focusBox">
    <ul class="pic">
        <c:forEach items="${shopList}" var="shop">
            <li><a href="${pageContext.request.contextPath}/findAllFoodById.action?sid=${shop.sid}" target="_blank"><img src="${pageContext.request.contextPath}${shop.shopFaces}"></a>
            </li>
        </c:forEach>
    </ul>
    <ul class="num">
        <c:forEach begin="1" end="${fn:length(shopList)}" var="num">
            <li><a>${num}</a><span></span></li>
        </c:forEach>
    </ul>

</div>
<!-- 轮播 结束 -->
<style>
    .fui-notice {
        border: #666666 1px solid;
        padding: 16px;
        height: auto;
        padding: 5px;
        margin-top: 20px;
        height: 30px;
        position: relative;
        overflow: hidden;
    }

    .fui-notice .img_gonggao {
        height: 30px;
        width: auto;
        position: relative;
        float: left;
        padding-left: 3px;
    }

    .bd_a_a ul li {
        line-height: 30px;
        margin-left: 20px;
    }

    .bd_a_a ul li a:hover {
        color: #059a32;
    }
</style>
<!-- 热门商品 开始 -->
<div class="index_time">
    <div class="w1200">
        <div class="title clearFloat">
            <span class="fl"><i>热门商品</i></span>
        </div>
        <ul class="clearFloat">
            <c:forEach items="${foodList}" var="food">
                <li>
                    <div class="d">
                        <img src="${pageContext.request.contextPath}${food.imageUrl}" width="100%" height="100%">
                    </div>
                    <h3>${food.fname}</h3>
                    <div class="d2 clearFloat">
                        <span class="sp1 fl">价钱：<i>${food.fprice}</i></span>
                    </div>
                    <div class="d2 clearFloat">
                        <span>销量：<i>${food.foodSales}</i></span>
                    </div>
                    <a class="d4"
                       href="${pageContext.request.contextPath}/findShopByFoodId?sortId=${food.sortId}">立即购买</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<!-- 热门商品 结束 -->

<!-- 昨日购买 开始 -->
<div class="w1200 index_cont3 index_cont5 clearFloat">
    <!-- 左侧 -->
    <div class="left fl">
        <div class="tit">
            <span>昨日购买</span>
        </div>
        <div class="det">

            <div class="det_list tab_det_list2">

                <c:if test="${empty  list}">
                    <div><p style="    font-size: 30px;margin: 20px;    color: gray;    margin-top: 10px;   ">
                            ${msg}
                    </p></div>
                </c:if>
                <c:if test="${not empty list}">
                    <table class="layui-table" style="width: 600px">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>

                        <thead>
                        <tr style="background-color: #0C0C0C;color: whitesmoke">
                            <th>商品名</th>
                            <th>数量</th>
                            <th>价格</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${list}" var="list">
                            <tr>
                                <td>${list.food.fname}</td>
                                <td>${list.foodNumber}</td>
                                <td>${list.priceSum}</td>
                            </tr>


                        </c:forEach>
                        <tr>
                            <td colspan="3"><a class="btn btn-default" href="#" role="button">立即下单</a></td>
                        </tr>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- 昨日购买 结束 -->
<!-- 推荐 开始 -->
<div class="w1200 index_cont3 index_cont5 clearFloat" style="margin-top: 10px">
    <!-- 左侧 -->
    <div class="left fl">
        <div class="tit">
            <span>推荐商品</span>
        </div>
    </div>
</div>
<!-- 推荐 结束 -->
<!-- 底部 开始 -->
<div class="foot">
    <div class="foot2">
        <div class="w1200 clearFloat">
            <div class="link">
                <a href="javascript:;">网站首页</a>|
                <a href="javascript:;">公司介绍</a>|
                <a href="javascript:;">联系我们</a>|
                <a href="javascript:;">合作邀请</a>|
                <a href="javascript:;">资质证件</a>|
                <a href="javascript:;">商城入驻</a>|
                <a href="javascript:;">基本帮助</a>
            </div>
        </div>
    </div>
    <!-- 底部 结束 -->
    <script>
        //搜索
        function searchproduct() {
            var keyword = document.getElementById("keyword").value;
            if (keyword == undefined || keyword == null || keyword == "") {
                alert("请输入关键字！");
                return false;
            }
            document.getElementById("searchform").submit();
        }

        //	轮播
        $(".focusBox").slide({
            titCell: ".num li",
            mainCell: ".pic",
            effect: "fold",
            autoPlay: true,
            trigger: "click",
            startFun: function (i) {
                jQuery(".focusBox .txt li").eq(i).animate({
                    "bottom": 0
                }).siblings().animate({
                    "bottom": -36
                });
            }
        });

        $('#container').highcharts({
            chart: {
                type: 'spline'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: ['10-12', '10-13', '10-14', '10-15', '10-16', '10-17', '10-18']
            },
            yAxis: {
                title: {
                    text: ''
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true          // 开启数据标签
                    },
                    enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                }
            },
            colors: ['#00ffff', '#ff0000'],
            series: [{
                name: '数据1',
                data: [0, 16, 16, 16, 16, 16, 17]
            }, {
                name: '数据2',
                data: [0, 15.5, 15, 17, 16, 15.5, 17]
            }]
        });
    </script>
</div>
</body>
</html>