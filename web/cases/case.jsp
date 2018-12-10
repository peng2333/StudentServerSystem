<%--
  Created by IntelliJ IDEA.
  User: 小鹏鹏
  Date: 2018/6/4
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>知识互助中心</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script type="text/javascript" src="/js/layui.js"></script>
    <script src="../js/layMI/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-1.12.4.js"></script>
    <script>
        layui.use('layim', function (layim) {
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
                        type: 'friend'
                        , name: "壹壹"
                        , avatar: "/images/kefu.jpg"
                        , id: -1
                    });
                }
            };

            layim.on('sendMessage', function(res){
                var mine = res.mine;
                var url = "${pageContext.request.contextPath}/user/kefu";
                var params = {
                    "content": mine.content
                };
                $.ajax({
                    "url": url,
                    "data": JSON.stringify(params),
                    "type": "post",
                    "contentType": "application/json;charset=UTF-8",
                    "success": function (data) {
                        layim.getMessage({
                            username: "壹壹" //消息来源用户名
                            ,avatar: "/images/kefu.jpg" //消息来源用户头像
                            ,id: -1 //消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
                            ,type: "friend" //聊天窗口来源类型，从发送消息传递的to里面获取
                            ,content: data.recent //消息内容
                            ,cid: 0 //消息id，可不传。除非你要对消息进行一些操作（如撤回）
                            ,mine: false //是否我发送的消息，如果为true，则会显示在右方
                            ,fromid: -2 //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
                            ,timestamp: 1467475443306 //服务端时间戳毫秒数。注意：如果你返回的是标准的 unix 时间戳，记得要 *1000
                        });
                    },
                    "error": function () {
                    },
                    "dataType": "json"
                });


            });

            $('.site-demo-layim').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
        });
    </script>
</head>
<body style="margin: 0px ;overflow-x: visible;background-size: 1600px 700px" background="../images/500472554.jpg">

<!-- 导航条start -->

<%--联想框样式 xiongtianci--%>
<style type="text/css">
    #lianxiang {
        position: absolute;
        background: #fff;
        border: 0px solid #999;
        border-radius: 0px;
        margin-left: 1px;
        display: none;
        top: 33px;
        left: -1px;
        width: 179px;
        z-index: 999;
    }
</style>
<style type="text/css">
    .lianxiangClass {
        width: 100%;
        padding: 2px;
    }
</style>

<%--
  User: XiongTianCi
  Date: 2018/6/8
  Time: 15:37
  页面加载完成时查询 置顶 内容
