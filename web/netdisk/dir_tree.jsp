<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/6/6
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>多级分类管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css"
          href="/layui/css/layui.css" media="all">

</head>

<style>
    .panel {
        margin-bottom: 0;
    }
    i{

        cursor: pointer !important ;
        cursor: hand !important;
    }
    body{

    }

    a:hover{
        background-color:#E6E6E6 ;
    }

    .active{
        background:#E6E6E6;
    }
    .hide{
        display:none;
    }

</style>
<body style="height:100%;">



<div    style="height:100%;widows: 100%;">
    <div class="panel panel-default"
         style=" position:fixed;   width: 250px; height:800px;   overflow:auto;">
        <div class="panel-body"  style=" ">
            <h4 style="text-align: center;">分类管理</h4>
            <ul unselectable="on" id="demo"
                style="margin-top: 30px; -moz-user-select: none; -webkit-user-select: none;"
                onselectstart="return false;"  ></ul>

            <button  id="addcate" class="layui-btn  layui-btn-primary"  style="margin-top:20px; margin-left:28px; width:70%;">新建文件夹</button>
            <button  id="ok" class="layui-btn  layui-btn-primary"  style="margin-top:20px; margin-left:28px; width:70%;">确定</button>
            <button  id="cancle" class="layui-btn  layui-btn-primary"  style="margin-top:20px; margin-left:28px; width:70%;">取消</button>
        </div>
    </div>



</div>


<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript">



    layui.use(['jquery','layer','element','form','tree'],function(){
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var form  =  layui.form;
        var elem = layui.element;
        var topcateid=0;  //为模拟顶级分类id用

      /*  //初始化layer.tree
        var tree = layui.tree({
            elem: '#demo',
            nodes:"",
            click:function (node) {
                alert(node.name)
            }
            //这里可以通过后台获取（如ThinkPHP框架则可以通过后台拼接好，再生成模板变量类似{$tree}就可以）
        });
*/
var tree;

        $.ajax({
            type: "post",
            url: "${param.dirMethod}",
            dataType: 'json',
            data:({user_id:${sessionScope.user.uid}}),
            success: function (data) {
                $("").html("");
                tree=layui.tree({
                    elem: '#demo',
                    nodes: data,
                    click: function (node, a) {
                        //console.log(a);
                        alert(node.path)

                        var to=$('#to', parent.document);
                        var form=$('#form',parent.document);
                        to.attr("value",node.path)
                    },
                    success: function () {

                    }
                });
            }
        })




        window.onload=function(){

            //删除layui-tree 自带的样式
            $("i.layui-tree-branch").remove();
            $("i.layui-tree-leaf").remove();
            //添加操作的图标(即鼠标划过时显示的添加，修改，删除的按钮组)
            $("ul#demo").find("a").after("<i class='layui-icon add select hide ' )'></i>"+
                "<i class='layui-icon edit select hide'></i>"+
                "<i class='layui-icon del select hide'></i>");
        }

//添加顶级分类
        $("#addcate").on("click",function(){
            layer.prompt({title: '输入分类名称，并确认', formType:0}, function(text, index){
                layer.close(index);
                //TODO 可以ajax到后台操作，这里只做模拟
                layer.load(2);
                setTimeout(function(){
                    layer.closeAll("loading");
                    //手动添加节点，肯定有更好的方法=.=！这里的方法感觉有点LOW
                    // li里面的pid属性为父级类目的id,顶级分类的pid为0
                    topcateid= topcateid+1;
                    $("ul#demo").append("<li  pid='0' id="+(topcateid)+">"+
                        "<a ><cite>"+text+"</cite> </a>"+
                        "<i class='layui-icon del select hide'></i>"+
                        "<i class='layui-icon select hide add'></i>"+
                        "<i class='layui-icon edit select hide'></i>"+
                        "</li>");
                },1000)
            });
        })



//显示/隐藏 分类的操作栏
        $("ul#demo").on({

            mouseover: function(event) {
                event.stopPropagation();
                $(this).children(".select").removeClass("hide")
            },

            mouseout: function(event) {
                event.stopPropagation();
                $(this).children(".select").addClass("hide")
            },

        },"li","a")

//添加子分类
        $("ul#demo ").on("click","li .add",function(){

            var pid = $(this).closest("li").attr("id");//将父级类目的id作为父类id
            var that= $(this).closest("li");
            layer.prompt({title: '输入子分类名称，并确认', formType:0}, function(text, index){
                layer.close(index);

                //TODO 可以ajax到后台操作，这里只做模拟
                layer.load(2);
                setTimeout(function(){
                    layer.closeAll("loading");
                    topcateid= topcateid+1;
                    if(that.children("ul").length == 0){
                        //表示要新增   i 以及 ul 标签
                        that.prepend('<i class="layui-icon layui-tree-spread"></i>')
                        that.append("<ul class='layui-show'><li  pid="+pid+"   id="+(topcateid)+"><a    ><cite>"+text+"</cite> </a><i  class='layui-icon select hide add' )'></i> <i    class='layui-icon edit select hide'></i> <i    class='layui-icon del select hide'></i></li></ul>")
                    }else{
                        that.children("ul").append("<li pid="+pid+"    id="+(topcateid)+"><a  ><cite>"+text+"</cite> </a><i  class='layui-icon select hide add' )'></i> <i    class='layui-icon edit select hide'></i> <i    class='layui-icon del select hide'></i></li>");
                    }
                },1000)
            });


        })
//重命名
        $("ul#demo ").on("click","li .edit",function(){
            var node=$(this).parent().children("a").children("cite");
            var id=$(this).parent().attr("id")
            var that= $(this).closest("li");
            layer.prompt({title: '输入新的分类名称，并确认',value:node.text(), formType:0}, function(text, index){
                layer.close(index);

                //TODO 可以ajax到后台操作，这里只做模拟
                layer.load(2);
                setTimeout(function(){
                    layer.closeAll("loading");
                    node.text(text);
                },1000)
            });


        })
//删除分类
        $("ul#demo ").on("click","li .del",function(){
            alert("我被点击了"+$(this).prev().text())
            console.info($(this).prev().text())
            var that= $(this).closest("li");
            if(that.children("ul").length > 0){
                layer.msg("该分类下含有子分类不能删除")
                return;
            }
            var id=$(this).parent().attr("id")

            /*layer.confirm('确定要删除？该分类下的课程亦将删除！', {
                btn: ['删除','取消']
            }, function(){

                //TODO 可以ajax到后台操作，这里只做模拟
                layer.load(2);
                setTimeout(function(){
                    layer.closeAll("loading");
                    if((that.parent("ul").children("li").length == 1)&&(that.parent("ul").parent("li").children("i.layui-tree-spread").length=1)){
                        //要把分类名前的三角符号和ul标签删除
                        that.parent("ul").parent("li").children("i.layui-tree-spread").remove();
                    }
                    that.remove()
                },1000)
            });*/


        })
//打开/关闭菜单

        $("ul#demo").on({

            click:function(event){
                event.stopPropagation();
                event.preventDefault();
                if( $(this).parent().children("ul").hasClass("layui-show")){


                    $(this).html("");
                    $(this).parent().children("ul").removeClass("layui-show");
                    return;
                }else{


                    $(this).html("");
                    $(this).parent().children("ul").addClass("layui-show");
                    return;
                }
                return;
            }
        },  'i.layui-tree-spread');


    });

</script>



</body>

</html>