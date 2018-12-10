<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script src="../js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-1.12.4.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<ul id="ulId" class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item" id="homeId">
        <a href="${pageContext.request.contextPath}/user/myhome?uid=${user.uid}">
            <i class="layui-icon">&#xe609;</i>
            我的主页
        </a>
    </li>
    <li class="layui-nav-item" id="indexId">
        <a href="/user/WangShuang">
            <i class="layui-icon">&#xe612;</i>
            用户中心
        </a>
    </li>
    <li class="layui-nav-item" id="setId">
        <a href="${pageContext.request.contextPath}/user/set">
            <i class="layui-icon">&#xe620;</i>
            基本设置
        </a>
    </li>
    <li class="layui-nav-item" id="messageId">
        <a href="/user/MyMessage">
            <i class="layui-icon">&#xe611;</i>
            我的消息
        </a>
    </li>

    <li class="layui-nav-item" id="message_3Id">
        <a href="${pageContext.request.contextPath}/todayOrder">
            <i class="layui-icon">&#xe612;</i>
            早点订单
        </a>
    </li>
</ul>
</body>
</html>
