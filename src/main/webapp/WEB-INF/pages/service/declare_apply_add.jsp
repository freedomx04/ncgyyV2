<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/attachment.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>申报</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/iCheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-apply-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-apply">
					
					<div class="form-group">
						<label for="description" class="col-sm-2 control-label">申报描述</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="description" style="resize:none; height: 150px;">${apply.description}</textarea>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="attachment" class="col-sm-2 control-label">附件</label>
						<div class="col-sm-9 apply-attachment">
							<button type="button" class="btn btn-white btn-attachment-dialog" data-toggle="modal" data-target="#modal-attachment-dialog">
		                        <i class="fa fa-paperclip fa-fw"></i>添加附件
		                    </button>
		                    <ul class="attachment-list list-unstyled project-files">
		                   		<c:forEach var="file" items="${apply.fileList}">
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
                        <div class="col-sm-4 col-sm-offset-3">
                            <c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-submit btn-apply-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-apply-edit">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-apply-cancel">
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
	;(function( $ ) {
		var $page = $('.body-apply-add');
        var $form = $page.find('#form-apply');
        var $applyFile = $page.find('.apply-attachment');
        var method = '${method}';
        
        $k.util.bsValidator($form);
		attachment($applyFile);
        
        if (method == 'edit') {
			$k.util.attachmentIcon($applyFile.find('.attachment-list'));
        }
        
        $page
        .on('click', '.btn-apply-add', function() {
        	var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	var attachmentList = new Array();
            	
				$form.find('.attachment-list li').each(function(k, elem) {
					var filename = $(elem).data('filename');
					var filepath = $(elem).data('filepath');
					attachmentList.push(filename + '?' + filepath);
				});
				formData.append('attachmentList', attachmentList);
				
				formData.append('declareId', $k.util.getRequestParam('declareId'));
				formData.append('enterpriseId', $k.util.getRequestParam('enterpriseId'));
            	
            	$.ajax({
            		url: '${ctx}/api/apply/create',
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
                                window.location.href = './declareEP?';
                            });
                    	} else {
                    		swal('', '操作失败', 'error');
                    	}
                    },
                    error: function(err) {}
            	});
            }
        })
        .on('click', '.btn-apply-edit', function() {
        	var validator = $form.data('bootstrapValidator');
        	validator.removeField('uploadImage');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	formData.append('applyId', '${apply.id}');
				
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
            		url: '${ctx}/api/apply/update',
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
                                window.location.href = './declareEP';
                            });
                    	} else {
                    		swal('', '操作失败', 'error');
                    	}
                    },
                    error: function(err) {}
            	});
            }
        })
        .on('click', '.btn-apply-cancel', function() {
        	window.location.href = './declareEP';
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
					url: '${ctx}/api/apply/fileDelete',
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
        
	})( jQuery );
	</script>
	
</body>

</html>