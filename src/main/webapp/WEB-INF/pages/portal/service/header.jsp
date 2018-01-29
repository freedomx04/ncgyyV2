<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/local/service.css">

<style type="text/css">
ul {
	padding: 0;
	margin: 0;
}
.header .header-info .logo {
	width: 180px;
	padding: 15px 0;
	margin-right: 40px;
}
.header .header-info .nav{
	float: left;
}
.header .header-info .nav ul li {
	display: inline-block;
	font-size: 18px;
	line-height: 87px;
	margin: 0 10px;
}
ul .current {
	color: #e94e38;
}

.pagination-info {
	margin: 20px 15px;
	line-height: 29px;
}
.pagination>.active>a, 
.pagination>.active>a:focus, 
.pagination>.active>a:hover, 
.pagination>.active>span, 
.pagination>.active>span:focus, 
.pagination>.active>span:hover {
	background-color: #e94e38;
	border-color: #e94e38;
	color: #fff;
}
</style>

<header class="header white-bg">
	<div class="container header-info">
		<div class="logo pull-left">
			<a href="${ctx}/service/talent">
				<img src="${ctx}/img/service-logo.png">
			</a>
		</div>
		<div class="nav">
			<ul class="service-type">
				<li>
					<a class="service-talent" href="${ctx}/service/talent">用工服务</a>
				</li>
				<li>
					<a class="service-business" href="${ctx}/service/information">信息化服务</a>
				</li>
				<li>
					<a class="service-financing" href="${ctx}/service/financing">融资服务</a>
				</li>
				<li>
					<a class="service-logistics" href="${ctx}/service/logistics">物流服务</a>
				</li>
			</ul>
		</div>
		<div class="pull-right" style="padding: 30px 0;">
			<div>
				<a href="${ctx}/index">园区首页</a>
			</div>
		</div>
	</div>
</header>

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="${ctx}/local/common.js"></script>

<script type="text/javascript">
;(function( $ ) {	
	
	var type = window.location.pathname;
	type = type.substring(type.lastIndexOf('/') + 1);
	
	var $ul = $('.service-type');
	
	switch (type) {
	case 'talent':		$ul.find('.service-talent').addClass('current');		break;
	case 'information':	$ul.find('.service-information').addClass('current');	break;
	case 'financing':	$ul.find('.service-financing').addClass('current');		break;
	case 'logistics':	$ul.find('.service-logistics').addClass('current');		break;
	}
	
})( jQuery );
</script>
