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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-appeal-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-appeal">
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label"><i class="form-required">*</i>诉求标题</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="title" value="${appeal.title}" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="appealTypeId" class="col-sm-3 control-label"><i class="form-required">*</i>诉求类型</label>
						<div class="col-sm-5">
							<select class="form-control" name="appealTypeId" required> 
								<option value="">请选择诉求类型</option>
								<c:forEach var="appealType" items="${appealTypeList}">
									<option value="${appealType.id}">${appealType.name}</option>
								</c:forEach> 
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="description" class="col-sm-3 control-label"><i class="form-required">*</i>诉求详情</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" name="description" style="resize:none; height: 150px;" required>${appeal.description}</textarea>
                        </div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-3">
                            <c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-appeal-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-appeal-edit">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-appeal-cancel">
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

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-appeal-add');
		var $form = $page.find('#form-appeal');
		var method = '${method}';
		var enterpriseId = '${enterpriseId}';
		
		$k.util.bsValidator($form);
		
		if(method == 'edit') {
			$page.find('select[name="appealTypeId"]').val(${appeal.appealType.id});
		}
		
		$page
		.on('click', '.btn-appeal-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('enterpriseId', enterpriseId);
				
				$.ajax({
					url: '${ctx}/api/appeal/create',
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
                                window.location.href = './appealEnterprise';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
                    },
                    error: function(err) {}
				});
			}
		})
		.on('click', '.btn-appeal-edit', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('appealId', '${appeal.id}');
				
				$.ajax({
            		url: '${ctx}/api/appeal/update',
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
                                window.location.href = './appealEnterprise';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
                    },
                    error: function(err) {}
            	});
			}
		})
		.on('click', '.btn-appeal-cancel', function() {
			window.location.href = './appealEnterprise';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>