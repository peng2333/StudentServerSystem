<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <script src="${pageContext.request.contextPath}/js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(function () {
            $(".layui-nav-item .menu").click(function () {
                $(".layui-nav-item").each(function () {
                    $(this).removeClass("layui-this");
                })
                $(this).addClass("layui-this");
            })
        })
    </script>
</head>
<body>
<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/images/Java_64px_1121656_easyicon.net.png" alt="layui">
        </a>
        <%--<ul class="layui-nav fly-nav layui-hide-xs">--%>
            <%--<li class="layui-nav-item menu">--%>
                <%--<a href="${pageContext.request.contextPath}/netdisk/index.jsp" target="iFrame_main"><i class="iconfont icon-iconmingxinganli"></i>资源中心</a>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item menu">--%>
                <%--<a href="${pageContext.request.contextPath}/case/WangShuang" target="iFrame_main"><i class="iconfont icon-daima"></i>交流互助中心</a>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item menu">--%>
                <%--<a href="${pageContext.request.contextPath}/yestodayOrder" target="iFrame_main"><i class="iconfont icon-jiaoliu"></i>早点服务</a>--%>
            <%--</li>--%>
        <%--</ul>--%>

            <ul class="layui-nav fly-nav-user">

            <c:if test="${empty sessionScope.get('user')}">
                <!-- 未登入的状态 -->
                <li class="layui-nav-item">
                    <a class="iconfont icon-touxiang layui-hide-xs" href="${pageContext.request.contextPath}/user/login.jsp" target="iFrame_main"></a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/user/login.jsp" target="iFrame_main">登入</a>
                </li>
            </c:if>


            <c:if test="${not empty sessionScope.get('user')}">
                <!-- 登入后的状态 -->
                <c:if test="${sessionScope.get('user').permission == 1}">
                    <li class="layui-nav-item">
                        <a href="/admin/admin">控制台</a>
                    </li>
                </c:if>
                <li class="layui-nav-item">
                    <a class="fly-nav-avatar" href="javascript:;">
                        <cite class="layui-hide-xs">${user.name}</cite>
                        <c:if test="${user.permission == 1}">
                            <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：系统开发者"></i>
                        </c:if>
                        <!--<i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：系统开发者"></i>-->
                        <img src="${pageContext.request.contextPath}${user.imageurl}">
                    </a>
                    <dl class="layui-nav-child usernav">
                        <dd><a href="${pageContext.request.contextPath}/user/set.jsp" target="iFrame_main"><i class="layui-icon">&#xe620;</i>基本设置</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/user/MyMessage" target="iFrame_main"><i class="iconfont icon-tongzhi"
                                                                                                                  style="top: 4px;"></i>我的消息</a>
                        </dd>
                        <dd><a href="${pageContext.request.contextPath}/user/myhome?uid=${user.uid}" target="iFrame_main"><i class="layui-icon"
                                                                                                               style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a>
                        </dd>
                        <hr style="margin: 5px 0;">
                        <dd><a href="${pageContext.request.contextPath}/user/layout" style="text-align: center;">退出</a></dd>
                    </dl>
                </li>
            </c:if>


        </ul>
    </div>
</div>


<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });

</script>
</body>
</html>
