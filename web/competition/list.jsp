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
    <script src="${pageContext.request.contextPath}/competition/js/jquery-1.12.4.js"></script>
    <link href="${pageContext.request.contextPath}/competition/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/competition/js/bootstrap.min.js"></script>
</head>
<style>
    a:link {
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
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
                    <input type="text" class="form-control" name="condition" id="exampleInputEmail1"
                           placeholder="搜索题目 名称"/>
                    <script type="text/javascript">
                        $(function () {
                            $("#searchSubmitId").click(function () {
                                var url = "/measurement/findByCondition";
                                var condition = $("#exampleInputEmail1").val();
                                $.post(
                                    url,
                                    condition,
                                    function (data) {
                                        $("#measurementTableId").empty();
                                        $(data).each(function () {
                                            var params = "";
                                            params += "<tr>" +
                                                "<!-- 序号 -->" +
                                                "<td>" + this.id + "</td>" +
                                                "<!-- 题目 -->" +
                                                "<td>" +
                                                "<a href=\"\">" + this.content + "</a>" +
                                                "<!-- 大头针 -->" +
                                                "<span class=\"glyphicon glyphicon-pushpin\" aria-hidden=\"true\"></span>" +
                                                "</td>" +
                                                "<!-- 解答图标 -->" +
                                                "<td>" +
                                                "<a href=\"${pageContext.request.contextPath}/competition/details.jsp\">" +
                                                "<span class=\"glyphicon glyphicon-list-alt\" aria-hidden=\"true\"></span>" +
                                                "</a>" +
                                                "</td>" +
                                                "<!-- 通过率 -->" +
                                                "<td>" + this.passrate + "</td>" +
                                                "<!-- 难度 -->" +
                                                "<td>";
                                            if (this.level == "1") {
                                                params += "<button type=\"button\" class=\"btn btn-success btn-default btn-xs\">简单</button>";
                                            } else if (this.level == "2") {
                                                params += "<button type=\"button\" class=\"btn btn-warning btn-default btn-xs\">中等</button>";
                                            } else if (this.level == "3") {
                                                params += "<button type=\"button\" class=\"btn btn-danger btn-default btn-xs\">困难</button>";
                                            }
                                            params += "</td>" +
                                                "</tr>";
                                            $("#measurementTableId").append(params);
                                        });
                                    },
                                    "json"
                                )
                            });
                        });
                    </script>
                </div>
                <!-- 搜索按钮 -->
                <div class="form-group col-md-2">
                    <input id="searchSubmitId" class="btn btn-default" type="submit" value="搜索">
                </div>
                <!-- 图标 -->
                <div class="dropdown col-md-1" style="padding-top: 2px">
                    <button type="button" class="btn btn-default" aria-label="Left Align" style="border: none;">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                    </button>
                </div>
                <!-- 下拉列表 -->
                <div class="dropdown col-md-1">
                    <button id="dropdownButtonId" style="border: 0px;" class="btn btn-default dropdown-toggle"
                            type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        难度
                        <span class="caret"></span>
                        <script type="text/javascript">
                            $(function () {
                                $("#dropdownButtonId").click(function () {
                                    $("#dropdownUlId").show("fast");
                                });
                                $("#dropdownButtonId").blur(function () {
                                    $("#dropdownUlId").hide("fast");
                                });
                            });
                        </script>
                    </button>
                    <span id="dropdownUlId" class="dropdown-menu" style="display: none">
                         <button type="button" class="btn btn-success btn-default btn-xs">
                             <a href="${pageContext.request.contextPath}/measurement/findByLevel.action?level=1">简单</a></button><br/>
                        <button type="button" class="btn btn-warning btn-default btn-xs">
                            <a href="${pageContext.request.contextPath}/measurement/findByLevel.action?level=2">中等</a></button><br/>
                        <button type="button" class="btn btn-danger btn-default btn-xs">
                            <a href="${pageContext.request.contextPath}/measurement/findByLevel.action?level=3">困难</a></button><br/>
                    </span>
                </div>
            </div>
            <table id="measurementTableId" class="table table-striped table-condensed table-hover">
                <tr>
                    <th>#</th>
                    <th>题目</th>
                    <th>解答</th>
                    <th>通过率</th>
                    <th>难度</th>
                </tr>
                <%--魏彤羽 页面加载成功数据遍历回显 start--%>
                <c:forEach items="${measurementList}" var="measurement">
                    <!-- table每行数据 -->
                    <tr>
                        <!-- 序号 -->
                        <td>${measurement.id}</td>
                        <!-- 题目 -->
                        <td>
                            <a href="">${measurement.content}</a>
                            <!-- 大头针 -->
                            <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>
                        </td>
                        <!-- 解答图标 -->
                        <td>
                            <a href="${pageContext.request.contextPath}/competition/details.jsp">
                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                            </a>
                        </td>
                        <!-- 通过率 -->
                        <td>${measurement.passrate}</td>
                        <!-- 难度 -->
                        <td>
                            <c:if test="${measurement.level == '1'}">
                                <button type="button" class="btn btn-success btn-default btn-xs">简单</button>
                            </c:if>
                            <c:if test="${measurement.level == '2'}">
                                <button type="button" class="btn btn-warning btn-default btn-xs">中等</button>
                            </c:if>
                            <c:if test="${measurement.level == '3'}">
                                <button type="button" class="btn btn-danger btn-default btn-xs">困难</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <%--魏彤羽 页面加载成功数据遍历回显 end--%>
            </table>

        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>
