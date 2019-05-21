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
	<div class="layui-card">
					<div class="layui-card-header">修改密码</div>
					<div class="layui-card-body" pad15="">
					<form id="passForm">
						<div class="layui-form" lay-filter="">
							<div class="layui-form-item">
								<label class="layui-form-label">当前密码</label>
								<div class="layui-input-inline">
									<input type="password" name="oldPass" lay-verify="required|oldPass"
									id="oldPass" lay-vertype="tips" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">新密码</label>
								<div class="layui-input-inline">
									<input type="password" name="newPass" lay-verify="required|newPass"
										id="newPass" lay-vertype="tips" autocomplete="off" id="LAY_password"
										class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">6到16个字符</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">确认新密码</label>
								<div class="layui-input-inline">
									<input type="password" name="repassword" lay-verify="required|repass"
										lay-vertype="tips" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" type="button" lay-submit="" lay-filter="setmypass">确认修改</button>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
	
</body>
<script>
	$(function() {
		layui.use([ 'layer', 'form'],function() {
				var layer = layui.layer;
				var form = layui.form;
				form.verify({
					oldPass: function (value) {
		                if (!/^[a-z0-9_-]{6,18}$/.test(value)) {
		                    return "密码格式不正确！";
		                }
		            },
		            newPass:function(value){
		            	if(!/^[a-z0-9_-]{6,18}$/.test(value)){
		            		return "密码格式不正确！";
		            	}
		            },
		            repass:function(value){
		            	var pass=$("#newPass").val();
		            	if(pass!=value){
		            		return "两次输入密码不一致！";
		            	}
		            }
		        });
				form.on('submit(setmypass)',function(){
					$.post("admin/updatePass",$("#passForm").serialize(),function(data){
						if(data=="success"){
							layer.msg("修改密码成功！请重新登陆！",{icon:1,anim:4,time:2000},function(){
								top.location.href="admin/logout";
							});
						}else{
							layer.msg("修改密码失败！请重试！",{icon:5,anim:6,time:2000});
						}
					});
				});
		});
	});
</script>
</html>
