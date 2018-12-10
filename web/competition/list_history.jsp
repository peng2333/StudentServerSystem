<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yangchen
  Date: 2018/6/28
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>题库</title>
    <script src="${pageContext.request.contextPath}/competition/js/jquery-1.11.3.min.js"></script>
    <link href="${pageContext.request.contextPath}/competition/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/competition/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/competition/css/bootstrap.css" rel="stylesheet">
</head>
<style>
    a:link{text-decoration:none;}
    a:hover{text-decoration:underline;}
</style>
<body style="background-color: #fff">
<jsp:include page="header.jsp"></jsp:include>
<div class="layui-container fly-marginTop ">
<div class="row" style="padding-top: 20px">
    <div class="col-md-2"></div>
    <div class="col-md-8" style="background-color: #FFF">
        <div class="row">
            <!-- 搜索栏 -->
            <div class="form-group col-md-5">
                <input type="" class="form-control" id="exampleInputEmail1" placeholder="搜索题目 名称、内容 或 编号">
            </div>
            <!-- 搜索按钮 -->
            <div class="form-group col-md-2">
                <input class="btn btn-default" type="submit" value="搜索">
            </div>
            <!-- 图标 -->
            <div class="dropdown col-md-1" style="padding-top: 2px">
                <button type="button" class="btn btn-default" aria-label="Left Align" style="border: none;">
                    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                </button>
            </div>
            <!-- 下拉列表 -->
            <div class="dropdown col-md-1">
                <button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    难度
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#">简单</a></li>
                    <li><a href="#">中等</a></li>
                    <li><a href="#">困难</a></li>
                </ul>
            </div>
            <div class="dropdown col-md-1">
                <button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    状态
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#">未做</a></li>
                    <li><a href="#">已解答</a></li>
                    <li><a href="#">尝试过</a></li>
                </ul>
            </div>
            <div class="dropdown col-md-1">
                <button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    类表
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                </ul>
            </div>
            <div class="dropdown col-md-1">
                <button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    标签
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                </ul>
            </div>
        </div>
        <c:if test="${list!=null}">


        <table class="table table-striped table-condensed table-hover" >
            <tr>
                <th> </th>
                <th>题目</th>
                <th>解答</th>
                <th>通过率</th>
                <th>难度</th>
            </tr>
            <!-- table每行数据 -->
            <c:forEach items="${list}" var="measure" varStatus="a"  >
                <tr>
                    <!-- 序号 -->
                    <td>${a.count}</td>
                    <!-- 题目 -->
                    <td>
                        <a href=""><font color="black">${measure.content}</font></a>
                        <!-- 大头针 -->
                        <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                    </td>
                    <!-- 解答图标 -->
                    <td>
                        <a href="" style="color: black">
                            <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                        </a>
                    </td>
                    <!-- 通过率 -->
                    <td>${measure.passrate}</td>
                    <c:if test="${measure.level==1}">
                        <td>
                            <button type="button" class="btn btn-success btn-default btn-xs">简单</button>
                        </td>
                    </c:if>

                    <c:if test="${measure.level==2}">
                        <td>
                            <button type="button" class="btn btn-warning btn-default btn-xs">中等</button>
                        </td>
                    </c:if>

                    <c:if test="${measure.level==3}">
                        <td>
                            <button type="button" class="btn btn-danger btn-default btn-xs">困难</button>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            <%--<tr>
                         <!-- 序号 -->
                <td>1</td>
                <!-- 题目 -->
                <td>
                    <a href=""><font color="black">两数之和x</font></a>
                    <!-- 大头针 -->
                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                </td>
                <!-- 解答图标 -->
                <td>
                    <a href="" style="color: black">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                    </a>
                </td>
                <!-- 通过率 -->
                <td>45.8%</td>
                <!-- 难度 -->
                <td>
                    <button type="button" class="btn btn-success btn-default btn-xs">简单</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>
                    <a href=""><font color="black">1比特与2比特字符</font></a>

                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                </td>
                <td></td>
                <td>45.8%</td>
                <td>
                    <button type="button" class="btn btn-warning btn-default btn-xs">中等</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>
                    <a href="">132模式</a>
                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                </td>
                <td></td>
                <td>45.8%</td>
                <td>
                    <button type="button" class="btn btn-danger btn-default btn-xs">困难</button>
                </td>
            </tr>
            <tr>
                <td>4</td>
                <td>
                    <a href="">只有两个键的键盘</a>
                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                </td>
                <td>
                    <a href="">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                    </a>
                </td>
                <td>45.8%</td>
                <td>
                    <button type="button" class="btn btn-success btn-default btn-xs">简单</button>
                </td>
            </tr>
            <tr>
                <td>5</td>
                <td>
                    <a href="">24点游戏</a>
                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                </td>
                <td>
                    <a href="">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                    </a>
                </td>
                <td>45.8%</td>
                <td>
                    <button type="button" class="btn btn-warning btn-default btn-xs">中等</button>
                </td>
            </tr>--%>
        </table>
        </c:if>
        <c:if test="${list==null}">
            <h1>您还没有竞赛历史,快来竞赛吧</h1>
        </c:if>
    </div>
</div>
</div>
</body>
</html>
