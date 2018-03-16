<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">

<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
<link rel="stylesheet" type="text/css" href="${ctx}/local/index.css">

<style type="text/css">
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

/** filter */
.filter-search {
	padding-left: 20px;
	padding-right: 20px;
}
.filter-classify ul {
	position: relative;
	min-height: 36px;
	padding: 6px 0;
}
.filter-classify li {
	padding-left: 100px;
}
.filter-classify dt {
	position: absolute;
	left: 20px;
	padding-right: 10px;
	height: 36px;
	line-height: 36px;
}
.filter-classify dl {
	height: 32px;
	overflow: hidden;
	margin-bottom: 0;
	display: inline-block;
}
.filter-classify .select-all,
.filter-classify .select-item,
.filter-classify .select-no {
	float: left;
	padding: 0px 8px;
	margin: 2px;
	height: 32px;
	line-height: 32px;
}
.filter-classify .select-no {
	padding: 0;
}
.filter-classify .select-all.active,
.filter-classify .select-all:hover,
.filter-classify .select-item.active,
.filter-classify .select-item:hover {
	background-color: #00b38a;
	color: #fff;
}
.filter-classify .has-more dl {
	margin-right: 80px;
}
.filter-classify .btn-more {
	position: absolute;
	right: 10px;
	height: 32px;
	line-height: 32px;
	margin: 2px;
}
.filter-classify .select-result a {
	background: #3b8cff url("${ctx}/img/close.gif") no-repeat scroll right 13px;
	padding-right: 20px;
}
.filter-classify .select-result .btn {
	margin: 2px;
	width: 80px;
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
			<a href="${ctx}/service" class="navbar-brand">服务平台</a>
		</div>
		<nav id="bs-navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li>
					<a class="service-talent" href="${ctx}/service/talent">用工服务</a>
				</li>
				<li>
					<a class="service-information" href="${ctx}/service/information">信息化服务</a>
				</li>
				<li>
					<a class="serivice-financing" href="${ctx}/service/financing">融资服务</a>
				</li>
				<li>
					<a class="service-logistics" href="${ctx}/service/logistics">物流服务</a>
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
	case 'talent':		$ul.find('.service-talent').addClass('current');		break;
	case 'information':	$ul.find('.service-information').addClass('current');	break;
	case 'financing':	$ul.find('.service-financing').addClass('current');		break;
	case 'logistics':	$ul.find('.service-logistics').addClass('current');		break;
	}
	
	$('body')
	.on('click', '.select-all', function() {
		var $this = $(this);
		var $tab = $this.closest('.tab-pane');
		if ($this.hasClass('active')) {
			return;
		}
		$this.addClass('active');
		$this.siblings().removeClass('active');
		
		var classify = $this.data('classify');
		$tab.find('.select-result .select-item[data-classify="' + classify + '"]').remove();
	})
	.on('click', '.select-item', function() {
		var $this = $(this);
		var $tab = $this.closest('.tab-pane');
		if ($this.hasClass('active')) {
			return;
		}
		$this.closest('dl').find('.select-all').removeClass('active');
		$this.addClass('active');
		
		var $copy = $this.clone();
		$tab.find('.select-result dl .btn').before($copy);
	})
	.on('click', '.select-result .select-item', function() {
		var $this = $(this);
		var $tab = $this.closest('.tab-pane');
		var classify = $this.data('classify');
		var value = $this.data('value');
		$this.remove();
		
		if ($tab.find('.select-result .select-item[data-classify="' + classify + '"]').length == 0) {
			$tab.find('.select-all[data-classify="' + classify + '"]').addClass('active');
		}
		$tab.find('.select-item[data-value="' + value + '"]').removeClass('active');
	})
	.on('click', '.select-item, .select-all', function() {
		var $this = $(this);
		var $tab = $this.closest('.tab-pane');
		if ($tab.find('.select-result .select-item').length > 0) {
			$tab.find('.select-no').hide();
		} else {
			$tab.find('.select-no').show();
		}
	})
	.on('click', '.btn-more', function() {
		var $this = $(this);
		if ($this.hasClass('btn-collapse')) {
			$this.removeClass('btn-collapse').addClass('btn-expand');
			$this.find('.select-toggle-text').text('收起');
			$this.find('fa').removeClass('fa-angle-down').addClass('fa-angle-up');
			$this.closest('li').find('dl').css({'height': '100%', 'overflow': 'visible'});
		} else {
			$this.removeClass('btn-expand').addClass('btn-collapse');
			$this.find('.select-toggle-text').text('更多');
			$this.find('fa').removeClass('fa-angle-up').addClass('fa-angle-down');
			$this.closest('li').find('dl').css({'height': '32px', 'overflow': 'hidden'});
		}
	})
	.on('click', '.btn-top', function() {
		$('html, body').animate({scrollTop: 0}, 1000);
	});
	
})( jQuery );

function getFilterValue(classify) {
	var list = [];
	$('.select-result a[data-classify="' + classify + '"]').each(function(index, val) {
		list.push($(val).data('value'));
	});
	return list.join(',');
}

</script>
