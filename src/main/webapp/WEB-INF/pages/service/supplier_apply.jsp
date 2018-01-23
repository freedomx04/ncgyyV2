<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/avatar.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>供应商申请</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/cropper/cropper.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sitelogo/sitelogo.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-supplier-apply .license-image:HOVER {
		cursor: pointer;
	}
	</style>
</head>

<body class="gray-bg body-supplier-apply">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>供应商申请</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-supplier">
					<div class="form-group">
						<label for="type" class="col-sm-3 control-label">供应商类别</label>
						<div class="col-sm-5">
							<c:choose>
								<c:when test="${type == 1}">
									<p class="form-control-static">人才服务供应商</p>
								</c:when>
								<c:when test="${type == 2}">
									<p class="form-control-static">招商服务供应商</p>
								</c:when>
								<c:when test="${type == 3}">
									<p class="form-control-static">融资服务供应商</p>
								</c:when>
								<c:when test="${type == 4}">
									<p class="form-control-static">物流服务供应商</p>
								</c:when>
							</c:choose>
						</div>
					</div>
				
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>供应商名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="name" value="${supplier.name}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for=imagePath class="col-sm-3 control-label"><i class="form-required">*</i>供应商图片</label>
						<div id="crop-avatar" class="col-sm-5">
							<div class="avatar-view" title="点击修改图片" style="width: 200px; height: 200px;">
								<img src="${ctx}/api/avatar/default_enterprise" alt="供应商图片">
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="profession" class="col-sm-3 control-label"><i class="form-required">*</i>行业类别</label>
						<div class="col-sm-5">
							<select class="form-control" name="profession" required>
								<c:forEach var="profession" items="${professions}">
									<option value="${profession}">${profession}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="property" class="col-sm-3 control-label"><i class="form-required">*</i>企业性质</label>
						<div class="col-sm-5">
							<select class="form-control" name="property" required>
								<c:forEach var="property" items="${propertys}">
									<option value="${property}">${property}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="scale" class="col-sm-3 control-label"><i class="form-required">*</i>企业规模</label>
						<div class="col-sm-5">
							<select class="form-control" name="scale" required>
								<c:forEach var="scale" items="${scales}">
									<option value="${scale}">${scale}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>地址</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="address" value="${supplier.address}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="contactUser" class="col-sm-3 control-label"><i class="form-required">*</i>联系人</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="contactUser" value="${supplier.contactUser}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="contact" value="${supplier.contact}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="phone" class="col-sm-3 control-label">座机</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="phone" value="${supplier.phone}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="fax" class="col-sm-3 control-label">传真</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="fax" value="${supplier.fax}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="introduction" class="col-sm-3 control-label">简介</label>
						<div class="col-sm-5">
							<textarea class="form-control" name="introduction" style="resize:none; height: 100px;">${supplier.introduction}</textarea>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<label for="license" class="col-sm-3 control-label"><i class="form-required">*</i>营业执照</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="license" value="${supplier.license}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="licensePath" class="col-sm-3 control-label"><i class="form-required">*</i>营业执照图片</label>
						<div class="col-sm-5">
							<input class="input-license-image" type="file" style="display:none" 
								accept="image/jpg, image/jpeg, image/webp, image/bmp, image/png, image/svg, image/gif">
							<button type="button" class="form-control btn btn-white btn-license-add" style="width: 120px;">
								<i class="fa fa-file-image-o fa-fw"></i>上传图片
							</button>
							<img class="license-image hide" src="${ctx}${supplier.licensePath}" data-image-path="${supplier.licensePath}" 
								style="max-width: 100%; max-height: 100%;" data-toggle="tooltip" data-placement="top" title="点击修改图片">
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-3">
                        	<button type="button" class="btn btn-primary btn-fw btn-supplier-submit">提交</button>
                        	<button type="button" class="btn btn-white btn-fw btn-apply-back">返回</button>
                        </div>
                   </div>
				</form>
				
				<div class="apply-info hide text-center">
					<img src="${ctx}/img/operate-success.png" style="max-width: 100px;">
					<h3 style="padding: 5px;">申请提交完成，正在为你审核...</h3>
					<p>我们会在3个工作日内完成供应商信息的审核工作，审核通过后，你可以使用供应商所提供的平台服务。</p>
					<p><button type="button" class="btn btn-primary btn-fw btn-apply-back">返回</button></p>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/cropper/cropper.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sitelogo/sitelogo.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-supplier-apply');
		var $form = $page.find('#form-supplier');
		var type = ${type};
		var userId = '${userId}';
		
		$k.util.bsValidator($form);
		
		$page
		.on('click', '.btn-license-add', function() {
			$page.find('.input-license-image').click();
		})
		.on('click', '.license-image', function() {
			$page.find('.input-license-image').click();
		})
		.on('change', '.input-license-image', function() {
			var formData = new FormData();
			formData.append('imageFile', this.files[0]);
			
			$.ajax({
				url: '${ctx}/api/uploadImage',
				type: 'post',
				data: formData,
				enctype : 'multipart/form-data',
                processData: false,
                contentType: false,
                cache: false,
                success: function(ret) {
                	if (ret.code == 0) {
                		var imagePath = ret.data;
                		$page.find('.btn-license-add').addClass('hide');
                		$page.find('.license-image')
                			.removeClass('hide')
                			.attr('src', '${ctx}' + imagePath)
                			.data('imagePath', imagePath);
                	}
                },
                error: function(err) {}
			});
		})
		.on('click', '.btn-supplier-submit', function() {
			var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($form[0]); 
            	formData.append('userId', userId);
            	formData.append('type', type);
            	formData.append('imagePath', $k.util.getAvatar($page.find('.avatar-view > img')));
            	
            	var licensePath = $page.find('.license-image').data('imagePath');
				if (!licensePath) {
					toastr['error']('请上传营业执照图片!');
					return;
				} else {
					formData.append('licensePath', licensePath);
				}
				
				$.ajax({
				    url: '${ctx}/api/service/supplier/add',
	            	type: 'post',
	            	data: formData,
	        		processData: false,
	                contentType: false,
	                cache: false, 
	                success: function(ret) {
	                	if (ret.code == 0) {
	                		$form.addClass('hide');
	                		$page.find('.apply-info').removeClass('hide');
	                	} else {
	                		toastr['error'](ret.msg);
	                	}
	                },
	                error: function(err) {}
	            });
            }
		})
		.on('click', '.btn-apply-back', function() {
			switch (type) {
			case 1:
				window.location.href = '${ctx}/platformTalent';
				break;
			case 2:
				window.location.href = '${ctx}/platformBusiness';
				break;
			case 3:
				window.location.href = '${ctx}/platformFinancing';
				break;
			case 4:
				window.location.href = '${ctx}/platformLogistics';
				break;
			}
			
		});
		
	})( jQuery );
	</script>
</body>
</html>