<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="admin_header.jsp"/>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="admin_student.jsp">所有学生</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/admin_student_add.jsp">添加学生</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/admin_addstudent_all.jsp">批量学生</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <table id="demo" lay-filter="demo"></table>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>

            <!-- 这里同样支持 laytpl 语法，如： -->
            {{#  if(d.auth > 2){ }}
            <a class="layui-btn layui-btn-xs" lay-event="check">审核</a>
            {{#  } }}
        </script>
    </div>

    <script>
        layui.use('upload', function(){
            var $ = layui.jquery
                ,upload = layui.upload;
            //指定允许上传的文件类型
            upload.render({
                elem: '#test3'
                ,url: '/user/xlsxInsert'
                ,accept: 'file' //普通文件
                ,exts: 'xlsx'
                ,done: function(res){
                    console.log(res)
                    location.href='localhost:8080/admin/admin_student.jsp';
                }
            });
        });
    </script>

    <jsp:include page="admin_footer.jsp"/>
</div>
<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element','form'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element; //元素操作


        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 315
            ,url: '${pageContext.request.contextPath}/user/showStudent' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'uid', title: 'ID', width:80, sort: true, fixed: 'left'},
                {field: 'username', title: '用户名', width:120},
                {field: 'name', title: '昵称', width:100},
                {field: 'signature', title: '个性签名', width:450},
                {field: 'imageurl', title: '头像', width:180},
                {fixed: 'right', width:150, align:'center', toolbar: '#barDemo'} //这里的toolbar值是模板元素的选择器
            ]]
        });

        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.msg('切换了：'+ this.innerHTML);
            console.log(data);
        });
        //监听工具条
        table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                // layer.msg('查看操作');
                // layer.msg(data.uid);
                //request.setAttribute("uid",data.uid);
                /*layer.open({
                     title: '用户详情'
                    ,area: ['500px', '300px']
                    ,content:['data.uid','#check']
                 });*/

                layer.open({
                    title: '用户详情',
                    area: ['500px', '300px'],
                    closeBtn: false,
                    shade: 0.8,
                    btnAlign: 'c',
                    id: 'LAY_layuipro', //设定一个id，防止重复弹出
                    content:'<form class="layui-form" action="" lay-filter="example">\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">ID</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="uid" value='+data.uid+' autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">姓名</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="username" value='+data.username+' lay-verify="title" autocomplete="off"  class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">昵称</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="name" value='+data.name+'  autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">个性签名</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="signature" value='+data.signature+' autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">级别</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="permission"  value='+data.permission+' autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '\n' +
                    '</form>\n',
                    success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: ''
                            ,target: '_blank'
                        });
                    }
                });
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${pageContext.request.contextPath}/user/delete",{"uid":data.uid},function(){},"json");
                });
            } else if(layEvent === 'edit'){
                layer.open({
                    title: '用户详情',
                    area: ['500px', '300px'],
                    closeBtn: false,
                    shade: 0.8,
                    btnAlign: 'c',
                    id: 'LAY_layuipro', //设定一个id，防止重复弹出
                    content:'<form class="layui-form" action="" lay-filter="example">\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">ID</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="uid" value='+data.uid+' autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">姓名</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="username" value='+data.username+' lay-verify="title" autocomplete="off"  class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">昵称</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="name" value='+data.name+'  autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">个性签名</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="signature" value='+data.signature+' autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <label class="layui-form-label">级别</label>\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <input type="text" name="permission"  value='+data.permission+' autocomplete="off" class="layui-input">\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '\n' +
                    '    <div class="layui-form-item">\n' +
                    '        <div class="layui-input-block">\n' +
                    '            <button class="layui-btn" lay-submit="" lay-filter="demo1">确定修改</button>\n' +
                    '        </div>\n' +
                    '    </div>\n' +
                    '</form>\n',
                    success: function(layero){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').attr({
                            href: ''
                            ,target: '_blank'
                        });
                    }
                });
            }


        });

    });
</script>

</body>
</html>


