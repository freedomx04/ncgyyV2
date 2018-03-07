<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${article.title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	#myplayer {
		margin: 0 auto;
	}
	</style>
</head>

<body class="gray-bg body-video height-full">
	<div class="wrapper wrapper-content animated fadeInRight height-full">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-video-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>安全生产管理</button>
	 		</div>
	 		
	 		<div class="ibox-content">
	 			<div class="text-center"><h1>${video.title}</h1></div>
	 			
	 			<div style="padding: 10px 20px; color: #999; text-align: center;">
 					<span>时间：<fmt:formatDate value="${video.updateTime}" pattern="yyyy-MM-dd HH:mm"/></span>
 				</div>
	 			
	 			<div id="myplayer"></div>
	 			
	 			<c:if test="${not empty video.content}">
	 				<div class="hr-line-dashed"></div>
	 				<div style="padding-left: 20px;">简介: ${video.content}</div>
	 			</c:if>
	 		</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script> 
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jwplayer/jwplayer.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jwplayer/jwplayer.controls.js"></script>
	<script>jwplayer.key="1XjAHokrtWKykp8f4kSZSg4wQI0BgQlvblMGKA==";</script>  

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-video');
		
		jwplayer('myplayer').setup({
			flashplayer: './jwplayer/jwplayer.flash.swf',
			file: '${ctx}${video.videoPath}',
			width: '80%', 
			aspectratio: '16:9',
			image: '${ctx}${video.imagePath}'
		});
		
		$page.on('click', '.btn-video-back', function() {
			window.history.back();
		});
		
	}) ( jQuery );
	</script>

</body>
</html>