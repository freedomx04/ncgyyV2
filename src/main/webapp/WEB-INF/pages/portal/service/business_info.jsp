<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${business.name}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<div class="info-main white-bg">
						<div class="info-header">
							<div class="info-name">${business.name}</div>
							<div class="info-supplier-name">${business.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${business.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">项目信息</div>
						<div class="info-content">
							<span>项目地点：${business.address}</span>
							<span>投资规模：${business.scale}</span>
							<span>合作方式：${business.mode}</span>
						</div>
						
						<div class="info-title">项目概况</div>
						<div class="info-content">${business.overview}</div>
						
						<div class="info-title">建设内容</div>
						<div class="info-content">${business.content}</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联  系  人：${business.contactUser}</span>
							<span>联系电话：${business.contact}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${business.supplier.name}</span>
							<span>行业：${business.supplier.profession}</span>
							<span>性质：${business.supplier.property}</span>
							<span>规模：${business.supplier.scale}</span>
							<span>地址：${business.supplier.address}</span>
							<span>座机：${business.supplier.phone}</span>
							<span>传真：${business.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${business.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>