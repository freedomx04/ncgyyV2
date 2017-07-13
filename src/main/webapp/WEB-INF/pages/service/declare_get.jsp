<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${declare.title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-declare-detail dt,
	.body-declare-detail dd {
		line-height: 2;
	}
	</style>
	
</head>

<body class="gray-bg body-declare-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-declare-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>申报列表</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${declare.title}</span>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<div class="tabs-container">
					<div class="tab-content">
						<div id="declare-tab-info" class="tab-pane active">
							<div class="panel-body">
								<div class="col-sm-12">
									<dl class="dl-horizontal">
										<dt>申报名称</dt><dd>${declare.title}</dd>
										<dt>申报开始时间</dt><dd>${declare.startTime}</dd>
										<dt>申报结束时间</dt><dd>${declare.endTime}</dd>
										<dt>状态</dt><dd>${declare.status == 0 ? '新增' : declare.status == 1 ? '上架' : '下架'}</dd>
										<dt>已申报企业数</dt><dd>${declare.applys.size()}</dd>
										<dt>发布人</dt><dd>${declare.user.name}</dd>
										<dt>项目描述</dt><dd>${declare.description}</dd>
										<dt>相关附件:</dt>
										<dd>
											<c:if test="${not empty declare.fileList}">
								 				<div class="declare-file">
								 					<ul class="attachment-list list-unstyled">
									 					<c:forEach var="file" items="${declare.fileList}">
									 						<li data-fileid="${file.id}" data-filename="${file.filename}" data-filepath="${file.filepath}">
																<a href="${ctx}${file.filepath}"><i class="icon-attachment"></i>${file.filename}</a>
															</li>
									 					</c:forEach>
								 					</ul>
								 				</div>
							 				</c:if>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
 				</div>
	 		</div>
	 	</div>
	
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>

	<script type="text/javascript">
	
		var $page = $('.body-declare-detail');
		$page
		.on('click', '.btn-declare-back', function() {
			var type = $k.util.getRequestParam('type');
			if (type == 'ep') {
				window.location.href = './declareEP';
			} else if (type == 'gv') {
				window.location.href = './declareGV';
			}
		});
		
	</script>
</body>

</html>