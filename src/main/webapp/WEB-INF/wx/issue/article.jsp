<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>新闻动态</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/updown.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<style type="text/css">
	.weui-weixin-content .hm-weixin-title {
		margin-bottom: 6px;
	}
    </style>
	
</head>

<body class="wx-article">
	<div class="weui_tab wx-article-tab">
		<div class="weui_tab_nav" style="padding: 10px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0" data-loaded="false" data-type="1">图片新闻</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1" data-loaded="false" data-type="2">公示公告</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="2" data-loaded="false" data-type="3">政策法规</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="3" data-loaded="false" data-type="4">工业信息</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item weui_tab_bd_item_active article_1">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
			
			<div class="weui_tab_bd_item article_2">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
			
			<div class="weui_tab_bd_item article_3">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
			
			<div class="weui_tab_bd_item article_4">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<div class="weui_cells_bd"></div>
				</div>
			</div>
		</div>	
	</div>
	
	<script type="text/javascript">
	$(function() {
		
		// 每个页面的分页独立
		var page = page1 = page2 = page3 = page4 = -1;
		// 分页大小
		var size = 10;
		
		var $page = $('.wx-article');
		
		// 根据index跳转的指定tab
		var defaultIndex = Url.queryString('index');
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.wx-article-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		// 根据index初始化页面
		var $item = $page.find('.weui_navbar_item[data-index="' + defaultIndex + '"]');
		var itemType = $item.data('type');
		initArticle($page.find('.article_' + itemType), itemType);
		$page.find('.weui_navbar_item[data-type="' + itemType + '"]').data('loaded', 'true');
		
		$page
		.on('click', '.article-info', function() {
			var articleId = $(this).data('articleId');
			window.location = '${ctx}/wx/article/get?articleId=' + articleId;
		})
		.on('click', '.weui_navbar_item', function() {
			var loaded = $(this).data('loaded');
			var type = $(this).data('type');
			
			if (!loaded) {
				var $article = $page.find('.article_' + type);
				// 初始化公告页面
				initArticle($article, type);
				// 加载过的不再重新加载
				$(this).data('loaded', 'true');
			}
			
			// 设置index,刷新页面时直接跳到该tab
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
		function initArticle($article, type) {
			$article.find('.weui_cells').dropload({
				scrollArea: window,
				autoLoad: true,
				domUp: { // 下拉
					domClass	: 	'dropload-up',
		            domRefresh  : 	'<div class="dropload-refresh"><i class="icon icon-114"></i>上拉加载更多</div>',
		            domUpdate   : 	'<div class="dropload-load f15"><i class="icon icon-20"></i>释放更新...</div>',
		            domLoad     : 	'<div class="dropload-load f15"><span class="weui-loading"></span>正在加载中...</div>'
				},
	 			domDown: { // 上拉
					domClass	:	'dropload-down',
					domRefresh	: 	'<div class="dropload-refresh f15"><i class="icon icon-20"></i>上拉加载更多</div>',
					domLoad    	: 	'<div class="dropload-load f15"><span class="weui-loading"></span>正在加载中...</div>',
		            domNoData  	: 	'<div class="dropload-noData">没有更多数据了</div>'
				}, 
	 			loadUpFn: function(me) { // 刷新
	 				var result = '';
	 			
					$.ajax({
						url: '${ctx}/api/article/listPaging',
						data: {
							type: type,
							page: 0,
							size: size
						},
						success: function(ret) {
							var articleList = ret.data.content;
							$.each(articleList, function(key, article) {
								var imgDiv = '';
								if (article.type == 1) {
									imgDiv = '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
										+ '<img src="${icon}" data-src="${ctx}' + article.imagePath + '" style="width: 80px; display: block;">'
										+ '</div>';
								}
								
								result += '<a href="javascript:;" class="weui_cell article-info" data-article-id="' + article.id + '">'
									+ imgDiv
									+ '<div class="weui_cell_bd">'
									+ '<p style="font-size: 16px; margin-bottom: 8px;">' + article.title + '</p>'
									+ '<p style="font-size: 13px; color: #999">' + new Date(article.updateTime).Format("yyyy-MM-dd") + '</p>'
									+ '</div>'
									+ '</a>'
							});
							$article.find('.weui_cells_bd').html(result);
							$k.util.lazyLoadImg('.weui-updown [data-src]');
							
							me.resetload();
							
							switch (type) {
							case 1:    page1 = 0;    break;
							case 2:    page2 = 0;	 break;
							case 3:	   page3 = 0;	 break;
							case 4:	   page4 = 0;	 break;
							}
							
							me.unlock();
							me.noData(false);
						},
						error: function(err) {
							$.alert('加载异常');
	                        me.resetload();
						}
					});
				}, 
				loadDownFn: function(me) { // 加载更多
					var result = '';
					
					switch (type) {
					case 1:		page1++;	page = page1;	break;
					case 2: 	page2++;	page = page2;	break;
					case 3:		page3++;	page = page3;	break;
					case 4:     page4++;	page = page4;	break;
					}
					
					$.ajax({
						url: '${ctx}/api/article/listPaging',
						data: {
							type: type,
							page: page,
							size: size
						},
						success: function(ret) {
							var articleList = ret.data.content;
							var arrLen = articleList.length;
							if (arrLen > 0) {
								$.each(articleList, function(key, article) {
									var imgDiv = '';
									if (article.type == 1) {
										imgDiv = '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
											+ '<img src="${icon}" data-src="${ctx}' + article.imagePath + '" style="width: 80px; display: block;">'
											+ '</div>';
									}
									
									result += '<a href="javascript:;" class="weui_cell article-info" data-article-id="' + article.id + '">'
										+ imgDiv
										+ '<div class="weui_cell_bd">'
										+ '<p style="font-size: 16px; margin-bottom: 8px;">' + article.title + '</p>'
										+ '<p style="font-size: 13px; color: #999">' + new Date(article.updateTime).Format("yyyy-MM-dd") + '</p>'
										+ '</div>'
										+ '</a>'
								});
							} else {
								me.lock();	// 锁定
								me.noData();// 无数据
							}
							
							$article.find('.weui_cells_bd').append(result);
							$k.util.lazyLoadImg('.weui-updown [data-src]');
							me.resetload();
						},
						error: function(err) {
							$.alert('加载异常');
	                        me.resetload();
						}
					});
				}
			});
		}
	});
	</script>
    
</body>
</html>