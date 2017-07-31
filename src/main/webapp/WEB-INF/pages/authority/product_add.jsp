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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-product-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
	 			<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-product">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label"><i class="form-required">*</i>产品名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="name" value="${product.name}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="uploadImage" class="col-sm-2 control-label"><i class="form-required">*</i>产品图片</label>
						<div class="col-sm-8">
							<input id="uploadImage" type="file" class="file-loading" name="uploadImage" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="specification" class="col-sm-2 control-label"><i class="form-required">*</i>规格参数</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="specification" value="${product.specification}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="introduction" class="col-sm-2 control-label"><i class="form-required">*</i>产品介绍</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" name="introduction" style="resize:none; height: 150px;" required>${product.introduction}</textarea>
                        </div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-2">
                            <c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-product-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-product-edit">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-product-cancel">
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-product-add');
		var $form = $page.find('#form-product');
		var method = '${method}';
		
		var enterpriseId = '${enterpriseId}';
		if (enterpriseId == '') {
			enterpriseId = '${product.enterprise.id}';
		}
		
		$k.util.bsValidator($form);
		
		if (method == 'add') {
			$k.util.fileinput($page.find('#uploadImage'));
		} else {
			$k.util.fileinput($page.find('#uploadImage'), {
				initialPreview:	'<img src="${ctx}${product.imagePath}" class="file-preview-image" style="max-width: auto; max-height: 200px;">',
			    initialCaption: '${product.imagePath}',
			});
		}
		
		$page
		.on('click', '.btn-product-add', function() {
			var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	formData.append('enterpriseId', ${enterpriseId});
            	
            	$.ajax({
            		url: '${ctx}/api/product/create',
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
		.on('click', '.btn-product-edit', function() {
			var validator = $form.data('bootstrapValidator');
        	validator.removeField('uploadImage');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	formData.append('productId', '${product.id}');
            	
            	$.ajax({
            		url: '${ctx}/api/product/update',
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
		.on('click', '.btn-product-cancel', function() {
			window.history.back();
		});
		
	})( jQuery );
	</script>
	
</body>

</html>