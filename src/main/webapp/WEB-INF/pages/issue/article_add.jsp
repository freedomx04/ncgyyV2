<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/attachment.jsp"%>

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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
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
					<c:if test="${type==1}">
					<div class="form-group">
						<label for="uploadImage" class="col-sm-1 control-label"><i class="form-required">*</i>图片</label>
						<div class="col-sm-10">
							<input id="uploadImage" type="file" class="file-loading" name="uploadImage" required>
						</div>
					</div>
					</c:if>
					<div class="form-group" >
						<label for="content" class="col-sm-1 control-label">正文</label>
						<div class="col-sm-10">
							<div id="summernote"></div>
						</div>
					</div>	
					
					<div class="form-group">
						<label for="attachment" class="col-sm-1 control-label">附件</label>
						<div class="col-sm-10 article-attachment">
							<button type="button" class="btn btn-white btn-attachment-dialog" data-toggle="modal" data-target="#modal-attachment-dialog">
		                        <i class="fa fa-paperclip fa-fw"></i>添加附件
		                    </button>
		                    <ul class="attachment-list list-unstyled project-files">
		                   		<c:forEach var="file" items="${article.fileList}">
									<li data-fileid="${file.id}" data-filename="${file.filename}" data-filepath="${file.filepath}">
										<i class="icon-attachment"></i>${file.filename}
										<a class="btn-articleFile-delete" style="color: #337ab7;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
									</li>
								</c:forEach> 
		                    </ul>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
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
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>

	<script type="text/javascript">
	
		var $page = $('.body-article-add');
		var $form = $page.find('#form-article');
		var $articleFile = $page.find('.article-attachment');
		
		var type = '${type}';
		var method = '${method}';
		
		$k.util.bsValidator($form);
		attachment($articleFile);
		
		if (method == 'add') {
			$k.util.summernote($page.find('#summernote'));
			if (type == 1) {
				$k.util.fileinput($page.find('#uploadImage'));
			}
		} else {
			$k.util.summernote($page.find('#summernote'));
			$('#summernote').summernote('code', '${article.content}');
			if (type == 1) {
				$k.util.fileinput($page.find('#uploadImage'), {
					initialPreview:	'<img src="${ctx}${article.imagePath}" class="file-preview-image" style="max-width: auto; max-height: 200px;">',
				    initialCaption: '${article.imagePath}',
				});
			}
			$k.util.attachmentIcon($articleFile.find('.attachment-list'));
		}
		
		$page
		.on('click', '.btn-article-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('type', type);
				formData.append('content', $('#summernote').summernote('code'));
				
				var attachmentList = new Array();
				$form.find('.attachment-list li').each(function(k, elem) {
					var filename = $(elem).data('filename');
					var filepath = $(elem).data('filepath');
					attachmentList.push(filename + '?' + filepath);
				});
				formData.append('attachmentList', attachmentList);
				
				$.ajax({
					url: '${ctx}/api/article/create',
					type: 'POST',
					data: formData,
					processData: false,
					contentType: false,
					cache: false, 
					success: function(ret) {
						if (ret.code == 0) {
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
			validator.removeField('uploadImage');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('articleId', '${article.id}');
				formData.append('content', $('#summernote').summernote('code'));
				
				var attachmentList = new Array();
				$form.find('.attachment-list li').each(function(k, elem) {
					var fileid = $(elem).data('fileid');
					if (!fileid) {
						var filename = $(elem).data('filename');
						var filepath = $(elem).data('filepath');
						attachmentList.push(filename + '?' + filepath);
					}
				});
				formData.append('attachmentList', attachmentList);
				
				$.ajax({
					url: '${ctx}/api/article/update',
					type: 'POST',
					data: formData,
					processData: false,
					contentType: false,
					cache: false, 
					success: function(ret) {
						if (ret.code == 0) {
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
					}
					
				});
			}
		})
		.on('click', '.btn-article-cancel', function() {
			window.location.href = './articleList?type=' + type;
		})
		.on('click', '.btn-articleFile-delete', function(e) {
			e.stopPropagation();
			var $this = $(this);
			swal({
				title: '',
				text: '确定删除选中附件?',
				type: 'warning',
				showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
			}, function() {
				var fileid = $this.closest('li').data('fileid');
				$.ajax({
					url: '${ctx}/api/article/fileDelete',
					data: {
						articleFileId: fileid
					},
					success: function(ret) {
						if (ret.code == 0) {
							swal('', '删除成功!', 'success');
							$this.closest('li').remove();
						} else {
							swal('', ret.msg, 'error');
						}
					},
					error: function(err) {}
				});
			});
		});
		
	</script>
</body>

</html>