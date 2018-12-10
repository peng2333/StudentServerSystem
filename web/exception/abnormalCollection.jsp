<%--
  Created by IntelliJ IDEA.
  User: huahu
  Date: 2018-6-28
  Time: 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/bootstrap-3.3.4.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="${pageContext.request.contextPath}/js/layui.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/jquery-1.12.4.js"></script>


    <style type="text/css">


        .div1 {
            margin: 0 auto;
            width: 90%;
            height: 70px;
            text-align: center;
            margin-top: 20px;

        }

        .div2 {
            margin: 0 auto;
            width: 80%;
            height: 388px;
            border: 1px;
            overflow: auto;

        }

        .div5 {
            margin: 0 auto;
            width: 14%;
            height: 50px;
            border: 1px;
            border-width: 1px;
            border-style: solid;
            border-radius: 2px;
            margin-bottom: 10px;
            background-color: #d6e9c6;

        }

        .div3 {
            position: relative;
            display: block;
            box-sizing: border-box;
            background-color: white;
            margin-bottom: 30px;
            margin-outside: 30px;

        }

        .div4 {
            border-style: solid;
            height: 100%;
            width: 70%;
            background-color: white;
            margin-left: auto;
            margin-right: auto;

        }

        body {
            height: 100%;
            width: 100%;
        }

        .input1 {
            height: 50px;
            width: 70%;
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            margin: 10px;
        }

        .font1 {
            font-weight: bold;
            font-size: 30px;
            font-family: 微软雅黑;
            text-align: center;
        }

        #login_click {
            margin-top: 10px;
            height: 45px;
        }

        #login_click {

            text-decoration: none;
            background: #2f435e;
            color: #f2f2f2;

            padding: 10px 30px 10px 30px;
            font-size: 16px;
            font-family: 微软雅黑, 宋体, Arial, Helvetica, Verdana, sans-serif;
            font-weight: bold;
            border-radius: 3px;

            -webkit-transition: all linear 0.30s;
            -moz-transition: all linear 0.30s;
            transition: all linear 0.30s;

        }

        #login_click:hover {
            background: #385f9e;
        }

        .layui-form-checkbox i {
            position: absolute;
            right: 0;
            top: 0;
            width: 30px;
            height: 30px;
            border: 1px solid #d2d2d2;
            border-left: none;
            border-radius: 0 2px 2px 0;
            color: #fff;
            font-size: 20px;
            text-align: center
        }


    </style>
    <script>


        $(function () {
            $("#login_click").click(function () {
                var keywords = $("#keywords").val();
                var types = null

                $(".cb").each(function () {
                    if (this.checked == true) {
                        types += "," + $(this).val();
                    }
                })
                alert(types)

                if (types == null) {
                    alert("请选择搜索方式")
                    return;
                } else {
                    var url = "${pageContext.request.contextPath}/exception/find";
                    var params = {
                        "name": keywords,
                        "types": types
                    };
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: JSON.stringify(params),
                        cache: false,
                        contentType: "application/json",
                        dataType: "json",
                        success: function (data) {
                            datas = data;
                            alert(data);
                        }
                    });

                }
            })
        })
    </script>
</head>
<body style="background:url(../images/11.jpg)">


