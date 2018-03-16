<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">

<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/local/index.css">

<style type="text/css">
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
.pagination>li>a, .pagination>li>span {
	color: #000;
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

<header class="navbar navbar-static-top white-bg">
	<div class="container">
		<div class="navbar-header" style="width: auto;">
			<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar" aria-controls="bs-navbar" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
			</button>
			<a href="${ctx}/business" class="navbar-brand">招商管理</a>
		</div>
		<nav id="bs-navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
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
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="${ctx}/index">园区首页</a>
				</li>
			</ul>
		</nav>
	</div>
</header>

<div class="corner-buttons hidden-xs">
	<div class="corner-container btn-top" title="回到顶部">
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
	
	var $ul = $('.navbar-nav');
	switch (type) {
	case 'dynamic':		$ul.find('.business-dynamic').addClass('current');		break;
	case 'policy':		$ul.find('.business-policy').addClass('current');		break;
	case 'item':		$ul.find('.business-item').addClass('current');			break;
	}
	
	$('body')
	.on('click', '.btn-top', function() {
		$('html, body').animate({scrollTop: 0}, 1000);
	});
	
})( jQuery );
</script>
