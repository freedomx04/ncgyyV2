<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>信息化服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-service" aria-expanded="true">找服务</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-demand" aria-expanded="false">找需求</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-service" class="tab-pane active">
						<c:forEach var="service" items="${services}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/information/service/info?serviceId=${service.id}" target="_blank">${service.title}</a>
										</div>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${service.supplier.name}</div>
										<span>行业：${service.supplier.profession}</span>
										<span>性质：${service.supplier.property}</span>
										<span>规模：${service.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${service.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
					
					<div id="tab-demand" class="tab-pane">
						<c:forEach var="demand" items="${demands}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-12">
										<div class="item-title">
											<a href="${ctx}/service/information/demand/info?demandId=${demand.id}" target="_blank">${demand.title}</a>
										</div>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${demand.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>