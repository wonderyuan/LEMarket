<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>主页</title>
<link rel="stylesheet" href="resources/css/layui.css">
<link rel="stylesheet" href="resources/css/admin.css">
<script src="resources/js/jquery.1.12.4.min.js"></script>
<script src="resources/js/layui.js"></script>
<script src="resources/js/echarts.js"></script>
<script src="resources/js/wonderland.js"></script>
<style type="text/css">
	.layui-col-xs6{
		width:220px;
		height:90px;
	}
	.layadmin-backlog-body{
		width:180px;
		height:90px;
	}
</style>
</head>
<body style="background-color:#F2F2F2;padding-top:15px;padding-left:15px;padding-bottom:0px;">
	<div class="layui-card" style="width: 480px; height: 195px;float:left;">
		<div class="layui-card-header">待办事件</div>
		<div class="layui-card-body" id="todo" style="width: 440px; height: 120px;">
              <div class="layadmin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 80px;">
                    <li class="layui-col-xs6">
                      <a class="layadmin-backlog-body">
                        <h3>总订单量</h3>
                        <p><cite style="line-height:45px;" id="totalOrder"></cite></p>
                      </a>
                    </li>
                    <li class="layui-col-xs6">
                    	<a class="layadmin-backlog-body">
	                        <h3>待发货</h3>
	                        <p><cite style="line-height:45px;" id="toDoOrder"></cite></p>
                        </a>
                    </li>
                </div>
		</div>
	</div>
	<div class="layui-card" style="width: 600px; height: 195px;float:left;margin-left:15px;">
		<!-- <div class="layui-card-header">热门商品浏览量</div> -->
		<div class="layui-card-body" id="hot" style="width: 560px; height:180px;"></div>
	</div>
	<div class="layui-card" style="width: 480px; height: 310px;float:left;">
		<div class="layui-card-header">销售额及订单量趋势</div>
		<div class="layui-card-body" id="order" style="width: 480px; height: 260px;"></div>
	</div>
	<div class="layui-card" style="width: 600px; height: 310px;float:left;margin-left:15px;">
		<div class="layui-card-header">手机销量排行</div>
		<div class="layui-card-body" id="volume" style="width: 580px; height: 260px;"></div>
	</div>
</body>
<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	$(function(){
		showToDo();
		var myChart = echarts.init(document.getElementById('volume'),'wonderland');
		var orderChart = echarts.init(document.getElementById('order'),'wonderland');
		var hotChart = echarts.init(document.getElementById('hot'),'wonderland');
		var layer;
		layui.use('layer',function(){
			layer=layui.layer;
		});
		// 指定图表的配置项和数据
		myChart.setOption({
			        tooltip: {},
			        legend: {
			        },
			        xAxis: {
			            data: [],
			            axisLabel:{
						     interval:0//横轴信息全部显示
						}
			        },
			        yAxis: {},
			        series: [{
			            type: 'bar',
			            data: []
			        }]
			    });
		orderChart.setOption({
	        tooltip: {
	            trigger: 'axis'
	        },
	        //图例名
	        legend: {
	            data:['销售额','订单量']
	        },
	        //工具框，可以选择
	        toolbox: {
	        },
	        //x轴信息样式
	        xAxis: {
	            type: 'category',
	            boundaryGap: false,
	            data: [],
	            axisLabel:{
	                interval:0
	            },
	        },

	        yAxis : [
	            {
	                type : 'value'
	            }
	        ],
	        series: [
	            //虚线
	            {
	                name:'订单量',
	                type:'line',
	                symbolSize:4,   //拐点圆的大小
	                data:[],
	                smooth:false,   //关键点，为true是不支持虚线的，实线就用true
	                itemStyle:{
	                    normal:{
	                        lineStyle:{
	                            width:2,
	                            type:'dotted'  //'dotted'虚线 'solid'实线
	                        }
	                    }
	                }
	            },
	            //实线
	            {
	                name:'销售额',
	                type:'line',
	                symbol:'circle',
	                symbolSize:4,
	                data:[]
	            }
	        ]
		});
		hotChart.setOption({
	        title: {
	        	text: '热门商品浏览量',
	            x:'center'
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: "{a} <br/>{b} : {c} ({d}%)"
	        },        
	        legend: {
	            orient: 'vertical',
	            x: 'left',
	            data: []
	        },        
	        toolbox: {
	            show: true,
	            feature: {
	                mark: { show: true },
	                magicType: {
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
	                restore: { show: true }
	            }
	        },         
	        series: [{
	            type: 'pie',
	            name:"浏览量",
	            radius: '55%',
	            center: ['50%', '60%'],            
	            data: []
	        }]        
	    });
		myChart.showLoading();
		$.ajax({
			type:"post",
			url:"goods/findGoodsByVolume",
			dataType:"json",
			success:function(res){
				 myChart.hideLoading();    //隐藏加载动画
		         myChart.setOption({        //加载数据图表
		            xAxis: {
		                  data: res.name
		            },
		            series: [{
		            	type: 'bar',
		                data: res.volume
		            	}]
		            });     
			},
			error:function(){
				layer.msg("图表数据请求失败！",{icon:5,anim:6,time:1000});
				myChart.hideLoading();
			}
		});
		$.ajax({
			type:"post",
			url:"order/findTotalOrder",
			dataType:"json",
			success:function(res){
				orderChart.setOption({        //加载数据图表
		            xAxis: {
		                  data: res.month
		            },
		            series: [{
		            	name:'订单量',
		                type:'line',
		                data:res.sheets
		            	},
		            	{
		            		name:'销售额',
			                type:'line',
			                symbol:'circle',
			                data:res.total
		            	}
		            ]
		            });
			}
		});
		var names = [];
		var brower = [];
		$.ajax({
			type:"post",
			url:"guess/findMostHotGoods",
			dataType:"json",
			success:function(res){
				$.each(res, function (index, item) {
	                names.push(item.name);    //挨个取出类别并填入类别数组 
	                brower.push({
	                    name: item.name,
	                    value: item.num
	                });
	            });
	            hotChart.setOption({        //加载数据图表                
	                legend: {                    
	                    data: names
	                },
	                series: [{                    
	                    data: brower
	                }]
	            });
	        }
		});
});
function showToDo(){
	$.ajax({
		type:"post",
		url:"order/findToDo",
		dataType:"json",
		success:function(data){
			$("#totalOrder").html(data.total);
			$("#toDoOrder").html(data.deliver);
		}
	});
}
</script>
</html>