--%>
<script>
    /**
     *@Author:XiongTianCi
     *@Description:搜索联想功能；
     *@return:
     */
    $(function () {

        /*页面加载完成，给当前分类进行高亮*/
        // 将所有分类样式清空
        $(".menuClass").each(function () {
            $(this).removeClass("layui-hide-xs layui-this");
        });
        // 添加高亮
        // 获得当前分类数据
        var qtype =
        ${qtype} ==
        4 ? "首页" :
        ${qtype} ==
        0 ? "传智热点" :
        ${qtype} ==
        1 ? "生活日常" :
        ${qtype} ==
        2 ? "学术难疑" :
        ${qtype} ==
        3 ? "技术分享" : "";
        //console.info(qtype);
        // 遍历所有分类标签
        $(".qtypeClass2").each(function () {
            // 得到遍历的分类标签数据
            //console.info($(this).text());
            // 将当前分类添加高亮
            if ($(this).text() == qtype) {
                $(this).parent().addClass("layui-hide-xs layui-this");
            }
        });

        // 将当前分类数据存入form表单中
        $("#qtypeFormId").val($("li[class='menuClass layui-hide-xs layui-this']").find("a").text());

        /*页面加载完成时通过ajax查询置顶内容*/
        /*使用ajax查询置顶内容*/
        // 判断，如果是“首页，将单独查询”
        if (qtype == "首页") {
            // 显示“首页”中的置顶内容
            /!*发送ajax*!/
            var url = "${pageContext.request.contextPath}/case/qtypeAjax2";
            var params = {
                "qtype": qtype
            };

            $.ajax({
                type: "post",
                url: url,
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(params),
                success: function (data) {
                    //console.info(data);

                    /!*填充前清空数据*!/
                    $("#qstickCase").html("");
                    /!*填充置顶内容*!/
                    $(data.qList).each(function () {
                        // console.info($(this.answerList));

                        $("#qstickCase").append(
                            "<li><a href='${pageContext.request.contextPath}/user/myhome?uid=" + this.user.uid + "' class='fly-avatar'><img src='" + this.user.imageurl + "' alt='贤心'></a>" +
                            "<h2><a class='layui-badge'>" + this.qtype + "</a>" +
                            "<a href='/case/todetails?qid=" + this.qid + " '>" + this.qbt + "</a>" +
                            "</h2><div class='fly-list-info'><a href='${pageContext.request.contextPath}/user/myhome?uid=" + this.user.uid + "' link><cite>" + this.user.name + "</cite>" +
                            "</a><span>" +
                            this.qtimeStr
                            + "</span>" +
                            "<span style='" + (this.qstate == 1 ? '' : 'background-color: #999') + "' class='" + (this.qstate == 1 ? 'layui-badge fly-badge-accept layui-hide-xs' : 'layui-badge fly-badge-accept') + "'>" + (this.qstate == 1 ? '已解决' : '待解决') + "</span>" +
                            "<span class='fly-list-nums'><i class='iconfont icon-pinglun1' title='回答'></i>" + this.answerList.length + "</span></div>" +
                            "<div class='fly-list-badge'><span class='" + (this.qfierce == 1 ? ' layui-badge layui-bg-red ' : 'display: none;') + "'>精帖</span><span class='layui-badge layui-bg-black'>置顶</span></div></li>"
                        );

                    });

                }
            });


        } else {
            // 显示除 首页 外其他分类的置顶内容
            var url = "${pageContext.request.contextPath}/case/qtypeAjax";
            var params = {
                "qtype": qtype
            };

            $.ajax({
                type: "post",
                url: url,
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(params),
                success: function (data) {
                    // console.info(data.qList);
                    /*填充前清空数据*/
                    $("#qstickCase").html("");
                    /*填充置顶内容*/
                    $(data.qList).each(function () {
                        // console.info($(this.answerList));

                        $("#qstickCase").append(
                            "<li><a href='${pageContext.request.contextPath}/user/myhome?uid=" + this.user.uid + "' class='fly-avatar'><img src='" + this.user.imageurl + "' alt='贤心'></a>" +
                            "<h2><a class='layui-badge'>" + qtype + "</a>" +
                            "<a href='/case/todetails?qid=" + this.qid + " '>" + this.qbt + "</a>" +
                            "</h2><div class='fly-list-info'><a href='${pageContext.request.contextPath}/user/myhome?uid=" + this.user.uid + "' link><cite>" + this.user.name + "</cite>" +
                            "</a><span>" +
                            this.qtimeStr
                            + "</span>" +
                            "<span style='" + (this.qstate == 1 ? '' : 'background-color: #999') + "' class='" + (this.qstate == 1 ? 'layui-badge fly-badge-accept layui-hide-xs' : 'layui-badge fly-badge-accept') + "'>" + (this.qstate == 1 ? '已解决' : '待解决') + "</span>" +
                            "<span class='fly-list-nums'><i class='iconfont icon-pinglun1' title='回答'></i>" + this.answerList.length + "</span></div>" +
                            "<div class='fly-list-badge'><span class='" + (this.qfierce == 1 ? ' layui-badge layui-bg-red ' : 'display: none;') + "'>精帖</span><span class='layui-badge layui-bg-black'>置顶</span></div></li>"
                        );

                    });

                }
            });
        }


        /*搜索联想功能*/
        $("#searchId").keyup(function () {
            lianxiang();
        });

        // 搜索框失去焦点时隐藏联想模块
        $("#searchId").blur(function () {
            // $("#lianxiang").hide();
        });

        // 搜索框获得焦点且搜索框有内容时
        $("#searchId").focus(function () {
            // 获得搜索数据
            var searchName = $("#searchId").val();
            // 如果搜索框有数据，将进行搜索联想
            if (searchName != null) {
                lianxiang();
            }
        });

    });


    /**
     *@Author:XiongTianCi
     *@Description:点击分类时，将此分类高亮，
     *@return:
     */
    function qtypeClick(obj) {
        /*给当前分类添加高亮*/
        // 将所有分类样式清空
        $(".menuClass").each(function () {
            $(this).removeClass("layui-hide-xs layui-this");
        });
        // 添加高亮
        $(obj).parent().addClass("layui-hide-xs layui-this");

        /*用于 搜索框 的数据*/
        // 将qtype数据存入隐藏的input中
        $("#qtypeFormId").val($("li[class='menuClass layui-hide-xs layui-this']").find("a").text());

        // 获得分类数据
        var qtypeStr = $("li[class='menuClass layui-hide-xs layui-this']").find("a").text();
        var qtype = qtypeStr == "传智热点" ? "0" : qtypeStr == "生活日常" ? "1" : qtypeStr == "学术难疑" ? "2" : qtypeStr == "技术分享" ? "3" : qtypeStr == "首页" ? "4" : "";
        // 实现花虎的分类查询功能
        window.location.href = "${pageContext.request.contextPath}/case/find?results=&qtype=" + qtype;

    }


    /**
     *@Author:XiongTianCi
     *@Description:联想功能，通过搜索框数据和分类数据进行模糊查询
     *@return:
     */
    function lianxiang() {
        // 获得搜索数据
        var searchName = $("#searchId").val();
        // 获得分类数据
        var qtype = $("li[class='menuClass layui-hide-xs layui-this']").find("a").text();
        //console.info("qytpe:" +qtype);
        // 判断
        if (searchName != null && searchName.trim().length != 0) {
            // 显示联想框
            $("#lianxiang").show();

            /*使用ajax进行模糊查询*/
            var url = "/case/associateSearch";
            var params = {
                "qtype": qtype,
                "searchName": searchName
            };

            $.ajax({
                type: "post",
                url: url,
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(params),
                success: function (data) {
                    // 获得查询结果的个数
                    $("#lianxiang").css('height', ($(data.qList).size() * 20) + 'px');
                    /* .css('height',_height+'px'); */

                    /*console.info(data);*/
                    /*填充前清空数据*/
                    $("#lianxiang").html("");
                    // 填充
                    $(data.qList).each(function () {
                        // 得到模糊查询出来结果
                        var qbt = this.qbt;
                        // 将结果显示在联想模块上
                        /* <li class='lianxiangClass' style='height: 20px;' onclick='dianji(this)'><font color='red'>"+qbt+"</font></li> */

                        $("#lianxiang").append("<input type='text' style='cursor: pointer;' onclick='dianji(this)' class='lianxiangClass' value='" + qbt + "'/>");
                    });
                }
            });

        } else {
            // 当搜索框内容为空时隐藏联想框
            $("#lianxiang").hide();
        }

        /*将自动改变联想框的height*/
        //console.info("长度" + searchNum);

    }


    /**
     *@Author:XiongTianCi
     *@Description:点击联想模块上的内容时，将点击内容显示在搜索框
     *@return:
     */
    function dianji(obj) {
        // 将点中的联想候选项显示在搜索框中
        $("#searchId").val($(obj).val());
        // 隐藏联想候选框
        $("#lianxiang").hide();
    }

    /**
     *@Author:XiongTianCi
     *@Description:搜索框点击搜索功能
     *@return:
     */
    function searchText() {
        // 获得搜索数据
        var searchName = $("#searchId").val();
        // 获得分类数据
        var qtype = $("li[class='menuClass layui-hide-xs layui-this']").find("a").text();

        var path = "/case/results?searchName=" + searchName;
    }
