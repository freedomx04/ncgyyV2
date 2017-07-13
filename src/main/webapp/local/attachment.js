(function (factory) {
	if (typeof define === 'function' && define.amd) {
		define(['jquery'], factory);
	} else if (typeof exports === 'object') {
		factory(require('jquery'));
	} else {
		factory(jQuery);
	}
})(function ($) {
	
	'user strict';
	
	Attachment = function(element, options) {
		var self = this;
		self.$element = element;
		self.options = options;
		self.$button = element.find('.btn-attachment-add');
		self.$list = element.find('.attachment-list');
		this.init(options);
	}
	
	Attachment.prototype = {
		constructor: Attachment,
		init: function() {
			this.initModal();
			this.addListener();
		},
		
		initModal: function(uploadUrl) {
			var self = this;
			var modal = '<div class="modal fade" id="modal-attachment-dialog" aria-hidden="true" role="dialog" tabindex="-1">\n' + 
				'	<div class="modal-dialog" style="width: 900px;">\n' +
				'		<div class="modal-content">\n' +
				'			<div class="modal-header">\n' +
				'				<button class="close" data-dismiss="modal" type="button">&times;</button>\n' +
				'				<h4 class="modal-title">附件上传</h4>\n' +
				'			</div>\n' +
				'			<div class="modal-body">\n' +
				'				<input id="attachment-input" name="attachment" type="file" multiple class="file-loading">\n' +
				'			</div>\n' +
				'			<div class="modal-footer">\n' +
				'				<button type="button" class="btn btn-white" data-dismiss="modal">\n' +
				'					<i class="fa fa-close fa-fw"></i>关闭\n' +
				'				</button>\n' +
				'				<button type="button" class="btn btn-primary btn-upload">\n' +
				'					<i class="fa fa-upload fa-fw"></i>上传\n' +
				'				</button>\n' +
				'			</div>\n' +
				'		</div>\n' +
				'	</div>\n' +
				'</div>\n';
			self.$element.append(modal);
			self.$modal = self.$element.find('#modal-attachment-dialog');
			self.$input = self.$modal.find('#attachment-input');
			self.$upload = self.$modal.find('.btn-upload');
			
			self.$input.fileinput({
				language: 'zh', 
				uploadUrl: self.options.uploadUrl,
				maxFilePreviewSize: 0,
				progressThumbClass: "progress-bar progress-bar-primary progress-bar-striped active",
		        progressClass: "progress-bar progress-bar-primary progress-bar-striped active",
		        progressCompleteClass: "progress-bar progress-bar-primary",
		        showCaption: false,
		        showUpload: false,
		        removeClass: 'btn btn-white',
			});
		},
		
		addListener: function() {
			var self = this;
			self.$button.on('click', $.proxy(this.add, this));
			self.$element.find('.btn-upload').on('click', $.proxy(this.upload, this));
			self.$modal.on('hidden.bs.modal', $.proxy(this.clear, this));
			self.$input.on('fileuploaded', $.proxy(this.uploaded, this));
			self.$list.on('click', '.btn-attachment-delete', $.proxy(this.del, this));
		},
		
		add: function() {
			var self = this;
			self.$modal.modal('show');
		},
		
		clear: function() {
			var self = this;
			self.$input.fileinput('clear');
		},
		
		upload: function() {
			var self = this;
			self.$input.fileinput('upload');
		},
		
		uploaded: function(event, data, previewId, index) {
			var self = this;
			var file = data.files[0];
			var filepath = data.response.data;
			var filename = file.name;
			
			var li = '<li data-filename=' + filename + ' data-filepath=' + filepath + '>' + filename + 
					'<a class="btn-attachment-delete" style="color: #337ab7;"><i class="fa fa-trash-o fa-fw"></i>删除</a>' +
					'</li>';
			self.$list.append(li);
		},
		
		del: function(e) {
			e.stopPropagation();
			var self = this;
			var $this = $(e.target);
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
					url: self.options.deleteUrl,
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
		}
		
	};
	
});