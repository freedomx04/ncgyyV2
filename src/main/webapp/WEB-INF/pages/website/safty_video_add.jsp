<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>新增新闻</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-video-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
	 		<div class="ibox-content">
	 			<div class="page-title">
		 			<h2>${title}</h2>
		 		</div>
		 		
		 		<form class="form-horizontal" role="form" autocomplete="off" id="form-video">
		 			<div class="form-group">
						<label for="title" class="col-sm-2 control-label"><i class="form-required">*</i>标题</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" value="${video.title}" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="videoPath" class="col-sm-2 control-label"><i class="form-required">*</i>视频</label>
						<div class="col-sm-8">
						
						</div>
					</div>
					
					<div class="form-group">
						<label for="imagePath" class="col-sm-2 control-label">预览图</label>
						<div class="col-sm-8">
							<input id="imagePath" type="file" class="file-loading" name="imageFile" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">简介</label>
						<div class="col-sm-8">
							<textarea class="form-control" name="content" style="resize:none; height: 200px;"></textarea>
						</div>
					</div>
					
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-2">
							<c:if test="${method == 'add'}">
								<button type="button" class="btn btn-primary btn-fw btn-video-add">确定</button>
		                    </c:if>
		                    <c:if test="${method == 'edit'}">
		                    	<button type="button" class="btn btn-primary btn-fw btn-video-edit">确定</button>
		                    </c:if>
							<button type="button" class="btn btn-white btn-fw btn-video-cancel">取消</button>
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
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-video-add');
		
		$page.find('#imagePath').fileinput({
			language: 'zh',
			showUpload: false,
			allowedFileExtensions: [ 'jpg', 'png', 'gif' ],
			browseClass: "btn btn-primary",
            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>",
            dropZoneEnabled: false,
            uploadUrl: '${ctx}/api/uploadImage',
           	maxFileCount: 1,
           	layoutTemplates: {
           		actionDelete: '',
           		actionUpload: ''
           	}
		})
		.on('filebatchselected', function(event, data) {
			$(this).fileinput('upload');
		})  
		.on('fileuploaded', function(event, data) {
			if (data.response.code == 0) {
				var imagePath = data.response.data;
				$page.find('#imagePath').data('imagePath', imagePath);
			}
		});
		
		$page
		.on('click', '.btn-video-add', function() {
			var path = $('#imagePath').data('imagePath');
			alert(path);
		})
		.on('click', '.btn-video-edit', function() {
			
		})
		.on('click', '.btn-video-cancel', function() {
			window.history.back();
		})
		
	}) ( jQuery );
	</script>
</body>
</html>