<div class="div4">
    <form class="layui-form">
        <div class="div1">
            <input name="name" type="text" class="input1" id="keywords" placeholder="IndexOutOfBoundsException">
            <a>
                <input type="button" id="login_click" value="搜索"/>
            </a>

        </div>
        <div class="layui-form-item" style="margin-left: 90px">

                <span class="layui-input-block">
                    <input type="checkbox" name="ckb" title="CSDN" value="CSDN" class="cb" checked>
                    <input type="checkbox" name="ckb" title="SEGMENTFAULT" value="SEGMENTFAULT" class="cb">
                    <input type="checkbox" name="ckb" title="STACKOVERFLOW" value="STACKOVERFLOW" class="cb">
                </span>
        </div>

    </form>


    <div class="div2" style="background-color: white">
        <div class="div3 layui-collapse">
            <div class="layui-collapse">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        懂英文吗？要不查查字典
                        Thrown to indicate that an index of some sort (such as to an array, to a string, or to a vector) is out of range.

                        Applications can subclass this class to indicate similar exceptions.

                        <div>
                                <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">

                        <em>639</em>
                      </span>

                        </div>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        Class IndexOutOfBoundsException

                        java.lang.Object
                        java.lang.Throwable
                        java.lang.Exception
                        java.lang.RuntimeException
                        java.lang.IndexOutOfBoundsException
                        All Implemented Interfaces:
                        Serializable
                        Direct Known Subclasses:
                        ArrayIndexOutOfBoundsException, StringIndexOutOfBoundsException

                        public class IndexOutOfBoundsException
                        extends RuntimeException
                        Thrown to indicate that an index of some sort (such as to an array, to a string, or to a vector) is out of range.
                        Applications can subclass this class to indicate similar exceptions.

                        Since:
                        JDK1.0
                        See Also:
                        Serialized Form
                        <div>
                                <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">

                        <em>928</em>
                      </span>

                        </div>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        Ok so I'm trying to create a drawing program, and it was working fine until I got a random error, I can't find what I messed up and I keep getting an error at nt point1 = (pointList.get(k)); Here is my whole code:
                        Java Code:
                        class MyPanel extends JPanel {

                        private int last_x;
                        private int last_y;
                        private int x;
                        private int y;
                        private Graphics g;
                        private int radiusX;
                        private int radiusY;
                        private int click_x;
                        private int click_y;
                        private String mouseString;

                        public MyPanel(ArrayList pointList, ArrayList colorList, ArrayList eraserList, ArrayList overlapList, ArrayList rectangleList)
                        {
                        setBorder(BorderFactory.createLineBorder(Color.black));
                        this.pointList = pointList;
                        this.colorList = colorList;
                        this.eraserList = eraserList;
                        this.overlapList = overlapList;
                        this.rectangleList = rectangleList;
                        defaultColor = new Color(238, 238, 238);
                        mouseString = "default";
                        addMouseListener(new MouseAdapter()
                        {
                        public void mousePressed(MouseEvent e)
                        {
                        last_x = e.getX();
                        last_y = e.getY();

                        }
                        }
                        );

                        addMouseMotionListener(new MouseAdapter()
                        {
                        public void mouseDragged(MouseEvent e)
                        {
                        x = e.getX();
                        y = e.getY();
                        mouseString = "Pressed";
                        repaint();
                        }
                        }
                        );
                        addMouseMotionListener(new MouseAdapter()
                        {
                        public void mouseRelease(MouseEvent e)
                        {
                        mouseString = "Released";
                        }
                        }
                        );
                        }
                        public Dimension getPreferredSize()
                        {
                        return new Dimension(250,200);
                        }
                        protected void paintComponent(Graphics g)
                        {
                        super.paintComponent(g);
                        int k = 0;
                        int j = 0;
                        int n = 0;
                        int m = 0;
                        int p = 0;
                        String eraserString12 = (String) setEraser1();
                        if (eraserString12.equals("Lines") && mouseString.equals("Pressed"))
                        {
                        pointList.add(last_x);
                        pointList.add(last_y);
                        pointList.add(x);
                        pointList.add(y);
                        colorList.add(setColor1());
                        overlapList.add(1);

                        }
                        else if (eraserString12.equals("Eraser") && mouseString.equals("Pressed"))
                        {
                        eraserList.add(last_x);
                        eraserList.add(last_y);
                        overlapList.add(2);
                        }
                        setBackgroundColor();
                        g.drawString("This is my custom Panel!",10,20);
                        int overlapSize = (int) overlapList.size();
                        last_x = x;
                        last_y = y;
                        while (m<overlapSize)
                        {
                        int overlap = overlapList.get(m);
                        if (overlap==1)
                        {
                        System.out.println(pointList);
                        int point1 = (pointList.get(k));
                        int point2 = ( pointList.get(k+1));
                        int point3 = (pointList.get(k+2));
                        int point4 = (pointList.get(k+3));
                        g.setColor(colorList.get(j));
                        g.drawLine(point1, point2, point3, point4);
                        g.setColor(defaultColor);
                        k = k+4;
                        j = j+1;

                        }
                        if (overlap==2)
                        {
                        int circleX = eraserList.get(n);
                        int circleY = eraserList.get(n+1);
                        Color a = ColorBox.getBackground1();
                        if (a==Color.darkGray)
                        {
                        g.setColor(defaultColor);
                        }
                        else if (a!=Color.darkGray)
                        {
                        g.setColor(a);
                        }
                        g.fillOval(circleX-15, circleY-15, 30, 30);
                        n = n+2;
                        }
                        }

                        m++;
                        }


                        public Color setColor1()
                        {
                        Color color = ColorBox.getColor();
                        return color;
                        }
                        public void setBackgroundColor()
                        {
                        Color a = ColorBox.getBackground1();
                        if (a==Color.darkGray)
                        {
                        setBackground(defaultColor);
                        }
                        else if (a!=Color.darkGray)
                        {
                        setBackground(a);
                        }
                        }
                        public String setEraser1()
                        {
                        String eraserString = ColorBox.getEraser1();
                        return eraserString;
                        }
                        public void Clear()
                        {
                        pointList.clear();
                        colorList.clear();
                        eraserList.clear();
                        overlapList.clear();
                        rectangleList.clear();
                        ColorBox.setBackgroundDefault();
                        setBackground(defaultColor);
                        repaint();
                        }
                        private ArrayList<Integer> pointList;
                        private ArrayList<Color> colorList;
                            private ArrayList<Integer> eraserList;
                                private ArrayList<Integer> overlapList;
                                    private ArrayList<Integer> rectangleList;
                                        private Color defaultColor;
                                        }
                                        The ArrayList is 4 by 4, yet the error states:
                                        Java Code:
                                        Exception in thread "AWT-EventQueue-0" java.lang.IndexOutOfBoundsException: Index: 4, Size: 4
                                        at java.util.ArrayList.RangeCheck(Unknown Source)
                                        at java.util.ArrayList.get(Unknown Source)
                                        at MyPanel.paintComponent(Scribble.java:137)
                                        at javax.swing.JComponent.paint(Unknown Source)
                                        at javax.swing.JComponent.paintToOffscreen(Unknown Source)
                                        at javax.swing.RepaintManager$PaintManager.paintDoubleBuffered(Unknown Source)
                                        at javax.swing.RepaintManager$PaintManager.paint(Unknown Source)
                                        at javax.swing.RepaintManager.paint(Unknown Source)
                                        at javax.swing.JComponent._paintImmediately(Unknown Source)
                                        at javax.swing.JComponent.paintImmediately(Unknown Source)
                                        at javax.swing.RepaintManager.paintDirtyRegions(Unknown Source)
                                        at javax.swing.RepaintManager.paintDirtyRegions(Unknown Source)
                                        at javax.swing.RepaintManager.seqPaintDirtyRegions(Unknown Source)
                                        at javax.swing.SystemEventQueueUtilities$ComponentWorkRequest.run(Unknown Source)
                                        at java.awt.event.InvocationEvent.dispatch(Unknown Source)
                                        at java.awt.EventQueue.dispatchEventImpl(Unknown Source)
                                        at java.awt.EventQueue.access$000(Unknown Source)
                                        at java.awt.EventQueue$1.run(Unknown Source)
                                        at java.awt.EventQueue$1.run(Unknown Source)
                                        at java.security.AccessController.doPrivileged(Native Method)
                                        at java.security.AccessControlContext$1.doIntersectionPrivilege(Unknown Source)
                                        at java.awt.EventQueue.dispatchEvent(Unknown Source)
                                        at java.awt.EventDispatchThread.pumpOneEventForFilters(Unknown Source)
                                        at java.awt.EventDispatchThread.pumpEventsForFilter(Unknown Source)
                                        at java.awt.EventDispatchThread.pumpEventsForHierarchy(Unknown Source)
                                        at java.awt.EventDispatchThread.pumpEvents(Unknown Source)
                                        at java.awt.EventDispatchThread.pumpEvents(Unknown Source)
                                        at java.awt.EventDispatchThread.run(Unknown Source)
                                        So I'm stuck, any suggestions/tips?
                        <div>
                                <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">

                        <em>812</em>
                      </span>

                        </div>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        数组下标越界啊
                        检查下用到数组的地方，看看有没有超过数组的大小
                        比如开了一个 int a[10];
                        然后用到了a[10],a[11],..中的某一个，都会越界

                        <div>
                            <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">
                          <em>283</em>
                      </span>
                        </div>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        Publishing failed
                        Could not publish to the server.
                        java.lang.IndexOutOfBoundsException



                        是maven的repository里有文件损坏导致的错误。所以重新换了个本地仓库，重新下载jar包就好了。
                        <div>
                            <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">
                          <em>999</em>
                      </span>
                        </div>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        java.lang
                        Class IndexOutOfBoundsException

                        java.lang.Object
                        extended by java.lang.Throwable
                        extended by java.lang.Exception
                        extended by java.lang.RuntimeException
                        extended by java.lang.IndexOutOfBoundsException
                        All Implemented Interfaces:
                        Serializable
                        Direct Known Subclasses:
                        ArrayIndexOutOfBoundsException, StringIndexOutOfBoundsException
                        public class IndexOutOfBoundsException
                        extends RuntimeException
                        Thrown to indicate that an index of some sort (such as to an array, to a string, or to a vector) is out of range.

                        Applications can subclass this class to indicate similar exceptions.

                        Since:
                        JDK1.0
                        See Also:
                        Serialized Form
                        <div>
                            <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">
                          <em>567</em>
                      </span>
                        </div>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">IndexOutOfBoundsException</h2>
                    <div class="layui-colla-content layui-show">
                        IndexOutOfBoundsException

                        public IndexOutOfBoundsException()
                        Constructs an IndexOutOfBoundsException with no detail message.
                        IndexOutOfBoundsException

                        public IndexOutOfBoundsException(String s)
                        Constructs an IndexOutOfBoundsException with the specified detail message.
                        Parameters:
                        s - the detail message.

                        <div>
                            <span style="text-align: left">
                                    <input type="radio" name="radio1"/><font style="color:black;">发帖</font>
                                </span>
                            <span style="margin-right: 30px">
                       <img src="../images/zan.jpg" width="50px" height="30px">
                          <em>826</em>
                      </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="div5">
        <a href="">
            <font class="font1">点我发帖</font>
        </a>
    </div>
</div>


<script type="">
    layui.use('element', function () {
        var element = layui.element;
    });

    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>