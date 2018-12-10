<%@ page import="com.sss.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/6/4
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>网盘</title>
    <script type="text/javascript" src="/js/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/layui.js"></script>
    <%--<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>

    <div id="con" class="layui-hide">需要复制的文字</div>
   <%-- <br>
    <input type="button" name="" class="layui-hide" value="点击复制" onclick="copyToClipboard('con')">
    <br>
    <br>
    <input type="text" name="" class="layui-hide" placeholder="粘贴到这里试试">
--%>
    <%
    User user=new User();
    user.setUid(1);
    user.setPermission(2);
    //request.getSession().setAttribute("user",user);
    %>

    <%--页面访问时，记录访问数据 xiongtianci--%>
    <script>
        $(function () {
            var url = "/netdisk/index";
            var params = {

            };
            $.ajax({
                url:url,
                data:params,
                type:"post",
                contentType:"application/json;charset=UTF-8"
            });
        });
    </script>

    <script>



        function copyToClipboard(elementId) {
            // 创建元素用于复制
            var aux = document.createElement("input");

            // 获取复制内容
            var content = document.getElementById(elementId).innerHTML || document.getElementById(elementId).value;

            // 设置元素内容
            aux.setAttribute("value", content);

            // 将元素插入页面进行调用
            document.body.appendChild(aux);

            // 复制内容
            aux.select();

            // 将内容复制到剪贴板
            document.execCommand("copy");

            // 删除创建元素
            document.body.removeChild(aux);

            //提示
            alert("复制内容成功：" + aux.value);
        }
    </script>




    <script type="text/javascript">
        window.onload = function(){
            showTime();
        }
        function showTime(){
            var myDate = new Date();
            var year = myDate.getFullYear();
            var month = myDate.getMonth() + 1;
            var date = myDate.getDate();
            var dayArray = new Array(7);
            dayArray[0] = "星期日";
            dayArray[1] = "星期一";
            dayArray[2] = "星期二";
            dayArray[3] = "星期三";
            dayArray[4] = "星期四";
            dayArray[5] = "星期五";
            dayArray[6] = "星期六";
            var day1 = myDate.getDay();
            var day = dayArray[day1];
            var hour = myDate.getHours();
            var minute = myDate.getMinutes();
            var second = myDate.getSeconds();
            var min = checkTime(minute);
            var sec = checkTime(second);
            var time1 = year + " 年 " + month + " 月 " + date + " 日 ";
            var time2 = hour + " ：" + min + " ：" + sec;
            // document.write(time1+day+time2);
            //用js方法
            // document.getElementById("time").innerHTML = time1+day+time2;
            //用jquery方法
            $('#time').text(time1+" "+day+" "+time2);
            setTimeout("showTime()",500);
        }
        function checkTime(i){
            if(i<10){
                i = "0" + i;
            }
            return i;
        }
        $(function () {
            $("#uploadId").mouseover(function () {
                $("#wjjId").css("display","block");
                $("#wjId").css("display","block");
            });
            $("#uploadId").mouseout(function () {
                $("#wjjId").css("display","none");
                $("#wjId").css("display","none")
            });
            $("#wjjId").click(function () {
                $("#batch_publish_form_reset").click()
                $("#pathId").attr("value",currentPath)
                $("#dir").click()
            });
            $("#wjId").click(function () {
                $("#batch_publish_form_reset").click()
                $("#pathId").attr("value",currentPath)
                $("#file").click()
            });
        });
    </script>
    <style>
        .layui-layer-content{
            text-align: center;
        }
        .layui-btn-radius{
            border-radius: 5px;
        }
        .layui-btn{
            padding: 0px 15px 0px 15px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div>



</div>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-black">
        <div class="layui-logo" ><h3><font color="#bbb" id="logoID">传智网盘</font></h3></div>
        <div style="padding-left: 180px;">
           <%-- <jsp:include page="/netdisk/reception/head.jsp"></jsp:include>--%>

               <ul class="layui-nav" lay-filter="">
                   <li id="publicDisk" class="layui-nav-item layui-this "><a href="javascript:void(0)" onclick="publicDisk()"><i class="layui-icon layui-icon-user">公共网盘</i></a></li>
                   <li id="privateDisk" class="layui-nav-item"><a href="javascript:void(0)" onclick="privateDisk()"><i class="layui-icon layui-icon-username">个人网盘</i></a></li>
                   <%--<li class="layui-nav-item">--%>
                   <%--<a href="javascript:;">更多</a>--%>
                   <%--<dl class="layui-nav-child">--%>
                   <%--<dd><a href="">功能1</a></dd>--%>
                   <%--<dd><a href="">功能2</a></dd>--%>
                   <%--<dd><a href="">功能3</a></dd>--%>
                   <%--</dl>--%>
                   <%--</li>--%>
               </ul>
               <%--<div class="layui-select-title" style="float: left;margin-top: 41px;margin-left: 36px;">--%>
               <div class="layui-select-title" style="float: right;margin-top: 44px;margin-right: 1020px;width: 300px">
                   <input type="text" id="searchText" placeholder="搜索组件或模块" value="" class="layui-input">
                   <div  style="margin-top: -38px;margin-left: 246px;">
                   <input style="height: 38px;" onclick="search()" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" type="button" value="搜索"/>
                   </div>
                       <i class="layui-edge"></i>



               </div>

        </div>

        <%--用户信息--%>
        <%--<ul class="layui-nav layui-layout-right">--%>
            <%--<li class="layui-nav-item">--%>
                <%--<a href="javascript:;">--%>
                    <%--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                    <%--贤心--%>
                <%--</a>--%>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="">基本资料</a></dd>--%>
                    <%--<dd><a href="">安全设置</a></dd>--%>
                <%--</dl>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item"><a href="">退了</a></li>--%>
        <%--</ul>--%>


    </div>

    <div class="layui-side layui-bg-black">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <div class="layui-side-scroll ">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:void(0);"><i class="layui-icon layui-icon-list">区域</i></a>
                    <dl class="layui-nav-child">
                        <dd class=" layui-this">
                            <center><a href="javascript:void(0);" onclick="getAreaItem(0)" id="tool"><i class="layui-icon layui-icon-loading">工具</i></a></center>
                        </dd>
                        <dd>
                            <center><a href="javascript:void(0);" onclick="getAreaItem(1)"><i class="layui-icon layui-icon-loading">文档</i></a></center>
                        </dd>
                        <dd>
                            <center><a href="javascript:void(0);" onclick="getAreaItem(2)"><i class="layui-icon layui-icon-loading">视频</i></a></center>
                        </dd>
                        <dd>
                            <center><a href="javascript:void(0);" onclick="getAreaItem(3)"><i class="layui-icon layui-icon-loading">jar</i></a></center>
                        </dd>
                        <dd>
                            <center><a href="javascript:void(0);" onclick="getAreaItem(4)"><i class="layui-icon layui-icon-loading">源码</i></a></center>
                        </dd>
                        <dd>
                            <center><a href="javascript:void(0);" onclick="getAreaItem(5)"><i class="layui-icon layui-icon-loading">其他</i></a></center>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item "><a href="javascript:void(0)" onclick="shareList()" ><i class="layui-icon layui-icon-share">我的分享</i></a></li>
                <%--<li class="layui-nav-item "><a href="javascript:void(0)" onclick="moveToTrash()"><i class="layui-icon layui-icon-delete">回收站</i></a></li>
                --%><%-- 剩余空间显示 --%>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <div class="layui-progress">
                    <div class="layui-progress-bar" lay-percent="30%"></div>
                </div>
                <br>
                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余空间 100GB/300TB</span>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <div style="padding: 15px;">
            <%--操作导航栏 begin--%>
            <div><%--
                <a href="http://www.layui.com" onclick="upload()" id="upload" class=" layui-btn layui-btn-radius layui-btn-primary layui-btn-sm">上传</a>
--%>

                <form id="uploadForm" action="/file/upload" enctype="multipart/form-data" method="post" style="display: none">
                    <input type="hidden" name="type" value="1"/>
                    <input type="hidden" id="pathId" name="path" value=""/>

                    <dd>  <span><input id="dir" type="file" name="file" webkitdirectory mozdirectory/>
                            </span>

                        <span>
                                <input id="file" type="file" name="file" /></span>
                    </dd>
                    <span style="display:none"><input  id = 'batch_publish_form_reset' type = "reset" value = "重置"/></span>

                </form>


                <ul lay-filter="" id="uploadId" style="width: 70px; height: 50px;background-color: #F2F2F2;display: inline-block;position: relative" lay-shrink="all">
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <a href="javascript:void(0)" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" style="color: #555;font-size: 12px;margin-top: 0px;">&nbsp;&nbsp;&nbsp;上传&nbsp;&nbsp;&nbsp;</a>
                        </a>
                    </li>
                        <input type="hidden" name="type" value="1"/>
                        <input type="hidden" id="path" name="path" value=""/>
                        <li class="layui-nav-item" id="wjjId" style="position: absolute;top: 30px;display: none;z-index: 1">
                            <a href="javascript:;">
                                <a href="javascript:void(0)" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" style="color: #555;font-size: 12px;margin-top: 0px;padding: 0px 9px 0px 9px;float: left">
                                    上传文件夹
                                </a>
                            </a>
                        </li>
                        <li class="layui-nav-item" id="wjId" style="position: absolute;top: 60px;display: none">
                            <a href="javascript:;">
                                <a href="javascript:void(0)" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" style="color: #555;font-size: 12px;margin-top: 0px;padding: 0px 15px 0px 15px;float: left">
                                    上传文件
                                </a>
                            </a>
                        </li>
                </ul>

                <script>
                    //注意：导航 依赖 element 模块，否则无法进行功能性操作
                    layui.use('element', function(){
                        var element = layui.element;

                        //…
                    });
                </script>





                <script>
                    $(function () {
                        $("#dir").change(function () {
                            $("#path").attr("value",currentPath)
                            $("#uploadForm").ajaxSubmit({
                                async:false
                            })
                            $('#batch_publish_form_reset').click();
                            getAreaItem(currentType)
                        })


                        $("#file").change(function () {
                            $("#path").attr("value",currentPath)
                            $("#uploadForm").ajaxSubmit({
                                async:false
                            })
                            $('#batch_publish_form_reset').click();
                            getAreaItem(currentType)
                        })

                    })
                </script>


                <a href="javascript:void(0)" id="mkdir" onclick="mkDir()" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" style="margin-left: 15px;">新建文件夹</a>
                <a href="javascript:void(0)" id="download" onclick="down()" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm layui-hide">下载</a>

                <a href="javascript:void(0)" id="shar" onclick="share()" class="layui-btn layui-btn-radius layui-btn-primary layui-btn-sm layui-hide">分享</a>
                <a href="javascript:void(0)" onclick="deletePath()" class="btn layui-btn layui-btn-radius layui-btn-primary layui-btn-sm layui-hide">删除</a>
                <a href="javascript:void(0)" onclick="rename()" class="btn layui-btn layui-btn-radius layui-btn-primary layui-btn-sm layui-hide" id="btnRename">重命名</a>
                <a href="javascript:void(0)" onclick="move()" class="btn layui-btn layui-btn-radius layui-btn-primary layui-btn-sm layui-hide">转移到</a>
                <a href="javascript:void(0)" onclick="copy()" class="btn layui-btn layui-btn-radius layui-btn-primary layui-btn-sm layui-hide">复制到</a>
                <script type="text/javascript">
                    var currentPath="";

                    var currentType=1;

                    var shareMethod="/share/getSharePublic"

                    var getAreaMethod="/"
                    var searchMethod="/"
                    var moveToTrashMethod="/"
                    getAreaMethod="/file/getAllPublic.action"
                    searchMethod="/file/searchPublic"
                    moveToTrashMethod="/file/moveToTrashPublic"

                    var currentDisk="public"



                    layui.use('element', function(){
                        var element = layui.element;

                        //一些事件监听
                        element.on('tab(demo)', function(data){
                            console.log(data);
                        });
                    });



                    function share(){

                        layer.prompt({
                            formType: 2,
                            value: '初始值',
                            title: '分享名',
                            area: ['256px', '108px'] //自定义文本域宽高
                        }, function(value, index, elem){
//                            alert(value); //得到value
                            $("#form").attr("action","/share/addShare")
                            $("#type").attr("value",currentDisk)
                            $("#name").attr("value",value)
                           // $("#form").ajaxSubmit({async:false})

                            var path="/share/addShare.action?"

                            //遍历每一个选中的checkbox

                            var cs=$("input[type='checkbox']:checked");

                            for(var i=0;i<cs.length;i++){
                                path+="path="+cs[i].value+"&"
                            }

                            alert(currentDisk+"--      当前网盘类型")

                            $.ajax({
                                url:path,
                                dataType:"json",
                                data:{
                                  name:value,
                                    type:currentDisk
                                },
                                async:false,
                                success:(function (data) {
                                    //alert(data.value)
                                    $("#con").text(data.value)
                                    copyToClipboard('con')


                                })
                            })


                            layer.close(index);
                        });



                    }


                    function shareList(){

                        layer.open({
                            area:['700px','500px'],
                            content:"<iframe width='100%' height='90%' src='/netdisk/share.jsp?inflateMethod="+shareMethod+"'/>",
                        });

                    }


                    function hideBtn(){
                        $(".btn").addClass("layui-hide")
                        $("#shar").addClass("layui-hide")
                        $("#download").addClass("layui-hide")
                    }


                    function down(){
                        layer.open({
                            type : 2,
                            title: "下载排行",
                            content: "/netdisk/file_downloads.jsp",
                            area: ['400px', '300px'],
                            closeBtn:1,
                        });
                        $("#form").attr("action","/file/download.action")
                        $("#type").attr("value",currentDisk)
                        //遍历每一个checkbox,拼装链接
                        //然后拼装

                        var path="/file/download.action?"

                        //遍历每一个选中的checkbox

                        var cs=$("input[type='checkbox']:checked");

                        for(var i=0;i<cs.length;i++){
                            path+="path="+cs[i].value+"&"
                        }
                        path+="type="+currentDisk
                        //alert(path+"     下载的链接")

                        alert(path+" 链接")

                        window.location.href=path;

                    }


                    function showTrash(){

                    }


                    function rename(){
                        layer.prompt({
                            formType: 2,
                            value: '初始值',
                            title: '请输入值',
                            area: ['800px', '350px'] //自定义文本域宽高
                        }, function(value, index, elem){
                            //alert(value); //得到value

                            $("#form").attr("action","/file/rename")
                            $("#to").attr("value",value);
                            $("#form").ajaxSubmit({async:false})
                            getChild(currentPath);
                            layer.close(index);
                        });
                    }



                    function prev(){


                        getBrother(currentPath);

                        if(currentDisk=="public"){
                            publicCheckboxSet()
                        }else{
                            privateCheckboxSet()
                        }
                    }

                    function getBrother(path){
                        $.ajax({
                            url:"/file/getBrother",
                            method:"post",
                            data:{
                                path:path
                            },
                            dataType:"json",
                            async:false,
                            success:(function (data) {
                                currentPath=data.key;
                              //  alert("我这是成功了")
                             //   alert(data.key+"  当前路径")
                                $(".layui-table tbody").html("")
                                $(data.value).each(function () {
                                    handleItem(this)
                                })
                            })
                        })



                    }

                    function getAll() {
                        getAreaItem(currentType);
                    }


                    function deletePath(){

                        $("#form").attr("action","/file/delete")
                        $("#form").ajaxSubmit({async:false})


                        getChild(currentPath)

                        $("btn").addClass("layui-hide")

                        $(".btn").addClass("layui-hide")
                        $("#uploadId").removeClass("layui-hide")
                        $("#mkdir").removeClass("layui-hide")

                        $("#shar").addClass("layui-hide")
                        $("#download").addClass("layui-hide")

                        if(currentDisk=="public"){
                            publicCheckboxSet()
                        }else{
                            privateCheckboxSet()
                        }

                    }

                    function mkDir(){
                        //弹窗

                        layer.prompt({
                            formType: 2,
                            value: '初始值',
                            title: '新建文件夹',
                            area: ['256px', '108px'] //自定义文本域宽高
                        }, function(value, index, elem){
//                            alert(value); //得到value

                            $.ajax({
                                url:"/file/mkdir",
                                data:{path:currentPath+"/"+value},
                                async:false
                            })
                            getChild(currentPath)
                            layer.close(index);
                        });



                    }


                    function publicDisk(){
                        $("#privateDisk").removeClass("layui-this")
                        $("#publicDisk").addClass("layui-this")

                        getAreaMethod="/file/getAllPublic"
                        searchMethod="/file/searchPublic"
                        moveToTrashMethod="/file/moveToTrashPublic"
                        shareMethod="/share/getSharePublic"
                        currentDisk="public"

                        getAreaItem(0)

                        publicCheckboxSet();
                    }
                    function privateDisk(){



                        if(${sessionScope.user==null}){
                            // alert("未登录")
                            layui.use(['layer', 'form'], function(){
                                layer.msg('未登录     ');
                            });
                            return;
                        }

                        sahreMethod="/share/getSharePrivate"

                        currentDisk="private"
                        shareMethod="/share/getSharePrivate"
                        checkBoxSexMethod="privateDisk()"

                        $("#privateDisk").addClass("layui-this")
                        $("#publicDisk").removeClass("layui-this")

                        getAreaMethod="/file/getAllPrivate"
                        searchMethod="/file/searchPrivate"
                        moveToTrashMethod="/file/moveToTrashPrivate"

                        getAreaItem(0)
                        privateCheckboxSet();
                    }

                    //根据区域获得文件及文件夹列表
                    function getAreaItem(type){


                        $("btn").addClass("layui-hide")

                        $(".btn").addClass("layui-hide")
                        $("#uploadId").removeClass("layui-hide")
                        $("#mkdir").removeClass("layui-hide")

                        $("#shar").addClass("layui-hide")
                        $("#download").addClass("layui-hide")

                        if(currentDisk=="public"){
                            publicCheckboxSet()
                        }else{
                            privateCheckboxSet()
                        }


                        currentType=type;
                        $.ajax({
                            url:getAreaMethod,
                            data:{
                                type:type,
                                userId:${sessionScope.user ==null? "1":sessionScope.user.uid}
                            },
                            async:false,
                            dataType:"json",
                            success:(function (data) {
                                //保存当前路径
                                currentPath=data.key;


                                //先清空原有
                                $(".layui-table tbody").html("")
                                //然后遍历
                                $(data.value).each(function () {

                                    handleItem(this)
                                    // alert("数据显示完成")
                                })
                            })
                        })

                        if(currentDisk=="private"){
                            privateCheckboxSet();
                        }else{
                            publicCheckboxSet();
                        }

                    }

                    //从传过来的json中放到容器
                    function handleItem(data){

                        var itemClickMethod="";

                        if(data.dir){
                           itemClickMethod="getChild"
                        }else{

                           // alert(data.postfix+"      后缀")

                            if(data.postfix==".txt"){
                                itemClickMethod="openTxt"
                            }
                            if(data.postfix == ".mp4"){
                                itemClickMethod="openMp4"
                            }
                            if(data.postfix == ".pdf"){
                                itemClickMethod="openPdf"
                            }

                            if(data.postfix==".docx"||data.postfix==".doc"){
                                itemClickMethod="openDoc";
                            }

                            if(data.postfix == ".JPG" || data.postfix == ".bmp"||data.postfix==".jpg"){
                                itemClickMethod="openImg"
                            }
                        }




                       /* alert(data.isDir+":"+data.postfix)

                        alert(itemClickMethod+":"+data.path)
*/

                        var click=itemClickMethod+"('"+data.path+"')"
                        $(".layui-table tbody").append("<tr>\n" +
                            "                        <td colspan=\"3\"><input type=\"checkbox\" name=\"path\" value="+data.path+" id=\"\"><a href=\"javascript:void(0)\" onclick="+click+"><i class=\"layui-icon layui-icon-template-1\">"+data.name+"</i></a></td>\n" +
                            "                        <td>"+data.size+"</td>\n" +
                            "                        <td>"+data.lastModifyDate+"</td>\n" +
                            "                    </tr>");

                    }

                    function getItemClickMethod(data){

                    }
                    function openTxt(path){
                        alert("打开txt:"+path)
                    }

                    function openDoc(path){
                        alert("服务端正在转换为pdf")
                        $.ajax({
                            url:"/file/transferFormat",
                            data:({
                                path:path
                            }),
                            async:false,
                            dataType:"json",
                            success:(function (data) {
                                alert(data.value)
                                openPdf(data.value)
                            })
                        })
                    }

                    function openMp4(path) {
                        layer.open({
                            title: '视频播放',
                            content: '  <video width="100%" height="96%" controls="controls" autoplay="autoplay">\n' +
                            '    <source src="\n'+ path +'" type="video/ogg" />\n' +
                            '    <source src="\n'+ path +'" type="video/mp4" />\n' +
                            '    <source src="\n'+ path +'" type="video/webm" />\n' +
                            '    <object data="\n'+ path +'" width="320" height="240">\n' +
                            '      <embed width="320" height="240" src="\n'+ path +'" />\n' +
                            '    </object>\n' +
                            '  </video> ',
                            area: ['1000px', '600px'],
                        });
                    }

                    function openPdf(path) {
                        path = "/ViewerJS/#.."+path;
                        alert(path)
                        layer.open({
                            title: 'PDF',
                            content: '<iframe src="'+path+'" width="100%" height="98%"/>',
                            area: ['1000px', '600px'],
                        });
                    }
                    function openImg(path) {
                        layer.open({
                            title: '图片',
                            content: '<img src="'+path+'"/>',
                            area: ['1000px', '600px'],
                        });
                    }
                    

                    // 根据绝对路径获得子文件及文件夹
                    function getChild(path){
                        $.ajax({
                            url:"/file/getChild.action",
                            data:{
                                path:path
                            },
                            dataType:"json",
                            async:false,
                            success:(function (data) {
                                $(".layui-table tbody").html("")


                                currentPath=data.key;


                                $(data.value).each(function () {
                                    handleItem(this)
                                })



                            })
                        })

                        if(currentDisk=="private"){
                            privateCheckboxSet();
                        }else{
                            publicCheckboxSet();
                        }

                    }


                    function search(){


                        $.ajax({
                            url:searchMethod,
                            data:{
                                name:$("#searchText").val(),
                                userId:${sessionScope.user==null?"1":sessionScope.user.uid}
                            },
                            dataType:"json",
                            async:false,
                            success:(function (data) {
                                //先清空原有
                                $(".layui-table tbody").html("")
                                $(data).each(function () {
                                    handleItem(this)
                                })
                            })

                        })


                        if(currentDisk=="public"){
                            publicCheckboxSet()
                        }else{
                            privateCheckboxSet()
                        }
                    }

                    //移动多个文件到回收站
                    function moveToTrash(path){
                        $.ajax({
                            url:moveToTrashMethod,
                            data:{
                                path:path,
                                userId:${sessionScope.user==null?"1":sessionScope.user.uid}
                            },
                            dataType:"json",
                            async:false,
                            success:(function (data) {

                            })
                        })
                    }

                    function initPublicData(){
                        if(${sessionScope.user==null|| sessionScope.user.permission!=1}){
                            //如果选择了大于1个选项,并且当前登录的是普通用户
                            //那就显示下载/分享按钮
                            $("#uploadId").addClass("layui-hide")
                            $("#mkdir").addClass("layui-hide")
                        }
                    }

                    function initPrivateData(){
                        if(${sessionScope.user!=null&&sessionScope.user.permission!=1}){
                            //如果选择了大于1个选项,并且当前登录的是普通用户
                            //那就显示下载/分享按钮
                            $("#uploadId").removeClass("layui-hide")
                            $("#mkdir").removeClass("layui-hide")
                        }
                    }


                    function publicCheckboxSet () {
                        initPublicData();
                        //获得复选框的数量 , 等于0 给btn的class添加"layui-btn-disabled" (addclass), 反之删除()
                        //按钮的隐藏于显示

                        $(":checkbox").off('change')


                        $(":checkbox").change(function () {

                            var len = $("input[type='checkbox']:checked").length;


                            // alert(l);
                            if(len==0&&${sessionScope.user!=null&&sessionScope.user.permission==1}){


                                //如果没有选择，并且当前登录的是管理员
                                //显示上传和新建文件夹按钮
                                $(".btn").addClass("layui-hide")
                                $("#uploadId").removeClass("layui-hide")
                                $("#mkdir").removeClass("layui-hide")

                                $("#shar").addClass("layui-hide")
                                $("#download").addClass("layui-hide")
                                return;
                            }
                            if(len==1&&${sessionScope.user!=null&&sessionScope.user.permission==1}){
                                //如果当前选择了一个，并且登录的是管理员
                                //那就显示上传/下载/新建文件夹/移动/复制/删除/分享按钮/重命名
                                $(".btn").removeClass("layui-hide")
                                $("#uploadId").removeClass("layui-hide")
                                $("#mkdir").removeClass("layui-hide")
                                $("#btnRename").removeClass("layui-hide")
                                $("#download").removeClass("layui-hide")
                                $("#btnRename").removeClass("layui-hide")
                                $("#shar").removeClass("layui-hide")
                                return;
                            }
                            if(len>1&&${sessionScope.user!=null&&sessionScope.user.permission==1}){
                                //如果当前登陆的用户是管理员并且选择了两个以上的条目
                                //显示上传/下载/新建文件夹/移动/复制/删除/分享按钮

                                $(".btn").removeClass("layui-hide")
                                $("#dir").removeClass("layui-hide")
                                $("#mkdir").removeClass("layui-hide")
                                $("#btnRename").removeClass("layui-hide")
                                $("#download").removeClass("layui-hide")
                                $("#btnRename").addClass("layui-hide")
                                $("#shar").removeClass("layui-hide")
                                return;
                            }

                            if(len>=1&&${sessionScope.user!=null&&sessionScope.user.permission!=1}){
                                //如果选择了大于1个选项,并且当前登录的是普通用户
                                //那就显示下载/分享按钮
                                $("#download").removeClass("layui-hide")
                                $("#shar").removeClass("layui-hide")
                                return;
                            }



                            if(len==0){
                                //如果没选中一个，并且当前是普通用户
                                $("#download").addClass("layui-hide")
                                $("#shar").addClass("layui-hide")
                                return;
                            }
                            if(len>=1){
                                $("#download").removeClass("layui-hide")
                                return;
                            }

                        });
                        //全选 全不选
                        $("#AllId").click(function () {
                            var isCheck=$(this).is(':checked');  //获得全选复选框是否选中
                            $("input[type='checkbox']").each(function() {
                                this.checked = isCheck;       //循环赋值给每个复选框是否选中
                            });
                        });
                    };


                    function privateCheckboxSet () {
                        initPrivateData();
                        //获得复选框的数量 , 等于0 给btn的class添加"layui-btn-disabled" (addclass), 反之删除()
                        //按钮的隐藏于显示

                        $(":checkbox").off('change')

                        $(":checkbox").change(function () {
                            var len = $("input[type='checkbox']:checked").length;
                            // alert(l);
                            if(len==0&&${sessionScope.user!=null}){
                                //如果没有选择，并且当前登录的是管理员
                                //显示上传和新建文件夹按钮
                                $(".btn").addClass("layui-hide")
                                $("#uploadId").removeClass("layui-hide")
                                $("#mkdir").removeClass("layui-hide")

                                $("#shar").addClass("layui-hide")
                                $("#download").addClass("layui-hide")
                            }
                            if(len==1&&${sessionScope.user!=null}){
                                //如果当前选择了一个，并且登录的是管理员
                                //那就显示上传/下载/新建文件夹/移动/复制/删除/分享按钮/重命名
                                $(".btn").removeClass("layui-hide")
                                $("#uploadId").removeClass("layui-hide")
                                $("#mkdir").removeClass("layui-hide")
                                $("#btnRename").removeClass("layui-hide")
                                $("#download").removeClass("layui-hide")
                                $("#btnRename").removeClass("layui-hide")
                                $("#shar").removeClass("layui-hide")
                            }
                            if(len>1&&${sessionScope.user!=null}){
                                //如果当前登陆的用户是管理员并且选择了两个以上的条目
                                //显示上传/下载/新建文件夹/移动/复制/删除/分享按钮

                                $(".btn").removeClass("layui-hide")
                                $("#uploadId").removeClass("layui-hide")
                                $("#mkdir").removeClass("layui-hide")
                                $("#btnRename").removeClass("layui-hide")
                                $("#download").removeClass("layui-hide")
                                $("#btnRename").addClass("layui-hide")
                                $("#shar").removeClass("layui-hide")
                            }

                            if(len>=1&&${sessionScope.user!=null}){
                                //如果选择了大于1个选项,并且当前登录的是普通用户
                                //那就显示下载/分享按钮
                                $("#download").removeClass("layui-hide")
                                $("#shar").removeClass("layui-hide")
                            }

                            if(len==0&&${sessionScope.user!=null}){
                                //如果没选中一个，并且当前是普通用户
                                $("#download").addClass("layui-hide")
                                $("#shar").addClass("layui-hide")
                            }


                        });

                        //全选 全不选
                        $("#AllId").click(function () {
                            var isCheck=$(this).is(':checked');  //获得全选复选框是否选中
                            $("input[type='checkbox']").each(function() {
                                this.checked = isCheck;       //循环赋值给每个复选框是否选中
                            });
                        });
                    };


                    function move(){
                        /*var index=layer.open({
                            type: 2,
                            title: 'layer mobile页',
                            shadeClose: true,
                            shade: 0.8,
                            area: ['1080px', '70%'],
                            yes:function(index,layero){

                                $("#form").attr("action","/file/move")

                                $("#form").ajaxSubmit({async:false})

                                getChild(currentPath)

                            },
                            content: '/netdisk/dir_tree.jsp' //iframe的url
                        });
                        layer.iframeAuto(index);*/


                        var method="";
                        if(currentDisk=="public"){
                            method="/file/getDirTreeListPublic";
                        }else{
                            method="/file/getDirTreeListPrivate";
                        }


                        layer.open({
                        content:"<iframe src='/netdisk/dir_tree.jsp?dirMethod="+method+"'/>",
                            yes: function(index, layero){
                                //do something


                                $("#form").attr("action","/file/move")

                                $("#form").ajaxSubmit({async:false})

                                getChild(currentPath)

                                layer.close(index); //如果设定了yes回调，需进行手工关闭

                                hideBtn()
                                $("input:checkbox").removeAttr("checked");
                            }
                        });


                    }

                    function copy(){

                        var method="";
                        if(currentDisk=="public"){
                            method="/file/getDirTreeListPublic";
                        }else{
                            method="/file/getDirTreeListPrivate";
                        }


                        layer.open({
                            content:"<iframe src='/netdisk/dir_tree.jsp?dirMethod="+method+"'/>",
                            yes: function(index, layero){
                                //do something

                                $("#form").attr("action","/file/copy")

                                $("#form").ajaxSubmit()

                                getChild(currentPath)

                                layer.close(index); //如果设定了yes回调，需进行手工关闭
                            }
                        });

                    }



                    $(function () {
                        getAreaItem(0)
                        publicCheckboxSet();
                    })


                    function showAll(){
                        getAreaItem(currentType)
                    }

                </script>
                &nbsp;
            </div>
            <%--操作导航栏 end--%>
            <hr>
            <%--正文 statrt--%>
            <div id="tableID">

                <form id="form" action="" method="post">
                    <input type="hidden" id="to" name="to" value="fffffffffff"/>
                    <input type="hidden" id="type" name="type" value=""/>
                    <input type="hidden" id="name" name="name" value=""/>
                    <span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span>
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
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="checkbox" name="" id=""><a href="#"><i class="layui-icon layui-icon-template-1">人生就像是一场修行</i></a></td>
                        <td>100MB</td>
                        <td>2018-06-12</td>
                    </tr>


                    </tbody>
                </table>

                </form>

            </div>
            <%--正文 end--%>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <span id="time"></span>
    </div>
</div>
<script>
JSON.stringify()
    var date = new Date();
    //JavaScript代码区域
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form;

        layer.msg('资源加载中'+"    <i class=\"layui-icon layui-icon-loading layui-icon layui-anim layui-anim-rotate layui-anim-loop\"></i>");
    });
</script>

</body>
</html>