<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${product.name}</title>
</head>
<body class="gray-bg">
	
	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="row">
				<div class="info-main">
					<div class="info-header">
						<div class="info-name">${product.name}</div>
						<div class="info-supplier-name">${product.enterprise.name}</div>
					</div>
					
					<div class="info-title">产品图片</div>
					<div class="info-content">
						<img class="img-thumbnail img-responsive" src="${ctx}${product.imagePath}">
					</div>
					
					<div class="info-title">规格参数</div>
					<div class="info-content">
						<span>${prodict.specification}</span>
					</div>
					
					<div class="info-title">产品介绍</div>
					<div class="info-content">
						<span>${prodict.introduction}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
</body>
</html>