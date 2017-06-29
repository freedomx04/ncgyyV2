<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${apply.declare.title}</title>
	
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
	 			<button type="button" class="btn btn-white btn-apply-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i></button>
	 			<span style="padding-left: 15px; font-size: 16px;">${apply.declare.title}</span>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<div class="tabs-container">
					<div class="tab-content">
						<div id="declare-tab-info" class="tab-pane active">
							<div class="panel-body">
								<div class="col-sm-7">
									<dl class="dl-horizontal">
										<dt>申报名称:</dt><dd>${apply.declare.title}</dd>
										<dt>审批状态:</dt><dd>${apply.status == 1 ? '未审批' : apply.status == 2 ? '审批通过' : '审批未通过'}</dd>
										<dt>审批意见:</dt><dd>${apply.opinion}</dd>
									</dl>
								</div>
								
				 				
								<div class="col-sm-12">
									<dl class="dl-horizontal">
										<dt>申报文件:</dt>
										<dd>
											<c:if test="${not empty apply.fileList}">
							 				<div class="apply-file">
							 					<ul class="attachment-list list-unstyled">
							 					<c:forEach var="file" items="${apply.fileList}">
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
		var type = $k.util.getRequestParam('type');
		var url = '';
		
		if (type == 'ep') {
			$page.find('.btn-apply-back').append('我的申报');
			url = './declareEP#tab-2';
		} else if (type == 'gv') {
			$page.find('.btn-apply-back').append('已申报企业列表');
			url = '${ctx}/declare/enterprise?declareId=${apply.declare.id}';
		}
		
		$page
		.on('click', '.btn-apply-back', function() {
			window.location.href = url;
		});
		
	</script>
</body>

</html>