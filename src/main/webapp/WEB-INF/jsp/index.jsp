<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<jsp:include page="userview/include/header.jsp" />
	<!-- 中间内容 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 控制栏 -->
			<div class="col-sm-3 col-md-2 sidebar sidebar-1">
				<ul class="nav nav-sidebar">
					<c:forEach items="${applicationScope.goodsTypeList }" var="t" varStatus="c">
						<c:if test="${fn:length(t.goodsList)!=0 }">
							<c:if test="${c.count==1 }">
								<li class="list-group-item-diy"><a href="#productArea${t.typeId }">${t.typeName }<span
								class="sr-only">(current)</span></a></li>
							</c:if>
							<c:if test="${c.count!=1 }">
								<li class="list-group-item-diy"><a href="#productArea${t.typeId }">${t.typeName }</a></li>
							</c:if>
							</c:if>
					</c:forEach>
				</ul>
			</div>
			<!-- 控制内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div id="myCarousel" class="layui-carousel">
					 <div carousel-item>
					 	<c:forEach items="${applicationScope.bannerList }" var="b">
					 		 <div><a href="${b.bannerUrl }"><img style="width:1144px;height:300px;" src="upload/${b.bannerImg }"></a></div>
					 	</c:forEach>
					  </div>
				</div>

				<!-- <div name="productArea1" class="row pd-10" id="productArea1">
					<div class="span16">
						<h2 class="title">苹果手机</h2>
						<ul>
										<a href="#">
											<li>
												<img src="upload/红米note4X.jpg" />
												<p class="goods-title">小米6X 4GB+32GB</p>
												<p class="goods-desc">全索尼相机，骁龙660 AIE处理器</p>
												<p><span class="newprice">1499元</span>&nbsp;
												</p>
											</li>
										</a>
					</div>
				</div> -->
				<c:forEach items="${applicationScope.goodsTypeList }" var="t">
					<c:if test="${fn:length(t.goodsList)!=0 }">
						<div name="productArea${t.typeId }" class="row" id="productArea${t.typeId }"></div>
					</c:if>
				</c:forEach>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<jsp:include page="userview/include/foot.jsp" />
			</div>
		</div>
	</div>

	<script type="text/javascript">
	var layer;
		layui.use(['carousel','layer'], function(){
			  var carousel = layui.carousel;
			  layer=layui.layer;
			  //建造实例
			  carousel.render({
			    elem: '#myCarousel'
			    ,width: '100%' //设置容器宽度
			    ,arrow: 'hover' //始终显示箭头
			    ,anim: 'fade' //切换动画方式
			  });
		});
		$(function(){
			getAllType();
		});
		function getAllType(){
			$.ajax({
				   type: "POST",
				   url: "goodsType/findAll",
				   success: function(arr){
				     for(var i=0;i<arr.length;i++){
				    	 showGoodsByType(arr[i].typeId);
				     }
				   }
				});
		}
		function showGoodsByType(id){
			$.ajax({
				   type: "POST",
				   url: "goods/findGoodsByType",
				   data: "typeId="+id,
				   success: function(arr){
				     var str="<div class='span16'><ul>";
				     for(var i=0;i<arr.length;i++){
				    	 if(i==0){
				    		 str=str+"<h2 class='title'>"+arr[i].goodsType.typeName+"</h2>";
				    	 }
				    	 if((i+1)%4!=0){
				    		 str=str+"<a href='goods/detail?goodsId="+arr[i].goodsId+"'><li>"+
							    "<img src='upload/"+arr[i].goodsImg+"' /><p class='goods-title'>"+arr[i].goodsName+"</p>"+
							    "<p class='goods-desc'>"+arr[i].goodsDesc+"</p><p><span class='newprice'>"+arr[i].goodsPrice+"元</span>&nbsp;"+
							    "</p></li></a>";
				    	 }else{
				    		 str=str+"<a href='goods/detail?goodsId="+arr[i].goodsId+"'><li class='brick4'>"+
							    "<img src='upload/"+arr[i].goodsImg+"' /><p class='goods-title'>"+arr[i].goodsName+"</p>"+
							    "<p class='goods-desc'>"+arr[i].goodsDesc+"</p><p><span class='newprice'>"+arr[i].goodsPrice+"元</span>&nbsp;"+
							    "</p></li></a>";
				    	 }
				     }
				     var str=str+"</ul></div>";
				     $("#productArea"+id).html(str);
				   }
				});
		}
	</script>


</body>
</html>