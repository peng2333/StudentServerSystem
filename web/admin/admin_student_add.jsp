<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>
<link rel="stylesheet" href="../css/layui.css">
<script src="${pageContext.request.contextPath}/js/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <jsp:include page="admin_header.jsp"/>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item ">
          <a class="" href="admin_student.jsp">所有学生</a>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a href="admin_student_add.jsp">添加学生</a>
        </li>
        <li class="layui-nav-item">
          <a href="${pageContext.request.contextPath}/admin/admin_addstudent_all.jsp">批量学生</a>
        </li>
      </ul>
    </div>
  </div>

    <!-- 内容主体区域 -->
    <div class="layui-body" style="background-color: #E8E8E8">
      <!-- 内容主体区域 -->
      <div class="layui-card" style="margin: 10px; margin-right: 50px;">
        <div class="layui-card-header"><h1>添加学生</h1></div>
        <div class="layui-card-body">
          <form class="layui-form" action="${pageContext.request.contextPath}/user/insert" method="post">
            <div class="layui-form-item">
              <label class="layui-form-label">用户名</label>
              <div class="layui-input-inline">
                <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">必填选项</div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" name="name"    placeholder="请输入昵称" autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">如果为空则则会设置成默认新用户</div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">密码框</label>
              <div class="layui-input-inline">
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">如果为空则则会设置成默认123456</div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">身份</label>
              <div class="layui-input-block">
                <input type="radio" name="permission" value="2" title="用户" checked>
                <input type="radio" name="permission" value="1" title="管理员">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <textarea name="signature" placeholder="请输入内容" class="layui-textarea">该用户无话可说...</textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-block">
                <input type="submit" value="立即提交" class="layui-btn"  lay-filter="formDemo"/>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>


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

