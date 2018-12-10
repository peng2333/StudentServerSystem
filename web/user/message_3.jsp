<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>我的消息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script src="../js/jquery-1.12.4.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        $(function () {
            $("#ulId li").each(function () {
                $(this).removeClass("layui-this");
            })
            $("#message_3Id").addClass("layui-this");
        })
    </script>
</head>
<body style="margin: 0px">
<%--header--%>
<div class="layui-container fly-marginTop fly-user-main">
    <jsp:include page="left.jsp"></jsp:include>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>


    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
            <div id="LAY_minemsg" style="margin-top: 10px;">
                <!--<div class="fly-none">您暂时没有最新消息</div>-->
                <ul class="mine-msg">
                    <li data-id="123">
                        <blockquote class="layui-elem-quote">
                            <c:if test="${empty  lists}">
                                您与&nbsp;&nbsp;   ${date} &nbsp;&nbsp;无订单
                            </c:if>
                            <c:if test="${not empty lists}">
                            您与&nbsp;&nbsp;${date}&nbsp;&nbsp;的订单为——<br/>
                            <c:forEach items="${lists}" var="list">
                            <table class="layui-table">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>商品名</th>
                                    <th>数量</th>
                                    <th>价格</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${list.food}" var="foods">
                                <tr>
                                    <td>${foods.food.fname}</td>
                                    <td>${foods.foodNumber}</td>
                                    <td>${foods.priceSum}</td>

                                    </c:forEach>
                                </tbody>
                            </table>
                                <p><img src="${pageContext.request.contextPath}/breakfast/images/${list.pathName}.png"><a href="javascript:;"
                                                    class="layui-btn layui-btn-small layui-btn-danger fly-delete">退订</a></p>

                            </c:forEach>
                            总金额为——&nbsp;&nbsp;${Total}元&nbsp;&nbsp;
                        </blockquote>

                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</div>
<%--footer--%>

<script src="../js/layui.js"></script>
<script>
    layui.cache.page = 'user';
    layui.cache.user = {
        username: '游客'
        , uid: -1
        , avatar: '../../res/images/avatar/00.jpg'
        , experience: 83
        , sex: '男'
    };
    layui.config({
        version: "3.0.0"
        , base: '../mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

</body>
</html>