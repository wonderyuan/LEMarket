<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>商品详情</title>

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/layui.css" rel="stylesheet">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
<style type="text/css">
	.dl-horizontal span{
		font-size:16px;
		margin:15px 15px;
	}
	.dl-horizontal .badge{
		background-color:#009688;
	}
	#btnFont button{
		font-size:16px;
	}
	#img{
		float:center;
		padding-top:35px;
	}
</style>
</head>
<body style="background-color:white;">
	<jsp:include page="include/header.jsp" />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12" style="padding-top:25px;padding-bottom:25px;">
			<input type="hidden" id="goodsId"
					value="${requestScope.goods.goodsId }">
				<h1 class="text-center" >${requestScope.goods.goodsName }</h1>
			</div>
		</div>
		<div class="row clearfix" style="margin-bottom:50px;">
			<div class="col-md-5 column center">
				<img id="img" alt="140x140"
					src="upload/${requestScope.goods.goodsImg }"
					class="img-rounded" />
			</div>
			<div class="col-md-5 column">
				<dl class="dl-horizontal">
					<dt><span class="badge">${requestScope.goods.goodsPrice}元</span></dt>
					<dd><span class="badge">${requestScope.goods.goodsMemory.memoryName }</span></dd>
					<dt><span class="badge">${requestScope.goods.goodsColor }</span></dt>
					<dd><span class="badge">${requestScope.goods.goodsDesc}</span></dd>
					<dt><span class="badge">购买数量</span></dt>
					<dd><div style="height: 38px;padding-left:10px;padding-top:5px;">
									<button id="redbtn" class="layui-btn layui-btn-radius" onclick="reduceCounts()"
										style="float: left;">-</button>
									<div class="layui-input-inline"
										style="width: 50px; float: left;">
										<input type="text" id="num" name="goods.goodsNum"
											autocomplete="off" value="1" class="layui-input">
									</div>
									<button id="addbtn" onclick="addCounts()" class="layui-btn layui-btn-radius"
										style="float: left;">+</button>
								</div></dd>
					<dt style="padding-top:20px;"><button
							class="layui-btn layui-btn-lg layui-btn-radius"
							onclick="addToCart()">
							<i class="layui-icon">&#xe608;</i>加入购物车
						</button></dt>
					<dd style="padding-top:20px;padding-left:10px;width:320px;">
					<button	class="layui-btn layui-btn-lg layui-btn-radius" id="fav"
							onclick="addToFavorite()">
							<i class="layui-icon">&#xe600;</i>收藏
					</button>
					<button	class="layui-btn layui-btn-lg layui-btn-radius" id="unfav"
							onclick="removeFavorite()">
							<i class="layui-icon">&#xe658;</i>取消收藏
					</button>
						<button
							class="layui-btn layui-btn-lg layui-btn-radius"
							onclick="javascript:window.location.href='view/cart';">
							<i class="layui-icon">&#xe698;</i>去购物车
						</button></dd>
				</dl>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column" id="hotGoods">
			</div>
		<div>
				<div class="row clearfix">
					<h2 style="padding-left:30px;">商品评价</h2>
					<div class="col-md-12 column">
						<div class="media-body" style="padding-left:20px;">
					          <c:if test="${evaList!=null }">
					          	<c:forEach items="${evaList }" var="e">
					          		<hr class="layui-bg-blue">
					          		<a href="javascript:;" class="media-left" style="float: left;">
							            <img src="upload/${e.evaUser.userImg }" class="layui-nav-img" style="height:55px; width:55px;"> 
							          </a>
							          <div class="pad-btm">
							            <p class="fontColor"><span>${e.evaUser.userName }</span>
							            	<div style="height:30px;width:150px;float:right;" id="evaStar${e.evaId }" class="evaStar"></div>        
							            </p>
							            <p class="fontColor">
							                <span class="layui-badge layui-bg-blue"><fmt:formatDate value="${e.evaDate}" pattern="yyyy年-MM月-dd日" /></span>
							            </p>
							         </div>
							         <p class="message-text">${e.evaContent }</p>
							         <div>
							         	<c:if test="${e.imgList!=null }">
							         		<c:forEach items="${e.imgList }" var="g">
							         			<img src="upload/${g.evaimgName }" height="80px" width="100px" />
							         		</c:forEach>
							         	</c:if>
							         </div>
					          </c:forEach>
					          </c:if>
					          <c:if test="${ empty evaList }">
					          	<h3>暂无评价</h3>
					          </c:if>
					     </div>
					</div>
				</div>
		</div>
	</div>
	<!-- 尾部 -->
	<jsp:include page="include/foot.jsp" />
	<script type="text/javascript">
		var flag = true;
		var layer;
		var rate;
		layui.use(['layer','rate'], function() {
			layer = layui.layer;
			rate=layui.rate;
			$("#num").bind('input propertychange', function() {
				var num = parseInt($("#num").val());
				if (num <= 0) {
					layer.msg('输入值不合法！', {
						icon : 5,
						time : 2000
					});
					$("#num").val(1);
				}
			})
			rate.render({
				elem: '.evaStar',  //绑定元素
			    theme: '#FF5722',
			    readonly:true,
			});
			var arr=new Array();
			<c:forEach items="${evaList}" var="e">
				arr.push('${e.evaId}${e.evaLevel}')
			</c:forEach>
			for(var i=0;i<arr.length;i++){
				var id=arr[i].substring(0,arr[i].length-1);
				var v=arr[i].substr(arr[i].length-1,1);
				rate.render({
				      elem: '#evaStar'+id,  //绑定元素
				      theme: '#FF5722',
				      readonly:true,
				      value:v
				});
			}
		});
		$(function(){
			isFavorite();
		});
		function reduceCounts() {
			var num = parseInt($("#num").val());
			if (num - 1 <= 0) {
				$("#redbtn").prop("disabled", true);
			} else {
				num--;
				$("#num").val(num);
			}
		}
		function addCounts() {
			var num = parseInt($("#num").val());
			$("#num").val(num + 1);
			$("#redbtn").prop("disabled", false);
		}
		function addToCart() {
			var num = $("#num").val();
			var goodsId = $("#goodsId").val();
			$.ajax({
				type : "post",
				url : "cart/addCart",
				data : "num=" + num + "&goodsId=" + goodsId,
				success : function(data) {
					if (data == "success") {
						layer.msg('添加成功！', {
							icon : 1,
							time : 2000
						});
						showHotGoods();
					} else {
						layer.msg('添加失败！', {
							icon : 5,
							time : 2000
						});
					}
				}
			});
		}
		function addToFavorite(){
			var goodsId=$("#goodsId").val();
			$.ajax({
				type:"post",
				url:"guess/addToFavorite",
				data:"goodsId="+goodsId,
				success : function(data){
					if (data == "success") {
						layer.msg('收藏成功！', {
							icon : 1,
							time : 2000
						});
						showHotGoods();
					} else {
						layer.msg('收藏失败！', {
							icon : 5,
							time : 2000
						});
					}
					isFavorite();
				}
			});
		}
		function removeFavorite(){
			var goodsId=$("#goodsId").val();
			$.ajax({
				type:"post",
				url:"guess/removeFavorite",
				data:"goodsId="+goodsId,
				success:function(data){
					if (data == "success") {
						layer.msg('取消收藏成功！', {
							icon : 1,
							time : 2000
						});
						showHotGoods();
					} else {
						layer.msg('取消收藏失败！', {
							icon : 5,
							time : 2000
						});
					}
					isFavorite();
				}
			});
		}
		function isFavorite(){
			var goodsId=$("#goodsId").val();
			$.ajax({
				type:"post",
				url:"guess/isFaorite",
				data:"goodsId="+goodsId,
				success:function(data){
					if(data=="true"){
						$("#fav").hide();
						$("#unfav").show();
					}else{
						$("#fav").show();
						$("#unfav").hide();
					}
				}
			});
		}
		function showHotGoods() {
			$.ajax({
						type : "post",
						url : "goods/findHotGoods",
						dataType : "json",
						success : function(arr) {
							var str = "<h2>热卖推荐</h2><div><div class='span16' style='width:1120px;'><ul>";
							for (var i = 0; i < arr.length; i++) {
								str = str
										+ "<a href='goods/detail?goodsId="
										+ arr[i].goodsId
										+ "'>"
										+ "<li><img src='upload/"+arr[i].goodsImg+"' /><p class='goods-title'>"
										+ arr[i].goodsName + "</p>"
										+ "<p class='goods-desc'>"
										+ arr[i].goodsDesc
										+ "</p><p><span class='newprice'>"
										+ arr[i].goodsPrice + "</span>&nbsp;"
										+ "</p></li></a>";
							}
							str = str + "</ul></div></div>"
							if (flag) {
								flag = false;
								$("#hotGoods").html(str);
							}
						}
					});
		}
	</script>
</body>
</html>