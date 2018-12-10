<%--
  Created by IntelliJ IDEA.
  User: 小鹏鹏
  Date: 2018/6/4
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <title>知识互助中心</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script src="../js/jquery-1.12.4.js"></script>

    <%-- xiongtianci --%>
    <script>
        $(function () {

        });
    </script>
</head>
<body style="margin: 0px;overflow-x: visible;background-size: 1600px 700px" background="../images/500472554.jpg"">

<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <%-- class="layui-hide-xs layui-this" --%>
            <li class="qtypeClass2">
                <a href="${pageContext.request.contextPath}/case/find?qtype=4&results=0">首页</a>
            </li>
            <li class="qtypeClass2">
                <a href="${pageContext.request.contextPath}/case/find?qtype=0&results=0">传智热点</a>
            </li>
            <li class="qtypeClass2">
                <a href="${pageContext.request.contextPath}/case/find?qtype=1&results=0">生活日常</a>
            </li>
            <li class="qtypeClass2">
                <a href="${pageContext.request.contextPath}/case/find?qtype=2&results=0">学术难疑</a>
            </li>
            <li class="qtypeClass2">
                <a href="${pageContext.request.contextPath}/case/find?qtype=3&results=0">技术分享</a>
            </li>
        </ul>
        <div class="fly-column-right layui-hide-xs">
            <input type="text" value="${searchText}"/>
            <span class="fly-search"><i class="layui-icon"></i></span>
            <a href="cases/add.jsp" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel" style="margin-bottom: 0;">
                <div class="fly-panel-title fly-filter">
                    <a href="${pageContext.request.contextPath}/case/find?qtype=${qtype}&results=0" class="${qstate == '0' ? '' : qstate == '1' ? '' : qstate == '3' ? 'layui-this' : 'layui-this' }">综合</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/case/findQstate?qtype=${qtype}&qstate=0&results=0" class="${qstate == '0' ? 'layui-this' : '' }">未结</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/case/findQstate?qtype=${qtype}&qstate=1&results=0" class="${qstate == '1' ? 'layui-this' : '' }">已结</a>
                    <span class="fly-mid"></span>
                    <span class="fly-filter-right layui-hide-xs">
                        <a href="${pageContext.request.contextPath}/case/findTime?qtype=${qtype}&qstate=${qstate}&results=0"
                           class="layui-this">按最新</a>
                        <span class="fly-mid"></span>
                        <a href="${pageContext.request.contextPath}/case/findDjs?qtype=${qtype}&qstate=${qstate}&results=0">按热议</a>
					</span>
                </div>

                <ul class="fly-list">

                    <c:forEach items="${pageInfo.list}" var="q">
                        <li>
                            <a href="user/home.html" class="fly-avatar">
                                <img src="${q.user.imageurl}"
                                     alt="贤心">
                            </a>
                            <h2>
                                <a class="layui-badge qtypeClass1">${q.qtype}</a>
                                <a href="${pageContext.request.contextPath}/details/show?qid=2">${q.qbt}</a>
                            </h2>
                            <div class="fly-list-info">
                                <a href="user/home.html" link>
                                    <cite>${q.user.name}</cite>
                                    <!--
            <i class="iconfont icon-renzheng" title="认证信息：XXX"></i>
            <i class="layui-badge fly-badge-vip">VIP3</i>
            -->
                                </a>

                                <span><fmt:formatDate value="${q.qtime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>

                                <c:if test="${q.qstate==1}">
                                    <span class="layui-badge fly-badge-accept layui-hide-xs">已解决</span>
                                </c:if>
                                <c:if test="${q.qstate==0}">
                                    <span class="layui-badge fly-badge-accept" style="background-color: #999">待解决</span>
                                </c:if>
                                <span class="fly-list-nums">
                                <i class="iconfont icon-pinglun1" title="回答"></i>${q.djs}
                            </span>
                            </div>
                            <div class="fly-list-badge">
                                <c:if test="${q.qfierce==1}">
                                    <span class="layui-badge layui-bg-red">精帖</span>
                                </c:if>

                            </div>
                        </li>
                    </c:forEach>
                </ul>

                <!-- <div class="fly-none">没有相关数据</div> -->

                <div style="text-align: center">
                    <div class="laypage-main">
                        <span class="laypage-curr">1</span>
                        <a href="/jie/page/2/">2</a>
                        <a href="/jie/page/3/">3</a>
                        <a href="/jie/page/4/">4</a>
                        <a href="/jie/page/5/">5</a><span>…</span>
                        <a href="/jie/page/148/" class="laypage-last" title="尾页">尾页</a>
                        <a href="/jie/page/2/" class="laypage-next">下一页</a>
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-col-md4">
            <dl class="fly-panel fly-list-one">
                <dt class="fly-panel-title">本周热议</dt>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>
                <dd>
                    <a href="">基于 layui 的极简社区页面模版</a>
                    <span><i class="iconfont icon-pinglun1"></i> 16</span>
                </dd>

                <!-- 无数据时 -->
                <!--
                <div class="fly-none">没有相关数据</div>
                -->
            </dl>

            <!--      <div class="fly-panel">
                    <div class="fly-panel-title">
                      这里可作为广告区域
                    </div>
                    <div class="fly-panel-Kmeansmain">
                      <a href="" target="_blank" class="fly-zanzhu" style="background-color: #393D49;">虚席以待</a>
                    </div>
                  </div>-->


        </div>
    </div>
</div>


</body>
</html>
