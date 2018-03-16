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
	<%@ include file="/WEB-INF/page/service/header.jsp"%>
	
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
						<div class="filter-recruit" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-recruit form-control" placeholder="搜索职位">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-fw search-recruit">搜索</button>
									</span>
								</div>
							</div>
							<div class="filter-classify hidden-xs" style="margin-top: 20px;">
								<ul class="list-unstyled has-more">
									<li>
										<dt>行业类别：</dt>
										<a class="btn-more btn-collapse">
											<span class="select-toggle-text">更多</span>
											<span class="fa fa-angle-down"></span>
										</a>
										<dl>
											<c:forEach var="profession" items="${professions}">
												<c:if test="${profession == '不限'}">
													<a class="select-all active" data-classify="profession">不限</a>
												</c:if>
												<c:if test="${profession != '不限'}">
													<a class="select-item" data-classify="profession" data-value="${profession}">${profession}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
								
									<li>
										<dt>薪资待遇：</dt>
										<dl>
											<c:forEach var="salary" items="${salarys}">
												<c:if test="${salary == '不限'}">
													<a class="select-all active" data-classify="salary">不限</a>
												</c:if>
												<c:if test="${salary != '不限'}">
													<a class="select-item" data-classify="salary" data-value="${salary}">${salary}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li>
										<dt>工作年限：</dt>
										<dl>
											<c:forEach var="workingYears" items="${workingYearss}">
												<c:if test="${workingYears == '不限'}">
													<a class="select-all active" data-classify="workingYears">不限</a>
												</c:if>
												<c:if test="${workingYears != '不限'}">
													<a class="select-item" data-classify="workingYears" data-value="${workingYears}">${workingYears}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li>
										<dt>学历要求：</dt>
										<dl>
											<c:forEach var="education" items="${educations}">
												<c:if test="${education == '不限'}">
													<a class="select-all active" data-classify="education">不限</a>
												</c:if>
												<c:if test="${education != '不限'}">
													<a class="select-item" data-classify="education" data-value="${education}">${education}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li class="select-result">
										<dt>已选条件：</dt>
										<dl style="height: 100%;">
											<span class="select-no">暂时没有选择过滤条件</span>
											<button type="button" class="btn btn-danger btn-filter-recruit">确定</button>
										</dl>
									</li>
								</ul>
							</div>
						</div>
						<div class="list-recruit"></div>
						<div class="paginator-recruit">
							<div class="pull-left pagination-info"></div>
							<div class="pull-right"><ul class="pagination"></ul></div>
						</div>
					</div>
					
					<div id="tab-job" class="tab-pane">
						<div class="filter-job" style="border-bottom: 1px solid #e7e7e7; padding: 20px 0;">
							<div class="row filter-search">
								<div class="col-md-8 input-group">
									<input type="text" class="input-job form-control" placeholder="搜索求职意向">
									<span class="input-group-btn">
										<button type="button" class="btn btn-primary btn-fw search-job">搜索</button>
									</span>
								</div>
							</div>
							<div class="filter-classify hidden-xs" style="margin-top: 20px;">
								<ul class="list-unstyled has-more">
									<li>
										<dt>专业类别：</dt>
										<a class="btn-more btn-collapse">
											<span class="select-toggle-text">更多</span>
											<span class="fa fa-angle-down"></span>
										</a>
										<dl>
											<c:forEach var="profession" items="${professions}">
												<c:if test="${profession == '不限'}">
													<a class="select-all active" data-classify="profession">不限</a>
												</c:if>
												<c:if test="${profession != '不限'}">
													<a class="select-item" data-classify="profession" data-value="${profession}">${profession}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
								
									<li>
										<dt>薪资待遇：</dt>
										<dl>
											<c:forEach var="salary" items="${salarys}">
												<c:if test="${salary == '不限'}">
													<a class="select-all active" data-classify="salary">不限</a>
												</c:if>
												<c:if test="${salary != '不限'}">
													<a class="select-item" data-classify="salary" data-value="${salary}">${salary}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li>
										<dt>工作年限：</dt>
										<dl>
											<c:forEach var="workingYears" items="${workingYearss}">
												<c:if test="${workingYears == '不限'}">
													<a class="select-all active" data-classify="workingYears">不限</a>
												</c:if>
												<c:if test="${workingYears != '不限'}">
													<a class="select-item" data-classify="workingYears" data-value="${workingYears}">${workingYears}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li>
										<dt>最高学历：</dt>
										<dl>
											<c:forEach var="education" items="${educations}">
												<c:if test="${education == '不限'}">
													<a class="select-all active" data-classify="education">不限</a>
												</c:if>
												<c:if test="${education != '不限'}">
													<a class="select-item" data-classify="education" data-value="${education}">${education}</a>
												</c:if>
											</c:forEach>
										</dl>
									</li>
									
									<li class="select-result">
										<dt>已选条件：</dt>
										<dl style="height: 100%;">
											<span class="select-no">暂时没有选择过滤条件</span>
											<button type="button" class="btn btn-danger btn-filter-job">确定</button>
										</dl>
									</li>
								</ul>
							</div>
						</div>
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
		loadRecruit('${ctx}/api/service/talent/recruit/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$recruit
		.on('click', '.search-recruit', function() {
			var searchStr = $recruit.find('.input-recruit').val();
			loadRecruit('${ctx}/api/service/talent/recruit/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		})
		.on('click', '.btn-filter-recruit', function() {
			var pr = getFilterValue('profession');
			var sa = getFilterValue('salary');
			var wy = getFilterValue('workingYears');
			var ed = getFilterValue('education');
			
			loadRecruit('${ctx}/api/service/talent/recruit/filter', {
				profession: pr,
				salary: sa,
				workingYears: wy,
				education: ed,
				page: 0,
				size: paginatorSize
			});
		});
		
		function loadRecruit(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$recruit.find('.list-recruit').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$recruit.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, recruit) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/talent/recruit/info?recruitId=' + recruit.id + '" target="_blank">' + recruit.position + '</a>'
										+ 		'</div>'
										+ 		'<span>招聘行业：' + recruit.profession + '</span>'
										+ 		'<span>薪资待遇：' + recruit.salary + '</span>'
										+ 		'<span>工作年限：' + recruit.workingYears + '</span>'
										+ 		'<span>学历要求：' + recruit.education + '</span>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5 hidden-xs">'
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
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									data.page = page - 1;
									loadRecruit(url, data)
								}
							});
						} else {
							$recruit.find('.list-recruit').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$recruit.find('.pagination').empty();
							$recruit.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
		var $job = $('#tab-job');
		loadJob('${ctx}/api/service/talent/job/listPaging', {
			page: 0,
			size: paginatorSize
		});
		
		$job
		.on('click', '.search-job', function() {
			var searchStr = $job.find('.input-job').val();
			loadJob('${ctx}/api/service/talent/job/search', {
				searchStr: searchStr,
				page: 0,
				size: paginatorSize
			});
		})
		.on('click', '.btn-filter-job', function() {
			var pr = getFilterValue('profession');
			var sa = getFilterValue('salary');
			var wy = getFilterValue('workingYears');
			var ed = getFilterValue('education');
			
			loadJob('${ctx}/api/service/talent/job/filter', {
				profession: pr,
				salary: sa,
				workingYears: wy,
				education: ed,
				page: 0,
				size: paginatorSize
			});
		});
		
		function loadJob(url, data) {
			$.ajax({
				url: url,
				data: data,
				type: 'post',
				success: function(ret) {
					if (ret.code == 0) {
						$job.find('.list-job').empty();
						
						var count = ret.data.totalElements;
						if (count > 0) {
							$job.find('.pagination-info').text('总共 ' + count + ' 条记录');
							$.each(ret.data.content, function(key, job) {
								var $obj = 
									'<div class="service-item">'
										+ '<div class="row">'
										+ 	'<div class="col-sm-7">'
										+ 		'<div class="item-title">'
										+ 			'<a href="${ctx}/service/talent/job/info?jobId=' + job.id + '" target="_blank">' + job.intention + '</a>'
										+ 		'</div>'
										+ 		'<span>性别：' + job.sex + '</span>'
										+ 		'<span>年龄：' + job.age + '岁</span>'
										+ 		'<span>学历：' + job.education + '</span>'
										+ 		'<span>专业：' + job.profession + '</span>'
										+ 	'</div>'
										+ 	'<div class="col-sm-5 hidden-xs">'
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
								currentPage: data.page + 1,
								totalPages: ret.data.totalPages,
								onPageClicked: function(event, originalEvent, type, page) {
									loadJob(url, data);
								}
							}); 
						} else {
							$job.find('.list-job').html('<div class="text-center" style="padding: 20px;">暂无数据</div>');
							$job.find('.pagination').empty();
							$job.find('.pagination-info').empty();
						}
					}
				}
			});
		}
		
	}) (jQuery);
	</script>
	
</body>
</html>