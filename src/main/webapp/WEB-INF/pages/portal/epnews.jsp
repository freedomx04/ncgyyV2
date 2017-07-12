<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
</head>
<body class="body-article-content">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav" style="border-bottom: 1px #ccc solid;">
			<span> 
				<a href="/index">首页</a>&nbsp;&gt;&nbsp; 
				<a href="${ctx}/enterprise?enterpriseId=${enterpriseId}">
			       	 企业新闻
				</a>   &gt;&nbsp;正文
			</span>
		</div>
	
		<div class="cmain" style="border: 0; width: 980px; margin: 0 auto;">
			<div class="ctitle" style="line-height: 40px; padding: 20px 30px; text-align: center;">
				<h1 id="con_title">${news.title}</h1>
			</div>
			<div class="cinfo" style="text-align: center; border-bottom: 1px #d9d9d9 solid; color: #999; padding: 15px;">
				<span id="con_time">发布时间：<fmt:formatDate value="${news.updateTime}" pattern="yyyy-MM-dd HH-mm" /></span>&nbsp; 
			</div>
			<div class="ccontent" style="font-size: 14px; font-family: '宋体'; width: 100%; padding: 40px; color: #070707; line-height: 26px; min-height: 400px;word-break: break-all;">
				${news.content}
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/template/footer.jsp"%>

	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>

</body>
</html>