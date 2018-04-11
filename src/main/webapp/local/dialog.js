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
	
	ConfirmDialog = function(element, options, method) {
		var self = this;
		self.$element = element;
		self.options = options;
		self.method = method;
		this.init(options);
	}
	
	ConfirmDialog.prototype = {
		constructor: ConfirmDialog,
		init: function() {
			this.initModal();
			this.addListener();
		},
		
		initModal: function() {
			var self = this;
			var modal = 
				'<div class="modal" id="modal-confirm-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">\n' +
				'	<div class="modal-dialog modal-center" style="width: 500px;">\n' + 
				'		<div class="modal-content animated bounceIn">\n' + 
				'			<div class="modal-header">\n' + 
				'				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>\n' +
				'				<h4 class="modal-title">' + self.options.title + '</h4>\n' +
				'			</div>\n' + 
				'			<div class="modal-body">\n' + 
				'				<div class="text-center padding-15">\n' + self.options.text + 
				'				</div>\n' + 
				'				<div class="text-center padding-10">\n' + 
				'					<button type="button" class="btn btn-white btn-modal-fw" data-dismiss="modal">取消</button>\n' + 
				'					<button type="button" class="btn btn-primary btn-modal-fw btn-confirm">确定</button>\n' +
				'				</div>\n' + 
				'			</div>\n' +
				'		</div>\n' +
				'	</div>\n' +
				'</div>\n';
			
			self.$element.append(modal);
			self.$modal = self.$element.find('#modal-confirm-dialog');
			self.$confirm = self.$modal.find('.btn-confirm');
			self.$modal.modal('show');
		},
		
		addListener: function() {
			var self = this;
			self.$confirm.on('click', $.proxy(this.confirm, this));
		},
		
		confirm: function() {
			var self = this;
			self.method();
			self.$modal.modal('hide');
		}
		
	}
	
});