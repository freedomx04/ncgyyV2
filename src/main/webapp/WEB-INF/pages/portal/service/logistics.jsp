<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>物流服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-line" aria-expanded="true">查询线路</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-network" aria-expanded="false">查询网点</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-supply" aria-expanded="false">货源信息</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-line" class="tab-pane active">
						<div class="list-line"></div>
						<div class="paginator-line">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-network" class="tab-pane">
						<div class="list-network"></div>
						<div class="paginator-network">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-supply" class="tab-pane">
						<div class="list-supply"></div>
						<div class="paginator-supply">
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
		
		var $line = $('#tab-line');
		var linePage = 0;
		loadLine(linePage, paginatorSize);
		
		function loadLine(linePage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/logistics/line/listPaging',
				data: {
					page: linePage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$line.find('.list-line').empty();
						$line.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, line) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/logistics/line/info?lineId=' + line.id + '">' + line.origin + ' - ' + line.destination + '</a>'
									+ 		'</div>'
									+ 		'<span>运输方式：' + line.transportMode + '</span>'
									+ 		'<span>参考时效：' + line.aging + '</span>'
									+ 		'<span>重货单价：' + line.heavyPrice + ' 元/公斤</span>'
									+ 		'<span>轻货单价：' + line.lightPrice + ' 元/立方</span>'
									+ 		'<span>最低一票：' + line.lowest + ' 元</span>'
									+ 	'</div>'
									+ 	'<div class="col-sm-5">'
									+ 		'<div class="item-title">' + line.supplier.name + '</div>'
									+ 		'<span>行业：' + line.supplier.profession + '</span>'
									+ 		'<span>性质：' + line.supplier.property + '</span>'
									+ 		'<span>规模：' + line.supplier.scale + '</span>'
									+ 	'</div>'
									+ '</div>'
									+ '<div class="item-time">更新时间：' + formatDate2(line.updateTime) + '</div>';
							$line.find('.list-line').append($obj);
						});
						
						$k.util.paginator($line.find('.pagination'), {
							currentPage: linePage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadLine(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
		var $network = $('#tab-network');
		var networkPage = 0;
		loadNetwork(networkPage, paginatorSize);
		
		function loadNetwork(networkPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/logistics/network/listPaging',
				data: {
					page: networkPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$network.find('.list-network').empty();
						$network.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, network) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/logistics/network/info?networkId=' + network.id + '">' + network.name + '</a>'
									+ 		'</div>'
									+ 		'<span>网店地址：' + network.address + '</span>'
									+ 		'<span>联系电话：' + network.contact + '</span>'
									+ 		'<span>业务内容：' + network.business + '</span>'
									+ 	'</div>'
									+ 	'<div class="col-sm-5">'
									+ 		'<div class="item-title">' + network.supplier.name + '</div>'
									+ 		'<span>行业：' + network.supplier.profession + '</span>'
									+ 		'<span>性质：' + network.supplier.property + '</span>'
									+ 		'<span>规模：' + network.supplier.scale + '</span>'
									+ 	'</div>'
									+ '</div>'
									+ '<div class="item-time">更新时间：' + formatDate2(network.updateTime) + '</div>';
							$network.find('.list-network').append($obj);
						});
						
						$k.util.paginator($network.find('.pagination'), {
							currentPage: networkPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadNetwork(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
		var $supply = $('#tab-supply');
		var supplyPage = 0;
		loadSupply(supplyPage, paginatorSize);
		
		function loadSupply(supplyPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/logistics/supply/listPaging',
				data: {
					page: supplyPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$supply.find('.list-supply').empty();
						$supply.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, supply) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-12">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/logistics/supply/info?supplyId=' + supply.id + '">' + supply.origin + ' - ' + supply.destination + '</a>'
									+ 		'</div>'
									+ 		'<span>货源类型：' + supply.supplyType + '</span>'
									+ 		'<span>货源描述：' + supply.description + '岁</span>'
									+ 	'</div>'
									+ '</div>'
									+ '<div class="item-time">更新时间：' + formatDate2(supply.updateTime) + '</div>';
							$supply.find('.list-supply').append($obj);
						});
						
						$k.util.paginator($supply.find('.pagination'), {
							currentPage: supplyPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadSupply(page - 1, paginatorSize);
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