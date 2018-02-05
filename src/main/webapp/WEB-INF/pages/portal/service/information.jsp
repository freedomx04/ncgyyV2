<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>信息化服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-service" aria-expanded="true">找服务</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-demand" aria-expanded="false">找需求</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-service" class="tab-pane active">
						<div class="filter-service" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-service form-control" placeholder="搜索服务">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-fw search-service">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="list-service"></div>
						<div class="paginator-service">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-demand" class="tab-pane">
						<div class="filter-demand" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-demand form-control" placeholder="搜索需求">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-fw search-demand">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="list-demand"></div>
						<div class="paginator-service">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var paginatorSize = 10;	
		
		var $service = $('#tab-service');
		loadService('${ctx}/api/service/information/service/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$service
		.on('click', '.search-service', function() {
			var searchStr = $service.find('.input-service').val();
			loadService('${ctx}/api/service/information/service/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		});
		
		function loadService(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$service.find('.list-service').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$service.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, service) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/information/service/info?serviceId=' + service.id + '" target="_blank">' + service.title + '</a>'
										+ 		'</div>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5 hidden-xs">'
										+ 		'<div class="item-title">' + service.supplier.name + '</div>'
										+ 		'<span>行业：' + service.supplier.profession + '</span>'
										+ 		'<span>性质：' + service.supplier.property + '</span>'
										+ 		'<span>规模：' + service.supplier.scale + '</span>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(service.updateTime) + '</div>';
								$service.find('.list-service').append($obj);
							});
							
							$k.util.paginator($service.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadService(url, data);
								}
							});
						} else {
							$service.find('.list-service').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$service.find('.pagination').empty();
							$service.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
		var $demand = $('#tab-demand');
		loadDemand('${ctx}/api/service/information/demand/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$demand
		.on('click', '.search-demand', function() {
			var searchStr = $demand.find('.input-demand').val();
			loadDemand('${ctx}/api/service/information/demand/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		});
		
		function loadDemand(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$demand.find('.list-demand').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$demand.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, demand) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-12">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/information/demand/info?demandId=' + demand.id + '" target="_blank">' + demand.title + '</a>'
										+ 		'</div>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(demand.updateTime) + '</div>';
								$demand.find('.list-demand').append($obj);
							});
							
							$k.util.paginator($demand.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadDemand(url, data);
								}
							});
						} else {
							$demand.find('.list-demand').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$demand.find('.pagination').empty();
							$demand.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>