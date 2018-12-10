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
    <title>分享页面</title>
    <script type="text/javascript" src="/js/layui.js"></script>
    <script type="text/javascript" src="/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

    <%--<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
    <%
        User user=new User();
        user.setUid(1);
        user.setPermission(1);
        //request.getSession().setAttribute("user",user);
    %>
</head>
<body>
<ul class="layui-nav" lay-filter="">
    <center><li class="layui-nav-item"><a href="">我的分享</a></li></center>
</ul>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id="unshare" onclick="unshare()" class="layui-btn layui-hide layui-btn-sm layui-btn-radius layui-btn-primary">取消分享</button>
<button id="download" onclick="download()" class="layui-btn layui-hide layui-btn-sm layui-btn-radius layui-btn-primary">下载</button>


<script>

    var canModify;
    var belongUser;
    $(function () {
        //加载数据
     init();
    })

    function init(){

        $("#unshare").addClass("layui-hide")
        $("#download").addClass("layui-hide")
        $.ajax({
            url:"${param.inflateMethod}",
            dataType:"json",
            data:{
                userId:${sessionScope.user==null?1:sessionScope.user.uid}
            },
            async:false,
            success:function (data) {
                $(".layui-table tbody").html("")


                if(data.length!=0 &&${sessionScope.user!=null}){
                    if(data[0].type=="1") {
                        //如果这个分享是公共的，并且我是管理员
                        if(${sessionScope.user.permission==1}){
                            canModify=true;
                        }
                    }

                    if(data[0].user_id==${sessionScope.user==null?-1:sessionScope.user.uid}){
                        canModify=true;
                    }

                }


                alert(data[0].user_id)

                    belongUser=data[0].user_id;
                $(data).each(function () {
                    handleItem(this)
                })
            }
        })
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
        //全选 全部选
        $("#AllId").click(function () {
            var isCheck=$(this).is(':checked');  //获得全选复选框是否选中
            $("input[type='checkbox']").each(function() {
                this.checked = isCheck;       //循环赋值给每个复选框是否选中
            });
        });

    }

    function unshare() {
        $("#form").attr("action","/share/unshare")
        $("#form").ajaxSubmit({async:false})
        init();
    }


    function download(){

        var path="/share/download.action?"

        //遍历每一个选中的checkbox

        var cs=$("input[type='checkbox']:checked");

        for(var i=0;i<cs.length;i++){

            if(cs[i].value=="on"){
                continue;
            }

            path+="shareId="+cs[i].value+"&"
        }
        path+="type=1"
        //alert(path+"     下载的链接")
        alert(path+"      丼")
        window.location.href=path;
    }



function handleItem(data) {
    var click="getItem('"+data.share_id+"')"

    $(".layui-table tbody").append("<tr>\n" +
        "                        <td colspan=\"3\"><input type=\"checkbox\" name=\"shareId\" value="+data.share_id+" id=\"\"><a href=\"javascript:void(0)\" onclick="+click+"><i class=\"layui-icon layui-icon-template-1\">"+data.name+"</i></a></td>\n" +
        "                        <td>"+data.count+"</td>\n" +
        "                        <td>"+data.create_date+"</td>\n" +
        "                        <td>"+data.downloads.count+"</td>\n" +
        "                    </tr>");
}


function getItem(shareId){

        window.location.href="http://localhost:8080/share/"+shareId;

}

</script>

<%--正文 statrt--%>
<div id="tableID">

    <form id="form" action="" method="post">
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
                <th colspan="3"><input type="checkbox" name="all" id="AllId">文件名 &nbsp;&nbsp;&nbsp; </th>
                <th>数量</th>
                <th>修改时间</th>
                <th>下载量</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                <td>12</td>
                <td>2018-06-12</td>
                <td>99</td>
            </tr>



            </tbody>
        </table>

    </form>

</div>
<%--正文 end--%>`
</body>
</html>
