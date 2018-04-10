<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.note-editing-area img {
		max-width: 100%;
		height: auto;
		display: block;
	}
	</style>
	
</head>

<body class="gray-bg body-item-add">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox">
	 		<div class="ibox-content">
	 			<div class="page-title">
		 			<h2>${title}</h2>
		 		</div>
	 		
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-item">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label"><i class="form-required">*</i>项目名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="name" value="${item.name}" required>
						</div>
					</div>
					
					<div class="form-group">
                        <label for="level" class="col-sm-2 control-label"><i class="form-required">*</i>项目级别</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="level" required>
                           		<option value="">请选择项目级别</option>
								<c:forEach var="itemLevel" items="${itemLevels}">
									<option value="${itemLevel}">${itemLevel}</option>
								</c:forEach>
							</select>
                        </div>
                    </div>	
					
					<div class="form-group">
						<label for="unit" class="col-sm-2 control-label"><i class="form-required">*</i>主管单位</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="unit" value="${item.unit}" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="deadline" class="col-sm-2 control-label"><i class="form-required">*</i>截止日期</label>
						<div class="col-sm-9 input-group date deadline" style="padding-left: 15px; padding-right: 15px;">
							<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							<input type="text" class="form-control" name="deadline" value="${item.deadline}" required/>
						</div>
					</div>
					
					<div class="form-group" >
						<label for="content" class="col-sm-2 control-label"><i class="form-required">*</i>项目概述</label>
						<div class="col-sm-9">
							<div id="summernote"></div>
						</div>
					</div>	
					
					<div class="form-group">
						<label for="attachment" class="col-sm-2 control-label">附件</label>
						<div class="col-sm-9">
							<div id="attachment">
								<button type="button" class="btn btn-white btn-attachment-add">
			                        <i class="fa fa-paperclip fa-fw"></i>添加附件
			                    </button>
								<ul class="attachment-list list-unstyled project-files">
			                   		<c:forEach var="file" items="${item.fileList}">
										<li data-fileid="${file.id}" data-filename="${file.filename}" data-filepath="${file.filepath}">
											${file.filename}
											<a class="btn-itemFile-delete" style="color: #337ab7;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
										</li>
									</c:forEach> 
			                    </ul>
							</div>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-2">
							<c:if test="${method == 'add'}">
								<button type="button" class="btn btn-primary btn-fw btn-item-add">确定</button>
		                    </c:if>
		                    <c:if test="${method == 'edit'}">
		                    	<button type="button" class="btn btn-primary btn-fw btn-item-edit">确定</button>
		                    </c:if>
							<button type="button" class="btn btn-white btn-fw btn-item-cancel">取消</button>
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
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/local/attachment.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
	
	<script type="text/javascript">
	
		var $page = $('.body-item-add');
		var $form = $page.find('#form-item');
		
		var type = '${type}';
		var method = '${method}';
		
		$k.util.bsValidator($form);
		$page.find('.deadline').datepicker({
			autoclose: true,
			startDate: new Date()
		}).on('hide', function() {
			$form.data('bootstrapValidator')
				.updateStatus('deadline', 'NOT_VALIDATED', null)
				.validateField('deadline');
		});

		$k.util.summernote($page.find('#summernote'), {
			ctx: '${ctx}'
		});
		new Attachment($page.find('#attachment'), {
			uploadUrl: '${ctx}/api/fileUpload',
			deleteUrl: '${ctx}/api/fileDelete',
		});
		
		if (method == 'edit') {
			$page.find('select[name="level"]').val('${item.level}');
			$('#summernote').summernote('code', '${item.content}');
		}
		
		$page
		.on('click', '.btn-item-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('content', $('#summernote').summernote('code'));
				
				var fileList = new Array();
				$form.find('.attachment-list li').each(function(k, elem) {
					var filename = $(elem).data('filename');
					var filepath = $(elem).data('filepath');
					fileList.push(filename + '?' + filepath);
				});
				formData.append('fileList', fileList);
				
				$.ajax({
					url: '${ctx}/api/website/item/create',
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
								window.history.back();
							});
						} else {
							swal('', '操作失败', 'error');
						}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-item-edit', function() {
			var validator = $form.data('bootstrapValidator');
			validator.removeField('uploadImage');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('itemId', '${item.id}');
				formData.append('content', $('#summernote').summernote('code'));
				
				var fileList = new Array();
				$form.find('.attachment-list li').each(function(k, elem) {
					var fileid = $(elem).data('fileid');
					if (!fileid) {
						var filename = $(elem).data('filename');
						var filepath = $(elem).data('filepath');
						fileList.push(filename + '?' + filepath);
					}
				});
				formData.append('fileList', fileList);
				
				$.ajax({
					url: '${ctx}/api/website/item/update',
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
								window.history.back();
							});
						} else {
							swal('', '操作失败', 'error');
						}
					}
				});
			}
		})
		.on('click', '.btn-item-cancel', function() {
			window.history.back();
		})
		.on('click', '.btn-itemFile-delete', function(e) {
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
			}, function() {
				var fileid = $this.closest('li').data('fileid');
				$.ajax({
					url: '${ctx}/api/website/item/fileDelete',
					data: {
						itemFileId: fileid
					},
					success: function(ret) {
						if (ret.code == 0) {
							toastr['success'](ret.msg);
							$this.closest('li').remove();
						} else {
							toastr['error'](ret.msg);
						}
					},
					error: function(err) {}
				});
			});
		});
		
	</script>
</body>

</html>