<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</style>

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
<link rel="stylesheet" type="text/css" href="${ctx}/local/service.css">

<header class="header white-bg">
	<div class="container header-info">
		<div class="logo pull-left">
			<a href="#">
				<img src="${ctx}/img/service-logo.png">
			</a>
		</div>
		<div class="nav">
			<ul class="service-type">
				<li>
					<a class="service-talent" href="${ctx}/service/talent">人才服务</a>
				</li>
				<li>
					<a class="service-business" href="${ctx}/service/business">招商服务</a>
				</li>
				<li>
					<a class="service-financing" href="${ctx}/service/financing">融资服务</a>
				</li>
				<li>
					<a class="service-logistics" href="${ctx}/service/logistics">物流服务</a>
				</li>
			</ul>
		</div>
	</div>
</header>

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">
;(function( $ ) {	
	
	var type = window.location.pathname;
	type = type.substring(type.lastIndexOf('/') + 1);
	
	var $ul = $('.service-type');
	
	switch (type) {
	case 'talent':		$ul.find('.service-talent').addClass('current');		break;
	case 'business':	$ul.find('.service-business').addClass('current');		break;
	case 'financing':	$ul.find('.service-financing').addClass('current');		break;
	case 'logistics':	$ul.find('.service-logistics').addClass('current');		break;
	}
	
})( jQuery );
</script>
