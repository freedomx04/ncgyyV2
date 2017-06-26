<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
	<style type="text/css">
	#modal-attachment-dialog .file-drop-zone {
		height: auto;
	}
	#modal-attachment-dialog .modal-dialog {
		width: 900px;
	}
	</style>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
	
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
</head>

<div class="modal fade" id="modal-attachment-dialog" aria-hidden="true" role="dialog" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal" type="button">&times;</button>
				<h4 class="modal-title">附件上传</h4>
			</div>
			<div class="modal-body">
				<input id="attachment-input" name="attachment" type="file" multiple class="file-loading">
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">
                    <i class="fa fa-close fa-fw"></i>关闭
                </button>
                <button type="button" class="btn btn-primary btn-upload">
                    <i class="fa fa-upload fa-fw"></i>上传
                </button>
            </div>
		</div>
	</div>
</div>

<script type="text/javascript">

	var $dialog = $('#modal-attachment-dialog');
	var $input = $dialog.find('#attachment-input');
	
	function attachment($element, list) {
		var $list = $element.find('.attachment-list');
		
		$input.fileinput({
			language: 'zh', 
			uploadUrl: '${ctx}/api/fileUpload',
			maxFilePreviewSize: 0,
			progressThumbClass: "progress-bar progress-bar-primary progress-bar-striped active",
	        progressClass: "progress-bar progress-bar-primary progress-bar-striped active",
	        progressCompleteClass: "progress-bar progress-bar-primary",
	        showCaption: false,
	        showUpload: false,
	        removeClass: 'btn btn-white',
		})
		.on('fileuploaded', function(event, data, previewId, index) {
			var file = data.files[0];
			var filepath = data.response.data;
			var filename = file.name;
			var iconClass = $k.util.getIconClass(filename);
			
			var $li = '<li data-filename = ' + filename + ' data-filepath=' + filepath + '>'
					+ '<i class="' + iconClass + '"></i>' + file.name
					+ '<a class="btn-attachment-delete" style="color: #337ab7;"><i class="fa fa-trash-o fa-fw"></i>删除</a>'
					+ '</li>'
			$list.append($li);
		});
		
		$list.on('click', '.btn-attachment-delete', function(e) {
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
				var filepath = $this.closest('li').data('filepath');
				$.ajax({
					url: '${ctx}/api/fileDelete',
					data: {
						filepath: filepath
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
	}
	
	$dialog
	.on('hidden.bs.modal', function() {
		$input.fileinput('clear');
	})
	.on('click', '.btn-upload', function() {
		$input.fileinput('upload');
	}); 
	
</script>
