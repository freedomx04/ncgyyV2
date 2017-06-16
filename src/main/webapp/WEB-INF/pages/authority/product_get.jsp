<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>产品详情</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-product-detail dt,
	.body-product-detail dd {
		line-height: 2;
	}
	</style>
	
</head>

<body class="gray-bg body-product-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<button type="button" class="btn btn-white btn-product-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>企业详情</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${product.name}</span>
			</div>
			
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-8">
						<dl class="dl-horizontal">
							<dt>产品名称</dt><dd>${product.name}</dd>
							<dt>规格参数</dt><dd>${product.specification}</dd>
							<dt>产品介绍:</dt><dd>${product.introduction}</dd>
						</dl>
					</div>
					<div class="col-sm-4 text-right">
						<img src="${ctx}${product.imagePath}" style="max-width: 300px; padding: 20px;">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-product-detail');
		
		$page.on('click', '.btn-product-back', function() {
			window.location.href = './enterpriseGet?enterpriseId=${product.enterprise.id}';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>