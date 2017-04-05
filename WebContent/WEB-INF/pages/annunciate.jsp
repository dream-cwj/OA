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

<title>XENON - 公告管理</title>
<link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet"
	href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/xenon-core.css">
<link rel="stylesheet" href="assets/css/xenon-forms.css">
<link rel="stylesheet" href="assets/css/xenon-components.css">
<link rel="stylesheet" href="assets/css/xenon-skins.css">
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet"
	href="assets/js/daterangepicker/daterangepicker-bs3.css">
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/js/jquery-validate/jquery.validate.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body class="page-body">

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
					<h1 class="title">公告列表</h1>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="javascript:void(0);"><i class="fa-home"></i>首页</a></li>
						<li class="active"><strong>公告管理</strong></li>
					</ol>

				</div>

			</div>

			<div class="row">

				<div class="col-md-12">
					<div class="panel panel-default panel-shadow">
						<!-- Add class "collapsed" to minimize the panel -->
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bullhorn"></i> <span>公告列表</span>
							</h3>

							<div class="panel-options">
								<a href="javascript:void(0);"
									onclick="$('#publish').modal('show');"> <i
									class="fa fa-plus"></i>
								</a>
							</div>
						</div>

						<div class="panel-body">
							<s:if test="page.data==null || page.data.isEmpty()">
								<div class="well well-sm">暂无公告信息</div>
							</s:if>
							<s:iterator value="page.data" var="annunciate" status="status">
								<s:if test="#status.index%2==0">
									<div class="row">
								</s:if>
								<div class="col-md-6">
									<div class="panel panel-default panel-border">
										<!-- Add class "collapsed" to minimize the panel -->
										<div class="panel-heading">
											<h3 class="panel-title">
												<span><s:if test="#annunciate.urgency">
														<div class="label label-red hidden-collapsed">紧急</div>
													</s:if> <s:property value="#annunciate.title" /></span>
											</h3>

											<div class="panel-options">
												<a href="javascript:void(0);"
													onclick="$('#annunciateId').val(<s:property value="#annunciate.id" />);$('#deleteAnnunciate').modal('show');">
													<i class="fa fa-trash"></i>
												</a>
											</div>
										</div>

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
								<s:if test="#status.index%2!=0 || #status.last">
						</div>
						</s:if>
						</s:iterator>
						<div class="row">
							<ul class="pager">
								<s:if test="page.current > 1">
									<li class="previous"><a
										href="annunciatelist.action?page.current=<s:property value="page.current - 1" />">
											<i class="fa fa-angle-double-left"></i> <span>上一页</span>
									</a></li>
								</s:if>
								<li class="page-info"><s:property value="page.current" /> / <s:property
										value="page.total" /></li>
								<s:if test="page.current < page.total">
									<li class="next"><a
										href="annunciatelist.action?page.current=<s:property value="page.current + 1" />">
											<span>下一页</span> <i class="fa fa-angle-double-right"></i>
									</a></li>
								</s:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<s:action name="topage_footer" executeResult="true" />
	</div>

	</div>

	<s:set name="today" value="%{getCurrentDate()}"></s:set>

	<!-- 发布新公告弹框 -->
	<div class="modal fade bs-example-modal-sm" id="publish"
		data-backdrop="static" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">发布公告</h4>
				</div>

				<div class="modal-body">
					<form id="publishForm" role="form" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="title">标题：</label>

							<div class="col-sm-7">
								<input id="title" name="annunciate.title" type="text"
									class="form-control" placeholder="公告标题">
							</div>

							<div class="col-sm-2">
								<div class="checkbox">
									<label> <input id="urgency" name="annunciate.urgency"
										type="checkbox" value="true" /> 紧急
									</label>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">显示时间段：</label>

							<div class="col-sm-9">
								<input type="text" id="rangeTime"
									value="<s:date name="#today" format="yyyy-MM-dd HH:mm" />,<s:date name="#today" format="yyyy-MM-dd HH:mm" />"
									readonly="true" data-time-picker="true" data-separator=","
									data-time-picker-increment="5" class="form-control daterange"
									data-format="YYYY-MM-DD HH:mm" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">发布时间：</label>

							<div class="col-sm-4">
								<input id="publishTime" name="annunciate.publishTime"
									type="text" readonly="true" class="form-control"
									value="<s:date name="#today" format="yyyy-MM-dd HH:mm" />" />
							</div>

							<label class="control-label col-sm-2">发布人：</label>

							<div class="col-sm-3">
								<s:hidden id="publisher" name="annunciate.publisher"
									value="%{#session.user.sn}" />
								<s:textfield name="username" readonly="true"
									class="form-control" value="%{#session.user.name}" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3" for="content">内容：</label>

							<div class="col-sm-9">
								<textarea id="content" name="annunciate.content"
									class="form-control" rows="5" placeholder="公告内容"
									style="resize: none;"></textarea>
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" onclick="publishAnnunciate();"
						class="btn btn-info">发布</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 删除确认弹框 -->
	<div class="modal fade bs-example-modal-sm" id="deleteAnnunciate"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">删除通告</h4>
				</div>

				<div class="modal-body">
					<p>是否要删除该通告？</p>
					<input id="annunciateId" type="hidden" value="" />
				</div>

				<div class="modal-footer">
					<button type="button" onclick="deleteAnnunciate();"
						class="btn btn-info">是</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">否</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$("#publishForm")
					.validate(
							{
								errorElement : 'span',
								errorClass : 'validate-has-error',
								highlight : function(element) {
									$(element).closest('.form-group').addClass(
											'validate-has-error');
								},
								unhighlight : function(element) {
									$(element).closest('.form-group')
											.removeClass('validate-has-error');
								},
								errorPlacement : function(error, element) {
									if (element.closest('.has-switch').length) {
										error.insertAfter(element
												.closest('.has-switch'));
									} else if (element
											.parent('.checkbox, .radio').length
											|| element.parent('.input-group').length) {
										error.insertAfter(element.parent());
									} else {
										error.insertAfter(element);
									}
								},
								rules : {
									"annunciate.title" : {
										required : true
									},
									"annunciate.content" : {
										required : true
									}
								},
								messages : {
									"annunciate.title" : {
										required : "请输入公告标题"
									},
									"annunciate.content" : {
										required : "请输入公告内容"
									}
								}

							});
		});

		function publishAnnunciate() {
			if ($("#publishForm").valid()) {
				var dates = $("#rangeTime").val().split(",");
				var data = {
					"annunciate.title" : $("#title").val(),
					"annunciate.urgency" : $("#urgency").is(":checked"),
					"annunciate.startTime" : dates[0],
					"annunciate.endTime" : dates[1],
					"annunciate.publishTime" : $("#publishTime").val(),
					"annunciate.publisher.sn" : $("#publisher").val(),
					"annunciate.content" : $("#content").val()
				};
				$.ajax({
					url : "annunciatepublish.action",
					type : "POST",
					dataType : "json",
					data : data,
					success : function(resp) {
						if (resp == true) {
							$("#publish").modal("hide");
							toastr.success("发布成功");
							setTimeout(function(){
								location.reload();
							},3000);
						} else {
							toastr.error("发布失败");
						}
					}
				});
			}
		}

		function deleteAnnunciate() {
			var data = {
				"annunciate.id":$("#annunciateId").val()
			};
			$.ajax({
				url : "annunciatedelete.action",
				type:"POST",
				data:data,
				success:function(resp){
					if(resp==true){
						alert("删除成功！");
						$("#deleteAnnunciate").modal("hide");
						location.reload();
					}else{
						alert("删除失败！");
					}
				}
			});
		}
	</script>

	<s:action name="topage_modal" executeResult="true" />

	<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/toastr/toastr.min.js"></script>


	<!-- Imported scripts on this page -->
	<script src="assets/js/daterangepicker/daterangepicker.js"></script>
	<script src="assets/js/datepicker/bootstrap-datepicker.js"></script>
	<script src="assets/js/timepicker/bootstrap-timepicker.min.js"></script>
	<script src="assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="assets/js/typeahead.bundle.js"></script>
	<script src="assets/js/handlebars.min.js"></script>
	<script src="assets/js/xenon-widgets.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>
</body>
</html>