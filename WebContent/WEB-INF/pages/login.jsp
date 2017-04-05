<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Xenon Boostrap Admin Panel" />
<meta name="author" content="" />
<title>XENON - 登录</title>
<link rel="stylesheet" href="<%=basePath %>assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet"
	href="<%=basePath %>assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath %>assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath %>assets/css/xenon-core.css">
<link rel="stylesheet" href="<%=basePath %>assets/css/xenon-forms.css">
<link rel="stylesheet" href="<%=basePath %>assets/css/xenon-components.css">
<link rel="stylesheet" href="<%=basePath %>assets/css/xenon-skins.css">
<link rel="stylesheet" href="<%=basePath %>assets/css/custom.css">
<script src="<%=basePath %>assets/js/jquery-1.11.1.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body class="page-body login-page">


	<div class="login-container">

		<div class="row">

			<div class="col-sm-6">

				<script type="text/javascript">
					jQuery(document)
							.ready(
									function($) {
										// Reveal Login form
										setTimeout(
												function() {
													$(".fade-in-effect")
															.addClass('in');
												}, 1);

										// Validation and Ajax action
										$("form#login")
												.validate(
														{
															rules : {
																username : {
																	required : true
																},

																passwd : {
																	required : true
																}
															},

															messages : {
																username : {
																	required : '请输入用户名'
																},

																passwd : {
																	required : '请输入密码'
																}
															},

															// Form Processing via AJAX
															submitHandler : function(
																	form) {
																show_loading_bar(70); // Fill progress bar to 70% (just a given value)

																var opts = {
																	"closeButton" : true,
																	"debug" : false,
																	"positionClass" : "toast-top-full-width",
																	"onclick" : null,
																	"showDuration" : "300",
																	"hideDuration" : "1000",
																	"timeOut" : "3000",
																	"extendedTimeOut" : "1000",
																	"showEasing" : "swing",
																	"hideEasing" : "linear",
																	"showMethod" : "fadeIn",
																	"hideMethod" : "fadeOut"
																};

																$
																		.ajax({
																			url : "login.action",
																			method : 'POST',
																			dataType : 'json',
																			data : {
																				"employee.sn" : $(
																						form)
																						.find(
																								'#username')
																						.val(),
																				"employee.password" : $(
																						form)
																						.find(
																								'#passwd')
																						.val(),
																			},
																			success : function(
																					resp) {
																				show_loading_bar({
																					delay : .5,
																					pct : 100,
																					finish : function() {

																						// Redirect after successful login page (when progress bar reaches 100%)
																						if (resp.accessGranted) {
																							window.location.href = 'toindex.action';
																						} else {
																							toastr
																									.error(
																											"用户名或密码错误，请重新尝试登录",
																											"登录失败",
																											opts);
																							$passwd
																									.select();
																						}
																					}
																				});

																			}
																		});

															}
														});

										// Set Form focus
										$(
												"form#login .form-group:has(.form-control):first .form-control")
												.focus();
									});
				</script>

				<!-- Errors container -->
				<div class="errors-container"></div>

				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login"
					class="login-form fade-in-effect">

					<div class="login-header">
						<a href="dashboard-1.html" class="logo"> <img
							src="assets/images/logo@2x.png" alt="" width="80" /> <span>登录</span>
						</a>

						<p>亲爱的用户，请登录系统进入您的工作空间！</p>
					</div>


					<div class="form-group">
						<label class="control-label" for="username">用户名</label> <input
							type="text" class="form-control input-dark" name="username"
							id="username" autocomplete="off" />
					</div>

					<div class="form-group">
						<label class="control-label" for="passwd">密码</label> <input
							type="password" class="form-control input-dark" name="passwd"
							id="passwd" autocomplete="off" />
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-dark  btn-block text-left">
							<i class="fa-lock"></i> 登录
						</button>
					</div>

					<div class="login-footer">
						<a href="#">忘记密码</a>
						<!-- <div class="info-links">
							<a href="#">ToS</a> - <a href="#">Privacy Policy</a>
						</div> -->

					</div>

				</form>

			</div>

		</div>

	</div>



	<!-- Bottom Scripts -->
	<script src="<%=basePath %>assets/js/bootstrap.min.js"></script>
	<script src="<%=basePath %>assets/js/TweenMax.min.js"></script>
	<script src="<%=basePath %>assets/js/resizeable.js"></script>
	<script src="<%=basePath %>assets/js/joinable.js"></script>
	<script src="<%=basePath %>assets/js/xenon-api.js"></script>
	<script src="<%=basePath %>assets/js/xenon-toggles.js"></script>
	<script src="<%=basePath %>assets/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="<%=basePath %>assets/js/toastr/toastr.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="<%=basePath %>assets/js/xenon-custom.js"></script>

</body>
</html>