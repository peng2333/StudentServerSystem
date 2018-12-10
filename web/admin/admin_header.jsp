<%--
  Created by IntelliJ IDEA.
  User: XDerhuo
  Date: 2018/6/7
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<link rel="stylesheet" href="../css/layui.css">
<div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="admin_student.jsp">学生管理</a></li>
        <li class="layui-nav-item"><a href="../admin/admin_tiezi.html">帖子管理</a></li>
        <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/orderController/orderFindAll">订单管理</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath}/user/myhome?uid=${user.uid}">
                <img src="${pageContext.request.contextPath}${user.imageurl}" class="layui-nav-img">
               ${user.username}
            </a>
        </li>
        <li class="layui-nav-item"><a href="../index.jsp">退了</a></li>
    </ul>
</div>
</body>
</html>
