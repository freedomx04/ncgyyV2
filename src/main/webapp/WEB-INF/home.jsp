<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	
	<title>南城工业  | 后台管理</title>
	<meta name="keywords" content="">
    <meta name="description" content="">

	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">

</head>

<body class="fixed-sidebar full-height-layout gray-bg body-home" style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" class="img-circle" src="${ctx}/api/avatar/${user.avatar}" width="64" height="64"/></span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear">
									<span class="block m-t-xs"><strong class="font-bold">${user.name}</strong></span>
									<span class="block text-muted text-xs">${user.role.name}<b class="caret"></b></span>
								</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="personalInfo">个人资料</a></li>
								<!-- <li><a class="J_menuItem" href="#">信箱</a></li> -->
								<li class="divider"></li>
								<li><a class="btn-logout" href="javascript:;">安全退出</a></li>
							</ul>
						</div>
					</li> 
					<li>
						<a class="J_menuItem" href="overview">
							<i class="fa fa-home fa-fw"></i><span class="nav-label">首页</span>
						</a>
					</li>
					<c:if test="${fn:contains(user.role.resource, 'authority-role')
						|| fn:contains(user.role.resource, 'authority-user')
						|| fn:contains(user.role.resource, 'authority-enterprise')
						|| fn:contains(user.role.resource, 'authority-department')}">
					<li>
						<a href="#">
							<i class="fa fa-cog fa-fw"></i><span class="nav-label">系统管理</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<c:if test="${fn:contains(user.role.resource, 'authority-role')}">
								<li><a class="J_menuItem" href="roleList">角色管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-user')}">
								<li><a class="J_menuItem" href="userList">用户管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-enterprise')}">
								<li><a class="J_menuItem" href="enterpriseList">企业管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-department')}">
								<li><a class="J_menuItem" href="department">部门管理</a></li>
							</c:if>
						</ul>
					</li>
					</c:if>
					<c:if test="${fn:contains(user.role.resource, 'authority-area')
						|| fn:contains(user.role.resource, 'authority-industry')
						|| fn:contains(user.role.resource, 'authority-appealType')}">
					<li>
						<a href="#">
							<i class="fa fa-calculator fa-fw"></i><span class="nav-label">基础数据</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<c:if test="${fn:contains(user.role.resource, 'authority-area')}">
								<li><a class="J_menuItem" href="area">园区管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-industry')}">
								<li><a class="J_menuItem" href="industry">行业管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-appealType')}">
								<li><a class="J_menuItem" href="appealType">诉求类别管理</a></li>
							</c:if>
						</ul>
					</li>
					</c:if>
					<c:if test="${fn:contains(user.role.resource, 'authority-target-report')
						|| fn:contains(user.role.resource, 'authority-target-enterprise')
						|| fn:contains(user.role.resource, 'authority-target-industry')
						|| fn:contains(user.role.resource, 'authority-target-area')
						|| fn:contains(user.role.resource, 'authority-target-point-enterprise')
						|| fn:contains(user.role.resource, 'authority-target-ep')}">
					<li>
						<a href="#">
							<i class="fa fa-bar-chart fa-fw"></i><span class="nav-label">监测平台</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<c:if test="${fn:contains(user.role.resource, 'authority-target-report')}">
								<li><a class="J_menuItem" href="targetReport">主要指标上报</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-target-enterprise')}">
								<li><a class="J_menuItem" href="targetEnterprise">企业主要指标</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-target-industry')}">
								<li><a class="J_menuItem" href="targetIndustry">行业主要指标</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-target-area')}">
								<li><a class="J_menuItem" href="targetArea">园区主要指标</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-target-point-enterprise')}">
								<li><a class="J_menuItem" href="targetPointEnterprise">重点企业主要指标</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-target-ep')}">
								<li><a class="J_menuItem" href="targetEP">主要指标(企业)</a></li>
							</c:if>
						</ul>
					</li>
					</c:if>
					<c:if test="${fn:contains(user.role.resource, 'authority-appeal-center') 
						|| fn:contains(user.role.resource, 'authority-appeal-enterprise')
						|| fn:contains(user.role.resource, 'authority-appeal-department') 
						|| fn:contains(user.role.resource, 'authority-appeal-dispatcher')}">
					<li>
						<a href="#">
							<i class="fa fa-hand-paper-o fa-fw"></i><span class="nav-label">帮扶平台</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<c:if test="${fn:contains(user.role.resource, 'authority-appeal-center')}">
								<li><a class="J_menuItem" href="appealList">诉求中心</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-appeal-enterprise')}">
								<li><a class="J_menuItem" href="appealEnterprise">诉求中心(企业)</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-appeal-department')}">
								<li><a class="J_menuItem" href="appealDepartment">诉求中心(部门)</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-appeal-dispatcher')}">
								<li><a class="J_menuItem" href="appealDispatcher">诉求中心(派单)</a></li>
							</c:if>
						</ul>
					</li>
					</c:if>
					<li>
						<a href="#">
							<i class="fa fa-building-o fa-fw"></i><span class="nav-label">服务平台</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="declareGV">网上申报</a></li>
							<li><a class="J_menuItem" href="declareEP">网上申报(企业)</a></li>
						</ul>
					</li>
					<c:if test="${fn:contains(user.role.resource, 'authority-photonews')
						|| fn:contains(user.role.resource, 'authority-announce')
						|| fn:contains(user.role.resource, 'authority-policy')
						|| fn:contains(user.role.resource, 'authority-overview')}">
					<li>
						<a href="#">
							<i class="fa fa-newspaper-o fa-fw"></i><span class="nav-label">新闻发布</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<c:if test="${fn:contains(user.role.resource, 'authority-photonews')}">
								<li><a class="J_menuItem" href="articleList?type=1">图片新闻</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-announce')}">
								<li><a class="J_menuItem" href="articleList?type=2">公示公告</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-policy')}">
								<li><a class="J_menuItem" href="articleList?type=3">政策法规</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-overview')}">
								<li><a class="J_menuItem" href="articleList?type=4">工业信息</a></li>
							</c:if>
						</ul>
					</li>
					</c:if>
					<li>
						<a href="#">
							<i class="fa fa-user fa-fw"></i><span class="nav-label">个人中心</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="personalInfo">个人资料</a></li>
							<c:if test="${not empty user.enterprise}">
								<li><a class="J_menuItem" href="enterpriseGet?source=personal&enterpriseId=${user.enterprise.id}">我的企业</a></li>
							</c:if>
						</ul>
					</li>					
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
                        <div style="padding: 16px; font-size: 18px; font-weight: 400;">南城县工业园区综合信息服务平台后台管理页面</div>
                    </div>
                    <!-- <ul class="nav navbar-top-links navbar-right">
                    	<li class="dropdown">
                    		<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    			 <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                    		</a>
                    		<ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/kakaxi.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/kakaxi.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="#">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                    	</li>
                    	
                    	<li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="#">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul> -->
				</nav>
			</div>
			
			<div class="row content-tabs">
				<!-- tab往左 -->
				<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward fa-fw"></i></button>
				<!-- tab列表 -->
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab" data-id="overview">首页</a>
					</div>
				</nav>
				<!-- tab往右 -->
				<button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward fa-fw"></i></button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
					<ul class="dropdown-menu dropdown-menu-right" role="menu">
						<li class="J_tabShowActive"><a>定位当前选项卡</a>
						</li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a>
						</li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a>
						</li>
					</ul>
				</div>
				 <a href="javascript:;" class="roll-nav roll-right J_tabExit btn-logout"><i class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			
			<!-- 主窗口 -->
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="overview" frameborder="0" data-id="overview" seamless></iframe>
			</div>
			
			<!-- footer -->
			<div class="footer">
				<div class="pull-left">南城县工业园区综合信息服务平台</div>
				<div class="pull-right">当前版本：v2.0.0</div>
			</div>
			
		</div>
		<!--右侧部分结束-->
		
	</div>

	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/metisMenu/metisMenu.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/layer/layer.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/hplus.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/contabs.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.session.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
	
		var $page = $('.body-home');
		
		$page
		.on('click', '.btn-logout', function() {
			$.ajax({
				url: '${ctx}/api/user/logout',
				success: function() {
					window.location.href = "./login";
				},
				error: function() {}
			});
		});
	
	})( jQuery );
	</script>
	
</body>

</html>