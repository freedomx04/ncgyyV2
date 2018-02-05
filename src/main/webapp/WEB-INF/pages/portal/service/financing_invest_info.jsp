<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${invest.title}</title>
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
							<div class="info-name">${invest.title}</div>
							<div class="info-supplier-name">${invest.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${invest.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">项目信息</div>
						<div class="info-content">
							<span>投资方式：${invest.investType}</span>
							<span>资金类型：${invest.fundType}</span>
							<span>投资行业：${invest.profession}</span>
							<span>投资金额：${invest.amount}</span>
						</div>
						
						<div class="info-title">项目概述</div>
						<div class="info-content">${invest.description}</div>
						
						<div class="info-title">其他备注</div>
						<div class="info-content">${invest.remark}</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联  系  人：${invest.contactUser}</span>
							<span>联系电话：${invest.contact}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4 hidden-xs">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${invest.supplier.name}</span>
							<span>行业：${invest.supplier.profession}</span>
							<span>性质：${invest.supplier.property}</span>
							<span>规模：${invest.supplier.scale}</span>
							<span>地址：${invest.supplier.address}</span>
							<span>座机：${invest.supplier.phone}</span>
							<span>传真：${invest.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${invest.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>