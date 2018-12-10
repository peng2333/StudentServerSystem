<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script src="../js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-1.12.4.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">
        $(function () {
            $("#ulId li").each(function () {
                $(this).removeClass("layui-this");
            })
            $("#indexId").addClass("layui-this");


        })
    </script>

</head>
<body style="margin: 0px">
<%--header--%>
<div class="layui-container fly-marginTop fly-user-main">
    <jsp:include page="left.jsp"></jsp:include>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>


    <div class="fly-panel fly-panel-user" pad20>
        <!--
        <div class="fly-msg" style="margin-top: 15px;">
          您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
        </div>
        -->
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li data-type="mine-jie" lay-id="index" class="layui-this">我发的帖<span></span>${pageInfo.list.size}</li>
                <!--        <li data-type="collection" data-url="/collection/find/" lay-id="collection">我收藏的帖（<span>16</span>）</li>-->
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <ul class="mine-view jie-row" id = "questionAll">

                        <!--用户中心的展示发表帖子start-->
                        <%--<c:forEach items="${list}" var="vo">
                            <li>
                                <a class="jie-title" href="../jie/detail.html" target="_blank">${vo.question.qs}</a>
                                <i>${vo.question.qtime}</i>
                                <a class="mine-edit" href="/jie/edit/8116">编辑</a>
                                <em>${vo.question.djs}阅/${vo.answerNum}答</em>
                            </li>
                        </c:forEach>--%>
                        <!--用户中心的展示发表帖子end-->
                    </ul>
                    <div id="LAY_page"></div>
                </div>
                <!--<div class="layui-tab-item">
                  <ul class="mine-view jie-row">
                    <li>
                      <a class="jie-title" href="../jie/detail.html" target="_blank">基于 layui 的极简社区页面模版</a>
                      <i>收藏于23小时前</i>  </li>
                  </ul>
                  <div id="LAY_page1"></div>
                </div>-->
                <div id="demo2" align="center"></div>
            </div>
        </div>
    </div>
</div>

<%--footer--%>

<script src="../js/layui.js"></script>
<script>
    layui.cache.page = 'user';
    layui.cache.user = {
        username: '游客'
        , uid: -1
        , avatar: '../../res/images/avatar/00.jpg'
        , experience: 83
        , sex: '男'
    };
    layui.config({
        version: "3.0.0"
        , base: '../mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>


<script>
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        var url = "/user/allQuestions";
        var ques = [];
        var len = 0;
        $.post(url, "", function (data) {
            ques = data;
            len = data.length;


            //调用分页
            laypage.render({
                elem: 'demo2'
                , count: len
                , limit : 6
                , jump: function (obj) {
                    //模拟渲染
                    $("#questionAll").html("");
                    for (var i = obj.curr * obj.limit - obj.limit; i < obj.curr * obj.limit; i++) {
                        $("#questionAll").append("<li>"+
                            "<a class=\"jie-title\" href=\"/case/todetails?qid="+ques[i].question.qid+"\" target=\"_blank\">"+ques[i].question.qs+"</a>"+
                            "<i>"+ques[i].question.qtimeStr+"</i>"+
                            "<a class=\"mine-edit\" href=\"${pageContext.request.contextPath}/details/edit?qid="+ques[i].question.qid+"\">编辑</a>"+
                            "<em>"+ques[i].question.djs+"阅/"+ques[i].count+"答</em>"+
                            "</li>");
                        if (i>=obj.count-1){
                            break;
                        };
                    }
                }
            });
        },"json");
        //将一段数组分页展示



    });
</script>
</body>
</html>