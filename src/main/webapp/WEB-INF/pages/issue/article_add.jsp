<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>新增新闻</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-article-add">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<h5>${title}</h5>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-article">
					<div class="form-group">
						<label for="title" class="col-sm-1 control-label"><i class="form-required">*</i>标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="title" value="${article.title}" required>
						</div>
					</div>	
					 <div class="form-group">
						<label for="source" class="col-sm-1 control-label">来源</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="source" value="${article.source}">
						</div>
					</div>
					<div class="form-group" >
						<label for="source" class="col-sm-1 control-label">正文</label>
						<div class="col-sm-10">
							<div id="summernote"></div>
						</div>
					</div>	
					
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-1">
							<c:if test="${method == 'add'}">
							<button type="button" class="btn btn-primary btn-article-add">
		                        <i class="fa fa-check fa-fw"></i>确定
		                    </button>
		                    </c:if>
		                    <c:if test="${method == 'edit'}">
		                    <button type="button" class="btn btn-primary btn-article-edit">
		                        <i class="fa fa-check fa-fw"></i>确定
		                    </button>
		                    </c:if>
							<button type="button" class="btn btn-white btn-article-cancel">
		                        <i class="fa fa-close fa-fw"></i>取消
		                    </button>

						</div>
					</div>
 				</form>
	 		</div>
	 	</div>
	
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	
		var $page = $('.body-article-add');
		var $form = $page.find('#form-article');
		
		var type = '${type}';
		var method = '${method}';
		
		$k.util.bsValidator($form);
		
		if (method == 'add') {
			$('#summernote').summernote({
				minHeight: 360,
				lang: 'zh-CN',
				focus: true,
				dialogsFade: true,
				placeholder: '文章内容'
			});
		} else {
			$('#summernote').summernote({
				minHeight: 360,
				lang: 'zh-CN',
				focus: true,
				dialogsFade: true,
			});
			$('#summernote').summernote('code', '${article.content}');
		}
		
		$page
		.on('click', '.btn-article-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('type', type);
				formData.append('content', $('#summernote').summernote('code'));
				
				$.ajax({
					url: '${ctx}/api/article/create',
					type: 'POST',
					data: formData,
					processData: false,
					contentType: false,
					cache: false, 
					success: function(ret) {
						if (ret.code == '0') {
							swal({
								title: '',
								text: '操作成功',
								type: 'success'
							}, function() {
								window.location.href = './articleList?type=' + type;
							});
						} else {
							swal('', '操作失败', 'error');
						}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-article-edit', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				$.ajax({
					url: '${ctx}/api/article/update',
				});
			}
		})
		.on('click', '.btn-article-cancel', function() {
			window.location.href = './articleList?type=' + type;
		});
		
	</script>
</body>

</html>