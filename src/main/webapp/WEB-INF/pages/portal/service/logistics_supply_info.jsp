<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${supply.origin} - ${supply.destination}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="info-main white-bg">
						<div class="info-header">
							<div class="info-name">${supply.origin} - ${supply.destination}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${supply.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">货源信息</div>
						<div class="info-content">
							<span>发货地：${supply.origin}</span>
							<span>收货地：${supply.destination}</span>
							<span>货源类型：${supply.supplyType}</span>
						</div>
						
						<div class="info-title">货源描述</div>
						<div class="info-content"><span>期望薪资：${supply.description}</span></div>
						
						<div class="info-title">其他备注</div>
						<div class="info-content">${supply.remark}</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联系人：${supply.contactUser}</span>
							<span>联系电话：${supply.contact}</span>
							<span>具体地点：${supply.address}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>