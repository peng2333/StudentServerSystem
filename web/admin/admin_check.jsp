<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <style>  .div1 {
        position: relative;
    }

    .div2 {
        width: 100px;
        height: 36px;
        background: green;
        color: #fff;
        text-align: center;
        line-height: 36px;
    }

    .file_input {
        width: 200px; /*因为file-input在部分浏览器中会自带一个输入框，需要双击才可以点击上传,放大后将其定位到div外面就好啦*/
        height: 36px;
        position: relative;
        top: -36px;
        left: -25px;
        z-index: 1;
        -moz-opacity: 0;
        -ms-opacity: 0;
        -webkit-opacity: 0;
        opacity: 0; /*css属性——opcity不透明度，取值0-1*/
        filter: alpha(opacity=0); /*兼容IE8及以下--filter属性是IE特有的，它还有很多其它滤镜效果，而filter: alpha(opacity=0); 兼容IE8及以下的IE浏览器(如果你的电脑IE是8以下的版本，使用某些效果是可能会有一个允许ActiveX的提示,注意点一下就ok啦)*/
        cursor: pointer;
    }</style>
    <jsp:include page="admin_header.jsp"/>

    <jsp:include page="admin_dingdan_left.jsp"/>
    <div class="layui-body" style="background-color: #E8E8E8">

        <div align="center">

            <form action="${pageContext.request.contextPath}/QRcodeCheck" enctype="multipart/form-data" method="post">

                <div class="div1">
                    <div class="div2">点击上传</div>
                    <input type="file" class="file_input" name="file">
                </div>

                <br/>
                <input type="submit" value="查询" class="layui-btn"/>
            </form>


            ${msg}
            <c:if test="${not empty list}">
                <table class="layui-table" style="width: 600px">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>

                    <thead>
                    <tr style="background-color: #0C0C0C;color: whitesmoke">
                        <th>商品名</th>
                        <th>数量</th>
                        <th>价格</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td>${list.food.fname}</td>
                            <td>${list.foodNumber}</td>
                            <td>${list.priceSum}</td>
                        </tr>


                    </c:forEach>

                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
    <jsp:include page="admin_footer.jsp"/>
</div>


</body>
</html>

