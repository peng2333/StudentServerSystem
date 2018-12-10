<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <div>
            <button class="layui-btn" id="add" style="width:150px"><h2>添加商品</h2></button>
        </div>

        <!-- 内容主体区域 -->
        <table id="demo" lay-filter="test" ></table>
        <script>
            layui.use('table', function(){
                var table = layui.table;

                //第一个实例
                table.render({
                    elem: '#demo'
                    ,height: 315
                    ,url: '${pageContext.request.contextPath}/goods/findAllGoods' //数据接口
                    ,cols: [[ //表头
                        {field: 'fid', title: '食物id', width:140, sort: true, fixed: 'left'}
                        ,{field: 'fname', title: '食物名称', width:140}
                        ,{field: 'fprice', title: '食物价钱', width:140, sort: true}
                        ,{field: 'foodSales', title: '销量', width:140, sort: true}
                        ,{field: 'imageUrl', title: '食物图片路径', width:140, sort: true}
                        ,{field: 'sortId', title: '分类外键', width:140, sort: true}
                        ,{fixed: 'right', title: '操作', width:120, align:'center', toolbar: '#barDemo'}
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
                                    url:"${pageContext.request.contextPath}/goods/deleteGoods",
                                    data:{"fid":data.fid}
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
                            content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><h1>修改商品</h1></br>' +
                            '<form class="layui-form" action="${pageContext.request.contextPath}/goods/editGoods" method="post"> '+
                            '<div class="layui-form-item"><label class="layui-form-label">食物id：</label><div class="layui-input-block"><input type="text" name="fid" lay-verify="title" autocomplete="off" class="layui-input" value='+data.fid+'></div> </div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">食物名称：</label><div class="layui-input-block"><input type="text" name="fname" lay-verify="title" autocomplete="off" class="layui-input" value='+data.fname+'> </div> </div></br>' +
                            // '星级：<input type="text" name="shopStar" value=\'+data.shopStar+\'></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">食物价钱：</label><div class="layui-input-block"><input type="text" name="fprice" lay-verify="title" autocomplete="off" class="layui-input" value='+data.fprice+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">销量：</label><div class="layui-input-block"><input type="text" name="foodSales" lay-verify="title" autocomplete="off" class="layui-input" value='+data.foodSales+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">食物图片路径：</label><div class="layui-input-block"><input type="text" name="imageUrl" lay-verify="title" autocomplete="off" class="layui-input" value='+data.imageUrl+'></div></div></br>' +
                            '<div class="layui-form-item"><label class="layui-form-label">分类外键：</label><div class="layui-input-block"><input type="text" name="sortId" lay-verify="title" autocomplete="off" class="layui-input" value='+data.sortId+'></div></div></br>' +
                            //  \'食物分类id<input type="text" name="foodSortId" value=\'+data.foodSortId+\'></br>\' +\n' +
                            '<div class="layui-form-item"><div class="layui-input-block"><input type="submit"  class="layui-btn layui-btn-normal value="修改" style="high:50px;width:75px;"/></div></div>' +
                            '<form>' +
                            '</div>'
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
            $('#add').on('click',function () {
                layer.open({
                    type: 1,
                    area: ['700px', '500px'],
                    title: false, //不显示标题栏,
                    content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><h1>添加商店</h1></br>' +
                    '<form class="layui-form" action="${pageContext.request.contextPath}/goods/addGoods" method="post">' +
                    '<div class="layui-form-item"><label class="layui-form-label">食物名称：</label><div class="layui-input-block"><input type="text" name="fname" lay-verify="title" autocomplete="off" class="layui-input" value=""> </div> </div></br>' +
                    '<div class="layui-form-item"><label class="layui-form-label">食物价钱：</label><div class="layui-input-block"><input type="text" name="fprice" lay-verify="title" autocomplete="off" class="layui-input" value=""></div></div></br>' +
                    '<div class="layui-form-item"><label class="layui-form-label">销量：</label><div class="layui-input-block"><input type="text" name="foodSales" lay-verify="title" autocomplete="off" class="layui-input" value=""></div></div></br>' +
                    '<div class="layui-form-item"><label class="layui-form-label">食物图片路径：</label><div class="layui-input-block"><input type="text" name="imageUrl" lay-verify="title" autocomplete="off" class="layui-input" value=""></div></div></br>' +
                    '<div class="layui-form-item"><label class="layui-form-label">分类外键：</label><div class="layui-input-block"><input type="text" name="sortId" lay-verify="title" autocomplete="off" class="layui-input" value=""></div></div></br>' +
                    //  \'食物分类id<input type="text" name="foodSortId" value=\'+data.foodSortId+\'></br>\' +\n' +
                    '<div class="layui-form-item"><div class="layui-input-block"><input type="submit"  class="layui-btn layui-btn-normal value="添加" style="high:50px;width:75px;"/></div></div>' +
                    '<form>' +
                    '</div>' //这里content是一个普通的String
                });
            });
        </script>

    </div>

</div>

</body>
</html>

