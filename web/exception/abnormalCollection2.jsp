<%--
  Created by IntelliJ IDEA.
  User: huahu
  Date: 2018-6-28
  Time: 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/bootstrap-3.3.4.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-1.12.4.js"></script>


    <style type="text/css">


        .div1 {
            margin: 0 auto;
            width: 90%;
            height: 70px;
            text-align: center;
            opacity: 0.6;

        }

        .div2 {
            margin: 0 auto;
            width: 80%;
            height: 500px;
            border: 1px;
            opacity: 0.6;
            height: 100%;
            background-color: white

        }

        .div3 {
            position: relative;
            display: block;
            box-sizing: border-box;
            background-color: white;
            opacity: 0.6;

        }

        .input1 {
            height: 50px;
            width: 70%;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            margin: 10px;
            background-color: black;
            color: rgba(253, 252, 254, 0.99);
            font-size: 20px;
        }

        .radioGroup label::before, .radioGroup label::after {
            content: '';
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            margin: auto;
            width: 1em;
            height: 1em;
            border-radius: 50%;
        }

        .radioGroup label::before {
            box-shadow: 0 1px 0 rgba(255, 255, 255, 0.25),
            0 2px 5px 6px rgba(0, 0, 0, 0.5) inset;
        }

        .radioGroup label::after {
            background: #79EAC5;
            opacity: .2;
            -webkit-transform: scale(0);
            -ms-transform: scale(0);
            -o-transform: scale(0);
            transform: scale(0);
            -webkit-transition: .3s;
            -o-transition: .3s;
            transition: .3s;
        }

        .radioGroup label:hover::after {
            -webkit-transform: scale(0.6);
            -ms-transform: scale(0.6);
            -o-transform: scale(0.6);
            transform: scale(0.6);
            opacity: 1;
            -webkit-transition: 0.2s;
            -o-transition: 0.2s;
            transition: 0.2s;
        }

        .radioGroup input:checked + label::after {
            -webkit-transform: scale(0.8);
            -ms-transform: scale(0.8);
            -o-transform: scale(0.8);
            transform: scale(0.8);
            opacity: 1;
            box-shadow: 0 0 15px -1px #79EAC5;
        }

        #login_click {
            margin-top: 10px;
            height: 45px;
        }

        #login_click {

            text-decoration: none;
            background: #2f435e;
            color: #f2f2f2;

            padding: 10px 30px 10px 30px;
            font-size: 16px;
            font-family: 微软雅黑, 宋体, Arial, Helvetica, Verdana, sans-serif;
            font-weight: bold;
            border-radius: 3px;

            -webkit-transition: all linear 0.30s;
            -moz-transition: all linear 0.30s;
            transition: all linear 0.30s;

        }

        #login_click:hover {
            background: #385f9e;
        }
        input[type="checkbox"] + label {
            cursor: pointer;
            font-size: 1em;
        }
        [id^="checkbox-"] + label {
            background-color: #ffffff;
            border: 1px solid #666666;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05);
            padding: 9px;
            border-radius: 3px;
            display: inline-block;
            vertical-align: middle;
        }
        [id^="checkbox-"] + label:active {
            box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }
        [id="checkbox-1"]:checked + label {
            background-color: #F47164;
            border: 1px solid #F47164;
        }
        [id="checkbox-2"]:checked + label {
            background-color: #84CBC5;
            border: 1px solid #84CBC5;
        }
        [id="checkbox-3"]:checked + label {
            background-color: #F8D25D;
            border: 1px solid #F8D25D;
        }

    </style>
    <script>
        layui.use('element', function () {
            var element = layui.element;

            //…
        });
    </script>
</head>
<body>

<div class="fly-header layui-bg-black">
    <div class="layui-container">
        <a class="fly-logo" href="/">
            <img src="/images/Java_64px_1121656_easyicon.net.png" alt="layui">
        </a>
        <%--<ul class="layui-nav fly-nav layui-hide-xs">--%>
            <%--<li class="layui-nav-item menu">--%>
                <%--<a href="/netdisk/index.jsp" target="iFrame_main"><i class="iconfont icon-iconmingxinganli"></i>资源中心</a>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item menu">--%>
                <%--<a href="/case/WangShuang" target="iFrame_main"><i class="iconfont icon-daima"></i>交流互助中心</a>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item menu">--%>
                <%--<a href="/yestodayOrder" target="iFrame_main"><i class="iconfont icon-jiaoliu"></i>早点服务</a>--%>
            <%--</li>--%>
        <%--</ul>--%>

        <ul class="layui-nav fly-nav-user">


            <!-- 未登入的状态 -->
            <li class="layui-nav-item">
                <a class="iconfont icon-touxiang layui-hide-xs" href="/user/login.jsp" target="iFrame_main"></a>
            </li>
            <li class="layui-nav-item">
                <a href="/user/login.jsp" target="iFrame_main">登入</a>
            </li>
        </ul>
    </div>
</div>


<div style="background:url(../images/6.jpg);width: 100%;height: 100%">

    <form class="layui-form" action="">
        <div class="div1">
            <input type="text" class="input1" id="keywords" placeholder="输入查询异常内容">
            <a>
                <input type="submit" id="login_click" value="搜索"/>
            </a>

        </div>
        <label style="margin-left: 55px; margin-right: 16px;">状态:</label>
        <input type="checkbox" value="0" class="check_view_state"
               id="checkbox-1" style="display: none;">
        <label for="checkbox-1"></label>
        <span class="status">未读</span>

        <input type="checkbox" value="1" class="check_view_state"
               id="checkbox-2" style="display: none;">
        <label for="checkbox-2"></label>
        <span class="status">已读</span>

        <input type="checkbox" value="2" class="check_view_state"
               id="checkbox-3" style="display: none;">
        <label for="checkbox-3"></label>
        <span class="status">未授权</span>

    </form>


    <div class="div2">
        <div class="div3 layui-collapse" lay-accordion>
            <div class="layui-collapse input1" lay-accordion style="margin-left:auto;margin-right:auto;">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">杜甫</h2>
                    <div class="layui-colla-content layui-show">内容区域</div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">李清照</h2>
                    <div class="layui-colla-content layui-show">内容区域</div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">鲁迅</h2>
                    <div class="layui-colla-content layui-show">内容区域</div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">鲁迅</h2>
                    <div class="layui-colla-content layui-show">内容区域</div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">鲁迅</h2>
                    <div class="layui-colla-content layui-show">内容区域</div>
                </div>


            </div>
        </div>
    </div>
</div>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>


</body>
</html>