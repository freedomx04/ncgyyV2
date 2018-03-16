<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${line.origin} - ${line.destination}</title>
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
							<div class="info-name">${line.origin} - ${line.destination}</div>
							<div class="info-supplier-name">${line.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${line.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">线路信息</div>
						<div class="info-content">
							<span>发货地：${line.origin}</span>
							<span>收货地：${line.destination}</span>
							<span>运输方式：${line.transportMode}</span>
							<span>参考时效：${line.aging}</span>
							<span>重货单价：${line.heavyPrice} 元/公斤</span>
							<span>轻货单价：${line.lightPrice} 元/立方</span>
							<span>最低一票：${line.lowest} 元</span>
						</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联系人：${line.contactUser}</span>
							<span>联系电话：${line.contact}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4 hidden-xs">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${line.supplier.name}</span>
							<span>行业：${line.supplier.profession}</span>
							<span>性质：${line.supplier.property}</span>
							<span>规模：${line.supplier.scale}</span>
							<span>地址：${line.supplier.address}</span>
							<span>座机：${line.supplier.phone}</span>
							<span>传真：${line.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${line.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>