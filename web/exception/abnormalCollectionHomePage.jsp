<%--
  Created by IntelliJ IDEA.
  User: huahu
  Date: 2018-6-28
  Time: 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
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
            margin-top: 100px;

        }

        .div2 {
            margin: 0 auto;
            width: 80%;
            height: 435px;
            border: 1px;
            overflow: auto;

        }
        .div5 {
            margin: 0 auto;
            width: 13%;
            height: 50px;
            border: 1px;
             border-width: 1px;
            border-style: solid;
            border-radius: 2px;
            margin-bottom: 10px;
            background-color: #d6e9c6;

        }

        .div3 {
            position: relative;
            display: block;
            box-sizing: border-box;
            background-color: white;
            margin-bottom: 30px;
            margin-outside: 30px;

        }

        .div4 {
            border-style: solid;
            height: 100%;
            width: 70%;
            background-color: white;
            margin-left: auto;
            margin-right: auto;

        }

        body {
            height: 100%;
            width: 100%;
        }

        .input1 {
            height: 50px;
            width: 70%;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            margin: 10px;
        }
        .font1{
            font-weight: bold;
            font-size: 30px;
            font-family: 微软雅黑;
            text-align: center;
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

        .layui-form-checkbox i {
            position: absolute;
            right: 0;
            top: 0;
            width: 30px;
            height: 30px;
            border: 1px solid #d2d2d2;
            border-left: none;
            border-radius: 0 2px 2px 0;
            color: #fff;
            font-size: 20px;
            text-align: center
        }



    </style>
    <script>


        $(function () {
            $("#login_click").click(function () {
                var keywords = $("#keywords").val();
                var types = null

                $(".cb").each(function () {
                    if (this.checked == true) {
                        types += "," + $(this).val();
                    }
                })
                alert(types)

                if (types == null) {
                    alert("请选择搜索方式")
                    return;
                } else {
                    var url = "${pageContext.request.contextPath}/exception/find";
                    var params = {
                        "name": keywords,
                        "types": types
                    };
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: JSON.stringify(params),
                        cache: false,
                        contentType: "application/json",
                        dataType: "json",
                        success: function (data) {
                            datas = data;
                            alert(data);
                        }
                    });

                }
            })
        })
    </script>
</head>
<body style="background:url(../images/5.jpg)">


<div class="div4">
    <form class="layui-form">
        <div class="div1">
            <input name="name" type="text" class="input1" id="keywords" placeholder="输入查询异常内容">
            <a>
                <input type="button" id="login_click" value="搜索"/>
            </a>

        </div>
        <div class="layui-form-item" style="margin-left: 90px">

                <span class="layui-input-block">
                    <input type="checkbox" name="ckb" title="CNDS" value="CNDS" class="cb">
                    <input type="checkbox" name="ckb" title="SEGMENTFAULT" value="SEGMENTFAULT" class="cb">
                    <input type="checkbox" name="ckb" title="STACKOVERFLOW" value="STACKOVERFLOW" class="cb">
                </span>
        </div>

    </form>


    <div class="div2" style="background-color: white">


    </div>

</div>


<script type="">
    layui.use('element', function () {
        var element = layui.element;
    });

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