</script>

<div class="fly-panel fly-column">
    <div class="layui-container">
        <ul class="layui-clear">
            <%--此表单用于存储分类数据和搜索框数据，当点击搜索按钮时提交这些数据 xiongtianci--%>
            <form id="serchFormId" action="${pageContext.request.contextPath}/case/searchTextAndQtype" method="post">
                <input type="hidden" id="qtypeFormId" name="qtype" value=""/>
                <input type="hidden" id="searchTextFormId" name="searchText" value=""/>
            </form>

            <li class="menuClass">
                <%-- ${pageContext.request.contextPath}/case/find?qtype=0 --%>
                <a class="qtypeClass2" href="#" onclick="qtypeClick(this)">首页</a>
            </li>
            <li class="menuClass">
                <%-- ${pageContext.request.contextPath}/case/find?qtype=0 --%>
                <a class="qtypeClass2" href="#" onclick="qtypeClick(this)">传智热点</a>
            </li>
            <li class="menuClass">
                <%--${pageContext.request.contextPath}/case/find?qtype=1--%>
                <a class="qtypeClass2" href="#" onclick="qtypeClick(this)">生活日常</a>
            </li>
            <li class="menuClass">
                <%--${pageContext.request.contextPath}/case/find?qtype=2--%>
                <a class="qtypeClass2" href="#" onclick="qtypeClick(this)">学术难疑</a>
            </li>
            <li class="menuClass">
                <%--${pageContext.request.contextPath}/case/find?qtype=3--%>
                <a class="qtypeClass2" href="#" onclick="qtypeClick(this)">技术分享</a>
            </li>
        </ul>
        <div class="fly-column-right layui-hide-xs">

            <%--搜索框 --%>
            <input id="searchId" type="text" value=""/> <%-- 功能：点击搜索按钮时，传输搜索框数据和分类数据 xiongtianci --%>

            <%--联想模块 xiongtianci--%>
            <div id="lianxiang" style="display: none; ">
                <%-- <ul id="lianxiangUl" style="height: 100%; width: 100%;" class="list-group"></ul>--%>
            </div>


            <%--搜索按钮 xiongtianci--%>
            <script>
                $(function () {
                    // 点击搜索按钮，提交form表单
                    $("#searchTextId").click(function () {
                        //console.info($("#searchId").val());
                        // 获得搜索框内容
                        var searchText = $("#searchId").val();
                        // 如果搜索框内容为空，提醒
                        if (searchText == null || searchText.trim().length == 0) {

                            JSON.stringify()
                            //JavaScript代码区域
                            layui.use(['layer', 'form'], function () {
                                var layer = layui.layer
                                    , form = layui.form;
                                layer.msg('     ' + "搜索框内容不能为空！", {
                                    offset: '100px',
                                    time: 1000 //2s后自动关闭
                                });
                            });

                            //
                            return;
                        }
                        // 将搜索框数据存入form表单隐藏域中
                        $("#searchTextFormId").val(searchText);

                        // 提交form表单
                        $("#serchFormId").submit();
                    });
                });
            </script>
            <span class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
	<a data-method="confirmTrans" class="searchClass" href="javascript:void(0)" id="searchTextId">
		 <span class="fly-search">
			 <i class="layui-icon"></i>
		 </span>
	</a>
