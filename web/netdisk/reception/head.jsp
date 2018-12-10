<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/4
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../layui/css/layui.css">
<script src="../layui/layui.js"></script>
<ul class="layui-nav" lay-filter="">
    <li class="layui-nav-item layui-this "><a href=""><i class="layui-icon layui-icon-user">公共网盘</i></a></li>
    <li class="layui-nav-item"><a href=""><i class="layui-icon layui-icon-username">个人网盘</i></a></li>
    <%--<li class="layui-nav-item">--%>
        <%--<a href="javascript:;">更多</a>--%>
        <%--<dl class="layui-nav-child">--%>
            <%--<dd><a href="">功能1</a></dd>--%>
            <%--<dd><a href="">功能2</a></dd>--%>
            <%--<dd><a href="">功能3</a></dd>--%>
        <%--</dl>--%>
    <%--</li>--%>

    <li  class="layui-nav-item">
        <dl class="layui-anim layui-anim-upbit" style=""></dl>
    </li>
</ul>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
