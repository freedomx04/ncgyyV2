<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>首页</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-overview">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div style="display: table-cell; vertical-align: middle; padding-right: 10px;">
							<img alt="image" class="img-circle" src="${ctx}/api/avatar/${user.avatar}" width="48" height="48">
						</div>
						<div style="display: table-cell; vertical-align: top; width: 10000px; padding-top: 10px;">
							<p style="font-size: 16px; font-weight: 500; margin-bottom: 5px;">欢迎您，${user.username} <small style="color: #999;">${user.role.name}</small></p>
							<p style="color: #999; margin-bottom: 0;">上次登录时间：<fmt:formatDate value="${latestLogin.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
						</div>
						<div style="display: table-cell; vertical-align: middle; padding-left: 10px;">
							<a href="javascript:;" class="btn btn-outline btn-primary btn-sm openPage" data-menu="${ctx}/personal/info">个人资料</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-7">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>登录历史</h5>
					</div>
					<div class="ibox-content">
						<span style="display: block; margin-bottom: 15px;">
							以下为您最近${fn:length(loginList)}次登录记录，若存在异常情况，请在核实后尽快
							<a href="javascript:;" class="openPage" data-menu="${ctx}/personal/password"> 修改密码</a>
						</span>
						<table class="table-hm table text-center" data-mobile-responsive="true" style="margin-bottom: 0;">
							<thead>
								<tr>
									<td>时间</td>
									<td>IP</td>
									<td>地点</td>
									<td>运营商</td>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="login" items="${loginList}">
								<tr>
									<td><fmt:formatDate value="${login.createTime}" pattern="yyyy/MM/dd HH:mm"/></td>
									<td>${login.ip}</td>
									<td>${login.location}</td>
									<td>${login.isp}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div style="margin-top: 15px;">
							<a href="javascript:;" class="openPage" data-menu="loginHistory">
								<i class="fa fa-plus-circle fa-fw"></i>全部登录历史
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-5">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>版本历史</h5>
					</div>
					<div class="ibox-content">
						<h2 style="display: inline-block;">Version ${version.code}</h2>
						<span style="float: right;">${version.releaseTime}</span>
						<div style="margin-top: 15px;">${version.content}</div>
						
						<div style="margin-top: 15px;">
							<a href="javascript:;" class="openPage" data-menu="versionHistory">
								<i class="fa fa-plus-circle fa-fw"></i>全部版本历史
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-overview');
		
		$page
		.on('click', '.openPage', function() {
			var menu = $(this).data('menu');
			window.parent.open(menu);
		});
		
	})( jQuery );
	</script>

</body>
</html>