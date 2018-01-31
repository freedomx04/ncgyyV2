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

.filter-search {
	padding-left: 20px;
	padding-right: 20px;
}
.filter-search input {
	height: 44px;
	line-height: 44px;
	font-size: 16px;
}
.filter-search button {
	padding: 10px 45px;
	font-size: 16px;
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
