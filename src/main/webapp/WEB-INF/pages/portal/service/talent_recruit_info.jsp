<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${recruit.position}</title>
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
							<div class="info-name">${recruit.position}</div>
							<div class="info-supplier-name">${recruit.supplier.name}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${recruit.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">职位信息</div>
						<div class="info-content">
							<span>招聘行业：${recruit.profession}</span>
							<span>薪资待遇：${recruit.salary}</span>
							<span>工作年限：${recruit.workingYears}</span>
							<span>学历要求：${recruit.education}</span>
						</div>
						
						<div class="info-title">岗位职责</div>
						<div class="info-content">${recruit.responsibility}</div>
						
						<div class="info-title">任职要求</div>
						<div class="info-content">${recruit.requirement}</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>工作地点：${recruit.address}</span>
							<span>联  系  人：${recruit.contactUser}</span>
							<span>联系电话：${recruit.contact}</span>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="info-supplier white-bg">
						<div class="info-title" style="margin-top: 0;">供应商名片</div>
						<div class="info-content">
							<span>${recruit.supplier.name}</span>
							<span>行业：${recruit.supplier.profession}</span>
							<span>性质：${recruit.supplier.property}</span>
							<span>规模：${recruit.supplier.scale}</span>
							<span>地址：${recruit.supplier.address}</span>
							<span>座机：${recruit.supplier.phone}</span>
							<span>传真：${recruit.supplier.fax}</span>
						</div>
						
						<div class="info-title">简介</div>
						<div class="info-content">${recruit.supplier.introduction}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>