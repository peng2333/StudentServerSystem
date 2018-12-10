<%--
  Created by IntelliJ IDEA.
  User: XDerhuo
  Date: 2018/6/19
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/layMI/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script src="http://cdn.ronghub.com/RongIMLib-2.3.2.min.js"></script>
</head>
<body>

<blockquote class="layui-elem-quote">由于LayIM是我们目前唯一的付费组件，所以在你下载的layui包里，并不包含LayIM。如果你觉得Layui对你有所帮助，并且你希望Layui能够持续发展下去，那么我们很欢迎你能捐赠Layui，成为我们的VIP2+，这对我们的促进将会极大！</blockquote>

<a class="layui-btn layui-btn-normal" href="http://layim.layui.com/" target="_blank">前去LayIM官网</a>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>面板外的操作示例</legend>
</fieldset>

<div class="site-demo-button">
    <button class="layui-btn site-demo-layim" data-type="chat">自定义会话</button>
    <button class="layui-btn site-demo-layim" data-type="message">接受好友的消息</button>
    <button class="layui-btn site-demo-layim" data-type="messageAudio">接受音频消息</button>
    <button class="layui-btn site-demo-layim" data-type="messageVideo">接受视频消息</button>
    <button class="layui-btn site-demo-layim" data-type="messageTemp">接受临时会话消息</button>

    <br>

    <button class="layui-btn site-demo-layim" data-type="add">申请好友</button>
    <button class="layui-btn site-demo-layim" data-type="addqun">申请加群</button>
    <button class="layui-btn site-demo-layim" data-type="addFriend">同意好友</button>
    <button class="layui-btn site-demo-layim" data-type="addGroup">增加群组到主面板</button>
    <button class="layui-btn site-demo-layim" data-type="removeFriend">删除主面板好友</button>
    <button class="layui-btn site-demo-layim" data-type="removeGroup">删除主面板群组</button>

    <br>
    <button class="layui-btn site-demo-layim" data-type="setGray">置灰离线好友</button>
    <button class="layui-btn site-demo-layim" data-type="unGray">取消好友置灰</button>
    <a href="http://layim.layui.com/kefu.html" class="layui-btn site-demo-layim" target="_blank">客服模式</a>
    <button class="layui-btn site-demo-layim" data-type="mobile">移动端版本</button>

    <br>

    <!-- 示例-970 -->
    <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

</div>


<script src="${pageContext.request.contextPath}/js/layMI/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('layim', function(layim){
        //基础配置
        layim.config({

            //获取主面板列表信息，下文会做进一步介绍
            init: {
                url: 'getList.json' //接口地址（返回的数据格式见下文）
                ,type: 'get' //默认get，一般可不填
                ,data: {} //额外参数
            }

            //获取群员接口（返回的数据格式见下文）
            ,members: {
                url: '' //接口地址（返回的数据格式见下文）
                ,type: 'get' //默认get，一般可不填
                ,data: {} //额外参数
            }

            //上传图片接口（返回的数据格式见下文），若不开启图片上传，剔除该项即可
            ,uploadImage: {
                url: '' //接口地址
                ,type: 'post' //默认post
            }

            //上传文件接口（返回的数据格式见下文），若不开启文件上传，剔除该项即可
            ,uploadFile: {
                url: '' //接口地址
                ,type: 'post' //默认post
            }
            //扩展工具栏，下文会做进一步介绍（如果无需扩展，剔除该项即可）
            ,tool: [{
                alias: 'code' //工具别名
                ,title: '代码' //工具名称
                ,icon: '&#xe64e;' //工具图标，参考图标文档
            }]

            ,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
            ,find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
            ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatlog.html' //聊天记录页面地址，若不开启，剔除该项即可
            ,min : true
            ,initSkin: '3.jpg'
            ,notice:true
        });
    });
</script>

</body>
</html>