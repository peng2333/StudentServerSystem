<%--
  Created by IntelliJ IDEA.
  User: yangchen
  Date: 2018/6/28
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>控制台</title>
    <script src="${pageContext.request.contextPath}/competition/js/jquery-1.11.3.min.js"></script>
    <script src="/competition/js/jquery-1.12.4.js"></script>
    <link href="${pageContext.request.contextPath}/competition/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/competition/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/competition/css/bootstrap.css" rel="stylesheet">
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
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="搜索题目 名称、内容 或 编号">
                </div>
                <script type="text/javascript">
                    $(function () {
                        $("#sumbitId").click(function () {
                            var url = "/bg/findByCondition";
                            var params = {condition: $("#exampleInputEmail1").val()};
                            $.post(
                                url,
                                params,
                                function (data) {
                                    $("#tableId").empty();
                                    $(data).each(function (index) {
                                        var index = index+1;
                                        var table = "";
                                        table += "<tr>" +
                                            "<!-- 序号 -->" +
                                            "<td>" + index + "</td>" +
                                            "<!-- 题目 -->" +
                                            "<td>" +
                                            "<a href=\"\" style='color:black'>" + this.content.substring(-1,45) + "</a>" +
                                            "</td>" +
                                            "<!-- 解答图标 -->" +
                                            "<td>" +
                                            "<a href="+'/bg/answer?id='+this.id+" style='color:black' title="+this.answer+">" +
                                            "<span class=\"glyphicon glyphicon-list-alt\" aria-hidden=\"true\"></span>" +
                                            "</a>" +
                                            "</td>" +
                                            "<!-- 通过率 -->" +
                                            "<td>" + this.tnumber/this.allnumber*100+"%" + "</td>" +
                                            "<!-- 难度 -->" +
                                            "<td>";
                                        if (this.level == "1") {
                                            table += "<button type=\"button\" class=\"btn btn-success btn-default btn-xs\">简单</button>";
                                        } else if (this.level == "2") {
                                            table += "<button type=\"button\" class=\"btn btn-warning btn-default btn-xs\">中等</button>";
                                        } else if (this.level == "3") {
                                            table += "<button type=\"button\" class=\"btn btn-danger btn-default btn-xs\">困难</button>";
                                        }
                                        table+="</td>";
                                        table+="<td>"+"<center>";
                                        table+="<a href="+'/bg/redact?id='+this.id+" style=\"color: #3b3b3b\" title=\"更改\"><span class=\"glyphicon glyphicon-wrench\" aria-hidden=\"true\"></span> </a>";
                                        table+="<a href="+'/bg/deleteObj?id='+this.id+" style=\"color: #3b3b3b\" title=\"删除\"><span class=\"glyphicon glyphicon-remove-sign\" aria-hidden=\"true\"></span> </a>";
                                        table+="<a href="+'/bg/getmeasure?id='+this.id+" style=\"color: #3b3b3b\" title=\"发布\"><span class=\"glyphicon glyphicon-globe\" aria-hidden=\"true\"></span></a>";
                                        table += "</center>"+"</td>" +
                                            "</tr>";
                                        $("#tableId").append(table);
                                    });
                                },
                                "json"
                            )
                        });
                    });
                </script>
                <!-- 搜索按钮 -->
                <div class="form-group col-md-2">
                    <input id="sumbitId" class="btn btn-default" type="button" value="搜索">
                </div>
                <!-- 图标 -->
                <div class="dropdown col-md-1" style="padding-top: 2px">
                    <button type="button" class="btn btn-default" aria-label="Left Align" style="border: none;">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                    </button>
                </div>
                <!-- 下拉列表 -->
                <div class="dropdown col-md-1">
                    <button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
                    <%--<button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button"--%>
                    <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">--%>
                    <%--状态--%>
                    <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">--%>
                    <%--<li><a href="#">未做</a></li>--%>
                    <%--<li><a href="#">已解答</a></li>--%>
                    <%--<li><a href="#">尝试过</a></li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="dropdown col-md-1">--%>
                    <%--<button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button"--%>
                    <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">--%>
                    <%--类表--%>
                    <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div class="dropdown col-md-1">--%>
                    <%--<button style="border: 0px;" class="btn btn-default dropdown-toggle" type="button"--%>
                    <%--data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">--%>
                    <%--标签--%>
                    <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                </div>
                <table class="table table-striped table-condensed table-hover">
                    <tr>
                        <th><span class="glyphicon glyphicon-tags" aria-hidden="true"></span></th>
                        <th>题目</th>
                        <th>解答</th>
                        <th>通过率</th>
                        <th>难度</th>
                        <th>
                            <center>操作</center>
                        </th>
                    </tr>
                    <tbody id="tableId">
                    <!-- table每行数据 -->
                    <c:forEach items="${list}" var="m" varStatus="s">
                        <tr>
                            <!-- 序号 -->
                            <td>${s.count}</td>
                            <!-- 题目 -->
                            <td>
                                <a href="" style="color: #3b3b3b">
                                    <c:if test="${fn:length(m.content) >= 20}">
                                        ${fn:split(m.content,"，")[0]}...
                                    </c:if>
                                    <c:if test="${fn:length(m.content) < 10}">
                                        ${m.content}
                                    </c:if>
                                </a>
                                <!-- 大头针 -->

                            </td>
                            <!-- 解答图标 -->
                            <td>
                                <a href="/bg/answer?id=${m.id}" style="color: black" title="${m.answer}">
                                    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                                </a>
                            </td>
                            <!-- 通过率 -->
                            <td>${m.tnumber/m.allnumber*100}%</td>
                            <!-- 难度 -->
                            <td>
                                <c:if test="${m.level =='1'}">
                                    <button type="button" class="btn btn-success btn-default btn-xs">简单</button>
                                </c:if>
                                <c:if test="${m.level =='2'}">
                                    <button type="button" class="btn btn-warning btn-default btn-xs">中等</button>
                                </c:if>
                                <c:if test="${m.level =='3'}">
                                    <button type="button" class="btn btn-danger btn-default btn-xs">困难</button>
                                </c:if>
                            </td>
                            <td>
                                <center>
                                    <a href="/bg/redact?id=${m.id}" style="color: #3b3b3b" title="更改"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> </a>
                                    <a href="/bg/deleteObj?id=${m.id}" style="color: #3b3b3b" title="删除"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span> </a>
                                    <a href="/bg/getmeasure?id=${m.id}" style="color: #3b3b3b" title="发布"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span></a>
                                </center>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <div class="col-md-2"></div>
        </div>

</body>
</html>
