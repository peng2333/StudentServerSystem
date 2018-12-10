<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>知识互助中心</title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/global.css">
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<script type="text/javascript">
    $(function () {

    })
</script>

<body style="margin: 0px;background-color: #fff">
<%@include file="header.jsp"%>

<div class="layui-container fly-marginTop ">
    <div class="fly-panel" pad20 style="padding-top: 5px;">

        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this ">题库搜集</li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form action="/measurement/addMeasurement.action" method="post">
                            <input type="hidden" name="uid" value="${user.uid}" />
                            <div class="layui-row layui-col-space15 layui-form-item">

                                <div class="layui-form-item">
                                    <label class="layui-form-label">一级分类</label>
                                    <div class="layui-input-block">
                                        <select lay-verify="required" name="typeone" id="typenoe" lay-filter="column">
                                            <option value="0" disabled>
                                                不请选择
                                            </option>
                                            <option value="1" disabled>
                                                不需选择
                                            </option>


                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">二级分类</label>
                                    <div class="layui-input-block">
                                        <select lay-verify="required" name="typetwo" id="typetwo" lay-filter="column">
                                            <option value="0"} disabled>
                                                不请选择
                                            </option>
                                            <option value="1" disabled>
                                                不需选择
                                            </option>

                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">等级</label>
                                    <div class="layui-input-block">
                                        <select lay-verify="required" name="level" lay-filter="column">
                                            <option value="0"} >
                                                请选择
                                            </option>
                                            <option value="1"} >
                                                简单
                                            </option>
                                            <option value="2"} >
                                                普通
                                            </option>
                                            <option value="3"} >
                                                困难
                                            </option>

                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-tab layui-tab-brief" lay-filter="user">
                                <ul class="layui-tab-title">
                                    <li class="layui-this">编辑</li>
                                </ul>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <div class="layui-input-block ">
                                    <textarea id="L_content" name="content" required lay-verify="re想·quired"
                                              placeholder="" class="layui-textarea fly-editor "
                                              style="height: 260px;" placeholder="请输入"></textarea>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">答案</label>
                                <div class="layui-input-inline ">
                                    <input type="text" id="L_vercode" name="answer" required lay-verify="required"
                                           placeholder="请提交正确的问题答案" autocomplete="off" class="layui-input">
                                </div>

                            </div>

                            <div class="layui-form-item">
                                <input type="submit" class="layui-btn layui-bg-black" lay-filter="*" value="提交"/>
                            </div>
                            <div class="layui-form-item" style="margin-left: 1066px;margin-top: -53px;">
                                <a href="/index.jsp" class="layui-btn layui-bg-black">返回</a>
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