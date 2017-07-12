<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title></title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

</head>

<body class="gray-bg body-warning">
	<div class="wrapper wrapper-content text-center animated fadeInDown">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<img src="${ctx}/img/warning.png" style="max-width: 200px;">
		        <h3 class="font-bold">
		        	<c:if test="${type == 'ep'}">
		        		您还不是企业用户 &nbsp
		        	</c:if>
		        	<c:if test="${type == 'gv'}">
		        		您还不属于任何部门
		        	</c:if>
		        </h3>
		
		        <div class="error-desc">
		        	<c:if test="${type == 'ep'}">
		        		请联系管理员成为企业用户&nbsp
		        	</c:if>
		        	<c:if test="${type == 'gv'}">
		        		请联系管理员成为部门用户
		        	</c:if>
		        </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
</body>
</html>