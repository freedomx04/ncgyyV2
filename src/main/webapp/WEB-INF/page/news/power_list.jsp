<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>电力服务</title>
</head>

<body class="gray-bg page-power">

	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-policy" data-tab="policy" aria-expanded="true">用电政策</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-cut" data-tab="cut" aria-expanded="false">停电信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-info" data-tab="info" aria-expanded="false">线上服务</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-policy" class="tab-pane active">
							<div class="tab-list"></div>
							<div class="tab-paginator">
								<div class="pull-left pagination-info"></div>
								<div class="pull-right"><ul class="pagination"></ul></div>
							</div>
						</div>
						
						<div id="tab-cut" class="tab-pane">
							<div class="tab-list"></div>
							<div class="tab-paginator">
								<div class="pull-left pagination-info"></div>
								<div class="pull-right"><ul class="pagination"></ul></div>
							</div>
						</div>
						
						<div id="tab-info" class="tab-pane">
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
		
		var $page = $('.page-power');
		var paginatorSize = 10;
		
		var tab = Url.queryString('tab');
		if (!tab) {
			tab = 'policy';
		}
		$page.find('a[data-tab="' + tab + '"]').tab('show');
		var $tab = $('#tab-' + tab);
		loadNews($tab, {
			type: getType(tab),
			page: 0,
			size: paginatorSize
		});
		
		function loadNews($tab, data) {
			$.ajax({
				url: '${ctx}/api/website/article/listPaging',
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$tab.find('.tab-list').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$tab.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, news) {
								var $obj = 
									'<li class="text-ellipsis li-item">'
									+ 	'<a href="${ctx}/news/get?newsid=' + news.id + '" target="_blank">' + news.title + '</a>'
									+ 	'<span class="index-time">' + formatDate5(news.updateTime) +'</span>'
									+ '</li>';
								$tab.find('.tab-list').append($obj);
							});
							
							$k.util.paginator($tab.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadNews($tab, data);
								}
							}); 
						} else {
							$tab.find('.tab-list').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$tab.find('.pagination').empty();
							$tab.find('.pagination-info').empty();
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
    		
    		var $tab = $('#tab-' + tab);
    		loadNews($tab, {
    			type: getType(tab),
    			page: 0,
    			size: paginatorSize
    		});
    	});
		
		function getType(tab) {
			switch(tab) {
			case 'policy':		return 40;
			case 'cut':			return 41;
			case 'info':		return 42;
			}
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>