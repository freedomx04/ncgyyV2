<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${news.title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-news-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<button type="button" class="btn btn-white btn-news-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>企业详情</button>
			</div>
			
			<div class="ibox-content">
				<div class="text-center"><h1>${news.title}</h1></div>
				
				<div style="padding: 10px 20px; color: #999;">
					<span style="padding-right: 15px;">${news.enterprise.name}</span>
 					<span><fmt:formatDate value="${news.updateTime}" pattern="yyyy-MM-dd HH-mm"/></span>
 				</div>
 				
 				<div style="padding: 20px;">${news.content}</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-news-detail');
		
		$page.on('click', '.btn-news-back', function() {
			window.location.href = './enterpriseGet?enterpriseId=${news.enterprise.id}';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>