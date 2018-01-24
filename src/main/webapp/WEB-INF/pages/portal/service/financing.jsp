<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>融资服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-financing" aria-expanded="true">找资金</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-invest" aria-expanded="false">找项目</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-financing" class="tab-pane active">
						<c:forEach var="financing" items="${financings}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/financing/financing/info?financingId=${financing.id}" target="_blank">${financing.title}</a>
										</div>
										<span>行业类型：${financing.profession}</span>
										<span>融资用途：${financing.purpose}</span>
										<span>融资金额：${financing.amount}</span>
										<span>融资类型：${financing.financingType}</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${financing.supplier.name}</div>
										<span>行业：${financing.supplier.profession}</span>
										<span>性质：${financing.supplier.property}</span>
										<span>规模：${financing.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${financing.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
					
					<div id="tab-invest" class="tab-pane">
						<c:forEach var="invest" items="${invests}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/financing/invest/info?investId=${invest.id}" target="_blank">${invest.title}</a>
										</div>
										<span>投资方式：${invest.investType}</span>
										<span>资金类型：${invest.fundType}</span>
										<span>投资行业：${invest.profession}</span>
										<span>投资金额：${invest.amount}</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${invest.supplier.name}</div>
										<span>行业：${invest.supplier.profession}</span>
										<span>性质：${invest.supplier.property}</span>
										<span>规模：${invest.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${invest.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>