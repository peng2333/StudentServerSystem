<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sss.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/6/10
  Time: 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/layer/layer.js"></script>

</head>

<body>
<ul class="layui-nav" lay-filter="">
    <center><li class="layui-nav-item"><a href="">文件列表</a></li></center>
</ul>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="unshare"  class="layui-btn layui-hide layui-btn-sm layui-btn-radius layui-btn-primary" onclick="unshare()">取消分享</button>
<button id="download" class="layui-btn layui-hide layui-btn-sm layui-btn-radius layui-btn-primary" onclick="download()">下载</button>


<script>

    var currentPath;
function setCheckBox() {
    $(":checkbox").change(function () {


        var len = $("input[type='checkbox']:checked").length;

        if(len>0){
            if(canModify){
                $("#unshare").removeClass("layui-hide")
            }
            $("#download").removeClass("layui-hide")
        }
        if(len==0){
            $("#unshare").addClass("layui-hide")
            $("#download").addClass("layui-hide")
        }



    })
}
    var belongUser;
        var canModify=false;
    $(function () {
        init();



setCheckBox()

       /* if(${param.type=="public"}){
    $("#href").attr("href","/share/getSharePublic")
        }else{
            $("#href").attr("href","/share/getSharePrivate")

        }*/

    })

    function init(){



        //加载数据
        $.ajax({
            url:"/share/getItem",
            dataType:"json",
            data:{
                shareId:"${param.shareId}",
            },
            async:false,
            success:function (data) {

                if(${sessionScope.user!=null}){

                    if(${sessionScope.belongUserId==sessionScope.user.uid}||${sessionScope.user.permission==1}){
                        canModify=true;
                    }
                }


                $(".layui-table tbody").html("")
                $(data).each(function () {
                    handleItem(this)
                })
            }
        })
        //全选 全部选
        $("#AllId").click(function () {
            var isCheck=$(this).is(':checked');  //获得全选复选框是否选中
            $("input[type='checkbox']").each(function() {
                this.checked = isCheck;       //循环赋值给每个复选框是否选中
            });
        });


    }


    function handleItem(data) {
        var click;

        //click="getChild('"+data.item.path+"')"

        $("#tableID tbody").append("<tr>\n" +
            "                        <td colspan=\"3\"><input type=\"checkbox\" name=\"itemId\" value="+data.item_id+" id=\"\"><a href=\"javascript:void(0)\" onclick="+click+"><i class=\"layui-icon layui-icon-template-1\">"+data.item.name+"</i></a></td>\n" +
            "                        <td>"+data.item.size+"</td>\n" +
            "                        <td>"+data.item.lastModifyDate+"</td>\n" +
            "                    </tr>");
    }

   /* function getItem(path) {
        getChild(path)
    }*/


    /*function unshare() {
        $("#form").attr("action","/share/unshareItem")
        $("#form").ajaxSubmit({async:false})
        init();
        setCheckBox();
    }*/

    function download(){

        var path="/file/download.action?"

        //遍历每一个选中的checkbox

        var cs=$("input[type='checkbox']:checked");

        for(var i=0;i<cs.length;i++){

            if(cs[i].value=="on"){
                continue;
            }

            path+="path="+cs[i].value+"&"
        }
        path+="type=public"
        //alert(path+"     下载的链接")
        alert(path+"      丼")
        window.location.href=path;
    }






</script>

<%--正文 statrt--%>
<div id="tableID"><%--
    <a id="href" href="/netdisk//share.jsp?inlateMethod=/share/getSharePubic" >返回</a>--%>
    <form id="form" action="/file/download" method="post">
        <input type="hidden" id="to" name="to" value="fffffffffff"/>
        <input type="hidden" id="type" name="type" value=""/>
        <table class="layui-table" lay-skin="line" style="z-index: 9">



            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th colspan="3"><input type="checkbox" name="" id="AllId">文件名 &nbsp;&nbsp;&nbsp; <a href="javascript:void(0)" onclick="prev()">上一级</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="showAll()">全部文件</a> </th>
                <th>大小</th>
                <th>修改时间</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="item" items="${items}">

                <tr>
                    <td colspan="3"><input type="checkbox" name="path" value="${item.item.path}" ><a href="#"><i class="layui-icon layui-icon-template-1">${item.item.name}</i></a></td>
                    <td>${item.item.size}</td>
                    <td>${item.item.lastModifyDate}</td>
                </tr>
            </c:forEach>


            </tbody>
        </table>

    </form>

</div>
<%--正文 end--%>`
</body>
</html>
