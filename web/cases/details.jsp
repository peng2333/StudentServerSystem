<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 小鹏鹏
  Date: 2018/6/4
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>知识互助中心</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../layer/layer.js"></script>
</head>
<body style="margin: 0px;overflow-x: visible;background-size: 1600px 700px" background="../images/500472554.jpg"">

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <%-- 此处展示问题的标题--%>
                <%--魏彤羽  问题展示start--%>
                <h1>${question.qbt}</h1>
                <div class="detail-about">
                    <input type="hidden" id="qidId" value="${question.qid}"/>
                    <a class="fly-avatar" href="${pageContext.request.contextPath}/user/myhome?uid=${question.uid}">
                        <img src="${question.user.imageurl}"
                             alt="${question.user.name}">
                    </a>
                    <div class="fly-detail-user">
                        <a href="${pageContext.request.contextPath}/user/myhome?uid=${question.uid}" class="fly-link">
                            <cite>${question.user.name}</cite>
                        </a>
                        <span><fmt:formatDate value="${question.qtime}" pattern="yyyy-MM-dd"/></span>
                        <a class="layui-badge">${question.qtype}</a>
                        <c:if test="${question.qfierce=='1'}">
                            <a class="layui-badge">精帖</a>
                        </c:if>
                        <c:if test="${question.qstick=='1'}">
                            <span class="layui-badge layui-bg-black">置顶</span>
                        </c:if>

                    </div>
                    <div class="detail-hits" id="LAY_jieAdmin" data-id="123">

                        <%-- 点击此链接跳转到 edit页面--%>

                        <%-- 判断用户名是否为空 是否是楼主 是楼主和管理员显示此按钮 --%>
                        <c:if test="${ not empty user}">
                            <c:if test="${user.uid==question.uid}">
                                <a href="${pageContext.request.contextPath}/details/edit?qid=${question.qid}">编辑此贴</a>
                            </c:if>
                        </c:if>
                        <c:if test="${user.uid!=question.uid}">
                            <c:if test="${user.permission==1}">
                                         <span class="layui-btn layui-btn-xs jie-admin" type="edit">
                                        <a href="${pageContext.request.contextPath}/details/edit?qid=${question.qid}">编辑此贴</a>
                                         </span>
                            </c:if>
                        </c:if>
                        <c:if test="${user.permission==1}">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp管理员权限:[
                            <span class="layui-badge layui-bg-black"><a href="#" id="zhiding"><font
                                    color="#f0f8ff">置顶</font></a></span>
                        </c:if>
                        <script type="text/javascript">
                            $(function () {
                                    // alert("页面加载成功")
                                    $("#zhiding").click(function () {
                                        //传入三个参数
                                        var url = "/details/top";
                                        var params = {
                                            "qid":${question.qid},
                                        };
                                        $.post(url, params, function (data) {
                                        });
                                        alert("${question.qstick=='1'?'取消置顶':'成功置顶'}");
                                        window.location.reload();
                                    })
                                }
                            );
                        </script>
                        <c:if test="${user.permission==1}">
                            <a id="jintie" class="layui-badge" href="#"><font color="#f0f8ff">精帖</font></a>]
                        </c:if>
                        <script type="text/javascript">
                            $(function () {
                                    $("#jintie").click(function () {
                                        //传入三个参数
                                        var url = "/details/good";
                                        var params = {
                                            "qid":${question.qid},
                                        };
                                        $.post(url, params, function (data) {
                                        });
                                        alert("${question.qfierce=='1'?'是否将该贴从精贴中取消':'是否将该贴设置为精贴'}");
                                        window.location.reload();
                                    })
                                }
                            );
                        </script>
                    </div>
                </div>
                <div class="detail-body photos">
                    <p>问题详情：</p>
                    <pre>
                        <%-- 此处展示问题的具体--%>
                        ${question.qs}
