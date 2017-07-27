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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-version-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-version">
					<div class="form-group">
						<label for="code" class="col-sm-3 control-label"><i class="form-required">*</i>版本号</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="code" value="${version.code}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="releaseTime" class="col-sm-3 control-label"><i class="form-required">*</i>发布时间</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control releaseTime" name="releaseTime" value="${version.releaseTime}" required>
                        </div>
					</div>
					
					<c:if test="${method != 'detail'}">
					<div class="form-group" >
						<label for="content" class="col-sm-3 control-label">版本内容</label>
						<div class="col-sm-7">
							<div id="summernote"></div>
						</div>
					</div>
					</c:if>
					
					<c:if test="${method == 'detail'}">
					<div class="form-group" >
						<label for="content" class="col-sm-3 control-label">版本内容</label>
						<div class="col-sm-7">
							<div class="disabled" style="border: 1px solid #e5e6e7; padding: 6px 12px;">${version.content}</div>
						</div>
					</div>
					</c:if>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-3">
                            <c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-version-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-version-edit">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-version-cancel">
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
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-version-add');
		var $form = $page.find('#form-version');
		var type = '${type}';
		var method = '${method}';
		
		$page.find(".releaseTime").datepicker({
			todayBtn : "linked",
    		autoclose: true,
    		todayHighlight : true
    	}).on('hide', function(e) {
    		$form.data('bootstrapValidator')
    			.updateStatus('releaseTime', 'NOT_VALIDATED', null)
    			.validateField('releaseTime');
    	});
		
		$k.util.bsValidator($form);
		
		if (method == 'add') {
			$k.util.summernote($page.find('#summernote'), {
				toolbar: [['para', ['ul', 'ol', 'paragraph']]],
				minHeight: 250,
				placeholder: '正文内容'
			});
		} else if (method == 'edit') {
			$k.util.summernote($page.find('#summernote'), {
				toolbar: [['para', ['ul', 'ol', 'paragraph']]],
				minHeight: 250,
				placeholder: '正文内容'
			});
			$('#summernote').summernote('code', '${version.content}');
		} else {
			$page.find('.form-required').remove();
			$page.find('input').addClass('disabled');
		}
		
		$page
		.on('click', '.btn-version-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('content', $('#summernote').summernote('code'));
				
				$.ajax({
					url: '${ctx}/api/version/create',
					type: 'post',
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
                                window.location.href = './versionList';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-version-edit', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('versionId', '${version.id}');
				formData.append('content', $('#summernote').summernote('code'));
				
				$.ajax({
					url: '${ctx}/api/version/update',
					type: 'post',
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
                                window.location.href = './versionList';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-version-cancel', function() {
			window.location.href = './versionList';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>