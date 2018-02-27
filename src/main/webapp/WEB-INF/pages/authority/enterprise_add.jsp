<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/avatar.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/iCheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/cropper/cropper.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sitelogo/sitelogo.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-enterprise-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>${title}</h2>
				</div>
			
				<form class="form-horizontal" role="form" autocomplete="off" id="form-enterprise">
					<div class="form-group">
						<label for="avatar" class="col-sm-3 control-label">企业图标</label>
						<div id="crop-avatar" class="col-md-5">
							<div class="avatar-view" title="点击修改企业图标" style="width: 160px; height: 160px;">
								<c:if test="${method=='add'}">
									<img src="${ctx}/api/avatar/default_enterprise" alt="企业图标">
								</c:if>
								<c:if test="${method=='edit'}">
									<img src="${ctx}/api/avatar/${enterprise.avatar}" alt="企业图标">
								</c:if>
						    </div>
						</div>
					</div>
				
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>企业名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="name" value="${enterprise.name}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="areaId" class="col-sm-3 control-label"><i class="form-required">*</i>所属园区</label>
						<div class="col-sm-5">
							<select class="form-control" name="areaId" required> 
								<option value="">请选择</option>
								<c:forEach var="area" items="${areaList}">
									<option value="${area.id}">${area.name}</option>
								</c:forEach> 
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="industryId" class="col-sm-3 control-label"><i class="form-required">*</i>行业类别</label>
						<div class="col-sm-5">
							<select class="form-control" name="industryId" required> 
								<option value="">请选择</option>
								<c:forEach var="industry" items="${industryList}">
									<option value="${industry.id}">${industry.name}</option>
								</c:forEach> 
							</select>
						</div>
					</div>
						
					<div class="form-group">
						<label for="mainProduct" class="col-sm-3 control-label"><i class="form-required">*</i>主要产品</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="mainProduct" value="${enterprise.mainProduct}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="principal" class="col-sm-3 control-label"><i class="form-required">*</i>企业负责人</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="principal" value="${enterprise.principal}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="telephone" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="telephone" value="${enterprise.telephone}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>企业地址</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="address" value="${enterprise.address}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="pointStatus" class="col-sm-3 control-label">重点企业</label>
						<div class="col-sm-5">
							<label class="checkbox-inline i-checks pointStatus">
								<input type="checkbox">
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="productionTime" class="col-sm-3 control-label">投产时间</label>
                        <div class="col-sm-5 input-group date productTime" style="padding-left: 15px; padding-right: 15px;">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            <input type="text" class="form-control" name="productionTime" value="${enterprise.productionTime}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="representative" class="col-sm-3 control-label">企业法人</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="representative" value="${enterprise.representative}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="shareholder" class="col-sm-3 control-label">主要股东</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="shareholder" value="${enterprise.shareholder}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="registeredCapital" class="col-sm-3 control-label">注册资金</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="registeredCapital" value="${enterprise.registeredCapital}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="alterRecording" class="col-sm-3 control-label">变更记录</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" name="alterRecording" style="resize:none; height: 100px;">${enterprise.alterRecording}</textarea>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="nationalTax" class="col-sm-3 control-label">国税识别码</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="nationalTax" value="${enterprise.nationalTax}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="localTax" class="col-sm-3 control-label">地税识别码</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="localTax" value="${enterprise.localTax}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="introduction" class="col-sm-3 control-label">企业简介</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" name="introduction" style="resize:none; height: 150px;">${enterprise.introduction}</textarea>
                        </div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-3">
                            <c:if test="${method == 'add'}">
                            	<button type="button" class="btn btn-primary btn-fw btn-enterprise-add">确定</button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            	<button type="button" class="btn btn-primary btn-fw btn-enterprise-edit">确定</button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-fw btn-enterprise-cancel">取消</button>
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
    <script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/cropper/cropper.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sitelogo/sitelogo.js"></script>
    
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-enterprise-add');
        var $form = $page.find('#form-enterprise');
        var method = '${method}';
        
        $k.util.bsValidator($form);
        
        $page.find(".i-checks").iCheck({
        	checkboxClass: "icheckbox_square-green", 
        	radioClass: "iradio_square-green"
        });
        
        $page.find(".productTime").datepicker({
    		autoclose: true
    	});
        
        if (method == 'edit') {
        	$page.find('select[name="areaId"]').val(${enterprise.area.id});
        	$page.find('select[name="industryId"]').val(${enterprise.industry.id});
        	var pointStatus = '${enterprise.pointStatus}';
        	if (pointStatus == 1) {
        		$page.find('.pointStatus').iCheck('check');
        	}
        }
        
        $page
        .on('click', '.btn-enterprise-add', function() {
        	var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
				formData.append('avatar', $k.util.getAvatar($page.find('.avatar-view > img')));
            	
            	var pointStatus = 0;
            	if ($(".pointStatus input").is(':checked')) {
            		pointStatus = 1;
            	}
            	formData.append('pointStatus', pointStatus);
            	
            	$.ajax({
            		url: '${ctx}/api/enterprise/create',
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
                                window.location.href = '${ctx}/authority/enterprise';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
                    },
                    error: function(err) {}
            	});
            }
        })
        .on('click', '.btn-enterprise-edit', function() {
        	var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	var pointStatus = 0;
            	if ($(".pointStatus input").is(':checked')) {
            		pointStatus = 1;
            	}
            	formData.append('enterpriseId', '${enterprise.id}');
            	formData.append('pointStatus', pointStatus);
            	formData.append('avatar', $k.util.getAvatar($page.find('.avatar-view > img')));
            	
            	$.ajax({
            		url: '${ctx}/api/enterprise/update',
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
                            	window.location.href = '${ctx}/authority/enterprise';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
                    },
                    error: function(err) {}
            	});
            }
        })
        .on('click', '.btn-enterprise-cancel', function() {
        	window.location.href = '${ctx}/authority/enterprise';
        });
        
	})( jQuery );
	</script>
	
</body>

</html>