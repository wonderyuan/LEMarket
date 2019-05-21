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
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
<style type="text/css">
</style>
</head>
<body>
	<!--导航栏部分-->
	<jsp:include page="userview/include/header.jsp" />
	<div class="layui-container" id="main" style="height:500px;width:100%;">
		<img style="margin-left:200px;float:left;height:500px;width:400px;" src="upload/paysuccess.png" />
		<div style="float:left;height:500px;width:500px;padding-top:200px;">
			<h1>支付成功</h>
			<button class="layui-btn layui-btn-normal" onclick="javascript:window.location.href='view/index'">继续购物</button>
			<button class="layui-btn layui-btn-warm" onclick="javascript:window.location.href='view/usercenter/#section2'">查看订单</button>
		</div>
	</div>
	<!--尾部-->
	<jsp:include page="userview/include/foot.jsp" />
</body>
</html>