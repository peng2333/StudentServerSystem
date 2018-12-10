<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="../css/layui.css">
    <script src="../js/layui.all.js"></script>
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
        <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>导入Excel表格(只接受xlsx格式)</button>
        <form class="layui-form" action="">
            <%--<div class="layui-form-item">--%>
            <%--<div class="layui-input-block">--%>
            <%--<input type="checkbox" name="like[]" id="cover" title="覆盖原数据">--%>
            <%--</div>--%>
            <%--</div>--%>
        </form>
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
                    }
                });
            });
        </script>


        <jsp:include page="admin_footer.jsp"/>
    </div>

    <script>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;

        });
        layui.use('form', function(){
            var form = layui.form;
        });
    </script>

</body>
</html>
