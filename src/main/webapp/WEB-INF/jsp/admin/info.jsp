<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="resources/css/layui.css">
<script src="resources/js/jquery.1.12.4.min.js"></script>
<script type="text/javascript" src="resources/js/layui.js"></script>
</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">设置我的资料</div>
					<div class="layui-card-body" pad15="">

						<div class="layui-form" lay-filter="">
							<div class="layui-form-item">
								<label class="layui-form-label">我的角色</label>
								<div class="layui-input-inline">
									<select name="role" lay-verify="">
										<option value="1" selected="">超级管理员</option>
										<option value="2" disabled="">普通管理员</option>
										<option value="3" disabled="">审核员</option>
										<option value="4" disabled="">编辑人员</option>
									</select>
									<div class="layui-unselect layui-form-select">
										<div class="layui-select-title">
											<input type="text" placeholder="请选择" value="超级管理员"
												readonly="" class="layui-input layui-unselect"><i
												class="layui-edge"></i>
										</div>
										<dl class="layui-anim layui-anim-upbit" style="">
											<dd lay-value="1" class="layui-this">超级管理员</dd>
											<dd lay-value="2" class="layui-disabled">普通管理员</dd>
											<dd lay-value="3" class="layui-disabled">审核员</dd>
											<dd lay-value="4" class="layui-disabled">编辑人员</dd>
										</dl>
									</div>
								</div>
								<div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-inline">
									<input type="text" name="username" value="xianxin" readonly=""
										class="layui-input">
								</div>
								<div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">昵称</label>
								<div class="layui-input-inline">
									<input type="text" name="nickname" value="贤心"
										lay-verify="nickname" autocomplete="off" placeholder="请输入昵称"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">性别</label>
								<div class="layui-input-block">
									<input type="radio" name="sex" value="男" title="男">
									<div class="layui-unselect layui-form-radio">
										<i class="layui-anim layui-icon"></i>
										<div>男</div>
									</div>
									<input type="radio" name="sex" value="女" title="女" checked="">
									<div class="layui-unselect layui-form-radio layui-form-radioed">
										<i class="layui-anim layui-icon"></i>
										<div>女</div>
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">头像</label>
								<div class="layui-input-inline">
									<input name="avatar" lay-verify="required" id="LAY_avatarSrc"
										placeholder="图片地址" value="http://cdn.layui.com/avatar/168.jpg"
										class="layui-input">
								</div>
								<div class="layui-input-inline layui-btn-container"
									style="width: auto;">
									<button type="button" class="layui-btn layui-btn-primary"
										id="LAY_avatarUpload">
										<i class="layui-icon"></i>上传图片
									</button>
									<input class="layui-upload-file" type="file" accept="undefined"
										name="file">
									<button class="layui-btn layui-btn-primary"
										layadmin-event="avartatPreview">查看图片</button>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">手机</label>
								<div class="layui-input-inline">
									<input type="text" name="cellphone" value="" lay-verify="phone"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">邮箱</label>
								<div class="layui-input-inline">
									<input type="text" name="email" value="" lay-verify="email"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item layui-form-text">
								<label class="layui-form-label">备注</label>
								<div class="layui-input-block">
									<textarea name="remarks" placeholder="请输入内容"
										class="layui-textarea"></textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit="" lay-filter="setmyinfo">确认修改</button>
									<button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		layui
				.use(
						[ 'layer', 'table', 'form', 'upload' ],
						function() {
							var table = layui.table;
							var layer = layui.layer;
							var form = layui.form;
							var upload = layui.upload;
							var uploadInst = upload
									.render({
										elem : '#test1' //绑定元素
										,
										url : 'banner/uploadBannerImg' //上传接口
										,
										done : function(res) {
											layer.msg("上传图片成功！", {
												icon : 1,
												time : 1000
											});
											var str = "<img style='width:280px;height:160px;' src='upload/"+res.src+"' /><input type='hidden' value='"+res.src+"' name='bannerImg' />"
											$("#newImg").html(str);
										},
										error : function() {
											layer.msg("上传图片失败！请重试！", {
												icon : 5,
												anim : 6,
												time : 1000
											});
										}
									});
							form
									.on(
											'submit(*)',
											function() {
												$
														.ajax({
															type : "post",
															url : "banner/addBanner",
															data : $(
																	"#formData")
																	.serialize(),
															success : function(
																	data) {
																if (data == "success") {
																	layer
																			.msg(
																					"添加轮播图成功！",
																					{
																						icon : 1,
																						shade : 0.4,
																						anim : 1,
																						time : 1000
																					},
																					function() {
																						window.location.href = "view/bannerlist";
																					});
																} else {
																	layer
																			.msg(
																					"添加轮播图失败！请重试！",
																					{
																						icon : 5,
																						shade : 0.4,
																						anim : 6,
																						time : 1000
																					});
																}
															}
														});
												return false;
											});
						});
	});
</script>
</html>
