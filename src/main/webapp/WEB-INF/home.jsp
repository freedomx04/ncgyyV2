<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/feedback.jsp"%>

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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

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
							<span><img alt="image" class="user-avatar img-circle" src="${ctx}/api/avatar/${user.avatar}" width="64" height="64"/></span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear">
									<span class="block m-t-xs"><strong class="font-bold user-name">${user.name}</strong></span>
									<span class="block text-muted text-xs">${user.role.name}<b class="caret"></b></span>
								</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="personalInfo">个人资料</a></li>
								<li><a class="J_menuItem" href="modifyPassword">修改密码</a></li>
								<li><a class="J_menuItem" href="mailList">邮箱</a></li>
								<li class="divider"></li>
								<li><a class="btn-logout" href="javascript:;">退出</a></li>
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
						|| fn:contains(user.role.resource, 'authority-department')
						|| fn:contains(user.role.resource, 'authority-supplier')
						|| fn:contains(user.role.resource, 'authority-feedback')
						|| fn:contains(user.role.resource, 'authority-version')
						|| fn:contains(user.role.resource, 'authority-website')
						|| fn:contains(user.role.resource, 'authority-business')}">
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
							<c:if test="${fn:contains(user.role.resource, 'authority-supplier')}">
								<li><a class="J_menuItem" href="supplierList">供应商管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-feedback')}">
								<li><a class="J_menuItem" href="feedbackList">反馈管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-version')}">
								<li><a class="J_menuItem" href="versionList">版本管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-website')}">
								<li><a class="J_menuItem" href="${ctx}/authority/website">网站管理</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-business')}">
								<li><a class="J_menuItem" href="${ctx}/authority/business">招商管理</a></li>
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
					
					<c:if test="${fn:contains(user.role.resource, 'authority-declare')
						|| fn:contains(user.role.resource, 'authority-apply')}">
					<li>
						<a href="#">
							<i class="fa fa-building-o fa-fw"></i><span class="nav-label">服务平台</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="platformTalent">用工平台</a></li>
							<li><a class="J_menuItem" href="platformInformation">信息化平台</a></li>
							<li><a class="J_menuItem" href="platformFinancing">融资平台</a></li>
							<li><a class="J_menuItem" href="platformLogistics">物流平台</a></li>
							<c:if test="${fn:contains(user.role.resource, 'authority-declare')}">
								<li><a class="J_menuItem" href="declareGV">网上申报</a></li>
							</c:if>
							<c:if test="${fn:contains(user.role.resource, 'authority-apply')}">
								<li><a class="J_menuItem" href="declareEP">网上申报(企业)</a></li>
							</c:if>
						</ul>
					</li>
					</c:if>
					<li>
						<a href="#">
							<i class="fa fa-tasks fa-fw"></i><span class="nav-label">日常办公</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="mailList">邮箱</a></li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-user fa-fw"></i><span class="nav-label">个人中心</span><span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="personalInfo">个人资料</a></li>
							<li><a class="J_menuItem" href="modifyPassword">修改密码</a></li>
							<li><a class="J_menuItem" href="personalEnterprise">我的企业</a></li>
							<li><a class="J_menuItem" href="loginHistory">登录历史</a></li>
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
                    <ul class="nav navbar-top-links navbar-right">
                    	<li><a href="index" target="_blank"><i class="fa fa-home fa-fw"></i>平台首页</a></li>
                    	<li class="dropdown">
                    		<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    			<i class="fa fa-envelope"></i>未读邮件
                    			<span class="label label-warning mail-unread-count"></span>
                    		</a>
                    		<ul class="dropdown-menu dropdown-messages">
                    			<li class="btn-mail-list">
	                    			<div class="text-center link-block">
	                    				<a class="J_menuItem" href="mailList">
	                    					<i class="fa fa-envelope fa-fw"></i> <strong>邮箱</strong>
	                    				</a>
	                    			</div>
	                    		</li>
                    		</ul>
                    	</li>
                    </ul>
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
				 <a href="javascript:;" class="roll-nav roll-right J_tabExit btn-logout"><i class="fa fa-sign-out fa-fw"></i>退出</a>
			</div>
			
			<!-- 主窗口 -->
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="overview" frameborder="0" data-id="overview" seamless></iframe>
			</div>
			
			<!-- footer -->
			<div class="footer">
				<div class="pull-left">南城县工业园区综合信息服务平台</div>
				<div class="pull-right">当前版本：${versionCode}
					<a class="J_menuItem" href="versionHistory" style="padding-left: 10px;"><i class="fa fa-history fa-fw"></i>版本历史</a>
					<span>|</span>
					<a class="btn-feedback"><i class="fa fa-pencil fa-fw"></i>意见反馈</a>
				</div>
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
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	
	var $page = $('.body-home');
	var userId = '${user.id}';
	var $feedbackDialog = $page.find('#modal-feedback-dialog');
	
	mailRefresh();
	
	$page
	.on('click', '.btn-logout', function() {
		$.ajax({
			url: '${ctx}/api/user/logout',
			success: function() {
				window.location.href = "${ctx}/login";
			},
			error: function() {}
		});
	})
	.on('click', '.btn-feedback', function() {
		$feedbackDialog.modal('show');
	})
	.on('click', '.btn-feedback-submit', function() {
		var content = $feedbackDialog.find('.textarea-feedback').val();
		if (!content) {
			$feedbackDialog.find('.textarea-feedback').css('border', '1px solid #f75659');
			return;
		} else {
			$feedbackDialog.find('.textarea-feedback').css('border', '1px solid #e5e6e7');
			$.ajax({
				url: '${ctx}/api/authority/feedback/create',
				type: 'post',
				data: {
					userId: userId,
					content: content
				},
				success: function(ret) {
					if (ret.code == 0) {
						$feedbackDialog.modal('hide');
						toastr['info']('提交成功！ 谢谢您的建议反馈');
					}
				},
				error: function(err) {}
			});
		}
	})
	.on('hidden.bs.modal', '#modal-feedback-dialog', function() {
		$feedbackDialog.find('.textarea-feedback').val('');
    });
	
	/** iframe页面打开其他嵌套页面 */
	function open(menu) {
		$page.find('a[href="' + menu + '"]').trigger('click');
	}
	
	function userRefresh() {
		$.ajax({
			url: '${ctx}/api/user/get',
			data: {
				userId: userId
			},
			success: function(ret) {
				if (ret.code == 0) {
					var user = ret.data;
					$page.find('.user-avatar').attr('src', '${ctx}/api/avatar/' + user.avatar);
					$page.find('.user-name').html(user.name);
				}
			},
			error: function(err) {}
		});
	}
	
	function mailRefresh() {
		$page.find('.mail-clear').remove();
		
		$.ajax({
			url: '${ctx}/api/mail/inboxUnread',
			data: {
				userId: userId
			},
			success: function(ret) {
				var mailList = ret.data;
				// set unread count
				mailList.length > 0 ? $page.find('.mail-unread-count').html(mailList.length) : $page.find('.mail-unread-count').html('');
				
				var $btnMail = $page.find('.btn-mail-list');
				$.each(mailList, function(k, mail) {
					var $li = '<li class="m-t-xs mail-clear">'
							+ '    <div class="dropdown-messages-box">'
							+ '        <span class="pull-left" style="padding: 3px 15px;">'
							+ '			   <img alt="avatar" class="img-circle" src="${ctx}/api/avatar/' + mail.sender.avatar + '">'
							+ '		   </span>'
							+ '		   <div class="media-body">'
							+ '		       <strong>' + mail.sender.username + '(' + mail.sender.name + ')'+ '</strong><br>'
							+ '			   <span>' + mail.title + '</span><br>'
							+ '			   <smail class="text-muted">' + formatDate3(mail.sendTime) + '</smail>'
							+ '		   </div>'
							+ '	   </div>'
							+ '</li>'
							+ '<li class="divider mail-clear"></li>';
					$btnMail.before($li);
				});
			},
			error: function(err) {}
		}); 
	}
	
	</script>
	
</body>
</html>