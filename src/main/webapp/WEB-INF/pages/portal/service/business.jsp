<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-business" aria-expanded="true">找项目</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-business" class="tab-pane active">
						<c:forEach var="business" items="${businesss}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/business/info?businessId=${business.id}" target="_blank">${business.name}</a>
										</div>
										<span>项目地点：${business.address}</span>
										<span>投资规模：${business.scale}</span>
										<span>合作方式：${business.mode}</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${business.supplier.name}</div>
										<span>行业：${business.supplier.profession}</span>
										<span>性质：${business.supplier.property}</span>
										<span>规模：${business.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${business.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>