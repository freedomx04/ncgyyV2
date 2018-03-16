<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>企业宣传</title>
	
	<style type="text/css">
	.enterprise-list {
		padding: 20px;
	}
	.enterprise-item {
		position: relative;
		padding: 20px;
		border-bottom: 1px solid #e7e7e7
	}
	.enterprise-name {
		font-size: 20px;
		margin-bottom: 15px;
	}
	.enterprise-item p {
		margin-bottom: 5px;
		color: #999;
	}
	.enterprise-classify {
		margin-right: 15px;
	}
	.enterprise-avatar {
		position: absolute;
		top: 30px;
		right: 20px;
		width: 160px;
		height: 160px;
	}
	</style>
</head>

<body class="gray-bg page-enterprise">

	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row enterprise-list"></div>
			<div class="enterprise-paginator">
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
		
		var $page = $('.page-enterprise');
		var paginatorSize = 10;
		
		loadEnterprise({
			page: 0,
			size: paginatorSize
		});
		
		function loadEnterprise(data) {
			$.ajax({
				url: '${ctx}/api/enterprise/listPaging',
				type: 'post',
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$page.find('.enterprise-list').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$page.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
							$.each(ret.data.content, function(key, enterprise) {
								var $obj = 
									'<div class="enterprise-item">'
									+	'<div class="enterprise-name">'
									+		'<a href="${ctx}/enterprise/get?eid=' + enterprise.id + '" target="_blank">' + enterprise.name + '</a>'
									+	'</div>'
									+	'<p><span class="enterprise-classify">所属园区</span><span>' + enterprise.area.name + '</span></p>'
									+	'<p><span class="enterprise-classify">行业类别</span><span>' + enterprise.industry.name + '</span></p>'
									+	'<p><span class="enterprise-classify">主要产品</span><span>' + (enterprise.mainProduct || '') + '</span></p>'
									+	'<p><span class="enterprise-classify">企业地址</span><span>' + (enterprise.address || '')+ '</span></p>'
									+	'<p><span class="enterprise-classify">联系电话</span><span>' + (enterprise.telephone || '')+ '</span></p>'
									+	'<img class="enterprise-avatar" src="${ctx}/api/avatar/' + enterprise.avatar + '">'
									+'</div>';
								$page.find('.enterprise-list').append($obj);
							});
							
							$k.util.paginator($page.find('.pagination'), {
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadEnterprise(data);
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