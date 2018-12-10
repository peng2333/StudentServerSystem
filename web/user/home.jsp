<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/global.css">
    <script src="${pageContext.request.contextPath}/js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/layMI/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="margin: 0px;overflow-x: visible">
<%--header--%>

<div class="fly-home fly-panel">
    <c:if test="${sessionScope.user.uid == user.uid}">
        <div class="fly-sns" data-user="">
            <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">我的主页</a>
        </div>
    </c:if>
    <c:if test="${sessionScope.user.uid != user.uid}">
        <div class="fly-sns" data-user="">
            <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">${user.name}的主页</a>
        </div>
    </c:if>
    <img src="${user.imageurl}" alt="贤心">
    <c:if test="${user.permission == 1}">
        <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>
    </c:if>
    <h1>
        ${user.name}
        <c:if test="${user.permission == 1}">
            <span style="color:#c00;">（管理员）</span>
        </c:if>
        <!-- <i class="iconfont icon-nv"></i>  -->
        <!--
        <span style="color:#c00;">（管理员）</span>
        <span style="color:#5FB878;">（社区之光）</span>
        <span>（该号已被封）</span>
        -->
    </h1>
    <!--<p class="fly-home-info">
      <i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">66666 飞吻</span>
      <i class="iconfont icon-shijian"></i><span>2015-6-17 加入</span>
      <i class="iconfont icon-chengshi"></i><span>来自杭州</span>
    </p>-->

    <p class="fly-home-sign">（${user.signature}）</p>
    <c:if test="${sessionScope.user.uid != user.uid}">
        <div class="fly-sns" data-user="">
            <button class="layui-btn site-demo-layim" data-type="add">申请好友</button>
            <button class="layui-btn site-demo-layim" data-type="chat">发起临时会话</button>
        </div>
    </c:if>

    <!--<div class="fly-sns" data-user="">
      <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">加为好友</a>
      <a href="javascript:;" class="layui-btn layui-btn-normal fly-imActive" data-type="chat">发起会话</a>
    </div>-->

</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6 fly-home-jie">
            <div class="fly-panel">
                <h3 class="fly-panel-title">${user.name} 最近的提问</h3>
                <ul class="jie-row">
                    <%-- <li>
                         <span class="fly-jing">精</span>
                         <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                         <i>刚刚</i>
                         <em class="layui-hide-xs">1136阅/27答</em>
                     </li>
                     <li>
                         <a href="" class="jie-title"> 基于 layui 的极简社区页面模版</a>
                         <i>1天前</i>
                         <em class="layui-hide-xs">1136阅/27答</em>
                     </li>--%>
                    <c:if test="${qcVos.size() == 0}">
                        <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i
                                style="font-size:14px;">没有发表任何求解</i></div>
                    </c:if>
                    <c:if test="${qcVos.size() != 0}">
                        <c:forEach items="${qcVos}" var="qcVo">
                            <li>
                                <c:if test="${qcVo.question.qfierce ==1}">
                                    <span class="fly-jing">精</span>
                                </c:if>
                                <a href="${pageContext.request.contextPath}/details/show?qid=${qcVo.question.qid}"
                                   class="jie-title">${qcVo.question.qbt}</a>
                                <i>${qcVo.question.qtimeStr}</i>
                                <em class="layui-hide-xs">${qcVo.question.djs}阅/${qcVo.count}答</em>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>

        <div class="layui-col-md6 fly-home-da">
            <div class="fly-panel">
                <h3 class="fly-panel-title">${user.name} 最近的回答</h3>
                <ul class="home-jieda">
                    <c:if test="${qaVos.size() == 0}">
                        <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;">
                            <span>没有回答任何问题</span></div>
                    </c:if>
                    <c:if test="${qaVos.size() != 0}">
                        <c:forEach items="${qaVos}" var="qaVo">
                            <li>
                                <p>
                                    <span>${qaVo.question.qtimeStr}</span>
                                    在<a href="${pageContext.request.contextPath}/details/show?qid=${qaVo.question.qid}">${qaVo.question.qs}</a>中回答：
                                </p>
                                <div class="home-dacontent">
                                        ${qaVo.answer.an}
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<%--footer--%>
<script>
    layui.extend({
        rmlib: '../js/rmlib',
        protobuf: '../js/protobuf',
        socket: '../js/socket'
    });
    layui.use(['layim', 'socket'], function (layim, socket) {
        //socket配置
        socket.config({
            uid: ${sessionScope.user.uid},
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
            init: {
                url: '${pageContext.request.contextPath}/user/getJson' //接口地址（返回的数据格式见下文）
                , type: 'get' //默认get，一般可不填
                , data: {} //额外参数

            },
            brief: false
            , right: '10000px'
            , title: '我的主页'
        });

        //面板外的操作
        var $ = layui.jquery, active = {
            chat: function () {
                //自定义会话
                layim.chat({
                    type: 'friend',
                    name: "${user.name}"
                    //, type: 'friend'
                    , avatar: "${user.imageurl}"
                    , id: ${user.uid}
                });
                layer.msg('此用户可能不是你的好友，交流请谨慎');
            }
            , add: function () {
                //实际使用时数据由动态获得
                layim.add({
                    type: 'friend'
                    , username: '${user.name}'
                    , avatar: '${user.imageurl}'
                    , submit: function (group, remark, index) {

                        //通知对方
                        $.post('${pageContext.request.contextPath}/user/addFriend', {
                            remark: remark,
                            groupId:group,
                            uid:${user.uid}
                        }, function (data) {
                            if(data=="true"){
                                layer.msg('你已经对该用户发出过申请', {
                                    icon: 1
                                    , shade: 0.5
                                }, function () {
                                    layer.close(index);
                                });
                            }else if(data=="1"){
                                layer.msg('对方已是你的好友', {
                                    icon: 1
                                    , shade: 0.5
                                }, function () {
                                    layer.close(index);
                                });
                            }else{
                                layer.msg('申请信息已发出，请稍候对方同意', {
                                    icon: 1
                                    , shade: 0.5
                                }, function () {
                                    layer.close(index);
                                });
                            }
                        });
                    }
                });
            }
        };

        $('.site-demo-layim').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>