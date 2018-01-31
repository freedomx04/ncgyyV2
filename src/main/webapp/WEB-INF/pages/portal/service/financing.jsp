<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>融资服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-financing" aria-expanded="true">找资金</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-invest" aria-expanded="false">找项目</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-financing" class="tab-pane active">
						<div class="filter-financing" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-financing form-control" placeholder="搜索">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary search-financing">搜索</button>
									</span>
								</div>
							</div>
							<div class="filter-classify" style="margin-top: 20px;">
								<ul class="list-unstyled has-more">
									<li>
										<dt>行业类别：</dt>
										<a class="btn-more btn-collapse">
											<span class="select-toggle-text">更多</span>
											<span class="fa fa-angle-down"></span>
										</a>
										<dl>
											<c:forEach var="profession" items="${professions}">
												<c:if test="${profession == '不限'}">
													<a class="select-all active" data-classify="profession">不限</a>
												</c:if>
												<c:if test="${profession != '不限'}">
													<a class="select-item" data-classify="profession" data-value="${profession}">${profession}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
								
									<li>
										<dt>融资类型：</dt>
										<dl>
											<c:forEach var="financingType" items="${financingTypes}">
												<c:if test="${financingType == '不限'}">
													<a class="select-all active" data-classify="financingType">不限</a>
												</c:if>
												<c:if test="${financingType != '不限'}">
													<a class="select-item" data-classify="financingType" data-value="${financingType}">${financingType}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li class="select-result">
										<dt>已选条件：</dt>
										<dl style="height: 100%;">
											<span class="select-no">暂时没有选择过滤条件</span>
											<button type="button" class="btn btn-danger btn-filter-financing">确定</button>
										</dl>
									</li>
								</ul>
							</div>
						</div>
						<div class="list-financing"></div>
						<div class="paginator-financing">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-invest" class="tab-pane">
						<div class="filter-invest" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-invest form-control" placeholder="搜索">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary search-invest">搜索</button>
									</span>
								</div>
							</div>
							<div class="filter-classify" style="margin-top: 20px;">
								<ul class="list-unstyled has-more">
									<li>
										<dt>投资行业：</dt>
										<a class="btn-more btn-collapse">
											<span class="select-toggle-text">更多</span>
											<span class="fa fa-angle-down"></span>
										</a>
										<dl>
											<c:forEach var="profession" items="${professions}">
												<c:if test="${profession == '不限'}">
													<a class="select-all active" data-classify="profession">不限</a>
												</c:if>
												<c:if test="${profession != '不限'}">
													<a class="select-item" data-classify="profession" data-value="${profession}">${profession}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
								
									<li>
										<dt>投资方式：</dt>
										<dl>
											<c:forEach var="investType" items="${investTypes}">
												<c:if test="${investType == '不限'}">
													<a class="select-all active" data-classify="investType">不限</a>
												</c:if>
												<c:if test="${investType != '不限'}">
													<a class="select-item" data-classify="investType" data-value="${investType}">${investType}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li>
										<dt>资金类型：</dt>
										<dl>
											<c:forEach var="fundType" items="${fundTypes}">
												<c:if test="${fundType == '不限'}">
													<a class="select-all active" data-classify="fundType">不限</a>
												</c:if>
												<c:if test="${fundType != '不限'}">
													<a class="select-item" data-classify="fundType" data-value="${fundType}">${fundType}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li class="select-result">
										<dt>已选条件：</dt>
										<dl style="height: 100%;">
											<span class="select-no">暂时没有选择过滤条件</span>
											<button type="button" class="btn btn-danger btn-filter-invest">确定</button>
										</dl>
									</li>
								</ul>
							</div>
						</div>
						<div class="list-invest"></div>
						<div class="paginator-invest">
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
		
		var $financing = $('#tab-financing');
		loadFinancing('${ctx}/api/service/financing/financing/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$financing
		.on('click', '.search-financing', function() {
			var searchStr = $financing.find('.input-financing').val();
			loadFinancing('${ctx}/api/service/financing/financing/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		})
		.on('click', '.btn-filter-financing', function() {
			var pr = getFilterValue('profession');
			var ft = getFilterValue('financingType');
			loadFinancing('${ctx}/api/service/financing/financing/filter', {
				profession: pr,
				financingType: ft,
				page: 0,
				size: paginatorSize
			});
		});
		
		function loadFinancing(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$financing.find('.list-financing').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$financing.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, financing) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/financing/financing/info?financingId=' + financing.id + '" target="_blank">' + financing.title + '</a>'
										+ 		'</div>'
										+ 		'<span>行业类别：' + financing.profession + '</span>'
										+ 		'<span>融资用途：' + financing.prupose + '</span>'
										+ 		'<span>融资金额：' + financing.amount + '</span>'
										+ 		'<span>融资类型：' + financing.financingType + '</span>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5">'
										+ 		'<div class="item-title">' + financing.supplier.name + '</div>'
										+ 		'<span>行业：' + financing.supplier.profession + '</span>'
										+ 		'<span>性质：' + financing.supplier.property + '</span>'
										+ 		'<span>规模：' + financing.supplier.scale + '</span>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(financing.updateTime) + '</div>';
								$financing.find('.list-financing').append($obj);
							});
							
							$k.util.paginator($financing.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadFinancing(url, data);
								}
							}); 
						} else {
							$financing.find('.list-financing').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$financing.find('.pagination').empty();
							$financing.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
		var $invest = $('#tab-invest');
		loadInvest('${ctx}/api/service/financing/invest/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$invest
		.on('click', '.search-invest', function() {
			var searchStr = $invest.find('.input-invest').val();
			loadInvest('${ctx}/api/service/financing/invest/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		})
		.on('click', '.btn-filter-invest', function() {
			var pr = getFilterValue('profession');
			var it = getFilterValue('investType');
			var ft = getFilterValue('fundType');
			
			loadInvest('${ctx}/api/service/financing/invest/filter', {
				profession: pr,
				investType: it,
				fundType: ft,
				page: 0,
				size: paginatorSize
			});
		});
		
		function loadInvest(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$invest.find('.list-invest').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$invest.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, invest) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/financing/invest/info?investId=' + invest.id + '" target="_blank">' + invest.title + '</a>'
										+ 		'</div>'
										+ 		'<span>投资方式：' + invest.investType + '</span>'
										+ 		'<span>资金类型：' + invest.fundType + '岁</span>'
										+ 		'<span>投资行业：' + invest.profession + '</span>'
										+ 		'<span>投资金额：' + invest.amount + '</span>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5">'
										+ 		'<div class="item-title">' + invest.supplier.name + '</div>'
										+ 		'<span>行业：' + invest.supplier.profession + '</span>'
										+ 		'<span>性质：' + invest.supplier.property + '</span>'
										+ 		'<span>规模：' + invest.supplier.scale + '</span>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(invest.updateTime) + '</div>';
								$invest.find('.list-invest').append($obj);
							});
							
							$k.util.paginator($invest.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadInvest(url, data);
								}
							}); 
						} else {
							$invest.find('.list-invest').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$invest.find('.pagination').empty();
							$invest.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>