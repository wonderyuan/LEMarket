<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>乐享手机商城后台管理</title>
<link rel="stylesheet" href="resources/css/layui.css">
<script src="resources/js/jquery.1.12.4.min.js"></script>
<script src="resources/js/layui.js"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">乐享手机商城后台管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="view/welcome" target="myframe">主页</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="upload/headpic.jpg" class="layui-nav-img">${sessionScope.admin.adminName }</a>
				</li>
				<li class="layui-nav-item"><a href="admin/logout">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<c:forEach items="${sessionScope.admin.adminRole.roleFuns }" var="f">
						<c:if test="${ not empty f.funsList }">
							<li class="layui-nav-item">
							<a class=""	href="javascript:;">${f.funName }</a>
								<dl class="layui-nav-child">
									<c:forEach items="${f.funsList }" var="t">
										<dd>
											<a href="${pageContext.request.contextPath }/${t.funUrl }" target="${t.funTarget }">${t.funName }</a>
										</dd>
									</c:forEach>
								</dl>
						</c:if>
						<c:if test="${empty f.funsList }">
							<li class="layui-nav-item">
							<a href="${pageContext.request.contextPath }/${f.funUrl }" target="${f.funTarget }">${f.funName }</a>
						</c:if>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe src="view/welcome" name="myframe" style="width:1140px;height:550px;border: 0;" ></iframe>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© LEenjoy.com - 底部固定区域
		</div>
	</div>
	
	<script>
		//JavaScript代码区域
		layui.use(['element','layer', 'table'], function() {
			var element = layui.element;
			var table = layui.table;
			var layer = layui.layer;
		});
	</script>
</body>
</html>