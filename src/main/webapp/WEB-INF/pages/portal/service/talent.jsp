<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>用工服务</title>
</head>

<body class="gray-bg page-talent">
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
						<div class="list-recruit"></div>
						<div class="paginator-recruit">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-job" class="tab-pane">
						<div class="list-job"></div>
						<div class="paginator-job">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var paginatorSize = 10;
		
		var $recruit = $('#tab-recruit');
		var recruitPage = 0;
		loadRecruit(recruitPage, paginatorSize);
		
		function loadRecruit(recruitPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/talent/recruit/listPaging',
				data: {
					page: recruitPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$recruit.find('.list-recruit').empty();
						$recruit.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, recruit) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/talent/recruit/info?recruitId=' + recruit.id + '">' + recruit.position + '</a>'
									+ 		'</div>'
									+ 		'<span>招聘行业：' + recruit.profession + '</span>'
									+ 		'<span>薪资待遇：' + recruit.salary + '</span>'
									+ 		'<span>工作年限：' + recruit.workingYears + '</span>'
									+ 		'<span>学历要求：' + recruit.education + '</span>'
									+ 	'</div>'
									+ 	'<div class="col-sm-5">'
									+ 		'<div class="item-title">' + recruit.supplier.name + '</div>'
									+ 		'<span>行业：' + recruit.supplier.profession + '</span>'
									+ 		'<span>性质：' + recruit.supplier.property + '</span>'
									+ 		'<span>规模：' + recruit.supplier.scale + '</span>'
									+ 	'</div>'
									+ '</div>'
									+ '<div class="item-time">更新时间：' + formatDate2(recruit.updateTime) + '</div>';
							$recruit.find('.list-recruit').append($obj);
						});
						
						$k.util.paginator($recruit.find('.pagination'), {
							currentPage: recruitPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadRecruit(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
		var $job = $('#tab-job');
		var jobPage = 0;
		loadJob(jobPage, paginatorSize);
		
		function loadJob(jobPage, paginatorSize) {
			$.ajax({
				url: '${ctx}/api/service/talent/job/listPaging',
				data: {
					page: jobPage,
					size: paginatorSize
				},
				success: function(ret) {
					if (ret.code == 0) {
						$job.find('.list-job').empty();
						$job.find('.pagination-info').text('总共 ' + ret.data.totalElements + ' 条记录');
						$.each(ret.data.content, function(key, job) {
							var $obj = 
								'<div class="service-item">'
									+ '<div class="row">'
									+ 	'<div class="col-sm-7">'
									+ 		'<div class="item-title">'
									+ 			'<a href="${ctx}/service/talent/job/info?jobId=' + job.id + '">' + job.intention + '</a>'
									+ 		'</div>'
									+ 		'<span>性别：' + job.sex + '</span>'
									+ 		'<span>年龄：' + job.age + '岁</span>'
									+ 		'<span>学历：' + job.education + '</span>'
									+ 		'<span>专业：' + job.profession + '</span>'
									+ 	'</div>'
									+ 	'<div class="col-sm-5">'
									+ 		'<div class="item-title">' + job.user.name + '</div>'
									+ 		'<span>工作经验：' + job.workingYears + '</span>'
									+ 		'<span>期望薪资：' + job.salary + '</span>'
									+ 		'<span>期望地区：' + job.area + '</span>'
									+ 	'</div>'
									+ '</div>'
									+ '<div class="item-time">更新时间：' + formatDate2(job.updateTime) + '</div>';
							$job.find('.list-job').append($obj);
						});
						
						$k.util.paginator($job.find('.pagination'), {
							currentPage: jobPage + 1,
							totalPages: ret.data.totalPages,
							onPageClicked: function(event, originalEvent, type, page) {
								loadJob(page - 1, paginatorSize);
							}
						}); 
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>