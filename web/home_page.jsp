<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>客户案例</title>
        <link href="css/style.css"rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="case-content-bg case-content-info">
            <div class="case-box">
                <h3 class="case-box-title">
                    <em>学生服务系统</em>
                    <span>各行各业的合作伙伴使用大数据分析产品</span>
	            </h3>
                <div class="case-wrapper clearfix">
	                <div style="width: 885px;height: 430px;margin: 0 auto;">
		                <div class="case-item">
			                <div class="move-class" onclick="window.open('${pageContext.request.contextPath}/netdisk/index.jsp','_self')"><!-- 此div为了给包含的div添加小手和点击跳转 -->
				                <div class="case-item-bg case-item-bg1"></div>
				                <div class="case-item-title">资源中心</div>
				                <div class="case-item-text">主要用于解决老师和学生的资源共享问题,
					                老师每天上课会有资料,学生可以在老师上传
					                资料后查看资料,也可以下载指定的文件夹和文件。
				                </div>
			                </div>
			                <div class="case-item-doc">
				                <p>使用产品</p>
				                <p>
					                <a href="${pageContext.request.contextPath}/netdisk/index.jsp">我的分享</a>
					                <a href="http://www.baidu.com">百度深度学习</a>
				                </p>
			                </div>
		                </div>
		                <div class="case-item">
			                <div class="move-class" onclick="window.open('${pageContext.request.contextPath}/case/WangShuang','_self')"><!-- 此div为了给包含的div添加小手和点击跳转 -->
				                <div class="case-item-bg case-item-bg2"></div>
				                <div class="case-item-title">交流互助中心</div>
				                <div class="case-item-text">此模块可供学生们吐槽在学校遇到的各种有趣的事，各个重大事件，以及学习方面的困难，技术分享...
				                </div>
			                </div>
			                <div class="case-item-doc">
				                <p>使用产品</p>
				                <p>
					                <a href="${pageContext.request.contextPath}/case/find?results=&qtype=0">传智热点</a>
					                <a href="${pageContext.request.contextPath}/cases/add.jsp">发表新帖</a>
				                </p>
			                </div>
		                </div>
		                <div class="case-item">
			                <div class="move-class" onclick="window.open('${pageContext.request.contextPath}/yestodayOrder','_self')"><!-- 此div为了给包含的div添加小手和点击跳转 -->
				                <div class="case-item-bg case-item-bg3"></div>
				                <div class="case-item-title">早餐服务</div>
				                <div class="case-item-text">用户可以自己在线点餐、下单，不需要安排人工手工记单。
				                </div>
			                </div>
			                <div class="case-item-doc">
				                <p>使用产品</p>
				                <p>
					                <a href="${pageContext.request.contextPath}/selectAll">所有商家</a>
					                <a href="${pageContext.request.contextPath}/todayOrder">今日订单</a>
				                </p>
			                </div>
		                </div>
	                </div>
	                <div style="width: 885px;height: 430px;margin: 0 auto;">
		                <div class="case-item">
			                <div class="move-class" onclick="window.open('${pageContext.request.contextPath}/measurement/index','_self')"><!-- 此div为了给包含的div添加小手和点击跳转 -->
				                <div class="case-item-bg case-item-bg4"></div>
				                <div class="case-item-title">竞赛</div>
				                <div class="case-item-text">在线编程平台,在这您可以学习,交流,分享,丰富的经验和知识,在线进行模拟考试练习比拼,全面提升你的编程能力</div>
			                </div>
			                <div class="case-item-doc">
				                <p>使用产品</p>
				                <p>
					                <a href="${pageContext.request.contextPath}/competition/details.jsp">当前竞赛信息</a>
					                <a href="${pageContext.request.contextPath}/measurement/history">我的竞猜历史</a>
				                </p>
			                </div>
		                </div>
		                <div class="case-item">
			                <div class="move-class" onclick="window.open('${pageContext.request.contextPath}/exception/abnormalCollection.jsp','_self')"><!-- 此div为了给包含的div添加小手和点击跳转 -->
				                <div class="case-item-bg case-item-bg5"></div>
				                <div class="case-item-title">异常收集系统</div>
				                <div class="case-item-text">系统开发过程中，出现错误在所难免，尽可能地收集出错时的一些信息，对我们分析错误，从而查找排除错误是很有帮助的，</div>
			                </div>
			                <div class="case-item-doc">
				                <p>使用产品</p>
				                <p>
					                <a href="#">添加异常</a>
					                <a href="#">异常搜索</a>
				                </p>
			                </div>
		                </div>

		                <div>
		                </div>

	                </div>

                </div>
            </div>
        </div>


    </body>
</html>
