<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal" id="modal-feedback-dialog" tabindex="-1" role="dialog"
	aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-center">
		<div class="modal-content animated fadeInDown">
			<div class="modal-body text-center">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true" style="font-size: 30px;">×</span><span class="sr-only">Close</span>
				</button>
				<h4 style="font-size: 24px; font-weight: 100;">提交反馈</h4>
				<textarea class="form-control textarea-feedback" style="height: 180px; resize: none; margin-top: 20px;" placeholder="告诉我们你的建议或遇到的问题。"></textarea>
				<div style="margin-top: 20px;">
					<button type="button" class="btn btn-primary btn-feedback-submit" style="width: 200px;">提&nbsp;&nbsp;交</button>
				</div>
			</div>
		</div>
	</div>
</div>

