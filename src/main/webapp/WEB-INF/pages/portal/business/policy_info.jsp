<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${policy.title}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/business/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="info-main white-bg">
					<div class="info-header text-center">
						<div class="info-name">${policy.title}</div>
						<div class="info-time">
							<span>来源：${policy.source}</span>
							<span style="margin-left: 20px;">时间：<fmt:formatDate value="${policy.updateTime}" pattern="yyyy-MM-dd"/></span>
						</div>
					</div>
					
					<div class="info-content">${policy.content}</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>