</pre>
                    <%--魏彤羽  问题展示end--%>
                </div>
            </div>

            <div class="fly-panel detail-box" id="flyReply">
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>回帖</legend>
                </fieldset>

                <ul class="jieda" id="jieda">
                    <%--魏彤羽   回贴遍历start--%>
                    <c:if test="${question.answerList.size() == 0}">
                        <li class="fly-none">消灭零回复</li>
                    </c:if>
                    <c:forEach items="${question.answerList}" var="answer">
                        <li data-id="111">
                            <a name="item-1111111111"></a>
                            <div class="detail-about detail-about-reply">
                                <a class="fly-avatar" href="${pageContext.request.contextPath}/user/myhome?uid=${answer.user.uid}">
                                    <img src="${answer.user.imageurl}">
                                </a>
                                <div class="fly-detail-user">
                                    <a href="" class="fly-link">
                                        <cite>${answer.user.username}</cite>
                                    </a>
                                    <span style="color:#5FB878">(${answer.user.signature})</span>
                                </div>
                                <div class="detail-hits">
                                    <span><fmt:formatDate value="${answer.dtime}" pattern="yyyy-MM-dd"/></span>
                                </div>
                                <c:if test="${answer.dbest  == '1'}">
                                    <i class="iconfont icon-caina" title="最佳答案"></i>
                                </c:if>
                            </div>
                            <div class="detail-body jieda-body photos">
                                <p>${answer.an}</p>
                            </div>
                            <div class="jieda-reply">
                                <span id="zanId${answer.aid}" class="" type="zan" onclick="zan(${answer.aid})">
                        <i class="iconfont icon-zan"></i>
                        <em id="dzsId${answer.aid}">${answer.dzs}</em>

                        </span>
                                <span type="reply">
                        <i class="iconfont icon-svgmoban53"></i>
                        回复
                        </span>
                                <div class="jieda-admin">
                                        <%--编辑的操作 --%>
                                    <c:if test="${user.uid==answer.uid}">
                                        <span type="edit" onclick="edit1('${answer.an}',${answer.aid})">编辑</span>

                                    </c:if>

                                    <c:if test="${user.uid==question.uid}">
                                        <span type="del" onclick="delete1(${answer.aid})">删除</span>
                                    </c:if>
                                    <c:if test="${user.uid!=question.uid}">
                                        <c:if test="${user.uid==answer.uid}">
                                            <span type="del" onclick="delete1(${answer.aid})">删除</span>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${user.permission==1}">
                                        <c:if test="${user.uid!=question.uid}">
                                            <c:if test="${user.uid!=answer.uid}">
                                                <span type="del" onclick="delete1(${answer.aid})">删除</span>
                                            </c:if>
                                        </c:if>
                                    </c:if>

                                    <c:if test="${question.qstate== '0'}">
                                        <c:if test="${user.uid==question.uid}">
                                            <span class="jieda-accept" onclick="caina(${question.qid},${answer.aid})"
                                                  type="accept">采纳</span>
                                        </c:if>
                                    </c:if>
                                            <c:if test="${question.qstate== '1'}">
                                                <c:if test="${user.uid==question.uid}">
                                            <span class="jieda-accept" onclick="uncaina(${question.qid},${answer.aid})"
                                                  type="accept">取消采纳</span>
                                                </c:if>
                                            </c:if>
                                </div>
                            </div>
                        </li>

                    </c:forEach>

                    <script type="text/javascript">
                        //采纳的方法
                        function caina(qid, aid) {
                            var url = "${pageContext.request.contextPath}/details/accept";
                            var params = {
                                "aid": aid,
                                "qid": qid
                            };
                            $.post(url, params, function (data) {
                            });
                            alert("采纳成功");
                            window.location.reload();
                        }
                        //取消采纳的方法
                        function uncaina(qid, aid) {
                            var url = "${pageContext.request.contextPath}/details/unaccept";
                            var params = {
                                "aid": aid,
                                "qid": qid
                            }
                            $.post(url, params, function (data) {
                            });
                            alert("取消采纳成功");
                            window.location.reload();
                        }


                        //删除的方法
                        function delete1(aid) {
                            var url = "${pageContext.request.contextPath}/details/delete";
                            var params = {
                                "aid": aid
                            };
                            $.post(url, params, function (data) {
                            });
                            alert("删除成功");
                            window.location.reload();
                        }


                        function edit1(an, aid) {
                            layer.open({
                                title: '回复编辑'
                                , content: '  <input type="text" id="ian"  name="an" value="' + an + '">' +
                                '</br> <input type="hidden" id="iaid" name="aid" value="' + aid + '" />  ',
                                area: ['500px', '300px'],
                                offset: '100px',
                                btn: ['确认修改'],
                                btn1: function (index, layero) {
                                    var an = $("#ian").val();
                                    var aid = $("#iaid").val();
                                    var url = "${pageContext.request.contextPath}/details/replyEdit";
                                    var params = {
                                        "an": an,
                                        "aid": aid
                                    };
                                    $.post(url, params, function () {
                                    });
                                    alert("修改成功");
                                    window.location.reload();
                                }

                            });
                        }

                    </script>
                    <script type="text/javascript">
                        function zan(aid) {
                            var cla = $("#zanId" + aid).attr("class");
                            var flag = false;
                            if (cla == "zanok") {
                                flag = true;
                            }
                            if (cla == "") {
                                flag = false;
                            }
                            var url = "/details/assist";
                            var params = {
                                "aid": aid,
                                "flag": flag
                            };
                            $.post(
                                url,
                                params,
                                function (data) {
                                    if (data.flag) {
                                        $("#zanId" + aid).removeClass();
                                        $("#zanId" + aid).addClass("zanok");
                                        $("#dzsId" + aid).html(data.dzs);
                                    } else {
                                        $("#zanId" + aid).removeClass();
                                        $("#dzsId" + aid).html(data.dzs);
                                    }
                                },
                                "json"
                            )
                        }
                    </script>
                    <%--魏彤羽   回贴遍历end--%>
                    <!-- 无数据时 -->
                    <!-- <li class="fly-none">消灭零回复</li> -->
                </ul>

                <div class="layui-form layui-form-pane">
                    <form action="/details/reply/" method="post" onsubmit="submitReply()">
                        <div class="layui-form-item layui-form-text">
                            <a name="comment"></a>
                            <div class="layui-input-block">
                                <textarea id="L_content" name="content" required lay-verify="required"
                                          placeholder="请输入内容" class="layui-textarea fly-editor"
                                          style="height: 150px;"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <input type="hidden" name="jid" value="123">
                            <button class="layui-btn" lay-filter="*" lay-submit>提交回复</button>
                        </div>
                        <%--魏彤羽  提交回复 start--%>
                        <script type="text/javascript">
                            function submitReply() {
                                var content = $("#L_content").val();
                                var qid = $("#qidId").val();
                                var url = "/details/reply";
                                var params = {
                                    "content": content,
                                    "qid": qid
                                };

                                $.post(
                                    url,
                                    params,
                                    function (data) {
                                        if (data.flag) {
                                            window.location.reload();
                                        } else {
                                            alert("您还没有登录！");
                                            window.location.reload();
                                            $("#L_content").val(data.content);
                                        }
                                    },
                                    "json"
                                )
                            }
                        </script>
                        <%--魏彤羽  提交回复 end--%>
                    </form>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title"><a href="#">本周热议</a> | <a href="#">年度热议</a></dt>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="jie/detail.html">祝传智学院Java1班第二次项目实战圆满成功</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>

                <!-- 无数据时 -->
                <!--
