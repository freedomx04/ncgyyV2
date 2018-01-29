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
						<div class="list-service"></div>
						<div class="paginator-service">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-demand" class="tab-pane">
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
		var servicePage = 0;
		loadService(servicePage, paginatorSize);
		
		function loadService(servicePage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/information/service/listPaging',
				data: {
					page: servicePage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$service.find('.list-service').empty();
						$service.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, service) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/information/service/info?serviceId=' + service.id + '">' + service.title + '</a>'
									+ 		'</div>'
									+ 	'</div>'
									+ 	'<div class="col-sm-5">'
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
							currentPage: servicePage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadService(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
		var $demand = $('#tab-demand');
		var demandPage = 0;
		loadDemand(demandPage, paginatorSize);
		
		function loadDemand(demandPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/information/demand/listPaging',
				data: {
					page: demandPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$demand.find('.list-demand').empty();
						$demand.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, demand) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-12">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/information/demand/info?demandId=' + demand.id + '">' + demand.title + '</a>'
									+ 		'</div>'
									+ 	'</div>'
									+ '</div>'
									+ '<div class="item-time">更新时间：' + formatDate2(demand.updateTime) + '</div>';
							$demand.find('.list-demand').append($obj);
						});
						
						$k.util.paginator($demand.find('.pagination'), {
							currentPage: demandPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadDemand(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>