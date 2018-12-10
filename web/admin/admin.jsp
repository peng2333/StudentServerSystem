 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="../css/layui.css">
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../js/echarts/echarts.js"></script>
    <script src="../js/echarts/echarts-all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/admin_student.jsp">学生管理</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/admin_tiezi.html">帖子管理</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/admin_dingdan.jsp">订单管理</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}${user.imageurl}" class="layui-nav-img">
                    ${user.username}
                </a>
            </li>
            <li class="layui-nav-item"><a href="../index.jsp">退了</a></li>
        </ul>
    </div>


    <!-- 内容主体区域 -->
    <div  style="padding: 15px;">
        <div style="float: right;padding-right: 80px;height: 50px;padding-top: 10px;">
            <a href="/admin/admin?view=sxt" id="sxt"><font color="${view == 'sxt' ? 'red' : ''}">扇形图</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/admin/admin?view=zzt" id="zzt"><font color="${view == 'zzt' ? 'red' : ''}">柱状图</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/indexView/mapView" ><font color="${view == 'dt' ? 'red' : ''}">地图</font></a>
        </div>

        <%-- 1.展示访问统计--%>
        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <%--显示柱状图、扇形图统计--%>
        <c:if test="${view == 'sxt' || view == 'zzt'}">
            <div id="main" style="height:400px;padding-left: 90px;margin-left: 0; padding-right: 90px;"></div>

            <!-- ECharts单文件引入 -->
            <script type="text/javascript">
                if(${view == "zzt"}){
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('main'));

                    var option = {
                        title: {
                            x: 'center',
                            text: '用户访问统计',
                            subtext: '',
                            link: 'http://echarts.baidu.com/doc/example.html'
                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                dataView: {show: true, readOnly: false},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        calculable: true,
                        grid: {
                            /*left: '20%',
                            width:400,*/
                            borderWidth: 0,
                            y: 80,
                            y2: 60
                        },
                        xAxis: [
                            {
                                type: 'category',
                                show: false,
                                data: ['资源中心','交流互助中心','早点服务','竞赛','异常']
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                show: false
                            }
                        ],
                        series: [
                            {
                                name: '用户访问统计',
                                type: 'bar',
                                itemStyle: {
                                    normal: {
                                        color: function(params) {
                                            // build a color map as your need.
                                            var colorList = [
                                                "#FF7F50","#87CEFA","#E18CDE","#32CD32","#6495ED"

                                            ];
                                            return colorList[params.dataIndex]
                                        },
                                        label: {
                                            show: true,
                                            position: 'top',
                                            formatter: '{b}\n{c}'
                                        }
                                    }
                                },
                                data: [${value1},${value2},${value3},${value4},${value5}],
                                markPoint: {
                                    tooltip: {
                                        trigger: 'item',
                                        backgroundColor: 'rgba(0,0,0,0)',
                                        formatter: function(params){
                                            return '<img src="'
                                                + params.data.symbol.replace('image://', '')
                                                + '"/>';
                                        }
                                    },
                                    data: [
                                        {xAxis:0, y: 350, name:'资源中心', symbolSize:20      , symbol: 'image://../asset/ico/折线图.png'},
                                        {xAxis:1, y: 350, name:'交流互助中心', symbolSize:20   ,symbol: 'image://../asset/ico/柱状图.png'},
                                        {xAxis:1, y: 350, name:'早点服务', symbolSize:20      , symbol: 'image://../asset/ico/柱状图.png'},
                                        {xAxis:1, y: 350, name:'竞赛', symbolSize:20      , symbol: 'image://../asset/ico/柱状图.png'},
                                        {xAxis:1, y: 350, name:'异常', symbolSize:20      , symbol: 'image://../asset/ico/柱状图.png'}
                                    ]
                                }
                            }
                        ]
                    };

                    // 为echarts对象加载数据
                    myChart.setOption(option);
                }else{
                    /*用于获得数据*/
                    var viewData = [{value:1, name:'资源中心'},{value:1, name:'交流互助中心'},{value:1, name:'早点服务'},{value:1, name:'竞赛'},{value:1, name:'异常'}];        //[{value:1, name:'资源中心'},{value:1, name:'交流互助中心'},{value:1, name:'早点服务'}]

                    // 基于准备好的dom，初始化echarts图表
                    var myChart = echarts.init(document.getElementById('main'));

                    var option = {
                        title : {
                            text: '用户访问统计',
                            // subtext: '纯属虚构',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient : 'vertical',
                            x : 'left',
                            data:['资源中心','交流互助中心','早点服务','竞赛','异常']
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {
                                    show: true,
                                    type: ['pie', 'funnel'],
                                    option: {
                                        funnel: {
                                            x: '25%',
                                            width: '50%',
                                            funnelAlign: 'left',
                                            max: 1548
                                        }
                                    }
                                },
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        series : [
                            {
                                name:'访问来源',
                                type:'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:[
                                    {value:${value1}, name:'资源中心'},
                                    {value:${value2}, name:'交流互助中心'},
                                    {value:${value3}, name:'早点服务'},
                                    {value:${value4}, name:'竞赛'},
                                    {value:${value5}, name:'异常'}
                                ]
                            }
                        ]
                    };


                    // 为echarts对象加载数据
                    myChart.setOption(option);
                }
            </script>
        </c:if>
        <%--显示地图统计--%>
        <c:if test="${view == 'dt'}">
            <div id="container" style="height: 600px;width:80%;margin:20px 0 0; padding-left: 60px;"></div>

            <!-- ECharts单文件引入 -->
            <script type="text/javascript">

                // 全国省份列表
                var dataMap = ${dataMapList};
                // 需要在页面上直接标记出来的城市
                var specialMap = ["${maxCity0}","${maxCity1}","${maxCity2}"];
                // 对dataMap进行处理，使其可以直接在页面上展示
                for (var i = 0; i < specialMap.length; i++) {
                    for (var j = 0; j < dataMap.length; j++) {
                        if (specialMap[i] == dataMap[j].name) {
                            dataMap[j].selected = true;
                            break;
                        }

                    }
                }
                // 绘制图表，准备数据
                var option = {
                    tooltip: {
                        formatter: function (params) {
                            console.info(params);
                            var info = '<p style="font-size:18px">' + params.name + '</p><p style="font-size:14px">使用本产品的总人数：' + params.value + ' 人</p>'
                            return info;
                        },
                        backgroundColor: "#ff7f50",//提示标签背景颜色
                        textStyle: { color: "#fff" } //提示标签字体颜色
                    },
                    series: [
                        {
                            name: '中国',
                            type: 'map',
                            mapType: 'china',
                            selectedMode : 'multiple',

                            label: {
                                normal: {
                                    show: true,//显示省份标签
                                    // textStyle:{color:"#c71585"}//省份标签字体颜色
                                },
                                emphasis: {
                                    show: true,//对应的鼠标悬浮效果
                                    // textStyle:{color:"#800080"}
                                }
                            },
                            itemStyle: {
                                normal: {
                                    label:{show:true},      // 显示区域名（eg：广东、黑龙江）
                                    borderWidth: .5,//区域边框宽度
                                    borderColor: '#009fe8',//区域边框颜色
                                    // areaColor:"#ffefd5",//区域颜色
                                },
                                emphasis: {
                                    label:{show:true},
                                    borderWidth: .5,
                                    borderColor: '#4b0082',
                                    // areaColor: "#ffdead",
                                }
                            },
                            data: dataMap
                        }
                    ]
                };
                //初始化echarts实例
                var myChart = echarts.init(document.getElementById('container'));
                //使用制定的配置项和数据显示图表
                myChart.setOption(option);

            </script>
        </c:if>

    </div>

    <div style="margin-left: -200px;" class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>

