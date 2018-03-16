<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/local/index.css">

<style type="text/css">
.headed-bg {
	background: url("${ctx}/img/top.jpg") no-repeat top center;
	position: relative;
	height: 165px;
}
html {
	height: 100%;
}
body {
	position: relative;
	min-height: 100%;
	padding-bottom: 160px;
}

/** pagination */
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

/** tab */
.main .tabs-container {
	padding: 10px;
}
.main .tabs-container .nav-tabs>li>a {
	padding: 10px;
}
.main .tab-pane {
	padding: 10px;
	position: relative;
}
.main .tab-content .li-item {
	list-style: none;
	font-size: 16px;
	margin: 20px 100px 20px 10px;
}
.main .tab-content .index-time {
	position: absolute;
	right: 20px;
	color: #999;
}

/** article */
.article-title {
	border-bottom: 1px solid #d9d9d9;
	text-align: center;
}
.article-title h2 {
	font-size: 24px;
	padding: 30px 20px 10px;
	margin: 0;
}
.article-remark {
	color: #999;
	padding: 15px;
}
.article-time {
	margin-right: 20px;
}
.article-content {
	padding: 40px;
	font-size: 14px;
	font-family: '宋体';
	color: #070707;
	min-height: 400px;
}
.article-content img {
	max-width: 100%!important;
	height: auto;
}

/** mobile */
@media (max-width: 768px) {
	.article-content {
		padding: 20px;
	}
}
</style>

<div class="headed-bg hidden-xs"></div>
<header class="navbar navbar-static-top white-bg">
	<div class="container">
		<div class="navbar-header" style="width: auto;">
			<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar" aria-controls="bs-navbar" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
			</button>
			<a href="${ctx}/" class="navbar-brand" style="font-size: 16px;"><i class="fa fa-home fa-fw"></i>首页</a>
		</div>
		<nav id="bs-navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">新闻中心</a>
				</li>
				<li>
					<a class="index-enterprise" href="${ctx}/enterprise" target="_blank">企业宣传</a>
				</li>
				<li>
					<a class="index-product" href="${ctx}/product" target="_blank">产品宣传</a>
				</li>
				<li>
					<a class="index-safty" href="${ctx}/safty" target="_blank">安全生产</a>
				</li>
				<li>
					<a class="index-assist" href="${ctx}/assist" target="_blank">帮扶平台</a>
				</li>
				<li>
					<a class="index-business" href="${ctx}/business" target="_blank">招商管理</a>
				</li>
				<li>
					<a class="index-service" href="${ctx}/service" target="_blank">服务平台</a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="${ctx}/login" target="_blank">登录</a>
				</li>
				<li>
					<a href="${ctx}/register" target="_blank">注册</a>
				</li>
			</ul>
		</nav>
	</div>
</header>

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
<script type="text/javascript" src="${ctx}/local/common.js"></script>

<script type="text/javascript">
;(function( $ ) {	

	var type = window.location.pathname;
	type = type.substring(type.lastIndexOf('/') + 1);
	
	var $ul = $('.navbar-nav');
	switch (type) {
	case 'news':		$ul.find('.index-news').addClass('current');			break;
	case 'enterprise':	$ul.find('.index-enterprise').addClass('current');		break;
	case 'product':		$ul.find('.index-product').addClass('current');			break;
	}
	
})( jQuery );
</script>