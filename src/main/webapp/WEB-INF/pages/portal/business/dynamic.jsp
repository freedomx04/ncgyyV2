<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商动态</title>
</head>

<body class="gray-bg page-dynamic">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/business/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="list-dynamic"></div>
			<div class="paginator-dynamic">
				<div class="pull-left pagination-info"></div>
				<div class="pull-right"><ul class="pagination"></ul></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var paginatorSize = 10;	
		
		var $dynamic = $('.page-dynamic');
		loadDynamic('${ctx}/api/article/listPaging?type=10', {
			page: 0,
			size: paginatorSize
		});
		
		function loadDynamic(url, data) {
			$.ajax({
				url: url,
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$dynamic.find('.list-dynamic').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$dynamic.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, dynamic) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-12">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/business/dynamic/info?dynamicId=' + dynamic.id + '" target="_blank">' + dynamic.title + '</a>'
										+ 		'</div>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(dynamic.updateTime) + '</div>';
								$dynamic.find('.list-dynamic').append($obj);
							});
							
							$k.util.paginator($dynamic.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadDynamic(url, data);
								}
							});
						} else {
							$dynamic.find('.list-dynamic').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$dynamic.find('.pagination').empty();
							$dynamic.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>