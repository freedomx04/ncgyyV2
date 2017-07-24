<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>企业新闻</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
</head>

<body>
	<div class="weui-weixin_ui">
		<div class="weui-weixin-page">
			<h2 class="weui-weixin-title">${news.title}</h2>
			<div class="weui-weixin-info">
				<em class="weui-weixin-em"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd"/></em>
				<em class="weui-weixin-em">${news.enterprise.name}</em>
			</div>
			
			<div class="weui-weixin-content">${news.content}</div>
		</div>
	</div>
	
</body>
</html>