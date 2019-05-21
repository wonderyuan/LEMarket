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
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="resources/css/layui.css">
<script type="text/javascript" src="resources/js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="resources/js/layui.js"></script>

<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<form class="layui-form">
<div class="layui-form-item" style="margin:15px;height:30px;">
    	<div style="height:40px;width:70px;float:left;line-height:40px;">订单编号:</div>
        <input type="text" class="layui-input" style="width:250px;float:left;" id="orderIdKeyword" name="orderIdKeyword" value="" lay-verify="" placeholder="请输入快递单号" autocomplete="off">
        <div style="height:40px;width:80px;float:left;line-height:40px;">&nbsp;&nbsp;起始日期:</div>
        <input type="text" id="startDate" name="startDate"  class="layui-input" style="float:left;width:100px;">
        <div style="height:40px;width:80px;float:left;line-height:40px;">&nbsp;&nbsp;结束日期:</div>
        <input type="text" id="endDate" name="endDate"  class="layui-input" style="float:left;width:100px;">
		<div style="height:40px;width:70px;float:left;line-height:40px;">&nbsp;&nbsp;订单状态:</div>
		<div class="layui-input-inline" style="width:150px;">
			<select name="orderState" id="orderState">
				<option value="">请选择订单状态</option>
				<option value="1">待付款</option>
				<option value="2">待发货</option>
				<option value="3">待收货</option>
				<option value="4">待评价</option>
				<option value="5">完成</option>
			</select>
		</div> 
	    <div class="layui-input-inline" style="width:80px;">
	        <a class="layui-btn" id="search" data-type="reload" name="search">
	            <i class="layui-icon"></i>搜索
	        </a>
	    </div> 
	    <div class="layui-input-inline" style="width:80px;">
		     <button class="layui-btn layui-btn-normal" id="reset"  name="reset" type="reset">
		            <i class="layui-icon">&#xe669;</i>重置
		     </button>
	    </div> 
</div>
</form>
<div>
    <table id="orders" lay-filter="orders"></table>
</div>
<div id="formData" style="display:none;width:750px;padding-top:10px;">
	<form id="orderForm" class="layui-form">
		<div class="layui-form-item">
			    <label class="layui-form-label">订单编号</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderId" id="orderId" style='background-color:#F8F8F8;' readonly="readonly" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">订单总价</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderPrice" id="orderPrice" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">订单地址</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderAddress" id="orderAddress" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">收货人</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderUserName" id="orderUserName" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
		<div class="layui-form-item">
			    <label class="layui-form-label">收货电话</label>
			    <div class="layui-input-block">
			      <input type="text" name="orderPhone" id="orderPhone" required lay-verify="required" value="" class="layui-input" />
			    </div>			    
		</div>
	</form>
</div>
<script type="text/html" id="bar">
    <a class="layui-btn layui-btn-xs" title="查看" lay-event="show">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-normal" title="编辑" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" title="刪除" lay-event="delete">刪除</a>
</script>
<script type="text/html" id="dateTpl">
    {{ layui.laytpl.fn(d.editdate) }}
