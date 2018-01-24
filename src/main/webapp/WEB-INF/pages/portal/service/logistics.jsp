<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>物流服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-line" aria-expanded="true">查询线路</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-network" aria-expanded="false">查询网点</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-supply" aria-expanded="false">货源信息</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-line" class="tab-pane active">
						<c:forEach var="line" items="${lines}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/logistics/line/info?lineId=${line.id}" target="_blank">${line.origin} - ${line.destination}</a>
										</div>
										<span>运输方式：${line.transportMode}</span>
										<span>参考时效：${line.aging}</span>
										<span>重货单价：${line.heavyPrice} 元/公斤</span>
										<span>轻货单价：${line.lightPrice} 元/立方</span>
										<span>最低一票：${line.lowest} 元</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${line.supplier.name}</div>
										<span>行业：${line.supplier.profession}</span>
										<span>性质：${line.supplier.property}</span>
										<span>规模：${line.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${line.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
					
					<div id="tab-network" class="tab-pane">
						<c:forEach var="network" items="${networks}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/logistics/network/info?networkId=${network.id}" target="_blank">${network.name}</a>
										</div>
										<span>网点地址：${network.address}</span>
										<span>联系电话：${network.contact}</span>
										<span>业务内容：${network.business}</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${network.supplier.name}</div>
										<span>行业：${network.supplier.profession}</span>
										<span>性质：${network.supplier.property}</span>
										<span>规模：${network.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${network.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
					
					<div id="tab-supply" class="tab-pane">
						<c:forEach var="supply" items="${supplys}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-12">
										<div class="item-title">
											<a href="${ctx}/service/logistics/supply/info?supplyId=${supply.id}" target="_blank">${supply.origin} - ${supply.destination}</a>
										</div>
										<span>货源类型：${supply.address}</span>
										<span>货源描述：${supply.description}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${supply.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>