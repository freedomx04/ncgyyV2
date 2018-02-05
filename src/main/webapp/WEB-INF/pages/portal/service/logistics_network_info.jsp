<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${network.name}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 padding-0">
					<div class="info-main white-bg">
						<div class="info-header">
							<div class="info-name">${network.name}</div>
							<div class="info-supplier-name">${network.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${network.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">网点信息</div>
						<div class="info-content">
							<span>网点地址：${network.address}</span>
							<span>联系电话：${network.contact}</span>
							<span>业务内容：${network.business}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4 hidden-xs">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${network.supplier.name}</span>
							<span>行业：${network.supplier.profession}</span>
							<span>性质：${network.supplier.property}</span>
							<span>规模：${network.supplier.scale}</span>
							<span>地址：${network.supplier.address}</span>
							<span>座机：${network.supplier.phone}</span>
							<span>传真：${network.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${network.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>