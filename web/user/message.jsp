<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            $("#messageId").addClass("layui-this");

            //全部删除
            $("#deleteAll").click(function () {
                $("#ulmsgId li").remove();
            });
        })

        //点击删除
        function deleteMessage(obj) {
            $(obj).parent().parent().remove();
        }
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
            <c:if test="${list.size()!=0}">
                <button class="layui-btn " id="deleteAll" onclick="confirm('您确定要删除吗？')">清空全部消息</button>
            </c:if>
            <div id="LAY_minemsg" style="margin-top: 10px;">
                <c:if test="${list.size()==0}">
                    <div class="fly-none">您暂时没有最新消息</div>
                </c:if>
                <ul class="mine-msg" id="ulmsgId">
                    <c:forEach items="${list}" var="myMessageVo">
                        <li data-id="123">
                            <blockquote class="layui-elem-quote">
                                <a href="/jump?username=Absolutely" target="_blank"><cite>${myMessageVo.username}</cite></a>回答了您的求解<a
                                    target="_blank"
                                    href="/jie/8153.html/page/0/#item-1489505778669"><cite>${myMessageVo.qname}</cite></a>
                            </blockquote>
                            <p>
                                <span>1小时前</span>
                                <a href="javascript:;" class="layui-btn layui-btn-small layui-btn-danger"
                                   onclick="deleteMessage(this)">删除</a>
                            </p>
                        </li>
                    </c:forEach>

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