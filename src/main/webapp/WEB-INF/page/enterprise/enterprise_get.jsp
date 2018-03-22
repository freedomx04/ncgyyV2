<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${enterprise.name}</title>
	
</head>
<body class="gray-bg">
	
	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main animated fadeInDown">
		<div class="container white-bg">
			<div class="row">
				<div class="info-main">
					<div class="info-header">
						<div class="info-name">${enterprise.name}</div>
					</div>
					
					<div class="info-title">企业图片</div>
					<div class="info-content">
						<img class="img-thumbnail img-responsive" src="${ctx}/api/avatar/${enterprise.avatar}">
					</div>
					
					<div class="info-title">企业简介</div>
					<div class="info-content">
						<c:if test="${not empty enterprise.introduction}">
							<span>${enterprise.introduction}</span>
						</c:if>
						<c:if test="${empty enterprise.introduction}">
							<span>暂无信息！</span>
						</c:if>
					</div>
					
					<div class="info-title">基本信息</div>
					<div class="info-content">
						<span>所属园区：${enterprise.area.name}</span>
						<span>行业类别：${enterprise.industry.name}</span>
						<span>主要产品：${enterprise.mainProduct}</span>
						<span>企业地址：${enterprise.address}</span>
						<span>联系电话：${enterprise.telephone}</span>
					</div>
					
					<div class="info-title">企业产品</div>
					<div class="info-content">
						<c:if test="${not empty enterprise.productList}">
							<div class="row product-list">
								<c:forEach var="product" items="${enterprise.productList}">
									<div class="col-sm-3">
										<div class="product-item">
											<div class="product-image">
												<a href="${ctx}/product/get?productid=${product.id}" target="_blank">
													<img src="${ctx}${product.imagePath}">
												</a>
											</div>
											<div class="product-info">
												<div class="product-name text-ellipsis">
													<a href="${ctx}/product/get?productid=${product.id}" target="_blank">${product.name}</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty enterprise.productList}">
							<span>暂无信息！</span>
						</c:if>
					</div>
					
					<div class="info-title">企业新闻</div>
					<div class="info-content">
						<c:if test="${not empty enterprise.newsList}">
							<div class="news-list">
								<c:forEach var="news" items="${enterprise.newsList}">
									<li class="text-ellipsis li-item">
										<a href="${ctx}/enterprise/news/get?newsid=${news.id}" target="_blank">${news.title}</a>
									</li>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty enterprise.newsList}">
							<span>暂无信息！</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
</body>
</html>