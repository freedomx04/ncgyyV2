<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

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
							<!-- <p style="color: #999;">这是您第113次登录，上次登录时间：2017-7-4 19:16:31，详细信息请查看日志，如果不是您本人登录，请及时修改密码。</p> -->
						</div>
						<div style="display: table-cell; vertical-align: middle; padding-left: 10px;">
							<a class="btn btn-outline btn-primary btn-sm btn-personal-info">个人资料</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-7">
				<div class="ibox float-e-margins">
					<div class="ibox-title"><h5>登录历史</h5></div>
					<div class="ibox-content">
						<table id="login-list-table" class="table-hm" data-mobile-responsive="true"></table>
					</div>
				</div>
			</div>
			
			<div class="col-sm-5">
				<div class="ibox float-e-margins">
					<div class="ibox-title"><h5>版本历史</h5></div>
					<div class="ibox-content">bbb</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-overview');
		
		$page.on('click', '.btn-personal-info', function() {
			window.location.href = "./personalInfo";
		});
		
		/* var $loginTable = $k.util.bsTable($page.find('#login-list-table'), {
			url: '${ctx}/api/login/list',
		}); */
		
	})( jQuery );
	</script>

</body>
</html>