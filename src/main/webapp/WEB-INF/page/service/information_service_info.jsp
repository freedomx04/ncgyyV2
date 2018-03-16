<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${service.title}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/page/service/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 padding-0">
					<div class="info-main white-bg">
						<div class="info-header">
							<div class="info-name">${service.title}</div>
							<div class="info-supplier-name">${service.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${service.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">服务内容</div>
						<div class="info-content">
							<span>${service.content}</span>
						</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联  系  人：${service.contactUser}</span>
							<span>联系电话：${service.contact}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4 hidden-xs">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${service.supplier.name}</span>
							<span>行业：${service.supplier.profession}</span>
							<span>性质：${service.supplier.property}</span>
							<span>规模：${service.supplier.scale}</span>
							<span>地址：${service.supplier.address}</span>
							<span>座机：${service.supplier.phone}</span>
							<span>传真：${service.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${service.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>