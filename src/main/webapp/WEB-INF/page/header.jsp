<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/feedback.jsp"%>

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
.main .li-item {
	list-style: none;
	font-size: 16px;
	margin: 20px 100px 20px 10px;
}
.main .index-time {
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
@media (max-width: 768px) {
	.article-content {
		padding: 20px;
	}
}

/** product */
.product-list {
	padding: 20px;
}
.product-item {
	border: 1px solid #eee;
	margin-bottom: 20px;
}
.product-item:HOVER {
	border: 1px solid #f40;
}
.product-image {
	width: 100%;
	height: 200px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}
.product-image img {
	width: 100%;
	max-height: 100%;
}
.product-info {
	border-top: 1px solid #eee;
	padding: 15px;
}
.product-info .product-name {
	margin-bottom: 10px;
}
.product-info .product-enterprise a {
	color: #999;
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
					<a class="index-appeal" href="${ctx}/appeal" target="_blank">帮扶平台</a>
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

<div class="corner-buttons">
	<div class="corner-container btn-top hide" title="回到顶部">
		<button type="button" class="btn corner-btn">
			<i class="fa fa-chevron-up fa-lg"></i>
		</button>
	</div>
	
	<div class="corner-container btn-feedback" title="意见反馈">
		<button type="button" class="btn corner-btn">
			<i class="fa fa-pencil fa-lg"></i>
		</button>
	</div>
</div>

<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/bootstrap-paginator/bootstrap-paginator.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
<script type="text/javascript" src="${ctx}/local/common.js"></script>

<script type="text/javascript">
;(function( $ ) {	

	var $feedbackDialog = $('body').find('#modal-feedback-dialog');
	
	var type = window.location.pathname;
	type = type.substring(type.lastIndexOf('/') + 1);
	
	var $ul = $('.navbar-nav');
	switch (type) {
	case 'news':		$ul.find('.index-news').addClass('current');			break;
	case 'enterprise':	$ul.find('.index-enterprise').addClass('current');		break;
	case 'product':		$ul.find('.index-product').addClass('current');			break;
	case 'safty':		$ul.find('.index-safty').addClass('current');			break;
	case 'appeal':		$ul.find('.index-appeal').addClass('current');			break;
	}
	
	$('body')
	.on('click', '.btn-top', function() {
		$('html, body').animate({scrollTop: 0}, 1000);
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
				url: '${ctx}/api/website/feedback/create',
				type: 'post',
				data: {
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
	
	// 回到顶部按钮
	var $top = $('body').find('.btn-top');
	$(window).scroll(function() {
		if ($(window).scrollTop() > 600) {
			$top.removeClass('hide');
		} else {
			$top.addClass('hide');
		}
	});
	
})( jQuery );
</script>