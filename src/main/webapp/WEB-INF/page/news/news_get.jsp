<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${news.title}</title>
</head>
<body class="gray-bg">
	
	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row">
				<div class="article-title">
					<h2>${news.title}</h2>
					<div class="article-remark">
						<span class="article-time">发布时间：<fmt:formatDate value="${news.updateTime}" pattern="yyyy-MM-dd hh:mm"/></span>
						<span>来源：${news.source}</span>
					</div>
				</div>
				<div class="article-content">
					${news.content}
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
</body>
</html>