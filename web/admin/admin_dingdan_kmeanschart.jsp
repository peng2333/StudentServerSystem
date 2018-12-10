<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>
<link rel="stylesheet" href="../css/layui.css">
    <script src="../js/layui.js"></script>
	<script src="../js/echarts.min.js"></script>
	<script src="../js/jquery-1.12.4.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="admin_header.jsp"/>

    <jsp:include page="admin_dingdan_left.jsp"/>

    <div class="layui-body" style="background-color: #E8E8E8">
    	<!-- 内容主体区域 -->
		<div class="layui-card" style="margin: 10px; margin-right: 50px;">
			<div id="main" style="width: 1200px;height:800px;"></div>
		</div>
	</div>
</div>

    <jsp:include page="admin_footer.jsp"/>
</body>
<script type="text/javascript">
	var url = "${pageContext.request.contextPath}/kmeans/init";
	var pointdata;
	var seriesdata;
    // $.post(url,params,function (datas) {
		// pointdata = datas[pointdata];
		// seriesdata = datas[seriesdata];
    // },"json");
    $.ajax({
        url: url,
        type: "POST",
        data: "",
        cache: false,
        dataType: "json",
        async:false,  //同步方式发起请求
        success: function (data) {
            pointdata = data.pointdata;
            seriesdata = data.seriesdata;
        }
    });
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        xAxis: {
            name: 'Days',
            scale: true
        },
        yAxis: {
            name: 'Days',
            scale: true
        },
        series: [{
            type: 'effectScatter',
            symbolSize: 20,
            data: seriesdata
        }, {
            type: 'scatter',
            data: pointdata,
        }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

</html>

