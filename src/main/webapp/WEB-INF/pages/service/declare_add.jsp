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
     <link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-declare-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-declare">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>申报项目名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="name" value="${declare.name}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="fileList" class="col-sm-3 control-label"><i class="form-required">*</i>申报模板</label>
                        <div class="col-sm-9">
                        	<input id="fileList" name="fileList" type="file" multiple class="file-loading" data-min-file-count="1">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="startTime" class="col-sm-3 control-label">申报开始时间</label>
                        <div class="col-sm-5 input-group date startTime" style="padding-left: 15px; padding-right: 15px;">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="startTime" value="${declare.startTime}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="endTime" class="col-sm-3 control-label">申报结束时间</label>
                        <div class="col-sm-5 input-group date endTime" style="padding-left: 15px; padding-right: 15px;">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="productionTime" value="${declare.endTime}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="description" class="col-sm-3 control-label">申报详细描述</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" name="description" style="resize:none; height: 150px;">${declare.description}</textarea>
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
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
    
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-declare-add');
        var $form = $page.find('#form-declare');
        var method = '${method}';
        
        $page.find(".i-checks").iCheck({
        	checkboxClass: "icheckbox_square-green", 
        	radioClass: "iradio_square-green"
        });
        
        $page.find(".startTime").datepicker({
    		autoclose: true
    	});
        $page.find(".endTime").datepicker({
    		autoclose: true
    	});
        
        if (method == 'add') {
        	$page.find("#fileList").fileinput({
        		uploadUrl: '${ctx}/api/declare/uploadFiles',
                maxFilePreviewSize: 10240
            });
        } else {
        	$page.find('input[name="name"]').attr('disabled', 'disabled');
        	
        	$k.util.fileinput($page.find('#uploadImage'), {
        		initialPreview:	'<img src="${ctx}${declare.imagePath}" class="file-preview-image" style="max-width: auto; max-height: 200px;">',
			    initialCaption: '${declare.imagePath}',
        	});
        	
        	var pointStatus = '${declare.pointStatus}';
        	if (pointStatus == 1) {
        		$page.find('.pointStatus').iCheck('check');
        	}
        }
        
        $k.util.bsValidator($form, {
        	excluded: [':disabled'],
        	fields: {
        		name: {
        			validators: {
        				threshold: 6,
 	                    remote: {
 	                    	url: '${ctx}/api/declare/exist',
 	                    	message: '企业已存在',
 	                    	delay: 2000,
 	                    	type: 'GET',
 	                    }
 					} 
 				},
             }
        });
		
        $page
        .on('click', '.btn-declare-add', function() {
        	var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	var pointStatus = 0;
            	if ($(".pointStatus input").is(':checked')) {
            		pointStatus = 1;
            	}
            	formData.append('pointStatus', pointStatus);
            	
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
                                window.location.href = './declareList?';
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
            	var pointStatus = 0;
            	if ($(".pointStatus input").is(':checked')) {
            		pointStatus = 1;
            	}
            	formData.append('declareId', '${declare.id}');
            	formData.append('pointStatus', pointStatus);
            	
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
                                window.location.href = './declareList?';
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
        	window.location.href = './declareList';
        });
        
	})( jQuery );
	</script>
	
</body>

</html>