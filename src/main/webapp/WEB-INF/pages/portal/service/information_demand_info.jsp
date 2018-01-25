<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${demand.title}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="info-main white-bg">
						<div class="info-header">
							<div class="info-name">${demand.title}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${demand.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">需求内容</div>
						<div class="info-content">
							<span>${demand.content}</span>
						</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联系人：${demand.contactUser}</span>
							<span>联系电话：${demand.contact}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>