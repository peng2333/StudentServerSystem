<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	  <meta charset="utf-8">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/main.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/breakfast/css/public.css">
     <script src="${pageContext.request.contextPath}/breakfast/js/jquery-1.11.3.min.js"></script>
     <script src="${pageContext.request.contextPath}/breakfast/js/jquery.SuperSlide.2.1.1.js"></script>
     <script src="${pageContext.request.contextPath}/breakfast/js/highcharts.js"></script>
  	  <title>所有商家</title>
     <script>
       $(function(){
           $("#bId").click(function(){
               location.href="${pageContext.request.contextPath}/selectAll";
           });

       });
     </script>
	</head>
<body>
  <!-- 导航 开始 --> 
  <div class="index_nav"> 
   <div class="w1200 clearFloat"> 
    <div class="nav_center fl"> 
     <ul>
      <li> <a class="add_bg" href="${pageContext.request.contextPath}/yestodayOrder">首页</a> </li>
      <li> <a href="${pageContext.request.contextPath}/selectAll">所有商家</a> </li>
     </ul> 
    </div> 
   </div> 
  </div> 
  <!-- 导航 结束 --> 
  <!-- 所有商家 开始 --> 
  <div class="w1200 index_cont3 clearFloat"> 
   <!-- 左侧 --> 
   <div class="left fl"> 
    <div class="tit">
     <div class="xq">
      <a href="javascript:;" id="bId"><span>全部商家</span></a>
     </div>
    </div> 
    <div class="det">
     <div class="det_tit tab_tit1">
      <ul class="clearFloat">
       <c:forEach items="${allShopSort}" var="shopSort" varStatus="vs">
         <li class="${index == vs.count ? 'active' : ''}"><a href="${pageContext.request.contextPath}/selectAll?shopSortId=${shopSort.shopSortId}&index=${vs.count}">${shopSort.shopSortName}</a></li>
       </c:forEach>
      </ul>
     </div>
     <div class="det_list tab_det_list1">
      <!-- 1 -->
      <c:forEach items="${shopList}" var="shop">

       <ul class="list" style="display:block;">
        <li class="clearFloat">
         <div class="ig fl">
          <a href="javascript:;"><img src="${pageContext.request.contextPath}${shop.imageUrl}"></a>
         </div>
         <div class="fon fl">
          <a href="javascript:;"> <h3>${shop.shopName}</h3> <p>${shop.shopIntroduce}</p>
           <div class="time">
            <em><font color="red" size="4"><fmt:formatNumber type="number" value="${shop.shopStar}" pattern="0.0" maxFractionDigits="1" /></font></em>
            <i>月售  ${shop.shopCount} 份</i>
           </div> </a>
         </div>
         <div class="xq">
          <a href="${pageContext.request.contextPath}/findAllFoodById.action?sid=${shop.sid}"><span>进店逛逛</span></a>
         </div> </li>
       </ul>

      </c:forEach>
     </div>
    </div> 
   </div> 
  </div> 
  <!-- 所有商家 结束 -->
</body>
</html>
