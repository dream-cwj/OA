<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!-- User Info, Notifications and Menu Bar -->
<nav class="navbar user-info-navbar" role="navigation">

	<!-- Left links for user info navbar -->
	<ul class="user-info-menu left-links list-inline list-unstyled">

		<li class="hidden-sm hidden-xs"><a href="#" data-toggle="sidebar">
				<i class="fa-bars"></i>
		</a></li>

	</ul>


	<!-- Right links for user info navbar -->
	<ul class="user-info-menu right-links list-inline list-unstyled">

		<li class="search-form">
			<!-- You can add "always-visible" to show make the search input visible -->

			<form method="get" action="">
				<input type="text" name="s" class="form-control search-field"
					placeholder="请输入搜索内容" />

				<button type="submit" class="btn btn-link">
					<i class="linecons-search"></i>
				</button>
			</form>

		</li>

		<li class="dropdown user-profile"><a href="javascript:void(0);"
			data-toggle="dropdown"> <img src="assets/images/user-4.png"
				alt="user-image" class="img-circle img-inline userpic-32" width="28" />
				<span><s:property value="#session.user.name" /> <i
					class="fa-angle-down"></i> </span>
		</a>

			<ul class="dropdown-menu user-profile-menu list-unstyled">
				<li><a href="javascript:void(0);" onclick="$('#alterPassword').modal('show');"> <i class="fa fa-edit"></i> <span>修改密码</span>
				</a></li>
				<li class="last"><a href="javascript:void(0);" onclick="$('#logout').modal('show');"> <i
						class="fa fa-lock"></i> <span>退出</span>
				</a></li>
			</ul></li>

	</ul>

</nav>