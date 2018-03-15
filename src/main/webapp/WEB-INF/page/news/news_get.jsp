<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${news.title}</title>
	
	<style type="text/css">
	.article-title {
		border-bottom: 1px solid #d9d9d9;
		text-align: center;
	}
	.article-title h2 {
		font-size: 24px;
		padding: 30px 20px 10px;
		margin: 0;
	}
	.article-remark {
		color: #999;
		padding: 15px;
	}
	.article-time {
		margin-right: 20px;
	}
	.article-content {
		padding: 40px;
		font-size: 14px;
		font-family: '宋体';
		color: #070707;
		min-height: 400px;
	}
	.article-content img {
		max-width: 100%!important;
		height: auto;
	}
	
	/** mobile */
	@media (max-width: 768px) {
		.article-content {
			padding: 20px;
		}
	}
	</style>
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