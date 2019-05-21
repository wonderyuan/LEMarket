<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐享手机商城</title>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/layui.css" rel="stylesheet">
<link href="resources/css/admin.css" rel="stylesheet">
<link href="resources/css/pro.css" rel="stylesheet">
<link href="resources/css/login.css" rel="stylesheet">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
<style type="text/css">
</style>
</head>
<body>
	<!--导航栏部分-->
	<jsp:include page="userview/include/header.jsp" />

	<!-- 中间内容 -->
	<div class="container-fluid">
		<form id="regForm">
			<div class="layadmin-user-login layadmin-user-display-show" style="padding-top:30px;padding-bottom:30px;"
				id="LAY-user-login">
				<div class="layadmin-user-login-main">
					<div class="layadmin-user-login-box layadmin-user-login-header">
						<h2>用户注册</h2>
					</div>
					<div class="layadmin-user-login-box layadmin-user-login-body layui-form">
						<div class="layui-form-item">
							<label
								class="layadmin-user-login-icon layui-icon layui-icon-username"
								for="LAY-user-login-nickname"></label> <input type="text"
								name="userName" id="LAY-user-login-nickname"
								lay-verify="nickname" placeholder="昵称" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label
								class="layadmin-user-login-icon layui-icon layui-icon-password"
								for="LAY-user-login-password"></label> <input type="password"
								name="userPass" id="LAY-user-login-password" lay-verify="pass"
								placeholder="密码" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label
								class="layadmin-user-login-icon layui-icon layui-icon-password"
								for="LAY-user-login-repass"></label> <input type="password"
								name="repass" id="LAY-user-login-repass" lay-verify="required"
								placeholder="确认密码" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label
								class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
								for="LAY-user-login-cellphone"></label> <input type="text"
								name="userPhone" id="LAY-user-login-cellphone"
								lay-verify="phone" placeholder="手机" class="layui-input">
						</div>
						<div class="layui-form-item">
							<label
								class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
								for="LAY-user-login-email"></label> <input type="text"
								name="userEmail" id="LAY-user-login-email"
								lay-verify="email" placeholder="邮箱" class="layui-input">
						</div>
						<div class="layui-form-item" style="height:50px;">
							<input type="checkbox" name="agreement" lay-skin="primary"
								title="同意用户协议" checked="">
							<div
								class="layui-unselect layui-form-checkbox layui-form-checked"
								lay-skin="primary">
								<span>同意用户协议</span><i class="layui-icon layui-icon-ok"></i>
							</div>
						</div>
						<div class="layui-form-item">
							<button class="layui-btn layui-btn-fluid" lay-submit="" type="button"
								lay-filter="reg-submit">注 册</button>
						</div>
						<div class="layui-trans layui-form-item layadmin-user-login-other">
							<label>社交账号注册</label> <a href="javascript:;"><i
								class="layui-icon layui-icon-login-qq"></i></a> <a
								href="javascript:;"><i
								class="layui-icon layui-icon-login-wechat"></i></a> <a
								href="javascript:;"><i
								class="layui-icon layui-icon-login-weibo"></i></a> <a
								lay-href="user/login"
								class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
							<a lay-href="user/login"
								class="layadmin-user-jump-change layadmin-link layui-hide-sm layui-show-xs-inline-block">登入</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--尾部-->
	<jsp:include page="userview/include/foot.jsp" />
	<script type="text/javascript">
		layui.use(['form','layer'], function() {
			var form = layui.form;
			var layer=layui.layer;
			form.on('submit(reg-submit)',function(){
				$.post("user/register",$("#regForm").serialize(),function(data){
					if(data=="success"){
						layer.msg("注册成功！即将转向登陆页面！",{icon:1,anim:4,time:2000},function(){
							window.location.href="view/login";
						});
					}else{
						layer.msg("注册失败！请重试！",{icon:5,anim:6,time:2000});
					}
				});
			});
		});
	</script>
</body>
</html>