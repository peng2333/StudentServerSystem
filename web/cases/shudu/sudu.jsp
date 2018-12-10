<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,user-scalable=no" />
	<title>数独游戏</title>
	<link rel="Stylesheet" type="text/css" href="${pageContext.request.contextPath}/cases/shudu/soduku.css" />
</head>
<body>
	<div class = "btn-group">
		<button onclick = "sd.checkRes();">完成</button>
		<button onclick = "sd.reset();">重置</button>
		<button onclick = "sd.again();">重玩本局</button>
	</div>
	<script src="http://apps.bdimg.com/libs/jquery/1.8.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/cases/shudu/soduku.js"></script>
	<script>
		var sd = new SD;
		sd.init(30);
	</script>
</body>
</html>