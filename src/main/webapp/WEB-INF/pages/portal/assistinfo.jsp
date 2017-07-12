<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
	
	
</head>
<body class="body-assistinfo">
	<div>
		<%@ include file="/WEB-INF/template/top.jsp"%>
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="index">首页</a>&nbsp;&gt;&nbsp;
			<a href="assistlist">帮扶平台</a>
	    </span>
	</div>
	
	<div class="" style="margin-top: 20px;">
	
	
	</div>
	
	<div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $(".body-assistinfo");
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_assist").addClass("nav_curr");
		
		
	})();
	
	</script>
</body>
</html>