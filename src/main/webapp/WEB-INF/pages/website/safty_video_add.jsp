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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-video-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
	 		<div class="ibox-content">
	 			<div class="page-title">
		 			<h2>${title}</h2>
		 		</div>
		 		
		 		<form class="form-horizontal" role="form" autocomplete="off">
		 			<div class="form-group">
						<label for="title" class="col-sm-2 control-label"><i class="form-required">*</i>标题</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" value="${video.title}" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="videoPath" class="col-sm-2 control-label"><i class="form-required">*</i>视频</label>
						<div class="col-sm-8">
							<input id="videoPath" type="file" class="file-loading" name="uploadFile" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="imagePath" class="col-sm-2 control-label"><i class="form-required">*</i>预览图</label>
						<div class="col-sm-8">
							<input id="imagePath" type="file" class="file-loading" name="imageFile" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">简介</label>
						<div class="col-sm-8">
							<textarea class="form-control" name="content" style="resize:none; height: 200px;">${video.content}</textarea>
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
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-video-add');
		var method = '${method}';
		
		if (method == 'add') {
			// upload video file
			$page.find('#videoPath').fileinput({
				language: 'zh',
				allowedFileExtensions: [ 'mp4', 'flv', 'mov', 'mkv', 'rmvb' ],
				browseClass: "btn btn-primary",
	            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>",
	            removeClass: "btn btn-white",
	            uploadClass: "btn btn-white",
	            dropZoneEnabled: false,
	            uploadUrl: '${ctx}/api/file/upload',
	           	layoutTemplates: {
	           		footer: '',
	           		actionDelete: '',
	           		actionUpload: ''
	           	}
			})
			.on('fileuploaded', function(event, data) {
				if (data.response.code == 0) {
					var videoPath = data.response.data;
					$page.find('#videoPath').data('videoPath', videoPath);
				}
			})
			.on('filecleared', function(event, data) {
				$page.find('#videoPath').removeData('videoPath');
			});
			
			// upload image file
			$page.find('#imagePath').fileinput({
				language: 'zh',
				allowedFileExtensions: [ 'jpg', 'png', 'gif' ],
				browseClass: "btn btn-primary",
	            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>",
	            removeClass: "btn btn-white",
	            uploadClass: "btn btn-white",
	            dropZoneEnabled: false,
	            uploadUrl: '${ctx}/api/uploadImage',
	           	layoutTemplates: {
	           		footer: '',
	           		actionDelete: '',
	           		actionUpload: ''
	           	},
			})
			.on('fileuploaded', function(event, data) {
				if (data.response.code == 0) {
					var imagePath = data.response.data;
					$page.find('#imagePath').data('imagePath', imagePath);
				}
			})
			.on('filecleared', function(event, data) {
				$page.find('#imagePath').removeData('imagePath');
			});
		} else {
			$page.find('#videoPath').data('videoPath', '${video.videoPath}');
			// upload video file
			$page.find('#videoPath').fileinput({
				language: 'zh',
				allowedFileExtensions: [ 'mp4', 'flv', 'mov', 'mkv', 'rmvb' ],
				browseClass: "btn btn-primary",
	            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>",
	            removeClass: "btn btn-white",
	            uploadClass: "btn btn-white",
	            dropZoneEnabled: false,
	            uploadUrl: '${ctx}/api/file/upload',
	           	layoutTemplates: {
	           		footer: '',
	           		actionDelete: '',
	           		actionUpload: ''
	           	},
	           	initialPreview:	'${ctx}/img/video_default.png',
	           	initialPreviewAsData: true,
	            initialCaption: '${video.videoPath}',
			})
			.on('fileuploaded', function(event, data) {
				if (data.response.code == 0) {
					var videoPath = data.response.data;
					$page.find('#videoPath').data('videoPath', videoPath);
				}
			})
			.on('filecleared', function(event, data) {
				$page.find('#videoPath').removeData('videoPath');
			});
			
			$page.find('#imagePath').data('imagePath', '${video.imagePath}');
			// upload image file
			$page.find('#imagePath').fileinput({
				language: 'zh',
				allowedFileExtensions: [ 'jpg', 'png', 'gif' ],
				browseClass: "btn btn-primary",
	            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i>",
	            removeClass: "btn btn-white",
	            uploadClass: "btn btn-white",
	            dropZoneEnabled: false,
	            uploadUrl: '${ctx}/api/uploadImage',
	           	layoutTemplates: {
	           		footer: '',
	           		actionDelete: '',
	           		actionUpload: ''
	           	},
	           	initialPreview:	'${ctx}${video.imagePath}',
	           	initialPreviewAsData: true,
	            initialCaption: '${video.imagePath}',
			})
			.on('fileuploaded', function(event, data) {
				if (data.response.code == 0) {
					var imagePath = data.response.data;
					$page.find('#imagePath').data('imagePath', imagePath);
				}
			})
			.on('filecleared', function(event, data) {
				$page.find('#imagePath').removeData('imagePath');
			});
		}
		
		$page
		.on('click', '.btn-video-add', function() {
			var title = $page.find('[name="title"]').val();
			if (!title) {
				toastr['error']('请填写标题');
				return;
			}
			var videoPath = $page.find('#videoPath').data('videoPath');
			if (!videoPath) {
				toastr['error']('请上传视频');
				return;
			}
			var imagePath = $page.find('#imagePath').data('imagePath');
			if (!imagePath) {
				toastr['error']('请上传预览图');
				return;
			}
			
			$.ajax({
				url: '${ctx}/api/weisite/safty/video/create',
				type: 'post',
				data: {
					title: title,
					videoPath: videoPath,
					imagePath: imagePath,
					content: $page.find('[name="content"]').val()
				},
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
						toastr['error'](ret.msg);
					}
				},
				error: function(err) {}
			});
		})
		.on('click', '.btn-video-edit', function() {
			var title = $page.find('[name="title"]').val();
			if (!title) {
				toastr['error']('请填写标题');
				return;
			}
			var videoPath = $page.find('#videoPath').data('videoPath');
			if (!videoPath) {
				toastr['error']('请上传视频');
				return;
			}
			var imagePath = $page.find('#imagePath').data('imagePath');
			if (!imagePath) {
				toastr['error']('请上传预览图');
				return;
			}
			
			$.ajax({
				url: '${ctx}/api/weisite/safty/video/update',
				type: 'post',
				data: {
					videoId: '${video.id}',
					title: title,
					videoPath: videoPath,
					imagePath: imagePath,
					content: $page.find('[name="content"]').val()
				},
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
						toastr['error'](ret.msg);
					}
				},
				error: function(err) {}
			});
		})
		.on('click', '.btn-video-cancel', function() {
			window.history.back();
		})
		
	}) ( jQuery );
	</script>
</body>
</html>