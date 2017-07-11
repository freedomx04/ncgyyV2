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
    
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
</head>
<body class="body-article-content">
	<div class="header">
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="${ctx}/index">首页</a>&nbsp;&gt;&nbsp;
			<a href="${ctx}/article">新闻动态</a>&nbsp;&gt;&nbsp;
			<a href="${ctx}/index_article?type=${article.type}">
				<c:choose>
				    <c:when test="${article.type == 1}">
				       	 图片新闻
				    </c:when>
				    <c:when test="${article.type == 2}">
			        	公示公告
				    </c:when>
				    <c:when test="${article.type == 3}">
			        	政策法规
				    </c:when>
				    <c:otherwise>
				       	工业信息
				    </c:otherwise>
				</c:choose>
			</a>   &gt;&nbsp;正文
	    </span>
	</div>
	
	<div class="cmain" style="border: 0;">
		<div class="ctitle">
			<h1 id="con_title" style="line-height: 40px; padding:0 120px;">${article.title}</h1>
		</div>
		<div class="cinfo center">
	     <span id="con_time">发布时间：<fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd HH-mm"/></span>&nbsp;
	        <span> 来源：${article.source}</span>&nbsp;
	    </div>
	    <div class="ccontent" style="font-size:14px;font-family:'宋体';word-break: break-all;">
	    	${article.content}
	    	<c:if test="${not empty article.fileList}">
			<div class="article-file" style="padding: 20px;">
				<p class="font-bold">相关附件</p>
				<ul class="attachment-list list-unstyled">
				<c:forEach var="file" items="${article.fileList}">
					<li data-fileid="${file.id}" data-filename="${file.filename}" data-filepath="${file.filepath}">
					<a href="${ctx}${file.filepath}"><i class="icon-attachment"></i>${file.filename}</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			</c:if>
	    </div>
	</div>
	
	<div class="footer">
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery-doT.js"></script>
	
	<script>
	var $page = $(".body-article-content");
	;(function() {
		$page.find(".header").html($(".template.Top").doT());
		$page.find(".footer").append($(".template.Footer").doT());
		
	})();
	
	</script>
</body>
</html>