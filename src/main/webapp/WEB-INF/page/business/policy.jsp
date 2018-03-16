<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商政策</title>
</head>

<body class="gray-bg page-policy">
	<!-- header -->
	<%@ include file="/WEB-INF/page/business/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="list-policy"></div>
			<div class="paginator-policy">
				<div class="pull-left pagination-info"></div>
				<div class="pull-right"><ul class="pagination"></ul></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var paginatorSize = 10;	
		
		var $policy = $('.page-policy');
		loadPolicy('${ctx}/api/website/article/listPaging', {
			type: 11,
			page: 0,
			size: paginatorSize
		});
		
		function loadPolicy(url, data) {
			$.ajax({
				url: url,
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$policy.find('.list-policy').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$policy.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, policy) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-12">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/business/policy/info?policyId=' + policy.id + '" target="_blank">' + policy.title + '</a>'
										+ 		'</div>'
										+ 	'</div>'
										+ '</div>'
										+ '<div class="item-time">更新时间：' + formatDate2(policy.updateTime) + '</div>';
								$policy.find('.list-policy').append($obj);
							});
							
							$k.util.paginator($policy.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadPolicy(url, data);
								}
							});
						} else {
							$policy.find('.list-policy').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$policy.find('.pagination').empty();
							$policy.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>