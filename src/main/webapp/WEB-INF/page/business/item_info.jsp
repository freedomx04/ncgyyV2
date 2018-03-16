<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${item.name}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/page/business/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="info-main white-bg">
					<div class="info-header">
						<div class="info-name">${item.name}</div>
						<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd"/></div>
					</div>
					
					<div class="info-title">项目信息</div>
					<div class="info-content">
						<span>项目地点：${item.address}</span>
						<span>投资规模：${item.scale}</span>
						<span>合作方式：${item.mode}</span>
					</div>
					
					<div class="info-title">项目概况</div>
					<div class="info-content">${item.overview}</div>
					
					<div class="info-title">建设内容</div>
					<div class="info-content">${item.content}</div>
					
					<div class="info-title">联系方式</div>
					<div class="info-content">
						<span>联系人：${item.contactUser}</span>
						<span>联系电话：${item.contact}</span>
						<span>邮箱：${item.email}</span>
						<span>传真：${item.fax}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>