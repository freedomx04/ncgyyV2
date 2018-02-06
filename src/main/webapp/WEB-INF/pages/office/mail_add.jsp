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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/chosen/chosen.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	
</head>

<body class="gray-bg body-mail-add">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-mail">
					<div class="form-group">
						<label for="title" class="col-sm-1 control-label"><i class="form-required">*</i>收件人</label>
						<div class="col-sm-10">
                            <select data-placeholder="请输入或选择收件人" class="chosen-select" style="width: 100%;" multiple>
                            	<c:forEach var="user" items="${userList}">
                            		<option value="${user.username}">${user.username}</option>
                            	</c:forEach>
                            </select>
                            <small class="help-block" data-bv-validator="notEmpty" data-bv-for="title" data-bv-result="INVALID" style="display: none;">请填写必填项目</small>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="title" class="col-sm-1 control-label"><i class="form-required">*</i>主题</label>
						<div class="col-sm-10">
                            <input type="text" class="form-control" name="title" value="${mail.title}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="content" class="col-sm-1 control-label">正文</label>
                        <div class="col-sm-10">
                            <div id="summernote"></div>
                        </div>
					</div>
					
					<div class="form-group">
                        <label for="attachment" class="col-sm-1 control-label">附件</label>
                        <div class="col-sm-10">
                            <div id="attachment">
                                <button type="button" class="btn btn-white btn-attachment-add">
                                    <i class="fa fa-paperclip fa-fw"></i>添加附件
                                </button>
                                <ul class="attachment-list list-unstyled project-files">
                                    <c:forEach var="file" items="${mail.fileList}">
                                        <li data-fileid="${file.id}" data-filename="${file.filename}" data-filepath="${file.filepath}">
                                            ${file.filename}
                                            <a class="btn-articleFile-delete" style="color: #337ab7;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
                                        </li>
                                    </c:forEach> 
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="hr-line-dashed"></div>
                    
                    <div class="form-group">
                        <div class="col-sm-4 col-sm-offset-1">
                        	<c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-mail-send">
                                <i class="fa fa-send-o fa-fw"></i>发送
                            </button>
                            <button type="button" class="btn btn-white btn-mail-draft-add">
                                <i class="fa fa-pencil fa-fw"></i>存草稿
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-fw btn-mail-draft-send">
                                <i class="fa fa-send-o fa-fw"></i>发送
                            </button>
                            <button type="button" class="btn btn-white btn-fw btn-mail-draft-edit">
                                <i class="fa fa-pencil fa-fw"></i>存草稿
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-fw btn-mail-cancel">取消</button>
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
	<script type="text/javascript" src="${ctx}/local/attachment.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/chosen/chosen.jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-mail-add');
		var $form = $page.find('#form-mail');
		var $select = $form.find('.chosen-select');
		var userId = '${user.id}';
		
		var type = '${type}';
		var method = '${method}';
		
		$k.util.bsValidator($form);
		
		new Attachment($page.find('#attachment'), {
            uploadUrl: '${ctx}/api/fileUpload',
            deleteUrl: '${ctx}/api/fileDelete',
        });
		
		$k.util.summernote($page.find('#summernote'), {
			ctx: '${ctx}'
		});
		
		if (method == 'add') {
			$k.util.chosen($select);
		} else {
			$('#summernote').summernote('code', '${mail.content}');
			$k.util.chosen($select);
			var receivers = '${mail.receivers}';
			var selectArr = receivers.split(',');
			$select.val(selectArr);
			$select.trigger("chosen:updated");
		}
		
		$page
		.on('click', '.btn-mail-send', function() {
			var userList = $form.find('.chosen-select').val();
			if (userList == null) {
				$k.util.toast({
					type: 'error',
					msg: '请输入或者选择收件人',
					positionClass: 'toast-top-full-width'
				});
				return;
			}
			
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				formData.append('receivers', userList.join(','));
				formData.append('userId', userId);
                formData.append('content', $('#summernote').summernote('code'));
				var attachmentList = new Array();
                $form.find('.attachment-list li').each(function(k, elem) {
                    var filename = $(elem).data('filename');
                    var filepath = $(elem).data('filepath');
                    attachmentList.push(filename + '?' + filepath);
                });
                formData.append('attachmentList', attachmentList);
                
                $.ajax({
                	url: '${ctx}/api/mail/send',
                	type: 'post',
                	data: formData,
                    processData: false,
                    contentType: false,
                    cache: false, 
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal({
                                title: '',
                                text: '发送成功',
                                type: 'success'
                            }, function() {
                                window.location.href = './mailList';
                            });
                        } else {
                            swal('', '发送失败', 'error');
                        }
                    },
                    error: function(err) {}
                });
			}
		})
		.on('click', '.btn-mail-draft-add', function() {
			var userList = $form.find('.chosen-select').val();
			if (userList == null) {
				$k.util.toast({
					type: 'error',
					msg: '请输入或者选择收件人',
					positionClass: 'toast-top-full-width'
				});
				return;
			}
			
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				formData.append('receivers', userList.join(','));
				formData.append('userId', userId);
                formData.append('content', $('#summernote').summernote('code'));

				var attachmentList = new Array();
                $form.find('.attachment-list li').each(function(k, elem) {
                    var filename = $(elem).data('filename');
                    var filepath = $(elem).data('filepath');
                    attachmentList.push(filename + '?' + filepath);
                });
                formData.append('attachmentList', attachmentList);
                
                $.ajax({
                	url: '${ctx}/api/mail/draftAdd',
                	type: 'post',
                	data: formData,
                    processData: false,
                    contentType: false,
                    cache: false, 
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal({
                                title: '',
                                text: '保存成功',
                                type: 'success'
                            }, function() {
                                window.location.href = './mailList';
                            });
                        } else {
                            swal('', '操作失败', 'error');
                        }
                    },
                    error: function(err) {}
                });
			}
		})
		.on('click', '.btn-mail-draft-send', function() {
			var userList = $form.find('.chosen-select').val();
			if (userList == null) {
				$k.util.toast({
					type: 'error',
					msg: '请输入或者选择收件人',
					positionClass: 'toast-top-full-width'
				});
				return;
			}
			
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				formData.append('mailId', '${mail.id}');
				formData.append('receivers', userList.join(','));
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
					url: '${ctx}/api/mail/draftSend',
					type: 'post',
					data: formData,
                    processData: false,
                    contentType: false,
                    cache: false, 
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal({
                                title: '',
                                text: '发送成功',
                                type: 'success'
                            }, function() {
                                window.location.href = './mailList';
                            });
                        } else {
                            swal('', '操作失败', 'error');
                        }
                    },
                    error: function(err) {}
				});
			}
		})
		.on('click', '.btn-mail-draft-edit', function() {
			var userList = $form.find('.chosen-select').val();
			if (userList == null) {
				$k.util.toast({
					type: 'error',
					msg: '请输入或者选择收件人',
					positionClass: 'toast-top-full-width'
				});
				return;
			}
			
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				formData.append('mailId', '${mail.id}');
				var userList = $form.find('.chosen-select').val();
				formData.append('receivers', userList.join(','));
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
                	url: '${ctx}/api/mail/draftUpdate',
                	type: 'post',
                	data: formData,
                    processData: false,
                    contentType: false,
                    cache: false, 
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal({
                                title: '',
                                text: '保存成功',
                                type: 'success'
                            }, function() {
                                window.location.href = './mailList';
                            });
                        } else {
                            swal('', '操作失败', 'error');
                        }
                    },
                    error: function(err) {}
                });
			}
		})
		.on('click', '.btn-mail-cancel', function() {
			window.history.back();
		});
		
	})( jQuery );
	</script>
	
</body>
</html>