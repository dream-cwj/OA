<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Xenon Boostrap Admin Panel" />
<meta name="author" content="" />

<title>XENON - 我的桌面</title>
<link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet"
	href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/xenon-core.css">
<link rel="stylesheet" href="assets/css/xenon-forms.css">
<link rel="stylesheet" href="assets/css/xenon-components.css">
<link rel="stylesheet" href="assets/css/xenon-skins.css">
<link rel="stylesheet" href="assets/css/custom.css">
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/js/jquery-validate/jquery.validate.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>
<body class="page-body">

	<div class="page-loading-overlay">
		<div class="loader-2"></div>
	</div>

	<div class="page-container">
		<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

		<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
		<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
		<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
		<div class="sidebar-menu toggle-others fixed">

			<s:action name="topage_menu" executeResult="true" />

		</div>

		<div class="main-content">

			<s:action name="topage_nav" executeResult="true" />

			<div class="page-title">

				<div class="title-env">
					<h1 class="title">我的桌面</h1>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="javascript:void(0);"><i class="fa-home"></i>首页</a></li>
						<li class="active"><strong>我的桌面</strong></li>
					</ol>

				</div>

			</div>

			<div class="row">

				<div class="col-md-6">
					<div class="panel panel-default">
						<!-- Add class "collapsed" to minimize the panel -->
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-flag"></i> <span>待处理任务</span>
							</h3>

							<div class="panel-options">
								<a href="#"> <span>更多</span> <i
									class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>

						<div class="panel-body">

							<table class="table table-striped">

								<thead>
									<tr>
										<th>任务名称</th>
										<th>状态</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><a href="#">test</a></td>
										<td>test</td>
									</tr>
									<tr>
										<td><a href="#">test</a></td>
										<td>test</td>
									</tr>
								</tbody>

							</table>

						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-default">
						<!-- Add class "collapsed" to minimize the panel -->
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bullhorn"></i> <span>通知公告</span>
							</h3>

							<div class="panel-options">
								<a href="annunciatelist.action"> <span>更多</span> <i
									class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>

						<div class="panel-body">
							<s:if test="annunciates==null || annunciates.isEmpty()">
								<div class="well well-sm">暂无公告</div>
							</s:if>
							<s:else>
								<div class="panel-group panel-group-joined" id="accordion-test">
									<s:iterator value="annunciates" var="annunciate">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion-test"
														href="#annunciate<s:property value="#annunciate.id" />"
														class="collapsed"> <s:if test="#annunciate.urgency">
															<div class="label label-red hidden-collapsed">紧急</div>
														</s:if> <s:property value="#annunciate.title" />
													</a>
												</h4>
											</div>
											<div id="annunciate<s:property value="#annunciate.id" />"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p>
														发布人：
														<s:property value="#annunciate.publisher.name" />
													</p>
													<p>
														发布时间：
														<s:date name="#annunciate.publishTime"
															format="yyyy-MM-dd HH:mm" />
													</p>
													<p>
														<s:property value="#annunciate.content" />
													</p>
												</div>
											</div>
										</div>
									</s:iterator>
								</div>
							</s:else>
						</div>
					</div>
				</div>

			</div>

			<div class="row">

				<div class="col-md-6">
					<div class="panel panel-default">
						<!-- Add class "collapsed" to minimize the panel -->
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-file-text-o"></i> <span>我的便签</span>
							</h3>

							<div class="panel-options">
								<a href="notelist.action"> <span>更多</span> <i
									class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>

						<div class="panel-body">
							<s:if test="notes==null || notes.isEmpty()">
								<div class="well well-sm">暂无便签</div>
							</s:if>
							<s:else>
								<div class="panel-group panel-group-joined" id="accordion-test">
									<s:iterator value="notes" var="note">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion-test"
														href="#note<s:property value="#note.id" />"
														class="collapsed"> <s:property value="#note.title" />
													</a>
												</h4>
											</div>
											<div id="note<s:property value="#note.id" />"
												class="panel-collapse collapse">
												<div class="panel-body">
													<p><s:property value="#note.content" /></p>
												</div>
											</div>
										</div>
									</s:iterator>
								</div>
							</s:else>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-default">
						<!-- Add class "collapsed" to minimize the panel -->
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-wrench"></i> <span>常用工具</span>
							</h3>
						</div>

						<div class="panel-body">

							<a href="#" class="btn btn-default btn-lg"> <i
								class="fa fa-globe"></i> <span>常用网址</span>
							</a> <a href="#" class="btn btn-default btn-lg"> <i
								class="fa fa-calendar-o"></i> <span>日历查询</span>
							</a> <a href="#" class="btn btn-default btn-lg"> <i
								class="fa fa-calendar"></i> <span>日程管理</span>
							</a>

						</div>
					</div>
				</div>

			</div>

			<s:action name="topage_footer" executeResult="true" />
		</div>

	</div>


	<s:action name="topage_modal" executeResult="true" />


	<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>


	<!-- Imported scripts on this page -->
	<script src="assets/js/xenon-widgets.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script src="assets/js/toastr/toastr.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
