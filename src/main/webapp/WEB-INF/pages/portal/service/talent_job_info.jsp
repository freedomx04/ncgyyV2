<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${job.intention}</title>
</head>

<body class="gray-bg">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/service/header.jsp"%>
	
	<div class="main animated fadeInRight">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 padding-0">
					<div class="info-main white-bg">
						<div class="info-header">
							<div class="info-name">${job.intention}</div>
							<div class="info-time"><i class="fa fa-clock-o fa-fw"></i>更新时间：<fmt:formatDate value="${job.updateTime}" pattern="yyyy-MM-dd"/></div>
						</div>
						
						<div class="info-title">个人信息</div>
						<div class="info-content">
							<span>姓名：${job.name}</span>
							<span>性别：${job.sex}</span>
							<span>年龄：${job.age}</span>
							<span>学历：${job.education}</span>
							<span>工作经验：${job.workingYears}</span>
						</div>
						
						<div class="info-title">求职意向</div>
						<div class="info-content">
							<span>期望薪资：${job.salary}</span>
							<span>期望地区：${job.area}</span>
						</div>
						
						<div class="info-title">自我介绍</div>
						<div class="info-content">${job.introduction}</div>
						
						<div class="info-title">工作经历</div>
						<div class="info-content">${job.experience}</div>
						
						<div class="info-title">联系方式</div>
						<div class="info-content">
							<span>联系电话：${job.contact}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>