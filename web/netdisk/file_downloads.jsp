<%--
  Created by IntelliJ IDEA.
  User: Boo
  Date: 2018/7/2
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script>
        $(function () {
            $.ajax({
                type: "POST",
                url: "/file/fileDownloads.action",
                success: function (msg) {
                    for(var i=0 ;i < msg.length;i++){
                        $("#tableId").append("<tr>\n" +
                            "            <td>"+(i+1)+"</td>\n" +
                            "            <td><a href=/file/download?path="+msg[i].path+">"+msg[i].path.split("/")[3]+"</a></td>\n" +
                            "            <td>"+msg[i].count+"</td>\n" +
                            "        </tr>");
                    }
                },
            });
        });
    </script>
</head>
<body>
    <table id="tableId">
        <tr>
            <td>排名</td>
            <td>文件名</td>
            <td>下载量</td>
        </tr>
    </table>
</body>
</html>
