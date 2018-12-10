<%--
  Created by IntelliJ IDEA.
  User: 小鹏鹏
  Date: 2018/6/28
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>消息盒子</title>

    <link rel="stylesheet" href="../../../layui.css">
    <style>
        .layim-msgbox {
            margin: 15px;
        }

        .layim-msgbox li {
            position: relative;
            margin-bottom: 10px;
            padding: 0 130px 10px 60px;
            padding-bottom: 10px;
            line-height: 22px;
            border-bottom: 1px dotted #e2e2e2;
        }

        .layim-msgbox .layim-msgbox-tips {
            margin: 0;
            padding: 10px 0;
            border: none;
            text-align: center;
            color: #999;
        }

        .layim-msgbox .layim-msgbox-system {
            padding: 0 10px 10px 10px;
        }

        .layim-msgbox li p span {
            padding-left: 5px;
            color: #999;
        }

        .layim-msgbox li p em {
            font-style: normal;
            color: #FF5722;
        }

        .layim-msgbox-avatar {
            position: absolute;
            left: 0;
            top: 0;
            width: 50px;
            height: 50px;
        }

        .layim-msgbox-user {
            padding-top: 5px;
        }

        .layim-msgbox-content {
            margin-top: 3px;
        }

        .layim-msgbox .layui-btn-small {
            padding: 0 15px;
            margin-left: 5px;
        }

        .layim-msgbox-btn {
            position: absolute;
            right: 0;
            top: 12px;
            color: #999;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"
            charset="utf-8"></script>
    <script>
        $(function () {
            var url = "${pageContext.request.contextPath}/user/findAddmsg";
            var params = {
                "uid": ${sessionScope.user.uid}
            };
            $.ajax({
                "url": url,
                "data": JSON.stringify(params),
                "type": "post",
                "contentType": "application/json;charset=UTF-8",
                "success": function (data) {
                    $(data).each(function () {
                        $("#msgUl").append("<li data-uid=" + this.addFriendVo.user.uid + " data-fromGroup=" + this.addFriendVo.groupId + " data-name=" + this.addFriendVo.user.name + " data-imageurl=" + this.addFriendVo.user.imageurl + " data-afid=" + this.addFriendVo.afid + " data-sign="+this.addFriendVo.user.signature+"><a href='' target='_blank'>\n" +
                            "            <img src=" + this.addFriendVo.user.imageurl + " class='layui-circle layim-msgbox-avatar'>\n" +
                            "        </a>" +
                            "<p class='layim-msgbox-user'>\n" +
                            "            <a href='' target='_blank'>" + this.addFriendVo.user.name + "</a>\n" +
                            "            <span>" + this.time + "</span>\n" +
                            "        </p>" +
                            "<p class='layim-msgbox-content'>\n" +
                            "            申请添加你为好友\n" +
                            "            <span>附言:" + this.addFriendVo.remark + "</span>\n" +
                            "        </p>\n" +
                            "        <p class='layim-msgbox-btn'>\n" +
                            "            <button class='layui-btn layui-btn-small' data-type='agree'>同意</button>\n" +
                            "            <button class='layui-btn layui-btn-small layui-btn-primary' data-type='refuse'>拒绝</button>\n" +
                            "        </p>" +
                            "</li>");
                    });
                },
                "error": function () {
                },
                "dataType": "json"
            });

            $.ajax({
                "url": "${pageContext.request.contextPath}/user/findSysmsg",
                "data": JSON.stringify(params),
                "type": "post",
                "contentType": "application/json;charset=UTF-8",
                "success": function (data) {
                    $(data).each(function () {
                        if(this.systemMsg.type==0){
                            $("#msgUl").append("<li class='layim-msgbox-system'>\n" +
                                "        <p><em>系统：</em>"+this.systemMsg.name+"\n\t拒绝了你的好友申请<span>"+this.time+"</span></p>\n" +
                                "    </li>");
                        }else{
                            $("#msgUl").append("<li class='layim-msgbox-system'>\n" +
                                "        <p><em>系统：</em>"+this.systemMsg.name+"\n\t同意了你的好友申请<span>"+this.time+"</span></p>\n" +
                                "    </li>");
                        }
                    });
                },
                "error": function () {
                },
                "dataType": "json"
            });
        });
    </script>
</head>
<body>

<ul id="msgUl" class="layim-msgbox" id="LAY_view"></ul>
<script src="${pageContext.request.contextPath}/js/layMI/layui.js" charset="utf-8"></script>
<script>
    layui.use(['layim', 'flow'], function () {
        var layim = layui.layim
            , layer = layui.layer
            , $ = layui.jquery

        //操作
        var active = {
            //同意
            agree: function (othis) {
                var li = othis.parents('li')
                    , uid = li.data('uid')
                    , from_group = li.data('fromGroup')
                    , name = li.data('name')
                    , imageurl = li.data('imageurl')
                    , afid = li.data('afid')
                    , sign = li.data('sign')
                //选择分组
                parent.layui.layim.setFriendGroup({
                    type: 'friend'
                    , username: name
                    , avatar: imageurl
                    , group: parent.layui.layim.cache().friend //获取好友分组数据
                    , submit: function (group, index) {
                        var url = "${pageContext.request.contextPath}/user/addFriendSuccess";
                        var params = {
                            "groupId": group,
                            "afid": afid,
                            "uid" :uid
                        };
                        $.ajax({
                            "url": url,
                            "data": JSON.stringify(params),
                            "type": "post",
                            "contentType": "application/json;charset=UTF-8",
                            "success": function () {
                            },
                            "error": function () {
                            },
                            "dataType": "json"
                        });

                        parent.layer.close(index);
                        othis.parent().html('已同意');

                        parent.layui.layim.addList({
                            type: 'friend'
                            , avatar: imageurl //好友头像
                            , username: name //好友昵称
                            , groupid: group //所在的分组id
                            , id: uid //好友ID
                            , sign: sign //好友签名
                        });
                    }
                });
            }

            //拒绝
            , refuse: function (othis) {
                var li = othis.parents('li')
                    , uid = li.data('uid')
                    , afid = li.data('afid');

                layer.confirm('确定拒绝吗？', function (index) {
                    var url = "${pageContext.request.contextPath}/user/addFriendFail";
                    var params = {
                        "uid": uid,
                        "afid":afid
                    };
                    $.ajax({
                        "url": url,
                        "data": JSON.stringify(params),
                        "type": "post",
                        "contentType": "application/json;charset=UTF-8",
                        "success": function () {
                        },
                        "error": function () {
                        },
                        "dataType": "json"
                    });
                    layer.close(index);
                    othis.parent().html('<em>已拒绝</em>');
                });
            }
        };

        $('body').on('click', '.layui-btn', function () {
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</body>
</html>
