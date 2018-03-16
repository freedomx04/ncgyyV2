<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>安全生产</title>
</head>

<body class="gray-bg page-safty">

	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-dynamic" data-tab="dynamic" aria-expanded="true">安全生产动态</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-video" data-tab="video" aria-expanded="false">安全生产视频</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-dynamic" class="tab-pane active">
							<div class="tab-list"></div>
							<div class="tab-paginator">
								<div class="pull-left pagination-info"></div>
								<div class="pull-right"><ul class="pagination"></ul></div>
							</div>
						</div>
						
						<div id="tab-video" class="tab-pane">
							<div class="tab-list"></div>
							<div class="tab-paginator">
								<div class="pull-left pagination-info"></div>
								<div class="pull-right"><ul class="pagination"></ul></div>
							</div>
						</div>
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
		
		var $page = $('.page-safty');
		var paginatorSize = 10;
		
		var tab = Url.queryString('tab');
		if (!tab) {
			tab = 'dynamic';
		}
		$page.find('a[data-tab="' + tab + '"]').tab('show');
		
		if (tab == 'dynamic') {
			loadDynamic({
				type: 20,
				page: 0,
				size: paginatorSize
			});
		} else if (tab == 'video') {
			loadVideo({
				page: 0,
				size: paginatorSize
			});
		}
		
		var $dynamic = $page.find('#tab-dynamic');
		function loadDynamic(data) {
			$.ajax({
				url: '${ctx}/api/website/article/listPaging',
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$dynamic.find('.tab-list').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$dynamic.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, dynamic) {
								var $obj = 
									'<li class="text-ellipsis li-item">'
									+ 	'<a href="${ctx}/safty/dynamic/get?dynamicid=' + dynamic.id + '" target="_blank">' + dynamic.title + '</a>'
									+ 	'<span class="index-time">' + formatDate5(dynamic.updateTime) +'</span>'
									+ '</li>';
								$dynamic.find('.tab-list').append($obj);
							});
							
							$k.util.paginator($dynamic.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadDynamic(data);
								}
							}); 
						} else {
							$dynamic.find('.tab-list').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$dynamic.find('.pagination').empty();
							$dynamic.find('.pagination-info').empty();
						}
					}
				},
				error: function(err) {}
			});
		}
		
		var $video = $page.find('#tab-video');
		function loadVideo(data) {
			$.ajax({
				url: '${ctx}/api/website/safty/video/listPaging',
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$video.find('.tab-list').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$video.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, video) {
								var $obj = 
									'<li class="text-ellipsis li-item">'
									+ 	'<a href="${ctx}/safty/video/get?videoid=' + video.id + '" target="_blank">' + video.title + '</a>'
									+ 	'<span class="index-time">' + formatDate5(video.updateTime) +'</span>'
									+ '</li>';
								$video.find('.tab-list').append($obj);
							});
							
							$k.util.paginator($video.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadVideo(data);
								}
							}); 
						} else {
							$video.find('.tab-list').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$video.find('.pagination').empty();
							$video.find('.pagination-info').empty();
						}
					}
				},
				error: function(err) {}
			});
		}
		
		$page
    	.on('click', 'a[data-toggle="tab"]', function() {
    		var tab = $(this).data('tab');
    		Url.updateSearchParam('tab', tab);
    		
    		if (tab == 'dynamic') {
    			loadDynamic({
    				type: 20,
    				page: 0,
    				size: paginatorSize
    			});
    		} else if (tab == 'video') {
    			loadVideo({
    				page: 0,
    				size: paginatorSize
    			});
    		}
    	});
		
	}) (jQuery);
	</script>
	
</body>
</html>