<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>物流服务</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/city-picker/css/city-picker.css">
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/page/service/header.jsp"%>
	
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
						<div class="filter-line" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<form class="form-horizontal row">
								<div class="form-group col-sm-4">
		                            <label for="origin" class="col-sm-3 control-label">发货地</label>
		                            <div class="col-sm-9">
		                                <input type="text" class="form-control citypicker" name="origin">
		                            </div>
		                        </div>
							
								<div class="form-group col-sm-4">
									<label for="destination" class="col-sm-3 control-label">收货地</label>
									<div class="col-sm-9">
										<input type="text" class="form-control citypicker" name="destination">
									</div>
								</div>
								<div class="form-group col-sm-4">
									<button type="button" class="btn btn-primary btn-fw search-line" style="width: 80px; margin-left: 15px;">搜索</button>
									<button type="button" class="btn btn-white btn-fw clear-line" style="width: 80px;">清除</button>
								</div>
							</form>
						</div>
						<div class="list-line"></div>
						<div class="paginator-line">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-network" class="tab-pane">
						<div class="filter-network" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-network form-control" placeholder="搜索网点名称，地址">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary search-network">搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="list-network"></div>
						<div class="paginator-network">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-supply" class="tab-pane">
						<div class="filter-supply" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<form class="form-horizontal row">
								<div class="form-group col-sm-4">
		                            <label for="origin" class="col-sm-3 control-label">发货地</label>
		                            <div class="col-sm-9">
		                                <input type="text" class="form-control citypicker" name="origin">
		                            </div>
		                        </div>
							
								<div class="form-group col-sm-4">
									<label for="destination" class="col-sm-3 control-label">收货地</label>
									<div class="col-sm-9">
										<input type="text" class="form-control citypicker" name="destination">
									</div>
								</div>
								<div class="form-group col-sm-4">
									<button type="button" class="btn btn-primary search-supply" style="width: 80px; margin-left: 15px;">搜索</button>
									<button type="button" class="btn btn-white clear-supply" style="width: 80px;">清除</button>
								</div>
							</form>
						</div>
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
	
	<script type="text/javascript" src="${ctx}/plugins/city-picker/js/city-picker.data.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/city-picker/js/city-picker.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var paginatorSize = 10;
		
		var $line = $('#tab-line');
		loadLine('${ctx}/api/service/logistics/line/listPaging', {
			page: 0,
			size: paginatorSize
		});
		$line.find('.citypicker').citypicker();
		
		$line
		.on('click', '.search-line', function() {
			var origin = $line.find('input[name="origin"]').citypicker().val();
			var destination = $line.find('input[name="destination"]').citypicker().val();
			loadLine('${ctx}/api/service/logistics/line/search', {
				origin: origin,
				destination: destination,
				page: 0,
				size: paginatorSize
			});
		})
		.on('click', '.clear-line', function() {
			$line.find('.citypicker').citypicker('reset');
		});
		
		function loadLine(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$line.find('.list-line').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$line.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, line) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/logistics/line/info?lineId=' + line.id + '" target="_blank">' + line.origin + ' - ' + line.destination + '</a>'
										+ 		'</div>'
										+ 		'<span>运输方式：' + line.transportMode + '</span>'
										+ 		'<span>参考时效：' + line.aging + '</span>'
										+ 		'<span>重货单价：' + line.heavyPrice + ' 元/公斤</span>'
										+ 		'<span>轻货单价：' + line.lightPrice + ' 元/立方</span>'
										+ 		'<span>最低一票：' + line.lowest + ' 元</span>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5 hidden-xs">'
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
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadLine(url, data);
								}
							});
						} else {
							$line.find('.list-line').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$line.find('.pagination').empty();
							$line.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
		var $network = $('#tab-network');
		loadNetwork('${ctx}/api/service/logistics/network/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$network
		.on('click', '.search-network', function() {
			var searchStr = $network.find('.input-network').val();
			loadNetwork('${ctx}/api/service/logistics/network/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		})
		
		function loadNetwork(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$network.find('.list-network').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$network.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, network) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/logistics/network/info?networkId=' + network.id + '" target="_blank">' + network.name + '</a>'
										+ 		'</div>'
										+ 		'<span>网店地址：' + network.address + '</span>'
										+ 		'<span>联系电话：' + network.contact + '</span>'
										+ 		'<span>业务内容：' + network.business + '</span>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5 hidden-xs">'
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
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadNetwork(url, data);
								}
							}); 
						} else {
							$network.find('.list-network').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$network.find('.pagination').empty();
							$network.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
		var $supply = $('#tab-supply');
		loadSupply('${ctx}/api/service/logistics/supply/listPaging', {
			page: 0,
			size: paginatorSize
		});
		$supply.find('.citypicker').citypicker();
		
		$supply
		.on('click', '.search-supply', function() {
			var origin = $supply.find('input[name="origin"]').citypicker().val();
			var destination = $supply.find('input[name="destination"]').citypicker().val();
			loadSupply('${ctx}/api/service/logistics/supply/search', {
				origin: origin,
				destination: destination,
				page: 0,
				size: paginatorSize
			});
		})
		.on('click', '.clear-supply', function() {
			$supply.find('.citypicker').citypicker('reset');
		});
		
		function loadSupply(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$supply.find('.list-supply').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$supply.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, supply) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-12">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/logistics/supply/info?supplyId=' + supply.id + '" target="_blank">' + supply.origin + ' - ' + supply.destination + '</a>'
										+ 		'</div>'
										+ 		'<span>货源类型：' + supply.supplyType + '</span>'
										+ 		'<span>货源描述：' + supply.description + '岁</span>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(supply.updateTime) + '</div>';
								$supply.find('.list-supply').append($obj);
							});
							
							$k.util.paginator($supply.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadSupply(url, data);
								}
							});
						} else {
							$supply.find('.list-supply').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$supply.find('.pagination').empty();
							$supply.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>