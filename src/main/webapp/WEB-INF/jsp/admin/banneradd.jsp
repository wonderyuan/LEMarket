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
	<div id="editForm" style="width: 700px; padding-top: 20px;">
		<form id="formData" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">轮播名称</label>
				<div class="layui-input-block">
					<input type="text" name="bannerName" id="bannerName" required
						lay-verify="required" placeholder="请输入轮播名称" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">轮播URL</label>
				<div class="layui-input-block">
					<input type="text" name="bannerUrl" id="bannerUrl" required
						lay-verify="required" placeholder="请输入轮播URL" value=""
						class="layui-input" />
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">轮播图片</label> 
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" id="test1">
					  <i class="layui-icon">&#xe67c;</i>上传图片
					</button>
					<div style="display:inline-block" id="newImg"></div>
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
					    ,url: 'banner/uploadBannerImg' //上传接口
					    ,done: function(res){
					      layer.msg("上传图片成功！",{icon:1,time:1000});
					      var str="<img style='width:280px;height:160px;' src='upload/"+res.src+"' /><input type='hidden' value='"+res.src+"' name='bannerImg' />"
					      $("#newImg").html(str);
					    }
					    ,error: function(){
					      layer.msg("上传图片失败！请重试！",{icon:5,anim: 6,time:1000});
					    }
					  });
					form.on('submit(*)',function(){
						$.ajax({
							type:"post",
							url:"banner/addBanner",
							data:$("#formData").serialize(),
							success:function(data){
								if(data=="success"){
									layer.msg("添加轮播图成功！",{icon:1,shade:0.4, anim:1,time:1000},function(){
										window.location.href="view/bannerlist";
									});
								}else{
									layer.msg("添加轮播图失败！请重试！",{icon:5,shade:0.4,anim:6,time:1000});
								}
							}
						});
						return false;
					});
	});
});
</script>
</html>
