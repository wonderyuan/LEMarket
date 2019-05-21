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
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>

</head>
<body>
	<div class="layui-body" style="position:absolute;left:0px;" id="LAY_app_body">
		<div class="layadmin-tabsbody-item layui-show">
			<div class="layui-fluid" style="padding-top:30px;">
				<div class="layadmin-tips">
					<i class="layui-icon" face=""></i>
					<div class="layui-text">
						<h1>
							<span class="layui-anim layui-anim-loop layui-anim-">4</span> <span
								class="layui-anim layui-anim-loop layui-anim-rotate">0</span> <span
								class="layui-anim layui-anim-loop layui-anim-">4</span>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;
		});
	</script>
</body>
</html>