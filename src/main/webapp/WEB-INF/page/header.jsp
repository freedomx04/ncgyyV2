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
<script type="text/javascript" src="${ctx}/local/common.js"></script>

<script type="text/javascript">
;(function( $ ) {	

})( jQuery );
</script>