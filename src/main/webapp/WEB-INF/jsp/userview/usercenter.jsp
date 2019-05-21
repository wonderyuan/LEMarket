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
<link href="resources/css/layui.css" rel="stylesheet">
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/layui.js" type="text/javascript"></script>
<script src="resources/js/ajaxfileupload.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
a {
	text-decoration: none;
	color: #333;
	out-line: none;
}
.layui-form-label{
	width:100px;
}
</style>
</head>
<body>
	<!--导航栏部分-->
	<jsp:include page="include/header.jsp" />
	<!-- 中间内容 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 控制栏 -->
			<div class="col-sm-3 col-md-2 sidebar sidebar-1">
				<ul class="nav nav-sidebar">
					<li class="list-group-item-diy"><a
						href="view/usercenter/#section1">收藏中心<span class="sr-only">(current)</span></a></li>
					<li class="list-group-item-diy"><a
						href="view/usercenter/#section2">我的订单</a></li>
					<li class="list-group-item-diy"><a
						href="view/usercenter/#section3">地址管理</a></li>
					<li class="list-group-item-diy"><a
						href="view/usercenter/#section4">猜你喜欢</a></li>
					<li class="list-group-item-diy"><a
						href="view/usercenter/#section5">账户安全</a></li>
				</ul>
			</div>
			<!-- 控制内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="col-md-12">
					<hr />
					<h1>
						<a name="section1">收藏中心</a>
					</h1>
					<hr />
					<div class="col-lg-12 col-md-12 col-sm-12" id="productArea"></div>
					<br />
				</div>

				<div class="col-md-12">
					<h1>
						<a name="section2">我的订单</a>
					</h1>
					<hr />
					<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
						<ul class="layui-tab-title">
							<li class="layui-this">待付款</li>
							<li>待发货</li>
							<li>待收货</li>
							<li>待评价</li>
							<li>完成</li>
						</ul>
						<div class="layui-tab-content" style="height: auto;">
							<div class="layui-tab-item layui-show" id="state1">
									<!-- <div class='layui-colla-item'> -->
										<!-- <h2 class='layui-colla-title'>订单编号：3724a838bbc64359a33de2c198859431&nbsp;&nbsp;总价：17995元&nbsp;</h2>
										<div class='layui-colla-content'>
											<h4>收货人：汤姆&nbsp;&nbsp;收货地址：河南郑州二七幸福小区</h4>
											<div class='layui-form'>
												<table class='layui-table'>
													<thead>
														<tr>
															<th>商品名称</th>
															<th>价格</th>
															<th>数量</th>
															<th>小计</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><a href='goods/detail?goodsId=7'>OPPO R11s
																	Plus</a></td>
															<td>3599</td>
															<td>5</td>
															<td>17995</td>
														</tr>
													</tbody>
												</table>
											</div>
											<a href='javascript:void(0)'
												class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>去付款</a>
										</div> -->
									<!-- </div> -->
							</div>
							<div class="layui-tab-item" id="state2"></div>
							<div class="layui-tab-item" id="state3"></div>
							<div class="layui-tab-item" id="state4"></div>
							<div class="layui-tab-item" id="state5"></div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<hr />
					<h1>
						<a name="section3">地址管理</a>
					</h1>
					<hr />
					<div class="col-sm-offset-2 col-md-offest-2" style="margin-left:0%;">
					<div id="addrData">
						<table class="layui-table">
							  <colgroup>
							    <col width="100">
							    <col width="150">
							    <col width="300">
							    <col width="340">
							    <col>
							  </colgroup>
						<thead>
						    <tr>
						      <th>收货人</th>
						      <th>电话</th>
						      <th>所在地区</th>
						      <th>详细地址</th>
						      <th>操作</th>
						    </tr> 
						  </thead>
						  <tbody>
						    <tr>
						      <td>贤心</td>
						      <td>2016-11-29</td>
						      <td>人生就像是一场修行</td>
						      <td>人生就像是一场修行</td>
						      <td>
						      	 <button class="layui-btn layui-btn-xs layui-btn-warm">编辑</button>
							     <button class="layui-btn layui-btn-xs layui-btn-danger">删除</button>
						      </td>
						    </tr>
						  </tbody>
						</table>
						</div>
						<button onclick="addAddress()" class="layui-btn layui-btn-normal layui-btn-lg layui-btn-fluid layui-btn-radius">添加地址</button>
					</div>
				</div>

				<div class="col-md-12">
					<h1>
						<a name="section4">猜你喜欢</a>
					</h1>
					<hr />
					<table class="table table-hover center" id="recentViewArea">
					</table>
				</div>
				<div class="col-md-12">
					<h1>
						<a name="section5">账户安全</a>
					</h1>
					<hr />
					<table class="table table-hover center" id="acountSafeArea">
						<div class="layui-card" style="margin-left: -20px;">
					        <div class="layui-card-header">修改密码</div>
					        <div class="layui-card-body" pad15="">
					          
					          <div class="layui-form" lay-filter="">
					            <div class="layui-form-item">
					              <label class="layui-form-label">当前密码</label>
					              <div class="layui-input-inline">
					                <input type="password" name="oldPassword" lay-verify="required" lay-vertype="tips" class="layui-input">
					              </div>
					            </div>
					            <div class="layui-form-item">
					              <label class="layui-form-label">新密码</label>
					              <div class="layui-input-inline">
					                <input type="password" name="password" lay-verify="required|pass" lay-vertype="tips" autocomplete="off" id="LAY_password" class="layui-input">
					              </div>
					              <div class="layui-form-mid layui-word-aux">6到16个字符</div>
					            </div>
					            <div class="layui-form-item">
					              <label class="layui-form-label">确认新密码</label>
					              <div class="layui-input-inline">
					                <input type="password" name="repassword" lay-verify="required|repass" lay-vertype="tips" autocomplete="off" class="layui-input">
					              </div>
					            </div>
					            <div class="layui-form-item">
					              <div class="layui-input-block">
					                <button class="layui-btn" lay-submit="" lay-filter="setmypass">确认修改</button>
					              </div>
					            </div>
					          </div>
					          
					        </div>
					      </div>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- 尾部 -->
	<jsp:include page="include/foot.jsp" />
