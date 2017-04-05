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

<title>XENON - 会议室管理</title>
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

			<!-- 面包屑 -->
			<div class="page-title">

				<div class="title-env">
					<h1 class="title">会议室管理</h1>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="javascript:void(0);"><i class="fa-home"></i>首页</a></li>
						<li><a href="javascript:void(0);">行政管理</a></li>
						<li class="active"><strong>会议室管理</strong></li>
					</ol>

				</div>

			</div>

			<!-- 页面内容 -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">会议室列表</h4>
					<div class="panel-options">
						<button type="button" class="btn btn-secondary btn-icon"
							onclick="alertSaveMeetingRoom();">新增</button>
					</div>
				</div>
				<table id="meetingRoomList"
					class="table table-condensed table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>会议室名称</th>
							<th>会议室描述</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="middle-align">
						<s:if test="page.data == null || page.data.isEmpty()">
							<tr>
								<td colspan="4" align="center">暂无会议室信息</td>
							</tr>
						</s:if>
						<s:iterator value="page.data" var="mr">
							<tr>
								<td class="mrid"><s:property value="#mr.id" /></td>
								<td class="mrname"><s:property value="#mr.name" /></td>
								<td class="mrdescribe"><s:property value="#mr.describe" /></td>
								<td><a href="javascript:void(0);"
									onclick="alertSaveMeetingRoom($(this).parents('tr'));"
									class="btn btn-blue btn-icon">修改</a> <a
									href="javascript:void(0);"
									onclick="alertDeleteMeetingRoomModal(<s:property value="#mr.id" />);"
									class="btn btn-danger btn-icon">删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="row">
					<div class="col-xs-12">
						<ul class="pager">
							<s:if test="page.current>1">
								<li class="previous"><a
									href="meetingroomlist.action?page.current=<s:property value="page.current-1" />">上一页</a></li>
							</s:if>
							<li class="page-info"><s:property value="page.current" /> /
								<s:property value="page.total" /></li>
							<s:if test="page.current<page.total">
								<li class="next"><a
									href="meetingroomlist.action?page.current=<s:property value="page.current+1" />">下一页</a></li>
							</s:if>
						</ul>
					</div>
				</div>
			</div>

			<s:action name="topage_footer" executeResult="true" />
		</div>

	</div>

	<s:action name="topage_modal" executeResult="true" />

	<!-- 新增会议室弹框 -->
	<div class="modal fade bs-example-modal-sm" id="saveMeetingRoomModal"
		data-backdrop="static" aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">新增会议室</h4>
				</div>

				<div class="modal-body">
					<form id="saveMeetingRoomForm" role="form" novalidate="novalidate"
						class="validate">
						<div class="form-group">
							<input type="hidden" class="mrid" value="" />
							<label>会议室名称</label> <input type="text" name="mrname"
								class="mrname form-control" data-validate="required"
								data-message-required="会议室名称不能为空" placeholder="会议室名称" />
						</div>
						<div class="form-group">
							<label>会议室描述</label>
							<textarea name="describe"
								class="mrdescribe form-control note-write"
								data-validate="required" data-message-required="会议室描述不能为空"
								placeholder="会议室描述"></textarea>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-info"
						onclick="saveMeetingRoom();">保存</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 会议室删除确认弹框 -->
	<div class="modal fade bs-example-modal-sm" id="deleteMeetingRoomModal"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">删除提示</h4>
				</div>

				<div class="modal-body">
					<input type="hidden" class="mrid" value="" />
					<p>确认删除该会议室？</p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-info" onclick="deleteMeetingRoom();">确定</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function alertSaveMeetingRoom(selector) {
			var flag = typeof(selector)=="undefined";
			var add_meeting_room = $("#saveMeetingRoomModal");
			add_meeting_room.find(".modal-title").html(
					flag == true ? "新增会议室" : "修改会议室");
			add_meeting_room.find(".mrid").val(flag?"":selector.find(".mrid").text());
			add_meeting_room.find(".mrname").val(flag?"":selector.find(".mrname").text());
			add_meeting_room.find(".mrdescribe").val(flag?"":selector.find(".mrdescribe").text());
			add_meeting_room.modal("show");
		}

		function alertDeleteMeetingRoomModal(id) {
			var $_MeetingRoomDelete = $("#deleteMeetingRoomModal");
			$_MeetingRoomDelete.find(".mrid").val(id);
			$_MeetingRoomDelete.modal("show");
		}
		
		function saveMeetingRoom(){
			var $_saveMeetingRoomModal = $("#saveMeetingRoomModal");
			var data = {
				"meetingRoom.id":$_saveMeetingRoomModal.find(".mrid").val(),
				"meetingRoom.name":$_saveMeetingRoomModal.find(".mrname").val(),
				"meetingRoom.describe":$_saveMeetingRoomModal.find(".mrdescribe").val()
			};
			if(!$_saveMeetingRoomModal.find("form").valid()) return;
			$.ajax({
				url:"meetingroomsave.action",
				data:data,
				type:"post",
				success:function(resp){
					if(resp==true){
						$_saveMeetingRoomModal.modal("hide");
						toastr.success("保存成功");
						setTimeout(function(){
							location.reload();
						},3000);
					}else{
						toastr.error("保存失败");
					}
				}
			});
		}

		function deleteMeetingRoom() {
			var $_MeetingRoomDelete = $("#deleteMeetingRoomModal");
			var data = {
				"meetingRoom.id":$_MeetingRoomDelete.find(".mrid").val()
			};
			$.ajax({
				url:"meetingroomdelete.action",
				data:data,
				type:"post",
				success:function(resp){
					if(resp==true){
						$_MeetingRoomDelete.modal("hide");
						toastr.success("删除成功");
						setTimeout(function(){
							location.reload();
						},3000);
					}else{
						toastr.error("删除失败");
					}
				}
			});
		}
	</script>


	<!-- Bottom Scripts -->
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/TweenMax.min.js"></script>
	<script src="assets/js/resizeable.js"></script>
	<script src="assets/js/joinable.js"></script>
	<script src="assets/js/xenon-api.js"></script>
	<script src="assets/js/xenon-toggles.js"></script>
	<script src="assets/js/toastr/toastr.min.js"></script>


	<!-- Imported scripts on this page -->
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
