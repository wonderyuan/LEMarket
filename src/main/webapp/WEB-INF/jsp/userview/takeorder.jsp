<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐享手机商城</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/layui.css" rel="stylesheet">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
</head>
<body>
	<!--导航栏部分-->
	<jsp:include page="include/header.jsp" />

	<!-- 中间内容 -->
	<div class="container-fluid bigHead">
		<div class="row" style="background-color:white;">
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
				<div class="jumbotron">
					<h1>下单成功！</h1>
				</div>
			</div>
			<div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
				<table class="table table-hover center" id="shoppingCarTable">
					<tr>
						<th>订单编号</th>
						<th>总价</th>
						<th>收件人</th>
						<th>电话</th>
						<th>收货地址</th>
						<th>状态</th>
					</tr>
					<tr>
						<th>${order.orderId }</th>
						<th>${order.orderPrice }</th>
						<th>${order.orderUserName }</th>
						<th>${order.orderPhone }</th>
						<th>${order.orderAddress }</th>
						<th>待付款</th>
					</tr>
				</table>
				<hr />
				<div class="row" style="text-align:center;">
					<button type="button"
						class="layui-btn layui-btn-lg layui-btn-normal"
						onclick="javascript:window.location.href='view/index'">继续购买</button>
					<button type="button"
						class="layui-btn layui-btn-lg layui-btn-warm"
						onclick="javascript:window.location.href='order/toPay?orderId=${order.orderId}'">立即支付</button>
				</div>
				<h2>猜你喜欢</h2>
				<div>
				<div class="span16" style="width:1080px;">
					<ul>
					<c:forEach items="${guessList }"  var="g">
									<a href="goods/detail?goodsId=${g.guessGoods.goodsId }">
										<li>
											<img src="upload/${g.guessGoods.goodsImg }" />
											<p class="goods-title">${g.guessGoods.goodsName }</p>
											<p class="goods-desc">${g.guessGoods.goodsDesc }</p>
											<p><span class="newprice">${g.guessGoods.goodsPrice }</span>&nbsp;
											</p>
										</li>
									</a>
					</c:forEach>
					</ul>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 尾部 -->
<jsp:include page="include/foot.jsp" />

<script type="text/javascript">
	var layer;
	layui.use(['layer','form'], function ()
	        {
	            layer = layui.layer;
	            form =layui.form;
	        });
	
	</script>
</body>
</html>