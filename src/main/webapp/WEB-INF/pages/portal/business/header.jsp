<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">

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

/** corner */
.corner-buttons {
	position: fixed;
	width: 50px;
	right: 0;
	bottom: 30px;
	display: flex;
	flex-direction: column;
	z-index: 999;
}
.corner-container {
	width: 40px;
}
.corner-btn {
	margin-top: 10px;
	padding: 0px;
	color: #999;
	background: #fff;
	width: 40px;
	height: 40px;
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,.1);
	box-shadow: 0 1px 3px rgba(0,0,0,.1);
}
.corner-btn:HOVER,
.corner-btn:FOCUS {
	color: #999;
	background: #d5dbe7;
}
</style>

<header class="header white-bg">
	<div class="container header-info">
		<div class="logo pull-left">
			<h2><a href="${ctx}/business">招商管理</a></h2>
		</div>
		<div class="nav">
			<ul class="service-type">
				<li>
					<a class="business-dynamic" href="${ctx}/business/dynamic">招商动态</a>
				</li>
				<li>
					<a class="business-policy" href="${ctx}/business/policy">招商政策</a>
				</li>
				<li>
					<a class="business-item" href="${ctx}/business/item">招商项目</a>
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

<div class="corner-buttons">
	<div class="corner-container btn-top" data-toggle="tooltip" data-placement="left" data-container="body" title="回到顶部">
		<button type="button" class="btn corner-btn">
			<i class="fa fa-chevron-up fa-lg"></i>
		</button>
	</div>
</div>

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript" src="${ctx}/local/common.js"></script>


<script type="text/javascript">
;(function( $ ) {	
	
	var type = window.location.pathname;
	type = type.substring(type.lastIndexOf('/') + 1);
	
	var $ul = $('.service-type');
	
	switch (type) {
	case 'dynamic':		$ul.find('.business-dynamic').addClass('current');		break;
	case 'policy':		$ul.find('.business-policy').addClass('current');		break;
	case 'item':		$ul.find('.business-item').addClass('current');			break;
	}
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$('body')
	.on('click', '.btn-top', function() {
		$('html, body').animate({scrollTop: 0}, 1000);
	});
	
})( jQuery );
</script>