</span>

            <%----%>
            <a href="/cases/add.jsp" class="layui-btn">发表新帖</a>
        </div>
    </div>
</div>
<!-- 导航条end -->

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
            <div class="fly-panel">
                <div class="fly-panel-title fly-filter">
                    <a class="layui-this">置顶</a>
                    <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin"
                       style="color: #FF5722;">去签到</a>
                </div>

                <!-- 顶置模块start -->
                <ul id="qstickCase" class="fly-list">


                </ul>
                <!-- 顶置模块end -->
            </div>

            <div class="fly-panel" style="margin-bottom: 0;">
                <div class="fly-panel-title fly-filter">
                    <a href="${pageContext.request.contextPath}/case/find?qtype=${qtype}&results= "
                       class="${qstate == '0' ? '' : qstate == '1' ? '' : qstate == '3' ? 'layui-this' : 'layui-this' }">综合</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/case/findQstate?qtype=${qtype}&qstate=0&results="
                       class="${qstate == '0' ? 'layui-this' : '' }">未结</a>
                    <span class="fly-mid"></span>
                    <a href="${pageContext.request.contextPath}/case/findQstate?qtype=${qtype}&qstate=1&results="
                       class="${qstate == '1' ? 'layui-this' : '' }">已结</a>
                    <span class="fly-mid"></span>
                    <span class="fly-filter-right layui-hide-xs">
                       <a href="${pageContext.request.contextPath}/case/findTime?qtype=${qtype}&qstate=${qstate}&results="
                          class="${qhuahu == 1 ? '' : qhuahu == 0 ? 'layui-this' : 'layui-this'}">按最新</a>
                     <span class="fly-mid"></span>
                       <a href="${pageContext.request.contextPath}/case/findDjs?qtype=${qtype}&qstate=${qstate}&results="
                          class="${qhuahu == 1 ? 'layui-this' : ''}">按热议</a>
                     </span>

                </div>

                <!-- 综合模版start -->
                <ul class="fly-list">
                    <c:forEach items="${pageInfo.list}" var="q">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/myhome?uid=${q.user.uid}"
                               class="fly-avatar">
                                <img src="${q.user.imageurl}"
                                     alt="贤心">
                            </a>
                            <h2>
                                <a class="layui-badge qtypeClass1">${q.qtype}</a>
                                <a href="/case/todetails?qid=${q.qid}">${q.qbt}</a>
                            </h2>
                            <div class="fly-list-info">
                                <a href="${pageContext.request.contextPath}/user/myhome?uid=${q.user.uid}" link>
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
                <!-- 综合模版end -->

                <div style="text-align: center">
                    <div class="laypage-main">
                        <a href="/case/find?results=1&qtype=4" class="laypage-next">更多求解</a>
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-col-md4">
            <div class="fly-panel">
                <div align="center">
                    <button class="layui-btn site-demo-layim" data-type="chat"
                            style="background-color: #20b8b8;position:relative;top:9px;left: -20px;">"撩"会天呗
                    </button>
                    <script charset="Shift_JIS"
                            src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.js"></script>
                </div>
            </div>
        </div>
        <!-- 周榜模版start -->
        <div class="layui-col-md4">
            <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
                <h3 class="fly-panel-title">采纳周榜</h3>
                <dl>
                    <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
                    <c:forEach items="${UserVoList}" var="userVo">
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/myhome?uid=${userVo.user.uid}">
                                <img src="${userVo.user.imageurl}"><cite>${userVo.user.name}</cite><i>${userVo.answerNum}次被采纳</i>
                            </a>
                        </dd>
                    </c:forEach>
                </dl>
            </div>
            <!-- 周榜模版end -->


            <div class="fly-panel">
                <div class="fly-panel-title">
                    宣传区域
                </div>
                <div class="fly-panel-main">
                    <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu"
                       time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;">Java1班4组和8组倾心之作</a>
                </div>
            </div>

            <dl class="fly-panel fly-list-one">
                <div class="layui-tab">
                    <ul class="layui-tab-title" id="allli">
                        <script>
                            $(function () {
                                $("#twozero").click(function () {
                                    $("#allli li").prop("class", "");
                                    $("#twozero").prop("class", "layui-this");
                                    $("#games").prop("src", "${pageContext.request.contextPath}/cases/2048/index.jsp");
                                    $("#games").prop("width", "450");
                                });
                                $("#sl").click(function () {
                                    $("#allli li").prop("class", "");
                                    $("#sl").prop("class", "layui-this");
                                    $("#games").prop("src", "${pageContext.request.contextPath}/cases/saolei/index.jsp");
                                    $("#games").prop("width", "300");
                                });
                                $("#sd").click(function () {
                                    $("#allli li").prop("class", "");
                                    $("#sd").prop("class", "layui-this");
                                    $("#games").prop("src", "${pageContext.request.contextPath}/cases/shudu/sudu.jsp");
                                    $("#games").prop("width", "300");
                                });
                            })
                        </script>
                        <li id="twozero">2048</li>
                        <li class="layui-this" id="sl">扫雷</li>
                        <li id="sd">数独</li>
                    </ul>

                    <div class="layui-tab-content">
                        <iframe src="${pageContext.request.contextPath}/cases/saolei/index.jsp" height="500" width="300"
                                id="games"/>
                    </div>
                </div>
            </dl>
        </div>
    </div>
</div>
</body>
</html>
