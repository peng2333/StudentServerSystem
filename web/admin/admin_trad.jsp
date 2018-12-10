<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="../css/layui.css">
    <script src="../js/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="admin_header.jsp"/>

    <jsp:include page="admin_dingdan_left.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <table id="demo" lay-filter="test"></table>
        <script>
            layui.use('table', function(){
                var table = layui.table;

                //第一个实例
                table.render({
                    elem: '#demo'
                    ,height: 315
                    ,url: '/user/trad' //数据接口
                    ,page: true//开启分页
                    ,limits:[10,15,20]
                    ,cols: [[ //表头
                        {field: 'time', title: '反馈时间', width:150, sort: true, fixed: 'left'}
                        ,{field: 'username', title: '反馈用户', width:150}
                        ,{field: 'content', title: '反馈内容', width:250, sort: true}
                    ]]
                });

            });
        </script>
    </div>


    <jsp:include page="admin_footer.jsp"/>

    <script type="text/html" id="barDemo">

        <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;

        });
    </script>
</body>
</html>

