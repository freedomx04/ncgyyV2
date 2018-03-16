<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>产品宣传</title>
	
	<style type="text/css">
	.product-list {
		padding: 20px;
	}
	.product-item {
		border: 1px solid #eee;
		margin-bottom: 20px;
	}
	.product-item:HOVER {
		border: 1px solid #f40;
	}
	.product-image {
		width: 100%;
		height: 200px;
		display: table-cell;
		text-align: center;
		vertical-align: middle;
	}
	.product-image img {
		width: 100%;
		max-height: 100%;
	}
	.product-info {
		border-top: 1px solid #eee;
		padding: 15px;
	}
	.product-info .product-name {
		margin-bottom: 10px;
	}
	.product-info .product-enterprise a {
		color: #999;
	}
	</style>
</head>

<body class="gray-bg page-product">

	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row product-list"></div>
			<div class="product-paginator">
				<div class="pull-left pagination-info"></div>
				<div class="pull-right"><ul class="pagination"></ul></div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.page-product');
		var paginatorSize = 20;
		
		loadProduct({
			page: 0,
			size: paginatorSize
		});
		
		function loadProduct(data) {
			$.ajax({
				url: '${ctx}/api/product/listPaging',
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$page.find('.product-list').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$page.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, product) {
								var $obj = 
									'<div class="col-sm-3">'
									+ '<div class="product-item">'
									+ 	'<div class="product-image">'
									+		'<a href="${ctx}/product/get?productid=' + product.id + '" target="_blank"><img src="${ctx}' + product.imagePath + '"></a>'
									+ 	'</div>'
									+ 	'<div class="product-info">'
									+ 		'<div class="product-name text-ellipsis">'
									+			'<a href="${ctx}/product/get?productid=' + product.id + '" target="_blank">' + product.name + '</a>'
									+		'</div>'
									+		'<div class="product-enterprise text-ellipsis">'
									+			'<a href="">' + product.enterprise.name + '</a>'
									+		'</div>'
									+ 	'</div>'
									+ '</div>'
									+'</div>';
								$page.find('.product-list').append($obj);
							});
							
							$k.util.paginator($page.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadProduct(data);
								}
							}); 
						} else {
							$page.find('.product-list').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
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