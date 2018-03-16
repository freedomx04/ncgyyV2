<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心</title>
	
	<style type="text/css">
	.main-appeal {
		padding: 20px;
		position: relative;
	}
	.main-appeal .appeal-list .li-item {
		list-style: none;
		font-size: 16px;
		margin: 20px 100px 20px 10px;
	}
	.main-appeal .index-time {
		position: absolute;
		right: 20px;
	}
	</style>
</head>

<body class="gray-bg page-appeal">

	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row">
				<div class="main-appeal">
					<div class="appeal-list"></div>
					<div class="appeal-paginator">
						<div class="pull-left pagination-info"></div>
						<div class="pull-right"><ul class="pagination"></ul></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.page-appeal');
		var paginatorSize = 10;
		
		load({
			page: 0,
			size: paginatorSize
		});
		
		function load(data) {
			$.ajax({
				url: '${ctx}/api/appeal/listPaging',
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$page.find('.appeal-list').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$page.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, appeal) {
								var status;
								switch (appeal.status) {
								case 0:		status = '待发送';		break;
								case 1:		status = '待派发';		break;
								case 2:		status = '待受理';		break;
								case 3:		status = '处理中';		break;
								case 4:		status = '待确认';		break;
								case 5:		status = '已确认';		break;
								case 6:		status = '已驳回';		break;
								}
								
								var $obj = 
									'<li class="text-ellipsis li-item">'
									+ 	'<a href="${ctx}/appeal/get?appealid=' + appeal.id + '" target="_blank">' + appeal.title + '</a>'
									+ 	'<span class="index-time">' + status +'</span>'
									+ '</li>';
								$page.find('.appeal-list').append($obj);
							});
							
							$k.util.paginator($page.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									load(data);
								}
							}); 
						} else {
							$page.find('.tab-list').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$page.find('.pagination').empty();
							$page.find('.pagination-info').empty();
						}
					}
				},
				error: function(err) {}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>