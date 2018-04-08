<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>园区管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-version-history">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div id="vertical-timeline" class="vertical-container dark-timeline">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-history"></i>
						</div>
                        <div class="vertical-timeline-content" style="background: #fff; font-size: 24px; padding: 6px;">
                        	版本历史
                        </div>
					</div>
				
					<c:forEach var="version" items="${versionList}">
						<div class="vertical-timeline-block">
							<div class="vertical-timeline-icon navy-bg"></div>
                        	<div class="vertical-timeline-content">
                        		<h2>Version ${version.code}</h2>
                        		<span>${version.content}</span>
                        		
                        		<span class="vertical-date" style="float: right; padding-right: 10px;">
                        			${version.releaseTime}                       		
								</span>
                        	</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
	})( jQuery );
	</script>
	
</body>

</html>