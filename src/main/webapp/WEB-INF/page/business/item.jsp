<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商项目</title>
</head>

<body class="gray-bg page-item">
	<!-- header -->
	<%@ include file="/WEB-INF/page/business/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="list-item"></div>
			<div class="paginator-item">
				<div class="pull-left pagination-info"></div>
				<div class="pull-right"><ul class="pagination"></ul></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var paginatorSize = 10;	
		
		var $item = $('.page-item');
		loadItem('${ctx}/api/website/business/item/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		function loadItem(url, data) {
			$.ajax({
				url: url,
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$item.find('.list-item').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$item.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, item) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-12">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/business/item/info?itemId=' + item.id + '" target="_blank">' + item.name + '</a>'
										+ 		'</div>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(item.updateTime) + '</div>';
								$item.find('.list-item').append($obj);
							});
							
							$k.util.paginator($item.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadItem(url, data);
								}
							});
						} else {
							$item.find('.list-item').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$item.find('.pagination').empty();
							$item.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>