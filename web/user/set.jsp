<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>帐号设置</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="../css/layui.css">
  <link rel="stylesheet" href="../css/global.css">
  <script src="../js/layui.js" type="text/javascript" charset="utf-8"></script>
  <script src="../js/jquery-1.12.4.js" type="text/javascript" charset="UTF-8"></script>

</head>

<body style="margin: 0px">

<%--header--%>
<script type="text/javascript">
  $(function () {
      $("#ulId li").each(function () {
          $(this).removeClass("layui-this");
      })
      $("#setId").addClass("layui-this");

      $(function () {
          $("#form_pass").submit(function () {
              $("#msg").html("");
              var pass = $("#L_pass").val();
              var repass = $("#L_repass").val();
              alert(pass);
              alert(repass);
              if (pass!=repass){
                  $("#msg").html("两次密码不相符");
                  return false;
              }
          })
      })

  })
</script>
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
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li lay-id="info" class="layui-this">我的资料</li>
        <li lay-id="avatar">头像</li>
        <li lay-id="pass">密码</li>
        <li lay-id="qrcode">二维码</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div ${empty msg ? 'class="layui-form layui-form-pane layui-tab-item layui-show"' : 'class="layui-form layui-form-pane layui-tab-item"'}>
          <form action="${pageContext.request.contextPath}/user/setzl" method="post">
            <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" id="L_username" name="name" required lay-verify="required" autocomplete="off" value="${sessionScope.user.name}" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label for="L_sign" class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="signature" autocomplete="off" class="layui-textarea" style="height: 80px;" >${sessionScope.user.signature}</textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <input type="submit" class="layui-btn" key="set-mine" lay-filter="*" value="确认修改"/>
            </div>
          </form>
          </div>

          <div class="layui-form layui-form-pane layui-tab-item">
            <div class="layui-form-item">
              <div class="avatar-add">
                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
                <button type="button" class="layui-btn" name="picfile" id="userimage" style="margin-left: 130px; margin-top: 30px">
                  <i class="layui-icon">&#xe67c;</i>上传头像
                </button>
                <img src="${pageContext.request.contextPath}${user.imageurl}">
                <span class="loading"></span>
              </div>
            </div>
          </div>

          <div ${not empty msg ? 'class="layui-form layui-form-pane layui-tab-item layui-show"' : 'class="layui-form layui-form-pane layui-tab-item"'}>
            <form action="${pageContext.request.contextPath}/user/setingpass" method="post" id="form_pass">
              <div class="layui-form-item">
                <label for="L_nowpass" class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_nowpass" name="oldpassword" required lay-verify="required" autocomplete="off" class="layui-input" value="">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="password" required lay-verify="required" autocomplete="off" class="layui-input" >
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div id="msg">
                ${msg}
              </div>
              <div class="layui-form-item">
                <input type="submit" class="layui-btn" key="set-mine" lay-filter="*" value="确认修改" ></input>
              </div>
            </form>
          </div>
          <div class="layui-form layui-form-pane layui-tab-item">
            <br/><br/>
            <img src="${pageContext.request.contextPath}${sessionScope.userQRCode.codeurl}" style="width: 150px; height: 150px;"><br/><br/>
            <a  class="layui-btn" href="${pageContext.request.contextPath}/user/download?codeurl=${sessionScope.userQRCode.codeurl}">下载二维码</a>
          </div>
        </div>

        </div>

      </div>
    </div>
  </div>
</div>

<%--footer--%>

<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<script>
layui.cache.page = 'user';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: '../mods/'
}).extend({
  fly: 'index'
}).use('fly');

layui.use('upload', function(){
    var upload = layui.upload;

    //执行实例
    var uploadInst = upload.render({
        elem: '#userimage' //绑定元素
        ,url: '${pageContext.request.contextPath}/user/uimgUpdate' //上传接口
        ,accept: 'file' //普通文件
        ,exts: 'jpg|png'//只允许上传压缩文件
        ,done: function(res){
            //上传完毕回调
            alert("上传成功！")
            parent.location.reload(true);
        }
        ,error: function(){
            //请求异常回调
            alert("上传失败，请重新上传符合要求的文件");
        }
    });
});
</script>

</body>
</html>