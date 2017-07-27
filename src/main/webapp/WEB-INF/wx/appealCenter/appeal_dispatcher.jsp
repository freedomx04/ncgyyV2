<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求中心</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
</head>

<body class="wx-appeal-dispatcher">
	<div class="searchbar_wrap"></div>
	
	<div class="wx-appeal-list">
		<div class="weui_cells weui_cells_access" style="margin-top: 0;">
			<c:if test="${empty appealList}">
				<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
			</c:if>
			<c:forEach var="appeal" items="${appealList}">
				<c:if test="${appeal.status != 0}">
				<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
	                <div class="weui_cell_hd">
	                	<p style="font-size: 16px; margin-bottom: 8px;">${appeal.title}</p>
						<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
	                </div>
	                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
	                <div style="color: #999;">
	                	${appeal.appealType.name}
	                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02;" data-status="${appeal.status}"></span>
	                </div>
          			</a>
          			</c:if>
			</c:forEach>
		</div>
	</div>
	
	<div class="wx-appeal-search" style="display: none;">
		<div class="weui_cells weui_cells_access" style="margin-top: 0;"></div> 
	</div>
	
	<script type="text/javascript">
	$(function() {
		
		var $page = $('.wx-appeal-dispatcher');
		var userId = Url.queryString("userId");
		var $list = $page.find('.wx-appeal-list');
		var $search = $page.find('.wx-appeal-search');
		
		var page = -1;
		var size = 10;

		$.each($page.find(".weui-badge"), function(k, y) {
			var status = $page.find(".weui-badge").eq(k).data('status');
			$page.find(".weui-badge").eq(k).text($k.util.getAppealStatus(status));
		});
		
		$page
		.on('click', '.appeal-info', function() {
			var appealId = $(this).data('appealId');
			window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=dispatcher&userId=" + userId;;
		});
		
		$('.searchbar_wrap').searchBar({
			cancelText : "取消",
			searchText : '搜索',
			onfocus: function(value) {
			},
			onblur: function(value) {
			},
			oninput: function(value) {
			},
			onsubmit: function(value) {
				if (value == '') {
					return;
				}
				
				$search.find('.weui_cells_access').empty();
				$list.hide();
				$search.show();
				
				/* $.ajax({
					url: '${ctx}/enterprise/product/search',
					data: {
						input: value
					},
					success: function(ret) {
						if (ret.status == 0) {
							var productList = ret.data;
							if (productList.length > 0) {
								$.each(productList, function(key, product) {
									$('<a href="javascript:;" class="weui_cell product-info" data-product-id="' + product.id + '">'
										+ '<div class="weui_cell_hd weui-updown" style="position: relative; margin-right: 10px;">'
										+ '<img src="${icon}" data-src="${ctx}/' + product.imagePath + '" style="width: 80px; display: block;">'
										+ '</div>'
										+ '<div class="weui_cell_bd">'
										+ '<p>' + product.name + '</p>'
										+ '<p style="font-size: 13px; color: #999; margin-top: 10px;">' + product.enterprise.name + '</p>'
										+ '</div>'
										+ '</a>')
									.appendTo($search.find('.weui_cells_access'));
								});
								
							} else {
								$search.find('.weui_cells_access').html('<div class="weui-footer" style="padding: 10px;"><p>未找到内容</p></div>');
							}
						}
					},
					error: function(err) {}
				}); */
			},
			oncancel: function() {
				$search.hide();
                $list.show();
			},
			onclear: function() {
			}
		});
		
	});
	</script>
    
</body>
</html>