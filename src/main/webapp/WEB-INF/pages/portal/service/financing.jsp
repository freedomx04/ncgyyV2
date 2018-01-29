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
						<div class="list-financing"></div>
						<div class="paginator-financing">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-invest" class="tab-pane">
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
		var financingPage = 0;
		loadFinancing(financingPage, paginatorSize);
		
		function loadFinancing(financingPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/financing/financing/listPaging',
				data: {
					page: financingPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$financing.find('.list-financing').empty();
						$financing.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, financing) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/financing/financing/info?financingId=' + financing.id + '">' + financing.title + '</a>'
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
							currentPage: financingPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadFinancing(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
		var $invest = $('#tab-invest');
		var investPage = 0;
		loadInvest(investPage, paginatorSize);
		
		function loadInvest(investPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/financing/invest/listPaging',
				data: {
					page: investPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$invest.find('.list-invest').empty();
						$invest.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, invest) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/financing/invest/info?investId=' + invest.id + '">' + invest.title + '</a>'
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
							currentPage: investPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadInvest(page - 1, paginatorSize);
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