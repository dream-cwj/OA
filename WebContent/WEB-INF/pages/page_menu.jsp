<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<div class="sidebar-menu-inner">

	<header class="logo-env">

		<!-- logo -->
		<div class="logo">
			<a href="#" class="logo-expanded"> <img
				src="assets/images/logo@2x.png" width="80" alt="" />
			</a> <a href="dashboard-1.html" class="logo-collapsed"> <img
				src="assets/images/logo-collapsed@2x.png" width="40" alt="" />
			</a>
		</div>

		<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
		<div class="mobile-menu-toggle visible-xs">

			<a href="#" data-toggle="mobile-menu"> <i class="fa-bars"></i>
			</a>

		</div>

	</header>

	<ul id="main-menu" class="main-menu">
		<!-- add class "multiple-expanded" to allow multiple submenus to open -->
		<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
		<li><a href="toindex.action"> <i class="fa fa-desktop"></i> <span
				class="title">我的桌面</span>
		</a></li>
		<li><a href="notelist.action"> <i class="fa fa-file-text-o"></i>
				<span class="title">我的便签</span>
		</a></li>
		<li><a href="annunciatelist.action"> <i
				class="fa fa-bullhorn"></i> <span class="title">通告管理</span>
		</a></li>
		<li><a href="javascript:void(0);"> <i class="fa fa-briefcase"></i>
				<span class="title">行政管理</span>
		</a>
			<ul>
				<li><a href="meetingroomlist.action"><span>会议室管理</span></a></li>
				<li><a href="javascript:void(0);"><span>会议室预约管理</span></a></li>
			</ul></li>
		<li><a href="javascript:void(0);"> <i class="fa fa-group"></i>
				<span class="title">人事管理</span>
		</a>
			<ul>
				<li class="has-sub"><a href="#"><span>请假管理</span></a>
					<ul>
						<li><a href="#"><span>申请请假</span></a></li>
						<li><a href="#"><span>查看请假</span></a></li>
					</ul></li>
				<li class="has-sub"><a href="#"><span>出差管理</span></a>
					<ul>
						<li><a href="#"><span>申请出差</span></a></li>
						<li><a href="#"><span>出差管理</span></a></li>
					</ul></li>
			</ul></li>
		<li><a href="javascript:void(0);"> <i class="fa fa-cogs"></i>
				<span class="title">系统管理</span>
		</a>
			<ul>
				<li><a href="#"><span>组织机构管理</span></a></li>
				<li><a href="#"><span>角色管理</span></a></li>
				<li><a href="#"><span>权限分配</span></a></li>
				<li class="has-sub"><a href="#"><span>用户管理</span></a>
					<ul>
						<li><a href="#"><span>添加用户</span></a></li>
						<li><a href="#"><span>用户信息列表</span></a></li>
					</ul></li>
				<li><a href="#"><span>查看操作日志</span></a></li>
				<li><a href="#"><span>字典管理</span></a></li>
			</ul></li>
	</ul>

</div>
