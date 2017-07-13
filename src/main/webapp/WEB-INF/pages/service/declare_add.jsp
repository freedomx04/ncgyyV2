<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>网上申报新增</title>
	
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

<body class="gray-bg body-declare-add">
	<div class="wrapper wrapper-content">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-declare">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>申报项目名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="title" value="${declare.title}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="startTime" class="col-sm-3 control-label"><i class="form-required">*</i>申报开始时间</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control layer-date" name="startTime" id="startTime" style="max-width: none;" value="${declare.startTime}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="endTime" class="col-sm-3 control-label"><i class="form-required">*</i>申报结束时间</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control layer-date" name="endTime" id="endTime" style="max-width: none;" value="${declare.endTime}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="description" class="col-sm-3 control-label">申报详细描述</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" name="description" style="resize:none; height: 150px;">${declare.description}</textarea>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="attachment" class="col-sm-3 control-label">附件</label>
						<div class="col-sm-5">
							<div id="attachment">
								<button type="button" class="btn btn-white btn-attachment-add">
			                        <i class="fa fa-paperclip fa-fw"></i>添加附件
			                    </button>
			                    <ul class="attachment-list list-unstyled project-files">
			                   		<c:forEach var="file" items="${declare.fileList}">
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
                        <div class="col-sm-4 col-sm-offset-3">
                            <c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-submit btn-declare-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-declare-edit">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-declare-cancel">
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
	<script type="text/javascript" src="${ctx}/local/attachment.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-declare-add');
        var $form = $page.find('#form-declare');
        var method = '${method}';
        var userId = ${user.id};
		
		new Attachment($page.find('#attachment'), {
			uploadUrl: '${ctx}/api/fileUpload',
			deleteUrl: '${ctx}/api/fileDelete',
		});
        
		laydate({
			elem:"#startTime", 
			event:"focus", 
			format: "YYYY/MM/DD hh:mm:ss", 
			istime: true,
			choose: function(dates){ //选择好日期的回调
				var end = $form.find("input[name='endTime']").val();
				
				if (new Date(dates) <=  new Date(end)) {
					$form.bootstrapValidator('updateStatus', 'startTime', 'VALID', null);
				} else {
					$form.bootstrapValidator('updateStatus', 'startTime', 'INVALID', null);
					$form.find("input[name='startTime']").parent().find("small").text("开始时间不能大于结束时间");
				}
			}
		});
		laydate({
			elem:"#endTime", 
			event:"focus", 
			format:"YYYY/MM/DD hh:mm:ss", 
			istime: true,
			choose: function(dates){ //选择好日期的回调
				var begin = $form.find("input[name='startTime']").val();
				
				if (new Date(dates) >=  new Date(begin)) {
					$form.bootstrapValidator('updateStatus', 'endTime', 'VALID');
					$form.bootstrapValidator('updateStatus', 'startTime', 'VALID');
				} else {
					$form.bootstrapValidator('updateStatus', 'endTime', 'INVALID');
					$form.find("input[name='endTime']").parent().find("small").text("开始时间不能大于结束时间");
				}
			}
		});
        
        $page
        .on('click', '.btn-declare-add', function() {
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
				formData.append('userId', userId);
            	
            	$.ajax({
            		url: '${ctx}/api/declare/create',
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
                                window.location.href = './declareGV?';
                            });
                    	} else {
                    		swal('', '操作失败', 'error');
                    	}
                    },
                    error: function(err) {}
            	});
            }
        })
        .on('click', '.btn-declare-edit', function() {
        	var validator = $form.data('bootstrapValidator');
        	validator.removeField('uploadImage');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	formData.append('declareId', '${declare.id}');
            	formData.append('userId', 1);
				
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
            		url: '${ctx}/api/declare/update',
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
                                window.location.href = './declareGV';
                            });
                    	} else {
                    		swal('', '操作失败', 'error');
                    	}
                    },
                    error: function(err) {}
            	});
            }
        })
        .on('click', '.btn-declare-cancel', function() {
        	window.location.href = './declareGV';
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
					url: '${ctx}/api/declare/fileDelete',
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
        
     // 添加验证器
        $form.bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            excluded: [':disabled'],
            fields: {
            	startTime: {
            		 validators: {  
           	            notEmpty: {  
           	            message: '开始时间不能为空'  
           	            }  
           	         }  
				},
				endTime: {
           		 validators: {  
          	            notEmpty: {  
          	            message: '结束时间不能为空'  
          	            }  
          	         }  
				}
            }
        });
	})( jQuery );
	</script>
	
</body>

</html>