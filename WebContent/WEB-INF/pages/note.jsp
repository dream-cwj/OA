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

<title>XENON - 我的便签</title>
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
					<h1 class="title">便签列表</h1>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="javascript:void(0);"><i class="fa-home"></i>首页</a></li>
						<li class="active"><strong>便签管理</strong></li>
					</ol>

				</div>

			</div>

			<div class="row">

				<div class="col-md-12">
					<div class="panel panel-default panel-shadow">
						<!-- Add class "collapsed" to minimize the panel -->
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-bullhorn"></i> <span>便签列表</span>
							</h3>

							<div class="panel-options">
								<a href="javascript:void(0);" onclick="$(this).addNote();">
									<i class="fa fa-plus"></i>
								</a>
							</div>
						</div>

						<div class="panel-body">
							<s:if test="page.data==null || page.data.isEmpty()">
								<div class="well well-sm">暂无便签信息</div>
							</s:if>
							<s:iterator value="page.data" var="note" status="status">
								<s:if test="#status.index%2==0">
									<div class="row">
								</s:if>
								<div class="col-md-6">
									<div id="note<s:property value="#note.id" />"
										class="panel panel-default panel-border">
										<!-- Add class "collapsed" to minimize the panel -->
										<div class="panel-heading">
											<h3 class="panel-title">
												<s:hidden class="note-id" value="%{#note.id}" />
												<span class="note-title"><s:property
														value="#note.title" /></span>
											</h3>

											<div class="panel-options">
												<a href="javascript:void(0);"
													onclick="$('#note<s:property value="#note.id" />').editNote();">
													<i class="fa fa-edit"></i>
												</a> <a href="javascript:void(0);"
													onclick="$('#deleteNote').find('.note-id').val(<s:property value="#note.id" />);$('#deleteNote').modal('show');">
													<i class="fa fa-trash"></i>
												</a>
											</div>
										</div>

										<div class="panel-body">
											<p class="note-content">
												<s:property value="#note.content" />
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
										href="notelist.action?page.current=<s:property value="page.current - 1" />">
											<i class="fa fa-angle-double-left"></i> <span>上一页</span>
									</a></li>
								</s:if>
								<li class="page-info"><s:property value="page.current" />
									/ <s:property value="page.total" /></li>
								<s:if test="page.current < page.total">
									<li class="next"><a
										href="notelist.action?page.current=<s:property value="page.current + 1" />">
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

	<div class="modal fade bs-example-modal-sm" id="addnote"
		data-backdrop="static" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">添加便签</h4>
				</div>

				<div class="modal-body">
					<form id="addnoteForm" class="validate" novalidate="novalidate"
						role="form">
						<div class="form-group">
							<input id="noteid" type="hidden" value="" /> <label>标题：</label>
							<input id="notetitle" name="title" type="text"
								class="form-control" placeholder="请输入便签标题"
								data-validate="required" data-message-required="便签标题不能为空" />
						</div>
						<div class="form-group">
							<label>内容：</label>
							<div class="write-pad">
								<textarea id="notecontent" name="content"
									class="form-control note-write" placeholder="请输入便签内容"
									data-validate="required" data-message-required="便签内容不能为空"></textarea>
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" onclick="addNote();" class="btn btn-info">保存</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 便签删除确认弹框 -->
	<div class="modal fade bs-example-modal-sm" id="deleteNote"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">提示</h4>
				</div>

				<div class="modal-body">
					<input type="hidden" class="note-id" value="" />
					<p>是否要删除该便签？</p>
				</div>

				<div class="modal-footer">
					<button type="button"
						onclick="deleteNote($('#deleteNote').find('.note-id').val());"
						class="btn btn-info">是</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">否</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//添加新便签
		function addNote() {
			if ($('#addnoteForm').valid()) {
				var data = {
					"note.id" : $("#noteid").val(),
					"note.title" : $("#notetitle").val(),
					"note.content" : $("#notecontent").val()
				};
				$.ajax({
					url : "notesave.action",
					type : "post",
					data : data,
					success : function(resp) {
						if (resp == true) {
							$("#addnote").modal("hide");
							toastr.success("保存成功");
							setTimeout(function(){
								location.reload();
							},3000);
						} else {
							toastr.error("保存失败");
						}
					}
				});
			}
		}
		
		function deleteNote(id){
			var data = {
				"note.id":id
			};
			$.ajax({
				url:"notedelete.action",
				type:"post",
				data:data,
				success:function(resp){
					if(resp==true){
						$("#deleteNote").modal("hide");
						toastr.success("删除成功");
						setTimeout(function(){
							location.reload();
						},3000);
					}else{
						alert("删除失败");
					}
				}
			});
		}

		$.fn.extend({
			addNote : function() {
				var addNoteModal = $("#addnote");
				addNoteModal.find(".modal-title").html("添加便签");
				$("#noteid").val("");
				$("#notetitle").val("");
				$("#notecontent").val("");
				addNoteModal.modal("show");
			},
			editNote : function() {
				var $_this = $(this);
				var addNoteModal = $("#addnote");
				addNoteModal.find(".modal-title").html("编辑便签");
				$("#noteid").val($_this.find(".note-id").val());
				$("#notetitle").val($_this.find(".note-title").html().trim());
				$("#notecontent").val(
						$_this.find(".note-content").html().trim());
				addNoteModal.modal("show");
			}
		});
	</script>


	<s:action name="topage_modal" executeResult="true" />

	<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>


	<!-- Imported scripts on this page -->
	<script src="assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="assets/js/typeahead.bundle.js"></script>
	<script src="assets/js/handlebars.min.js"></script>
	<script src="assets/js/xenon-widgets.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
	<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
	<script src="assets/js/toastr/toastr.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="assets/js/xenon-custom.js"></script>
</body>
</html>