</script>
<script type="text/javascript">
var table;
var layer;
var form;
var upload;
var laydate;
var element;
        layui.use(['layer', 'table','form','upload','laydate','element'], function ()
        {
            table = layui.table;
            layer = layui.layer;
            form =layui.form;
            upload=layui.upload;
            laydate=layui.laydate;
            element=layui.element;
            layui.laytpl.fn = function (value)
            {
                //json日期格式转换为正常格式
                var date = new Date(parseInt(value.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                return date.getFullYear() + "-" + month + "-" + day;
            }
            var start=laydate.render({
                elem: '#startDate', //指定元素
                type: 'date',
                max: 'date',
                btns:['clear','confirm'],
                done:function(value,date){
                	endMax=end.config.max;
                	end.config.min=date;
                	end.config.min.month=date.month-1;
                }
              });
            var end=laydate.render({
                elem: '#endDate', //指定元素
                type:'date',
                max:'date',
                done:function(value,date){
                	if($.trim(value)==''){
                		var curDate=new Date();
                		date={'date':curDate.getDate(),'month':curDate.getMonth()+1,'year':curDate.getFullYear()};
                	}
                	start.config.max=date;
                	start.config.max.month=date.month-1;
                }
              });
            //--------------方法渲染TABLE----------------
            var tableIns = table.render({
                elem: '#orders'
                , id: 'orders'
                , url: 'order/findOrderBySplitPage'
                ,width:1140
                , cols: [[
                     { field: 'orderId', title: '订单编号', width: 300, align: 'center' }
                     , { field: 'orderUser', title: '下单用户', width: 120, align: 'center',templet:function(d){
                    	 return d.orderUser.userName
                     	} 
                     }
                    , { field: 'orderDate', title: '下单日期', width: 120, align: 'center' }
                    , { field: 'orderPrice', title: '订单总价', width: 120, align: 'center' }
                   ,{field:'orderState', title: '订单状态', width: 102, align: 'center',templet: function(d){
                        if(d.orderState==1){
                        	return "待付款";
                        }else if(d.orderState==2){
                        	return "待发货";
                        }else if(d.orderState==3){
                        	return "待收货";
                        }else if(d.orderState==4){
                        	return "待评价";
                        }else{
                        	return "完成";
                        }
                   	}
                  }, {field:'orderExpressNo', title: '快递单号', width: 180, align: 'center',templet: function(d){
                        if(d.orderState==1){
                        	return "等待付款";
                        }else if(d.orderState==2){
                        	return "<button onclick='deliverOrder(\""+d.orderId+"\")' class='layui-btn layui-btn-sm layui-btn-fluid layui-btn-warm'>发货</button>";
                        }else if(d.orderState==3){
                        	return d.orderExpressNo;
                        }else if(d.orderState==4){
                        	return d.orderExpressNo;
                        }else{
                        	return d.orderExpressNo;
                        }
                   	}
                  }, {title: '操作', fixed: 'right', width: 190, align: 'center', toolbar: '#bar'}
                ]]
                , page: true
                , limits: [5, 10, 15]
                , limit: 10 //默认采用10
                , done: function (res, curr, count)
                {
                    //如果是异步请求数据方式，res即为你接口返回的信息。
                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                    //console.log(res);
                    //得到当前页码
                    //console.log(curr);
                    $("#curPageIndex").val(curr);
                    //得到数据总量
                    //console.log(count);
                }
            });

            //#region --------------搜索----------------
            $("#search").click(function ()
            {
            	var keyword=$("#orderIdKeyword").val();
            	var start=$("#startDate").val();
            	var end=$("#endDate").val();
            	var state=$("#orderState").val();
                tableIns.reload({
                    where: {
                    	orderIdKeyword: keyword,
                    	startDate:start,
                    	endDate:end,
                    	orderState:state
                    },page: {
                    curr: 1 //重新从第 1 页开始
                  }
                });
            });
            //#endregion

            //工具条事件监听
            table.on('tool(orders)', function (obj)
            { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值
                var tr = obj.tr; //获得当前行 tr 的DOM对象
                if (layEvent === 'edit')
                { //编辑
                    layer.open({
                        type: 1,
                        title: '编辑订单信息',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['800px;', '400px;'],    //窗体大小（宽,高）
                        content: $('#formData'),
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                            $("#orderId").val(data.orderId);
                            $("#orderPrice").val(data.orderPrice);
                           	$("#goodsPrice").val(data.goodsPrice);
                            $("#orderUserName").val(data.orderUserName);
                            $("#orderPhone").val(data.orderPhone);
                            $("#orderAddress").val(data.orderAddress);
                            form.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['修改','取消'],
                        yes: function(index, layero){
                        	$.post('order/updateOrder',$('#orderForm').serialize(),function(data){
                                if (data == 'success')
                                {
                                    parent.layer.msg('修改成功', { icon: 1, shade: 0.4, time: 1000 });
                                    $("#search").click();
                                    $("#handle_status").val('');
                                }
                                else
                                {
                                    parent.layer.msg('修改失败', { icon: 5, shade: 0.4, time: 1000 });
                                }
                                layer.close(index);
                        	}); 
                        }
                    });
                }else if(layEvent === 'delete'){
                	layer.confirm('是否删除该订单？', {
                		  btn: ['确认', '取消'] //可以无限个按钮
                		  ,btn1: function(index, layero){
                			  $.ajax({
                				   type: "POST",
                				   url: "order/deleteOrder",
                				   data: "orderId="+data.orderId,
                				   success: function(msg){
                				     if(msg=='success'){
                				    	 parent.layer.msg('删除成功', { icon: 1, shade: 0.4, time: 1000 });
                				     }else{
                				    	 parent.layer.msg('删除失败', { icon: 5, shade: 0.4, time: 1000 });
                				     }
                				   }
                				});
                			  $(tr).remove();
                			  layer.close(index);
                		  }
                		});
                }else if(layEvent ==='show'){
                	var str="";
                	$.ajax({
						type : "post",
						url : "order/findOrderById",
						async: false,
						data:"orderId="+data.orderId,
						dataType : "json",
						success : function(data) {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
									var date=new Date(data.orderDate).toLocaleString();
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+ data.orderId
											+ "&nbsp;&nbsp;总价："
											+ data.orderPrice
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content layui-show'><h4>收货人："
											+ data.orderUserName
											+ "&nbsp;&nbsp;收货地址："
											+ data.orderAddress
											+ "&nbsp;电话："+data.orderPhone+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data.detailList;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='goods/detail?goodsId="
												+ arr[t].detailGoods.goodsId
												+ "'>"
												+ arr[t].detailGoods.goodsName
												+ "</a></td>" + "<td>"
												+ arr[t].detailGoods.goodsPrice
												+ "</td><td>"
												+ arr[t].detailNum
												+ "台</td><td>"
												+ arr[t].detailGoods.goodsPrice
												* arr[t].detailNum + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div>"
											+ "</div></div>";
								str = str + "</div>";
						}
					});
                	layer.open({
                        type: 1,
                        title: '查看订单详情',
                        shade: 0.4,  //阴影度
                        fix: false,
                        shadeClose: true,
                        maxmin: false,
                        area: ['800px;', '400px;'],    //窗体大小（宽,高）
                        content: str,
                        success: function (layero, index)
                        {
                            var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                            element.render();
                            body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                        },
                        btn:['关闭'],
                        yes: function(index, layero){
                             layer.close(index);
                        }
                    });
                }
            });
        });
        function deliverOrder(id){
        	layer.open({
                type: 1,
                title: '发货',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['600px;', '250px;'],    //窗体大小（宽,高）
                content: "<div style='width:500px;padding-top:15px;'><div class='layui-form-item'><label class='layui-form-label'>订单编号</label>"+
                "<div class='layui-input-block'><input type='text' name='orderId' id='orderId' style='background-color:#F8F8F8;' "+
                " readonly='readonly' required lay-verify='required' value='"+id+"' class='layui-input' /></div></div>"+
                "<div class='layui-form-item'><label class='layui-form-label'>快递单号</label><div class='layui-input-block'><input type='text' "+
                " id='expressNo' required lay-verify='required' class='layui-input' /></div></div></div>",
                success: function (layero, index)
                {
                    var body = layer.getChildFrame('body', index); //得到子页面层的BODY
                    body.find('#hidValue').val(index); //将本层的窗口索引传给子页面层的hidValue中
                },
                btn:['发货','取消'],
                yes: function(index, layero){
                	var no=$("#expressNo").val();
                	$.post('order/deliverOrder',{orderId:id,expressNo:no},function(msg){
                        if (msg == 'success')
                        {
                            parent.layer.msg('发货成功', { icon: 1, shade: 0.4, time: 1000 });
                            $("#search").click();
                            $("#handle_status").val('');
                        }
                        else
                        {
                            parent.layer.msg('发货失败', { icon: 5, shade: 0.4, time: 1000 });
                        }
                        layer.close(index);
                	}); 
                }
            });
        }
    </script>
</body>
</html>