<div class="layui-form" id="addrForm" style="display:none;padding-top:10px;">
<form id="addrFormData">
	<input type="hidden" name="addrId" id="addrId" />
	<div class="layui-form-item">
		<label class="layui-form-label">收货人名称</label>
		<div class="layui-input-inline">
			 <input type="text" name="addrNickname" id="addrNickName" required lay-verify="required" placeholder="请输入收货人名称" value="" class="layui-input" />
		</div>			 
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">收货人电话</label>
		<div class="layui-input-inline">
			 <input type="text" name="addrPhone" id="addrPhone" required lay-verify="required" placeholder="请输入收货电话" value="" class="layui-input" />
		</div>			 
	</div>
    <div class="layui-form-item">
    	<label class="layui-form-label">请选择地区</label>
	    <div class="layui-input-inline">
	      <select name="addrProvince" id="proData" lay-filter="province" required lay-verify="required">
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="addrCity" id="cityData" lay-filter="city" required lay-verify="required">
	        <option value="">请选择市</option>
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="addrArea" id="areaData" required lay-verify="required">
	        <option value="">请选择县/区</option>
	      </select>
	    </div>
    </div>
     <div class="layui-form-item">
		<label class="layui-form-label">详细地址</label>
		<div class="layui-input-inline">
			 <input style="width:590px;" type="text" name="addrDetail" id="addrDetail" placeholder="请输入详细地址" required lay-verify="required" value="" class="layui-input" />
		</div>			 
	 </div>
	 <div class="layui-form-item">
		<label class="layui-form-label">邮政编码</label>
		<div class="layui-input-inline">
			 <input type="text" name="addrZipcode" id="addrZipcode" required lay-verify="required" placeholder="请输入邮政编码" value="" class="layui-input" />
		</div>			 
	</div>
	<button style="display:none;" type="reset" id="resetBtn">重置</button>
</form>	
 </div>
 <div id="evaData" style="width:600px;padding-top:15px;display:none;">
		<form id="evaForm">
			<input type="hidden" id="evaOrderId" name="evaOrderId" />
			<div class="layui-form-item">
				<label class="layui-form-label" style="padding-top:15px;">评分</label>
				<div class="layui-input-inline">
					<input type="hidden" name="evaLevel" required lay-verify="required" id="evaStar" />
					<div id="evaLevel"></div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">评论图</label> 
				<div  class="layui-input-block">
						<button type="button" class="layui-btn" id="test2">多图片上传</button>
						<button type="button" class="layui-btn" id="test6">开始上传</button> 
						<button type="button" class="layui-btn layui-danger" onclick="cleanImgsPreview()" id="cleanImgs">清空预览</button> 
					    	预览图：
					    <div class="layui-upload-list" id="demo2"></div>
				</div>
			</div>
			<input type="text" id="imgUrls" name="imgUrls" style="display: none;" class="layui-input">
			<div class="layui-form-item">
				<label class="layui-form-label">评价内容</label>
				<div class="layui-input-inline">
					<textarea rows="8" cols="50"  required lay-verify="required" name="evaContent"></textarea>
				</div>
			</div>
			<button type="reset" style="display:none;" id="evaReset"></button>
		</form>
