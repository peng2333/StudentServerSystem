<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>layout 后台大布局 - Layui</title>
	<link rel="stylesheet" href="../css/layui.css">
	<script src="../js/layui.js" charset="utf-8"></script>
	<script src="../js/jquery-1.12.4.js" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<jsp:include page="admin_header.jsp"/>

	<jsp:include page="admin_dingdan_left.jsp"/>

	<div class="layui-body">

	<%--	<div>
			<button class="layui-btn" id="add" style="width:150px"><h2>添加商品</h2></button>
		</div>--%>

		<!-- 内容主体区域 -->
		<table id="demo" lay-filter="test" ></table>
		<script>
            layui.use('table', function(){
                var table = layui.table;

                //第一个实例
                table.render({
                    elem: '#demo'
                    ,height: 315
                    ,url: '${pageContext.request.contextPath}/order/findAllOrders' //数据接口
                    ,cols: [[ //表头
                        {field: 'ordersNumber', title: '订单编号', width:140, sort: true, fixed: 'left'}
                        ,{field: 'createTime', title: '订单创建时间', width:140}
                        ,{field: 'ordersRemark', title: '订单备注', width:140, sort: true}
                        ,{field: 'ordersPrice', title: '订单总价', width:140, sort: true}
                        ,{field: 'ordersState', title: '订单状态', width:140, sort: true}
                        ,{field: 'sid', title: '订单对应商家id', width:140, sort: true}
                        ,{field: 'uid', title: '订单对应用户id', width:140, sort: true}
                        ,{fixed: 'right', title: '操作', width:150, align:'center', toolbar: '#barDemo'}
                    ]]

                    ,page: true
                    ,limits:[10,15,20]

                    , done:function(res,curr,count){
                        //如果是异步请求数据方式，res即为你接口返回的信息。
                        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                        console.log(res);

                        //得到当前页码
                        console.log(curr);

                        //得到数据总量
                        console.log(count);
                    }
                });

                table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                    var data = obj.data; //获得当前行数据
                    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    var tr = obj.tr; //获得当前行 tr 的DOM对象
                    if(layEvent === 'detail'){ //查看
                        //do somehing
                    } else if(layEvent === 'del'){ //删除
                        layer.confirm('真的删除行么', function(index){
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            layer.close(index);
                            //向服务端发送删除指令
                            $(function () {
                                $.ajax({
                                    type:"post",
                                    url:"${pageContext.request.contextPath}/order/deleteOrder",
                                    data:{"ordersNumber":data.ordersNumber}
                                });
                            });

                        });
                    } else if(layEvent === 'edit'){ //编辑
                        layer.open({
                            //do something
                            // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                            //同步更新缓存对应的值
                            type: 1,
                            area: ['700px', '500px'],
                            content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><h1>修改订单</h1></br>' +
                            '<form class="layui-form" action="${pageContext.request.contextPath}/order/editOrder" method="post"> '+
                            '<div class="layui-form-item"><label class="layui-form-label">订单编号：</label><div class="layui-input-block"><input type="text" name="ordersNumber" lay-verify="title" autocomplete="off" class="layui-input" value='+data.ordersNumber+'></div> </div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">订单创建时间：</label><div class="layui-input-block"><input type="text" name="createTime" id="test1" lay-verify="title" placeholder="yyyy-MM-dd" class="layui-input" value='+data.createTime+'> </div> </div></br>' +
                            // '星级：<input type="text" name="shopStar" value=\'+data.shopStar+\'></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">订单备注：</label><div class="layui-input-block"><input type="text" name="ordersRemark" lay-verify="title" autocomplete="off" class="layui-input" value='+data.ordersRemark+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">订单总价：</label><div class="layui-input-block"><input type="text" name="ordersPrice" lay-verify="title" autocomplete="off" class="layui-input" value='+data.ordersPrice+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">订单状态：</label><div class="layui-input-block"><input type="text" name="ordersState" lay-verify="title" autocomplete="off" class="layui-input" value='+data.ordersState+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">订单对应商家id：</label><div class="layui-input-block"><input type="text" name="sid" lay-verify="title" autocomplete="off" class="layui-input" value='+data.sid+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">订单对应用户id：</label><div class="layui-input-block"><input type="text" name="uid" lay-verify="title" autocomplete="off" class="layui-input" value='+data.uid+'></div></div></br>' +
                            //  \'食物分类id<input type="text" name="foodSortId" value=\'+data.foodSortId+\'></br>\' +\n' +
                            '<div class="layui-form-item"><div class="layui-input-block"><input type="submit"  class="layui-btn layui-btn-normal value="修改" style="high:50px;width:75px;"/></div></div>' +
                            '<form>' +
                            '<br>我们此后的征途是星辰大海 ^_^</div>'
                            /* content: '<form action="\${pageContext.request.contextPath}/goods/edit" method="post">' +
                             '食物id<input type="text" name="fid" value='+data.fid+'></br>' +
                             '食物名称<input type="text" name="fname" value='+data.fname+'></br>' +
                             '食物价钱<input type="text" name="fprice" value='+data.fprice+'></br>' +
                             '销量<input type="text" name="foodSales" value='+data.foodSales+'></br>' +
                             '食物图片路径<input type="text" name="imageUrl" value='+data.imageUrl+'></br>' +
                             '分类外键<input type="text" name="sortId" value='+data.sortId+'></br>' +
                             '<input type="submit" value="修改" style="high:50px;width:75px">' +
                             '<form>'*/ //这里content是一个普通的String
                        });

                    }
                });


            });
		</script>

		<jsp:include page="admin_footer.jsp"/>
		<script type="text/html" id="barDemo">

			<%--<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>--%>
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			<%--//JavaScript代码区域--%>
			<%--layui.use('element', function(){--%>
			<%--var element = layui.element;--%>

			<%--});--%>

		</script >


		<script>
            layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#test1' //指定元素
                });
            });
		</script>

	</div>

</div>

</body>
</html>

