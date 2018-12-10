<%--
  Created by IntelliJ IDEA.
  User: tianc
  Date: 2018/6/28
  Time: 8:18
  -- 用于展示时间段访问量、地图展示ip定位
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery-1.12.4.js"></script>
    <script src="../js/echarts/echarts.js"></script>
    <script src="../js/echarts/echarts-all.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px;width: 100%;padding: 37px;margin: 8px;"></div>
    <!-- ECharts单文件引入 -->
    <script type="text/javascript">
        /*用于获得数据*/
        var viewData = [{value:1, name:'资源中心'},{value:1, name:'交流互助中心'},{value:1, name:'早点服务'}];        //[{value:1, name:'资源中心'},{value:1, name:'交流互助中心'},{value:1, name:'早点服务'}]

        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main'));


        var option = {
            title : {
                text: '世界人口总量',
                subtext: '数据来自网络'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['2011年', '2012年']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'value',
                    boundaryGap : [0, 0.01]
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    data : ['巴西','印尼','美国','印度','中国','世界人口(万)']
                }
            ],
            series : [
                {
                    name:'2011年',
                    type:'bar',
                    data:[18203, 23489, 29034, 104970, 131744, 630230]
                },
                {
                    name:'2012年',
                    type:'bar',
                    data:[19325, 23438, 31000, 121594, 134141, 681807]
                }
            ]
        };

















        /*var option = {
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
                data:['资源中心','交流互助中心','早点服务']
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
                    ]
                }
            ]
        };*/


        // 为echarts对象加载数据
        myChart.setOption(option);
    </script>
</body>
</html>
