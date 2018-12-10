<%--
  Created by IntelliJ IDEA.
  User: 小鹏鹏
  Date: 2018/6/4
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>知识互助中心</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
</head>
<body style="margin: 0px;background-size: 1600px 700px" background="../images/500472554.jpg"">


<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">编辑该帖<!-- 编辑帖子 --></li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form action="/details/upData" method="post">
                            <input type="hidden" name="qid" value="${question.qid}" />
                            <div class="layui-row layui-col-space15 layui-form-item">
                                <div class="layui-col-md9">
                                    <label for="L_title" class="layui-form-label">标题</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="L_title" name="qbt"  value="${question.qbt}" required lay-verify="required"
                                               autocomplete="off" class="layui-input">
                                        <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <label class="layui-form-label">所属分类</label>
                                    <div class="layui-input-block">
                                        <select lay-verify="required" name="qtype" lay-filter="column">
                                            <option value=""></option>
                                            <option value="传智热点" ${question.qtype == "传智热点"?"selected='selected'":""} >传智热点</option>
                                            <option value="生活日常" ${question.qtype == "生活日常"?"selected='selected'":""} >生活日常</option>
                                            <option value="学术疑难" ${question.qtype == "学术疑难"?"selected='selected'":""} >学术疑难</option>
                                            <option value="技术分享" ${question.qtype == "技术分享"?"selected='selected'":""} >技术分享</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block">
                                    <textarea id="L_content" name="qs" required lay-verify="required"
                                              placeholder="" class="layui-textarea fly-editor"
                                              style="height: 260px;">${question.qs}</textarea>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">人类验证</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_vercode" name="vercode" required lay-verify="required"
                                           placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-mid">
                                    <span style="color: #c00;">1*1=?</span>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <input  type="submit" class="layui-btn" lay-filter="*" value="立即编辑" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="../js/layui.js"></script>
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
        , base: '../mods/'
    }).extend({
        fly: 'index'
    }).use('fly');
</script>

</body>
</html>
