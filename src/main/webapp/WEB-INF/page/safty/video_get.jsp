<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${video.title}</title>
	
	<style type="text/css">
	#myplayer {
		margin: 0 auto;
	}
	</style>
</head>
<body class="gray-bg">
	
	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main animated fadeInDown">
		<div class="container white-bg">
			<div class="row">
				<div class="article-title">
					<h2>${video.title}</h2>
					<div class="article-remark">
						<span class="article-time">发布时间：<fmt:formatDate value="${video.updateTime}" pattern="yyyy-MM-dd hh:mm"/></span>
					</div>
				</div>
				
				<div class="article-content">
					<div id="myplayer"></div>
				
					<div style="margin-top: 20px;">${video.content}</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/jwplayer/jwplayer.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jwplayer/jwplayer.controls.js"></script>
	<script>jwplayer.key="1XjAHokrtWKykp8f4kSZSg4wQI0BgQlvblMGKA==";</script>  
	
	<script type="text/javascript">
	;(function( $ ) {
		
		jwplayer('myplayer').setup({
			flashplayer: './jwplayer/jwplayer.flash.swf',
			file: '${ctx}${video.videoPath}',
			width: '90%', 
			aspectratio: '16:9',
			image: '${ctx}${video.imagePath}'
		});
		
	}) ( jQuery );
	</script>
	
</body>
</html>