<%--
  Created by IntelliJ IDEA.
  User: XDerhuo
  Date: 2018/6/7
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="${pageContext.request.contextPath}/admin/admin_dingdan.jsp">订单生成</a>
            </li>
        </ul>
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="${pageContext.request.contextPath}/admin/admin_goods.jsp">商品列表</a>
            </li>
        </ul>
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="${pageContext.request.contextPath}/admin/admin_seller.jsp">店家列表</a>
            </li>
        </ul>
        <%--<ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
            <%--<li class="layui-nav-item layui-nav-itemed">--%>
                <%--<a class="" href="${pageContext.request.contextPath}/admin/admin_trad.jsp">反馈</a>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="${pageContext.request.contextPath}/admin/admin_dingdan_kmeanschart.jsp">数据展示</a>
            </li>
        </ul>
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="${pageContext.request.contextPath}/admin/admin_check.jsp">查询</a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
