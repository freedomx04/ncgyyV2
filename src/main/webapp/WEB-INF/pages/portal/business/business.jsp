<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.page-business .main ul {
		line-height: 36px;
		font-size: 16px;
	}
	</style>
</head>

<body class="gray-bg page-business">
	<!-- header -->
	<%@ include file="/WEB-INF/pages/portal/business/header.jsp"%>
	
	<div class="main">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 padding-0">
					<div class="info-main white-bg">
						<div class="info-title" style="margin-top: 0;">招商动态</div>
						<div class="info-content">
							<ul class="list-unstyled">
								<c:forEach var="dynamic" items="${dynamics}">
									<li class="text-ellipsis"><a href="${ctx}/business/dynamic/info?dynamicId=${dynamic.id}" target="_blank">${dynamic.title}</a></li>
								</c:forEach>
							</ul>
						</div>
						
						<div class="info-title">招商政策</div>
						<div class="info-content">
							<ul class="list-unstyled">
								<c:forEach var="policy" items="${policys}">
									<li class="text-ellipsis"><a href="${ctx}/business/policy/info?policyId=${policy.id}" target="_blank">${policy.title}</a></li>
								</c:forEach>
							</ul>
						</div>
						
						<div class="info-title">招商项目</div>
						<div class="info-content">
							<ul class="list-unstyled">
								<c:forEach var="business" items="${businesss}">
									<li class="text-ellipsis"><a href="${ctx}/business/item/info?itemId=${business.id}" target="_blank">${business.name}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4 hidden-xs">
					<div class="white-bg" style="padding: 20px 0">
						<div class="info-title" style="margin: 0 0 20px 20px;">我要留言</div>
						<form class="form-horizontal" role="form" id="form-message" autocomplete="off">
							<div class="form-group">
	                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>姓名</label>
	                            <div class="col-sm-8">
	                                <input type="text" class="form-control" name="name" required>
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>电话</label>
	                            <div class="col-sm-8">
	                                <input type="text" class="form-control" name="contact" required>
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>地区</label>
	                            <div class="col-sm-8">
	                                <input type="text" class="form-control" name="address" required>
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="email" class="col-sm-3 control-label">邮箱</label>
	                            <div class="col-sm-8">
	                                <input type="text" class="form-control" name="email">
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="qq" class="col-sm-3 control-label">QQ</label>
	                            <div class="col-sm-8">
	                                <input type="text" class="form-control" name="qq">
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="content" class="col-sm-3 control-label">留言</label>
	                            <div class="col-sm-8">
	                                <textarea class="form-control" name="content" style="resize:none; height: 150px;"></textarea>
	                            </div>
	                        </div>
	                        
	                        <div class="text-center">
	                        	<button type="button" class="btn btn-primary btn-confirm" style="width: 150px;">提交</button>
	                        </div>
	                        
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.page-business');
		
		var $form = $('#form-message');
		$k.util.bsValidator($form);
		
		$page.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]);
            	$.ajax({
				    url: '${ctx}/api/website/business/message/create',
	            	type: 'post',
	            	data: formData,
	        		processData: false,
	                contentType: false,
	                cache: false, 
	                success: function(ret) {
	                	if (ret.code == 0) {
	                		toastr['success']('提交成功！');
	                		$form.bootstrapValidator('resetForm', true);
	                        $(this).removeData('bs.modal');
	                	} else {
	                		toastr['error'](ret.msg);
	                	}
	                },
	                error: function(err) {}
	            });	
            }
		});
		
	})( jQuery );
	</script>
	
</body>
</html>