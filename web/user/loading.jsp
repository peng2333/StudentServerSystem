<%--
  Created by IntelliJ IDEA.
  User: XDerhuo
  Date: 2018/6/7
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
    <script>
        $(function () {
            parent.location.reload(true);
            window.location.href="${pageContext.request.contextPath}/";
        })
    </script>
</body>
</html>
