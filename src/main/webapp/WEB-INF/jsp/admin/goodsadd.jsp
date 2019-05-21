<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="resources/css/layui.css">
<script src="resources/js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="resources/js/layui.js"></script>
</head>

<body>
	<div id="editForm" style="width: 700px; padding-top: 10px;">
		<form id="formData" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-block">
					<input type="text" name="goodsName" id="goodsName" required
						lay-verify="required" placeholder="请输入商品名称" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="goodsPrice" id="goodsPrice" required
						lay-verify="required" placeholder="请输入商品价格" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-block">
					<input type="text" name="goodsNum" id="goodsNum" required
						lay-verify="required" placeholder="请输入商品库存" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item" lay-filter="test">
				<label class="layui-form-label">商品类别</label>
				<div class="layui-input-inline">
					<select name="goodsType.typeId" id="goodsType" required
						lay-verify="required" lay-filter="goods.goodsType.typeId">
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">内存大小</label>
				<div class="layui-input-inline">
					<select name="goodsMemory.memoryId" id="memory" required
						lay-verify="required" lay-filter="memory">
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品颜色</label>
				<div class="layui-input-block">
					<input type="text" name="goodsColor" id="goodsColor" required
						lay-verify="required" value="" class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品图片</label> 
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" id="test1">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
					<div style="display:inline-block" id="newImg"></div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">商品描述</label>
				<div class="layui-input-block">
					<textarea name="goodsDesc" id="goodsDesc" required
						lay-verify="required" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item" style="margin-left:110px;">
				<button type="button" lay-submit lay-filter="*" class="layui-btn layui-btn-lg" style="margin-right:50px;">添加</button>
				<button type="reset" class="layui-btn layui-btn-warm layui-btn-lg">重置</button>
			</div>
		</form>
	</div>
</body>
<script>
	$(function(){
		layui.use(['layer', 'table','form','upload'], function ()
		        {
		            var table = layui.table;
		            var layer = layui.layer;
		            var form =layui.form;
					var upload=layui.upload;
					var uploadInst = upload.render({
					    elem: '#test1' //绑定元素
					    ,url: 'goods/uploadImg' //上传接口
					    ,done: function(res){
					      layer.msg("上传图片成功！",{icon:1,time:2000});
					      var str="<img style='width:280px;height:160px;' src='upload/"+res.src+"' /><input type='hidden' value='"+res.src+"' name='goodsImg' />"
					      $("#newImg").html(str);
					    }
					    ,error: function(){
					      layer.msg("上传图片失败！请重试！",{icon:5,time:2000});
					    }
					  });
					form.on('submit(*)',function(){
						$.ajax({
							type:"post",
							url:"goods/addGoods",
							data:$("#formData").serialize(),
							success:function(data){
								if(data=="success"){
									layer.msg("添加商品成功！",{icon:1,time:2000},function(){
										window.location.href="view/goodsList";
									});
								}else{
									layer.msg("添加商品失败！请重试！",{icon:5,time:2000});
								}
							}
						});
						return false;
					});
		$.ajax({
  		   type: "POST",
  		   url: "goodsType/findAll",
  		   success: function(arr){
	            var str="<option value=''>请选择分类</option>";
	            for(var i=0;i<arr.length;i++){
	               	str=str+"<option value='"+arr[i].typeId+"'>"+arr[i].typeName+"</option>";
	            }
	       		$("#goodsType").html(str);
	       	 	form.render();
  		   }
  		});
         $.ajax({
   		   type: "POST",
   		   url: "memory/findAll",
   		   success: function(arr){
	            var str="<option value=''>请选择内存大小</option>";
	            for(var i=0;i<arr.length;i++){
	               	str=str+"<option value='"+arr[i].memoryId+"'>"+arr[i].memoryName+"</option>";
	            }
	       		$("#memory").html(str);
	       		form.render();
   		   }
   		});
	});
});
</script>
</html>
