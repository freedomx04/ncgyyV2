<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${financing.title}</title>
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
							<div class="info-name">${financing.title}</div>
							<div class="info-supplier-name">${financing.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${financing.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">项目信息</div>
						<div class="info-content">
							<span>行业类别：${financing.profession}</span>
							<span>融资用途：${financing.purpose}</span>
							<span>融资金额：${financing.amount}</span>
							<span>融资类型：${financing.financingType}</span>
						</div>
						
						<div class="info-title">项目概述</div>
						<div class="info-content">${financing.description}</div>
						
						<div class="info-title">项目优势</div>
						<div class="info-content">${financing.advantage}</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联  系  人：${financing.contactUser}</span>
							<span>联系电话：${financing.contact}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4 hidden-xs">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${financing.supplier.name}</span>
							<span>行业：${financing.supplier.profession}</span>
							<span>性质：${financing.supplier.property}</span>
							<span>规模：${financing.supplier.scale}</span>
							<span>地址：${financing.supplier.address}</span>
							<span>座机：${financing.supplier.phone}</span>
							<span>传真：${financing.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${financing.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>