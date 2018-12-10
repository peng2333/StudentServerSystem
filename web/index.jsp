<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layui.css"/>
    <script src="${pageContext.request.contextPath}/js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"
            charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layMI/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
    <%--用于用于统计时判断是否为同一天的数据--%>
    <script>
        $(function () {
            var url = "/index/indexViews/visitView";
            var params = {};
            $.ajax({
                url:url,
                data:params,
                type:"post"

            });
        });
    </script>

</head>
<body>

<%--header--%>
<jsp:include page="header.jsp"/>

<!--核心内容-->
<input type="text" hidden value="${user.uid}" id="uid">
<input type="text" hidden value="${user.name}" id="name">
<script>
    $(function () {
        $("#iFrame_main").css("height", window.innerHeight - 61);
        $("#iFrame_main").css("width", window.innerWidth);
        // $(".layui-nav-item").each(function () {
        //     $(this).removeClass("layui-this");
        // })
    })

</script>
<div id="iFrame_main">
    <iframe src="${pageContext.request.contextPath}/home_page.jsp" name="iFrame_main" frameborder="0" width="100%"
            height="99%"></iframe>
    <script src="${pageContext.request.contextPath}/js/layMI/layui.js" charset="utf-8"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
    <script>
        var userService = false;//开启客服模式

        var uid = $("#uid").val();
        var name = $("#name").val();
        var kefuId = 10000001;
        layui.extend({
            rmlib: '/js/rmlib',
            protobuf: '/js/protobuf',
            socket: '/js/socket'
        });
        layui.use(['layim', 'socket'], function (layim, socket) {
            socket.on('status', function (status) {
                console.log(status);
            });
            //socket配置
            socket.config({
                uid: uid,
                key: '6tnym1br643w7',//融云key
                token: {
                    url: '/chart/tokenUser',//这里配置自己的token服务域名
                    uselocal: true
                },
                layim: layim,
                autoConnect: true
            });
            var layim = layui.layim;

            //基础配置
            layim.config({

                //获取主面板列表信息，下文会做进一步介绍
                init: {
                    url: '${pageContext.request.contextPath}/user/getJson' //接口地址（返回的数据格式见下文）
                    , type: 'get' //默认get，一般可不填
                    , data: {} //额外参数
                }

                //获取群员接口（返回的数据格式见下文）
                , members: {
                    url: '' //接口地址（返回的数据格式见下文）
                    , type: 'get' //默认get，一般可不填
                    , data: {} //额外参数
                }

                //上传图片接口（返回的数据格式见下文），若不开启图片上传，剔除该项即可
                , uploadImage: {
                    url: '' //接口地址
                    , type: 'post' //默认post
                }

                //上传文件接口（返回的数据格式见下文），若不开启文件上传，剔除该项即可
                , uploadFile: {
                    url: '' //接口地址
                    , type: 'post' //默认post
                }
                //扩展工具栏，下文会做进一步介绍（如果无需扩展，剔除该项即可）
                , tool: [{
                    alias: 'code' //工具别名
                    , title: '代码' //工具名称
                    , icon: '&#xe64e;' //工具图标，参考图标文档
                }]
                , msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.jsp' //消息盒子页面地址，若不开启，剔除该项即可
                , find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
                , chatLog: layui.cache.dir + 'css/modules/layim/html/chatlog.html' //聊天记录页面地址，若不开启，剔除该项即可
                , min: true
                , initSkin: '3.jpg'
                , notice: true
                , title: name
            });
            layim.on('ready', function () {
                var url = "${pageContext.request.contextPath}/user/findAddmsg";
                var params = {
                    "uid": ${sessionScope.user.uid}
                }
                $.ajax({
                    "url": url,
                    "data": JSON.stringify(params),
                    "type": "post",
                    "contentType": "application/json;charset=UTF-8",
                    "success": function (data) {
                        if ($(data).size() != 0) {
                            layim.msgbox($(data).size());
                        }
                    },
                    "error": function () {
                    },
                    "dataType": "json"
                });

            });
        });
    </script>
</div>
</body>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });.0

</script>
</html>