</div>
	<script type="text/javascript">
		var layer;
		var element;
		var form;
		var rate;
		var upload;
		var success=0;
		var fail=0;
		var imgurls="";
		layui.use([ 'layer', 'element','form','rate','upload' ], function() {
			layer = layui.layer;
			element = layui.element;
			form=layui.form;
			rate=layui.rate;
			upload=layui.upload;
			form.render();
			element.render();
			form.verify({
			        pass: function(value, item){ //value：表单的值、item：表单的DOM对象
			            if(!/^[\S]{6,12}$/.test(value)){
			                return '密码必须6到12位，且不能出现空格';
			            }
			        }
			        //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
			        //repass: [
			          //  /^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格'
			        //]
			        ,repass:function(value,item){
			        	var newpass=$("#LAY_password").val();
			        	if(newpass!=value){
			        		return '两次密码输入不一致';
			        	}
			        }
			    });
			upload.render({
			    elem: '#test2'
			    ,url: 'evaluate/uploadEvaImg'
			    ,multiple: true
			    ,number:5
			    ,size:10240
			    ,auto:false
			    ,bindAction:'#test6'
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo2').append('<img style="width:70px;height:70px;" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
			      });
			    },done: function(res, index, upload) {
					//每个图片上传结束的回调，成功的话，就把新图片的名字保存起来，作为数据提交
					console.log(res.code);
					if(res.code=="1"){
						fail++;
					}else{
						success++;
						imgurls=imgurls+""+res.src+",";
					}
					$('#imgUrls').val(imgurls);
				},
				allDone:function(obj){
				    layer.msg("总共要上传图片总数为："+(fail+success)+"\n"
				    			+"其中上传成功图片数为："+success+"\n"
				    			+"其中上传失败图片数为："+fail
				    		 )
				}
			  });
			var ins1 = rate.render({
			      elem: '#evaLevel',  //绑定元素
			      theme: '#FF5722',
			      choose:function(value){
			    	  $("#evaStar").val(value);
			      }
			    });
			form.on('submit(setmypass)',function(data){
				$.ajax({
					type:"post",
					url:"user/modifyUserPass",
					data:"oldPass="+data.field.oldPassword+"&newPass="+data.field.password+"&rePass="+data.field.repassword,
					success:function(data){
						if(data=="success"){
							layer.alert('修改密码成功！请重新登陆！', {icon: 1},function(index){
								window.location.href="view/login";
								layer.close(index);
							});
						}else{
							layer.msg('修改密码失败！请重试！', {
								icon : 5,
								time : 2000
							});
						}
					}
				});
			});
			form.on('select(province)',function(data){
				$.ajax({
					type:"post",
					url:"proCityArea/findCityByProId",
					data:"provinceId="+data.value,
					dataType:"json",
					success:function(data){
						var str="<option value=''>请选择市</option>"
						for(var i=0;i<data.length;i++){
							str=str+"<option value='"+data[i].cityId+"'>"+data[i].cityName+"</option>";
						}
						$("#cityData").html(str);
						form.render();
					}
				});
			});
			form.on('select(city)',function(data){
				$.ajax({
					type:"post",
					url:"proCityArea/findAreaByCityId",
					data:"cityId="+data.value,
					dataType:"json",
					success:function(data){
						var str="<option value=''>请选择县/区</option>"
						for(var i=0;i<data.length;i++){
							str=str+"<option value='"+data[i].areaId+"'>"+data[i].areaName+"</option>";
						}
						$("#areaData").html(str);
						form.render();
					}
				});
			});
		});
		$(function() {
			showFavorite();
			showReadyPayOrder();
			findReadyToDeliverOrder();
			findReadyToReceiveOrder();
			findReadyToEvaluateOrder();
			findFinishOrder();
			showUserAddress();
			showRecentView();
			showProvince();
		})
		function cleanImgsPreview(){
			success=0;
			fail=0;
			$('#demo2').html("");
			$('#imgUrls').val("");
		}
		function showUserAddress(){
			$.ajax({
				type:"post",
				url:"address/findAddrByUserId",
				dataType:"json",
				success:function(data){
					if(data!=null && data!=""){
						str="<table class='layui-table'><colgroup><col width='100'><col width='150'>"+
						"<col width='300'><col width='340'><col></colgroup><thead><tr><th>收货人</th>"+
						"<th>电话</th><th>所在地区</th><th>详细地址</th><th>操作</th></tr></thead><tbody>";
						for(var i=0;i<data.length;i++){
							str=str+"<tr><td>"+data[i].addrNickname+"</td><td>"+data[i].addrPhone+"</td>"+
							"<td>"+data[i].addrProvince+data[i].addrCity+data[i].addrArea+"</td>"+
							"<td>"+data[i].addrDetail+"</td><td>"+
							"<button onclick='modifyAddress("+data[i].addrId+")' class='layui-btn layui-btn-xs layui-btn-warm'>编辑</button>"+
							"<button onclick='deleteAddress("+data[i].addrId+")' class='layui-btn layui-btn-xs layui-btn-danger'>删除</button>"+
							"</td></tr>";
						}
						str=str+"</tbody></table>";
					}else{
						str="<h3>暂无收货地址！</h3>";
					}
					$("#addrData").html(str);
				}
			});
		}
		function publishEva(id){
			layer.open({
                type: 1,
                title: '发表评价',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['700px;', '500px;'],    //窗体大小（宽,高）
                content: $('#evaData'),
                btn:['发布','取消'],
                success: function (layero, index) {
                    layero.addClass('layui-form');//添加form标识
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
                    $("#evaOrderId").val(id);
                    form.render(); 
                },
                yes: function(index, layero){
                	form.on('submit(fromContent)',function(data){
                		$.post("evaluate/addEvaluate",$("#evaForm").serialize(),function(data){
                            if (data == 'success'){
                                parent.layer.msg('发表评价成功！', { icon: 1, shade: 0.4, time: 1000 });
                            }else{
                                parent.layer.msg('发表评价失败！,请重试！', { icon: 5, shade: 0.4, time: 1000 });
                            }
                            layer.close(index);
                            findReadyToEvaluateOrder();
                            $("#evaReset").click();
                            cleanImgsPreview();
                    	});
                		
                	})
                }
            });
		}
		function modifyAddress(id){
			$.ajax({
				type:"post",
				url:"address/findAddressById",
				data:"addrId="+id,
				dataType:"json",
				success:function(data){
					layer.open({
		                type: 1,
		                title: '修改地址',
		                shade: 0.4,  //阴影度
		                fix: false,
		                shadeClose: true,
		                maxmin: false,
		                area: ['800px;', '500px;'],    //窗体大小（宽,高）
		                content: $('#addrForm'),
		                btn:['修改','取消'],
		                success: function (layero, index) {
		                	$("#addrId").val(data.addrId);
		                	$("#addrNickName").val(data.addrNickname);
		                	$("#addrPhone").val(data.addrPhone);
		                	$("#proData").val(data.addrProvince);
		                	reloadCity(data.addrProvince,data.addrCity);
		                	reloadArea(data.addrCity,data.addrArea);
		                	$("#addrDetail").val(data.addrDetail);
		                	$("#addrZipcode").val(data.addrZipcode);
		                    layero.addClass('layui-form');//添加form标识
		                    layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
		                    form.render(); 
		                },
		                yes: function(index, layero){
		                	form.on('submit(fromContent)',function(data){
		                		$.post("address/modifyAddress",$("#addrFormData").serialize(),function(data){
		                            if (data == 'success'){
		                                parent.layer.msg('修改地址成功！', { icon: 1, shade: 0.4, time: 1000 });
		                                showUserAddress();
		                            }else{
		                                parent.layer.msg('修改地址失败！,请重试！', { icon: 5, shade: 0.4, time: 1000 });
		                            }
		                            layer.close(index);
		                            $("#resetBtn").click();
		                    	});
		                		
		                	})
		                }
		            });
				}
			});
		}
		function reloadCity(id,cityId){
			$.ajax({
				type:"post",
				url:"proCityArea/findCityByProId",
				data:"provinceId="+id,
				dataType:"json",
				success:function(data){
					var str="<option value=''>请选择市</option>"
					for(var i=0;i<data.length;i++){
						str=str+"<option value='"+data[i].cityId+"'>"+data[i].cityName+"</option>";
					}
					$("#cityData").html(str);
					$("#cityData").val(cityId);
					form.render();
				}
			});
		}
		function reloadArea(id,areaId){
			$.ajax({
				type:"post",
				url:"proCityArea/findAreaByCityId",
				data:"cityId="+id,
				dataType:"json",
				success:function(data){
					var str="<option value=''>请选择县/区</option>"
					for(var i=0;i<data.length;i++){
						str=str+"<option value='"+data[i].areaId+"'>"+data[i].areaName+"</option>";
					}
					$("#areaData").html(str);
					$("#areaData").val(areaId);
					form.render();
				}
			});
		}
		function deleteAddress(id){
			layer.confirm("确定要删除该地址吗？",function(){
				$.ajax({
					type:"post",
					url:"address/deleteAddress",
					data:"addrId="+id,
					success:function(data){
						if(data=="success"){
							layer.msg('删除地址成功！', {
								icon : 1,
								time : 2000
							});
						}else{
							layer.msg('删除地址失败！请重试！', {
								icon : 5,
								time : 2000
							});
						}
						showUserAddress();
					}
				});
			});
		}
		function addAddress(){
			layer.open({
                type: 1,
                title: '添加地址',
                shade: 0.4,  //阴影度
                fix: false,
                shadeClose: true,
                maxmin: false,
                area: ['800px;', '500px;'],    //窗体大小（宽,高）
                content: $('#addrForm'),
                btn:['添加','取消'],
                success: function (layero, index) {
                    layero.addClass('layui-form');//添加form标识
                    layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
                    $("#resetBtn").click();
                    form.render(); 
                },
                yes: function(index, layero){
                	form.on('submit(fromContent)',function(data){
                		$.post("address/addAddress",$("#addrFormData").serialize(),function(data){
                            if (data == 'success'){
                                parent.layer.msg('添加地址成功！', { icon: 1, shade: 0.4, time: 1000 });
                                showUserAddress();
                            }else{
                                parent.layer.msg('添加地址失败！,请重试！', { icon: 5, shade: 0.4, time: 1000 });
                            }
                            layer.close(index);
                            $("#resetBtn").click();
                    	});
                		
                	})
                	
                }
            });
		}
		function addToFavorite(id){
			$.ajax({
				type:"post",
				url:"guess/addToFavorite",
				data:"goodsId="+id,
				success : function(data){
					if (data == "success") {
						layer.msg('收藏成功！', {
							icon : 1,
							time : 2000
						});
					} else {
						layer.msg('收藏失败！', {
							icon : 5,
							time : 2000
						});
					}
					showRecentView();
					showFavorite();
				}
			});
		}
		function removeFavorite(id) {
			layer.confirm("确定取消收藏吗？", function() {
				$.ajax({
					type : "post",
					url : "guess/removeFavorite",
					data : "goodsId=" + id,
					success : function(data) {
						if (data == "success") {
							layer.msg('取消收藏成功！', {
								icon : 1,
								time : 2000
							});
							showFavorite();
						} else {
							layer.msg('取消收藏失败！', {
								icon : 5,
								time : 2000
							});
						}
						showFavorite();
						showRecentView();
					}
				});
			})
		}
		function showFavorite() {
			$.ajax({
						type : "post",
						url : "guess/findFavorite",
						dataType : "json",
						success : function(arr) {
							var str = "<div style='padding-left:16px;' class='span16'><ul>";
							for (var i = 0; i < arr.length; i++) {
								if ((i + 1) % 4 != 0) {
									str = str
											+ "<li><a href='goods/detail?goodsId="
											+ arr[i].guessGoods.goodsId
											+ "'>"
											+ "<img style='margin-bottom:2px;margin-top:10px;' src='upload/"+arr[i].guessGoods.goodsImg+"' /><p class='goods-title'>"
											+ arr[i].guessGoods.goodsName
											+ "</p>"
											+ "<p class='goods-desc'>"
											+ arr[i].guessGoods.goodsDesc
											+ "</p></a><p><span class='newprice'>"
											+ arr[i].guessGoods.goodsPrice
											+ "元</span>&nbsp;"
											+ "</p><button onclick='addToCart("
											+ arr[i].guessGoods.goodsId
											+ ")'  class='layui-btn layui-btn-sm'>加入购物车</button>"
											+ "<button onclick='removeFavorite("
											+ arr[i].guessGoods.goodsId
											+ ")' class='layui-btn layui-btn-sm'>取消收藏</button></li>";
								} else {
									str = str
											+ "<li class='brick4'><a href='goods/detail?goodsId="
											+ arr[i].guessGoods.goodsId
											+ "'>"
											+ "<img style='margin-bottom:2px;margin-top:10px;' src='upload/"+arr[i].guessGoods.goodsImg+"' /><p class='goods-title'>"
											+ arr[i].guessGoods.goodsName
											+ "</p>"
											+ "<p class='goods-desc'>"
											+ arr[i].guessGoods.goodsDesc
											+ "</p></a><p><span class='newprice'>"
											+ arr[i].guessGoods.goodsPrice
											+ "元</span>&nbsp;"
											+ "</p><button onclick='addToCart("
											+ arr[i].guessGoods.goodsId
											+ ")' class='layui-btn layui-btn-sm'>加入购物车</button>"
											+ "<button onclick='removeFavorite("
											+ arr[i].guessGoods.goodsId
											+ ")' class='layui-btn layui-btn-sm'>取消收藏</button></li>";
								}
							}
							var str = str + "</ul></div>";
							$("#productArea").html(str);
						}
					});
		}
		function showRecentView() {
			$.ajax({
						type : "post",
						url : "guess/findRecentGoods",
						dataType : "json",
						success : function(arr) {
							var str = "<div style='padding-left:0px;margin-left:-40px' class='span16'><ul>";
							for (var i = 0; i < arr.length; i++) {
								if ((i + 1) % 4 != 0) {
									str = str
											+ "<li><a href='goods/detail?goodsId="
											+ arr[i].guessGoods.goodsId
											+ "'>"
											+ "<img style='margin-bottom:2px;margin-top:10px;' src='upload/"+arr[i].guessGoods.goodsImg+"' /><p class='goods-title'>"
											+ arr[i].guessGoods.goodsName
											+ "</p>"
											+ "<p class='goods-desc'>"
											+ arr[i].guessGoods.goodsDesc
											+ "</p></a><p><span class='newprice'>"
											+ arr[i].guessGoods.goodsPrice
											+ "元</span>&nbsp;"
											+ "</p>"
											+ "<button onclick='addToFavorite("
											+ arr[i].guessGoods.goodsId
											+ ")' class='layui-btn layui-btn-sm layui-btn-normal' onclick='addToFavorite();'>收藏商品</button></li>";
								} else {
									str = str
											+ "<li class='brick4'><a href='goods/detail?goodsId="
											+ arr[i].guessGoods.goodsId
											+ "'>"
											+ "<img style='margin-bottom:2px;margin-top:10px;' src='upload/"+arr[i].guessGoods.goodsImg+"' /><p class='goods-title'>"
											+ arr[i].guessGoods.goodsName
											+ "</p>"
											+ "<p class='goods-desc'>"
											+ arr[i].guessGoods.goodsDesc
											+ "</p></a><p><span class='newprice'>"
											+ arr[i].guessGoods.goodsPrice
											+ "元</span>&nbsp;"
											+ "</p>"
											+ "<button onclick='addToFavorite("
											+ arr[i].guessGoods.goodsId
											+ ")' class='layui-btn layui-btn-sm layui-btn-normal' onclick='addToFavorite()'>收藏商品</button></li>";
								}
							}
							var str = str + "</ul></div>";
							$("#recentViewArea").html(str);
						}
					});
		}
		function addToCart(id) {
			var num = 1;
			$.ajax({
				type : "post",
				url : "cart/addCart",
				data : "num=" + num + "&goodsId=" + id,
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
		function showReadyPayOrder() {
			$.ajax({
						type : "post",
						url : "order/findReadPayOrder",
						dataType : "json",
						success : function(data) {
							str = "";
							if (data == null ||data=="") {
								str = str + "<h2>暂无相关订单信息</h2>"
							} else {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
								for (var i = 0; i < data.length; i++) {
									var date=new Date(data[i].orderDate).toLocaleString();
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+ data[i].orderId
											+ "&nbsp;&nbsp;总价："
											+ data[i].orderPrice
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content'><h4>收货人："
											+ data[i].orderUserName
											+ "&nbsp;&nbsp;收货地址："
											+ data[i].orderAddress
											+ "&nbsp;电话："+data[i].orderPhone+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data[i].detailList;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='goods/detail?goodsId="
												+ arr[t].detailGoods.goodsId
												+ "'>"
												+ arr[t].detailGoods.goodsName
												+ "</a></td>" + "<td>"
												+ arr[t].detailGoods.goodsPrice
												+ "</td><td>"
												+ arr[t].detailNum
												+ "台</td><td>"
												+ arr[t].detailGoods.goodsPrice
												* arr[t].detailNum + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div><button onclick='payfor(\""+data[i].orderId+"\")' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>去付款</button>"
											+ "</div></div>";
								}
								str = str + "</div>";
							}
							
							$("#state1").html(str);
							element.render();
						}
					});
		}
		function payfor(id){
			window.location.href="order/toPay?orderId="+id;
		}
		function findReadyToDeliverOrder() {
			$.ajax({
						type : "post",
						url : "order/findReadyToDeliverOrder",
						dataType : "json",
						success : function(data) {
							str = "";
							if (data == null ||data=="") {
								str = str + "<h2>暂无相关订单信息</h2>"
							} else {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
								for (var i = 0; i < data.length; i++) {
									var date=new Date(data[i].orderDate).toLocaleString();
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+ data[i].orderId
											+ "&nbsp;&nbsp;总价："
											+ data[i].orderPrice
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content'><h4>收货人："
											+ data[i].orderUserName
											+ "&nbsp;&nbsp;收货地址："
											+ data[i].orderAddress
											+ "&nbsp;电话："+data[i].orderPhone+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data[i].detailList;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='goods/detail?goodsId="
												+ arr[t].detailGoods.goodsId
												+ "'>"
												+ arr[t].detailGoods.goodsName
												+ "</a></td>" + "<td>"
												+ arr[t].detailGoods.goodsPrice
												+ "</td><td>"
												+ arr[t].detailNum
												+ "台</td><td>"
												+ arr[t].detailGoods.goodsPrice
												* arr[t].detailNum + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div>"
											+ "</div></div>";
								}
								str = str + "</div>";
							}
							$("#state2").html(str);
							element.render();
						}
					});
		}
		function findReadyToReceiveOrder() {
			$.ajax({
						type : "post",
						url : "order/findReadyToReceiveOrder",
						dataType : "json",
						success : function(data) {
							str = "";
							if (data == null ||data=="") {
								str = str + "<h2>暂无相关订单信息</h2>"
							} else {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
								for (var i = 0; i < data.length; i++) {
									var date=new Date(data[i].orderDate).toLocaleString();
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+ data[i].orderId
											+ "&nbsp;&nbsp;总价："
											+ data[i].orderPrice
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content'><h4>收货人："
											+ data[i].orderUserName
											+ "&nbsp;&nbsp;收货地址："
											+ data[i].orderAddress
											+ "&nbsp;电话："+data[i].orderPhone+"&nbsp;快递单号"+data[i].orderExpressNo+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data[i].detailList;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='goods/detail?goodsId="
												+ arr[t].detailGoods.goodsId
												+ "'>"
												+ arr[t].detailGoods.goodsName
												+ "</a></td>" + "<td>"
												+ arr[t].detailGoods.goodsPrice
												+ "</td><td>"
												+ arr[t].detailNum
												+ "台</td><td>"
												+ arr[t].detailGoods.goodsPrice
												* arr[t].detailNum + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div><button onclick='confirmReceive(\""+data[i].orderId+"\")' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>确认收货</button>"
											+ "</div></div>";
								}
								str = str + "</div>";
							}
							$("#state3").html(str);
							element.render();
						}
					});
		}
		function confirmReceive(id){
			layer.confirm("确认收货吗？",function(){
				$.ajax({
					type:"post",
					url:"order/receiveOrder",
					data:"orderId="+id,
					success:function(data){
						if(data=="success"){
							layer.msg('确认收货成功！', {
								icon : 1,
								time : 2000
							});
						}else{
							layer.msg('确认收货失败！请重试！', {
								icon : 5,
								time : 2000
							});
						}
						findReadyToReceiveOrder();
						findReadyToEvaluateOrder();
					}
				});
			});
		}
		function findReadyToEvaluateOrder() {
			$.ajax({
						type : "post",
						url : "order/findReadyToEvaluateOrder",
						dataType : "json",
						success : function(data) {
							str = "";
							if (data == null ||data=="") {
								str = str + "<h2>暂无相关订单信息</h2>"
							} else {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
								for (var i = 0; i < data.length; i++) {
									var date=new Date(data[i].orderDate).toLocaleString();
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+ data[i].orderId
											+ "&nbsp;&nbsp;总价："
											+ data[i].orderPrice
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content'><h4>收货人："
											+ data[i].orderUserName
											+ "&nbsp;&nbsp;收货地址："
											+ data[i].orderAddress
											+ "&nbsp;电话："+data[i].orderPhone+"&nbsp;快递单号"+data[i].orderExpressNo+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data[i].detailList;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='goods/detail?goodsId="
												+ arr[t].detailGoods.goodsId
												+ "'>"
												+ arr[t].detailGoods.goodsName
												+ "</a></td>" + "<td>"
												+ arr[t].detailGoods.goodsPrice
												+ "</td><td>"
												+ arr[t].detailNum
												+ "台</td><td>"
												+ arr[t].detailGoods.goodsPrice
												* arr[t].detailNum + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div><button onclick='publishEva(\""+data[i].orderId+"\")'  class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>发表评价</button>"
											+ "</div></div>";
								}
								str = str + "</div>";
							}
							$("#state4").html(str);
							element.render();
						}
					});
		}
		function findFinishOrder() {
			$.ajax({
						type : "post",
						url : "order/findFinishOrder",
						dataType : "json",
						success : function(data) {
							var str = "";
							if (data == null ||data=="") {
								str = str + "<h2>暂无相关订单信息</h2>"
							} else {
								str = str+ "<div class='layui-collapse' lay-accordion=''>";
								for (var i = 0; i < data.length; i++) {
									var date=new Date(data[i].orderDate).toLocaleString();
									str = str
											+ "<div class='layui-colla-item'>"
											+ "<h2 class='layui-colla-title'>订单编号："
											+ data[i].orderId
											+ "&nbsp;&nbsp;总价："
											+ data[i].orderPrice
											+ "元&nbsp;订单日期："+date+"</h2>"
											+ "<div class='layui-colla-content'><h4>收货人："
											+ data[i].orderUserName
											+ "&nbsp;&nbsp;收货地址："
											+ data[i].orderAddress
											+ "&nbsp;电话："+data[i].orderPhone+"&nbsp;快递单号"+data[i].orderExpressNo+"</h4>"
											+ "<div class='layui-form'><table class='layui-table'><thead><tr><th>商品名称</th><th>价格</th><th>数量</th><th>小计</th></tr>"
											+ "</thead><tbody>";
									var arr = data[i].detailList;
									for (var t = 0; t < arr.length; t++) {
										str = str
												+ "<tr><td><a href='goods/detail?goodsId="
												+ arr[t].detailGoods.goodsId
												+ "'>"
												+ arr[t].detailGoods.goodsName
												+ "</a></td>" + "<td>"
												+ arr[t].detailGoods.goodsPrice
												+ "</td><td>"
												+ arr[t].detailNum
												+ "台</td><td>"
												+ arr[t].detailGoods.goodsPrice
												* arr[t].detailNum + "元</td>"
												+ "</tr>";
									}
									str = str
											+ "</tbody></table></div><button onclick='deleteOrder(\""+data[i].orderId+"\")' class='layui-btn layui-btn-normal layui-btn-fluid layui-btn-radius'>删除订单</button>"
											+ "</div></div>";
								}
								str = str + "</div>";
							}
							$("#state5").html(str);
							element.render();
						}
					});
		}
		function deleteOrder(id){
			layer.confirm("确认删除该订单吗？",function(){
				$.ajax({
					type:"post",
					url:"order/deleteOrder",
					data:"orderId="+id,
					success:function(data){
						if(data=="success"){
							layer.msg("删除订单成功！",{icon:1 , time:2000 });
						}else{
							layer.msg("删除订单失败！请重试！",{icon: 5, time: 2000});
						}
						findFinishOrder();
					}
				});
			});
		}
		function showProvince(){
			$.ajax({
				type:"post",
				url:"proCityArea/findAllPro",
				dataType:"json",
				success:function(data){
					var str="<option value=''>请选择省</option>"
					for(var i=0;i<data.length;i++){
						str=str+"<option value='"+data[i].provinceId+"'>"+data[i].provinceName+"</option>"
					}
					$("#proData").html(str);
					form.render();
				}
			});
		}
	</script>
</body>
</html>