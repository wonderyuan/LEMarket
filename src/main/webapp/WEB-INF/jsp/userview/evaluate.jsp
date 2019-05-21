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
<title>评价商品</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/layui.css" rel="stylesheet">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
</head>
<body>
	
<script type="text/javascript">
layui.use(['table','rate','form'], function(){
    var rate = layui.rate;
   	var form=layui.form;
   	var table=layui.table;
    //渲染
    var ins1 = rate.render({
      elem: '#evaLevel',  //绑定元素
      theme: '#FF5722',
      choose:function(value){
    	  $("#evaStar").val(value);
      }
    });
  });
</script>
</body>
</html>