<div class="fly-none">没有相关数据</div>
-->
            </dl>

            <div class="fly-panel">
                <div class="fly-panel-title">
                    宣传区域
                </div>
                <div class="fly-panel-main">
                    <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu"
                       time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">Java1班4组和8组倾心之作</a>
                </div>
            </div>

        </div>
    </div>
</div>


<%--<script src="../../res/layui/layui.js"></script>--%>
<%--<script>--%>
<%--layui.cache.page = 'jie';--%>
<%--layui.cache.user = {--%>
<%--username: '游客'--%>
<%--, uid: -1--%>
<%--, avatar: '../../res/images/avatar/00.jpg'--%>
<%--, experience: 83--%>
<%--, sex: '男'--%>
<%--};--%>
<%--layui.config({--%>
<%--version: "3.0.0"--%>
<%--, base: '../../res/mods/'--%>
<%--}).extend({--%>
<%--fly: 'index'--%>
<%--}).use(['fly', 'face'], function () {--%>
<%--var $ = layui.$--%>
<%--, fly = layui.fly;--%>
<%--//如果你是采用模版自带的编辑器，你需要开启以下语句来解析。--%>
<%--/*--%>
<%--$('.detail-body').each(function(){--%>
<%--var othis = $(this), html = othis.html();--%>
<%--othis.html(fly.content(html));--%>
<%--});--%>
<%--*/--%>
<%--});--%>
<%--</script>--%>

</body>
</html>
