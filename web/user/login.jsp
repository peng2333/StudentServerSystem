<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script src="../js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
    <style>
        /*样式1*/
        .a-upload {
            padding: 4px 10px;
            height: 20px;
            line-height: 20px;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .a-upload  input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }

        .a-upload:hover {
            color: #444;
            background: #eee;
            border-color: #ccc;
            text-decoration: none
        }

    </style>
</head>
<body style="margin: 0px">
<%--header--%>

<%

    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if ("user".equals(cookie.getName())) {
            String[] split = cookie.getValue().split("@");
            String username = split[0];
            String password = split[1];
            request.setAttribute("username", username);
            request.setAttribute("password", password);

            break;
        }
    }
%>

<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">登入</li>
                <li>二维码登入</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form action="${pageContext.request.contextPath}/user/login" method="post">
                            <div class="layui-form-item">
                                <label for="L_email" class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_email" name="username" required lay-verify="required"
                                           autocomplete="off" class="layui-input" value="${username}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_pass" class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_pass" name="password" required lay-verify="required"
                                           autocomplete="off" class="layui-input" value="${password}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <!--记住我-->
                                <label class="layui-form-label">记住我</label>
                                <div class="layui-input-block">
                                    <input type="checkbox" ${empty username ? "":"checked=checked"} name="remberme"
                                           lay-skin="switch" lay-text="开启|关闭">
                                </div>
                            </div>
                            <div>
                                ${msg}
                            </div>
                            <div class="layui-form-item">
                                <input type="submit" class="layui-btn" lay-filter="*" value="立即登录" lay-submit v/>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="layui-tab-item">
                    <div class="layui-form-item">
                        <form method="post" action="${pageContext.request.contextPath}/user/qrCodeLogin"  enctype="multipart/form-data">
                            <a href="javascript:;" class="a-upload">
                                <input name="file" type="file">点击这里上传二维码图片
                            </a>
                            <br/>
                            <br/>
                            <br/>
                            <input type="submit" value="登录" class="layui-btn"/>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--footer--%>
<script>
    layui.use('form', function () {
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
    layui.cache.page = 'user';
    layui.config({
        version: "3.0.0"
        , base: '../mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

</body>
</html>