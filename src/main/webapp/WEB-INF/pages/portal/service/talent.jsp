<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>用工服务</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main">
		<div class="container white-bg">
			<div class="tabs-container">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#tab-recruit" aria-expanded="true">找工作</a>
					</li>
					<li>
						<a data-toggle="tab" href="#tab-job" aria-expanded="false">找人才</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="tab-recruit" class="tab-pane active">
						<c:forEach var="recruit" items="${recruits}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a href="${ctx}/service/talent/recruit/info?recruitId=${recruit.id}" target="_blank">${recruit.position}</a>
										</div>
										<span>招聘行业：${recruit.profession}</span>
										<span>薪资待遇：${recruit.salary}</span>
										<span>工作年限：${recruit.workingYears}</span>
										<span>学历要求：${recruit.education}</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${recruit.supplier.name}</div>
										<span>行业：${recruit.supplier.profession}</span>
										<span>性质：${recruit.supplier.property}</span>
										<span>规模：${recruit.supplier.scale}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${recruit.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
					
					<div id="tab-job" class="tab-pane">
						<c:forEach var="job" items="${jobs}">
							<div class="service-item">
								<div class="row">
									<div class="col-sm-7">
										<div class="item-title">
											<a  href="${ctx}/service/talent/job/info?jobId=${job.id}" target="_blank">${job.intention}</a>
										</div>
										<span>  性别：${job.sex}</span>
										<span>	年龄：${job.age}岁</span>
										<span>	学历：${job.education}</span>
										<span>	专业：${job.profession}</span>
									</div>
									
									<div class="col-sm-5">
										<div class="item-title">${job.user.name}</div>
										<span>  工作经验：${job.workingYears}</span>
										<span>  期望薪资：${job.salary}</span>
										<span>  期望地区：${job.area}</span>
									</div>
								</div>
								<div class="item-time">更新时间：<fmt:formatDate value="${job.updateTime}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>