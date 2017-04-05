<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 登出弹框提示 -->
<div class="modal fade bs-example-modal-sm" id="logout"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">登出提示</h4>
			</div>

			<div class="modal-body">是否要登出系统？</div>

			<div class="modal-footer">
				<button type="button" onclick="location.href='employeelogout';"
					class="btn btn-info">是</button>
				<button type="button" class="btn btn-white" data-dismiss="modal">否</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade bs-example-modal-sm" data-backdrop="static"
	id="alterPassword" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button id="closex" type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">修改密码</h4>
			</div>

			<div class="modal-body">
				<form id="alterPasswdForm" action="employeealterPassword.action"
					role="form" class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-sm-3">原密码：</label>
						<div class="col-sm-9">
							<input type="password" name="password" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">新密码：</label>
						<div class="col-sm-9">
							<input type="password" id="newPasswd" name="employee.password"
								class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3">再次输入：</label>
						<div class="col-sm-9">
							<input type="password" id="verifyPassword" name="test"
								class="form-control" />
						</div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button id="btnalter" type="button" onclick="alertPasswd();" class="btn btn-info">修改</button>
				<button id="btncancel" type="button" class="btn btn-white" data-dismiss="modal">取消</button>
				<button id="btnsure" type="button" onclick="location.href='employeelogout'" class="btn btn-info" style="display: none;">确定</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改密码弹窗 -->
<script type="text/javascript">
	$(function() {
		$("#alterPasswdForm").validate(
				{
					debug : true,
					errorElement : 'span',
					errorClass : 'validate-has-error',
					highlight : function(element) {
						$(element).closest('.form-group').addClass(
								'validate-has-error');
					},
					unhighlight : function(element) {
						$(element).closest('.form-group').removeClass(
								'validate-has-error');
					},
					errorPlacement : function(error, element) {
						if (element.closest('.has-switch').length) {
							error.insertAfter(element.closest('.has-switch'));
						} else if (element.parent('.checkbox, .radio').length
								|| element.parent('.input-group').length) {
							error.insertAfter(element.parent());
						} else {
							error.insertAfter(element);
						}
					},
					rules : {
						password : {
							required : true,
							remote : {
								url : "employeeverifyPassword",
								type : "post",
								dataType : "json",
								cache : false,
								async : false,
								data : {
									"employee.password" : function() {
										return $("[name=password]").val();
									}
								}
							}
						},
						"employee.password" : {
							required : true
						},
						test : {
							required : true,
							equalTo : "#newPasswd"
						}
					},
					messages : {
						password : {
							required : "请输入原密码",
							remote : "原密码验证失败"
						},
						"employee.password" : {
							required : "请输入新密码"
						},
						test : {
							required : "请再次输入新密码",
							equalTo : "两次密码必须一致"
						}
					}
				});
	});
	function alertPasswd() {
		if ($("#alterPasswdForm").valid()) {
			$.ajax({
				url : "employeealterPassword.action",
				type : "post",
				data : {
					"employee.password" : $("#newPasswd").val()
				},
				success : function(resp) {
					$("#alterPassword .modal-body").html(
							"<h4>" + (resp ? "修改成功" : "修改失败") + "</h4>");
					if(resp){
						$("#btnalter").hide();
						$("#btncancel").hide();
						$("#closex").hide();
						$("#btnsure").show();
					}else{
						$("#btnalter").hide();
						$("#btncancel").show();
						$("#btnsure").hide();
					}
					$("#alterPassword").modal("show");
				}
			});
		}
	}
</script>