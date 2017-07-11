<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/template/top_footer.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
	<meta name="keywords" content="">
    <meta name="description" content="">
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
	
	<style>
	.dl-horizontal dt {
		line-height: 2em;
	}
	</style>
	
</head>
<body class="body-enterprise">
	<div class="header">
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="index">首页</a>&nbsp;&gt;&nbsp;
			<a href="index_product">产品宣传</a>&nbsp;&gt;&nbsp;
			<a href="javascript: voide(0);">${product.name}</a>
	    </span>
	</div>
	
	<div class="index-productinfo" style="margin-top: 30px;">
		<div class="panel panel-default">
	        <div class="panel-heading">
	          	${product.name}
	        </div>
	        <div class="panel-body" style="font-size: 14px;padding-bottom: 80px;">
				<div class="col-sm-9">
					<dl class="dl-horizontal">
						<dt>产品图片</dt><dd><img src="${ctx}/${product.imagePath}" style="max-width: 300px;padding: 20px;"></dd>
						<dt>产品名称</dt><dd>${product.name}</dd>
						<dt>产品规格参数</dt><dd>${product.specification}</dd>
						<dt>公司名称</dt><dd>${product.enterprise.name}</dd>
						<dt>产品介绍:</dt><dd>${enterprise.introduction}</dd>
					</dl>
				</div>

	        </div>
	
	    </div>
	</div>
	
	<div class="footer">
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery-doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $(".body-enterprise");
		$page.find(".header").html($(".template.Top").doT());
		$page.find(".footer").append($(".template.Footer").doT());
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_product").addClass("nav_curr");
		
	})();
	
	</script>
</body>
</html>