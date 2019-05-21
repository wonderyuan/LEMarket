<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐享手机商城</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.1.12.4.min.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<!--导航栏部分-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="view/index">乐享手机商城</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav navbar-right" style="padding-right:30px;">
					<c:if test="${ empty sessionScope.user}">
						<li><a href="view/register" >注册</a></li>
						<li><a href="view/login">登录</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
						<li><a href="view/usercenter">用户中心</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><div style="margin-top:-5px;float:left;width:30px; height:30px; border-radius:50%; overflow:hidden;"><img src="upload/${user.userImg }" style="width:30px;height:30px;" class="layui-nav-img"></div>&nbsp;&nbsp;${sessionScope.user.userName} <span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="view/cart">购物车</a></li>
								<li><a href="user/amendinfo">个人资料修改</a></li>
								<li><a href="user/logout">注销登录</a></li>
							</ul></li>
					</c:if>
				</ul>

				<div class="navbar-form navbar-right">
				<form action="goods/search" method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="iPhone X" name="keyWord"
							id="searchKeyWord" />
					</div>
					<button class="btn btn-default" type="submit">查找商品</button>
				</div>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>