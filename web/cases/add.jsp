<%--
  Created by IntelliJ IDEA.
  User: 小鹏鹏
  Date: 2018/6/4
  Time: 20:18
  To change this template use A | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>知识互助中心</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/layer.css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../js/layui.js"></script>
    <script type="text/javascript" src="../layer/layer.js"></script>
</head>
<body style="margin: 0px;background-size: 1600px 700px" background="../images/500472554.jpg"">


<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表新帖<!-- 编辑帖子 --></li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form id="fr" action="${pageContext.request.contextPath}/case/addCard" method="post">
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md9">
                                    <label for="L_title" class="layui-form-label">标题</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="L_title" name="title" required lay-verify="required"
                                               autocomplete="off" class="layui-input">
                                        <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <label class="layui-form-label">所属分类</label>
                                    <div class="layui-input-block">
                                        <select lay-verify="required" name="class" lay-filter="column" id="se1">
                                            <option value=""></option>
                                            <option value="传智热点">传智热点</option>
                                            <option value="生活日常">生活日常</option>
                                            <option value="学术难疑">学术难疑</option>
                                            <option value="技术分享">技术分享</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="L_content" name="content" required lay-verify="required"
                                              placeholder="详细描述" class="layui-textarea fly-editor"
                                              style="height: 260px;"></textarea>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">人类验证</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_vercode" name="vercode" required lay-verify="required"
                                           placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid">
                                    <span style="color: #c00;">1+1=?</span>
                                </div>
                            </div>

                            <div class="layui-form-item">

                                <input type="submit" class="layui-btn" lay-filter="*" id="btn" value="立即发布">
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script>

    layui.cache.page = 'jie';
    layui.cache.user = {
        username: '游客'
        , uid: -1
        , avatar: '../../res/images/avatar/00.jpg'
        , experience: 83
        , sex: '男'
    };
    layui.config({
        version: "3.0.0"
        , base: '${pageContext.request.contextPath}/mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
    $(function () {


        $("#btn").prop("disabled","disabled");
        $("#L_title").blur(function () {
            var str = $("#L_title").val();
            if (str != "") {
                $("#btn").removeProp("disabled");
            } else {
                $("#btn").prop("disabled", "disabled");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg('请输入标题');
                });
            }

        })
        $("#se1").blur(function () {
            var str= $("#se1").val();
            if(str=="传智热点"||str!="生活日常"||str!="学术难疑"||str!="技术分享"){
                $("#btn").removeProp("disabled");
            } else {
                $("#btn").prop("disabled", "disabled");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg('请填写类型');
                });

            }

        })
        $("#L_content").blur(function () {
            var str = $("#L_content").val();
            if (str != "") {
                $("#btn").removeProp("disabled");
            } else {
                $("#btn").prop("disabled", "disabled");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg('请填写内容');
                });
            }
        })
        $("#L_vercode").blur(function () {
            var str = $("#L_vercode").val();
            if (str == "2") {
                $("#btn").removeProp("disabled");
            } else {
                $("#btn").prop("disabled", "disabled");
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.msg('请输入验证码');
                });
            }
        })

    })


</script>

</body>
</html>
