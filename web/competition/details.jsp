<%--
  Created by IntelliJ IDEA.
  User: 神秘人
  Date: 2018/6/28
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" id="bootstrap-css" href="${pageContext.request.contextPath}/competition/css/bootstrap.min.css"
      type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath}/competition/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/competition/js/bootstrap.min.js"></script>
<style>
    .box {
        width: 75%;
        margin: 0 auto;
        margin-top: 30px;
    }

    .title {
        padding-bottom: 30px;
        margin-left: 10px;
        font-size: 22px;
    }

    .u1 {
        float: left;
        margin-top: 20px;
        margin-left: -33px;
    }

    .u2 {
        float: right;
        margin-top: 34px;
        margin-right: 50px;
    }

    li {
        list-style: none;
        font-size: 14px;
        padding-bottom: 10px;
    }

    .u2 > li {
        padding-bottom: 15px;
    }

    .pull-left {
        float: left !important;
    }

    .pull-right {
        float: right !important;
    }

</style>

<script>

</script>
<body style="background-color: #fff">
<div>
    <%@include file="header.jsp" %>
    <div class="box">
        <c:if test="${obj == null}">
            <div class="title">无重复字符的最长子串</div>
        </c:if>
        <c:if test="${obj != null}">
            <div class="title">${obj.content}</div>
        </c:if>

        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#home" data-toggle="tab">
                    题目描述
                </a>
            </li>
            <li><a href="#ios" data-toggle="tab">阅读解答</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="home">
                <div>
                    <ul class="u1">
                        <c:if test="${obj == null}">
                            <li style="color: red">给定一个字符串，找出不含有重复字符的最长子串的长度。</li>
                        </c:if>
                        <c:if test="${obj != null}">
                            <li style="color: red">${obj.content}</li>
                        </c:if>
                        <li style="font-weight: bold"> 示例:</li>
                        <li>1.给定 "abcabcbb" ，没有重复字符的最长子串是 "abc" ，那么长度就是3。</li>
                        <li>2.给定 "bbbbb" ，最长的子串就是 "b" ，长度是1。</li>
                        <li>3.给定 "pwwkew" ，最长子串是 "wke" ，长度是3。请注意答案必须是一个子串，"pwke" 是 子序列 而不是子串。</li>
                    </ul>
                    <ul class="u2">
                        <li>题目难度:
                            <c:if test="${obj.level =='1'}">
                                <button type="button" class="btn btn-success btn-default btn-xs">简单</button>
                            </c:if>
                            <c:if test="${obj.level =='2'}">
                                <button type="button" class="btn btn-warning btn-default btn-xs">中等</button>
                            </c:if>
                            <c:if test="${obj.level =='3'}">
                                <button type="button" class="btn btn-danger btn-default btn-xs">困难</button>
                            </c:if>
                        </li>
                        <li>通过次数: <span>${obj.tnumber}次</span></li>
                        <li>提交次数: <span>${obj.allnumber}次</span></li>
                        <li>贡献者: <span>${obj.user.username}</span></li>
                    </ul>
                </div>
            </div>
            <div class="tab-pane fade" id="ios">
                <c:if test="${obj == null}">
                    <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                        TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
                </c:if>
                <c:if test="${obj != null}">
                <p>${obj.answer}</p>
                </c:if>
            </div>
        </div>

    </div>
    <div class="box">
        <iframe src="https://tool.lu/coderunner/embed/4SI.html" style="background-color: #fff1f3" width="100%"
                height="550" frameborder="0" mozallowfullscreen webkitallowfullscreen allowfullscreen></iframe>
    </div>
    <div class="box">
        <button type="submit" height="100" id="sbm" class="btn btn-primary pull-right">提交你的答案</button>
        <script>
            $(function () {
                $("#sbm").click(function () {
                    //点击后弹出一个询问框
                    if (confirm("确定提交么?提交后无法更改")) {
                        alert("提交成功")
                    }

                })
            })
        </script>
    </div>
    <div class="box" height="100px">
    </div>
</div>
</body>
</html>
