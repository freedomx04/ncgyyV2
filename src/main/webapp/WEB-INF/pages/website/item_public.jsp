<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>项目公示</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.note-editing-area img {
		max-width: 100%;
		height: auto;
		display: block;
	}
	</style>
	
</head>

<body class="gray-bg body-item-public">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox">
	 		<div class="ibox-content">
	 			<div class="page-title">
		 			<h2>项目公示</h2>
		 		</div>
	 		
 				<form class="form-horizontal" role="form" autocomplete="off" id="form-public">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">项目名称</label>
						<div class="col-sm-9">
							<p class="form-control-static">${item.name}</p>
						</div>
					</div>
					
					<div class="form-group" >
						<label for="result" class="col-sm-2 control-label"><i class="form-required">*</i>公示结果</label>
						<div class="col-sm-9">
							<div id="summernote"></div>
						</div>
					</div>	
					
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-2">
							<button type="button" class="btn btn-primary btn-fw btn-item-public">确定</button>
							<button type="button" class="btn btn-white btn-fw btn-item-cancel">取消</button>
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
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	
	<script type="text/javascript">
	
		var $page = $('.body-item-public');
		
		$k.util.summernote($page.find('#summernote'), {
			ctx: '${ctx}'
		});
		
		$page
		.on('click', '.btn-item-public', function() {
			var result = $('#summernote').summernote('code');
			$.ajax({
				url: '${ctx}/api/website/item/public',
				type: 'post',
				data: {
					itemId: '${item.id}',
					result: result
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
						swal('', '操作失败', 'error');
					}
				},
				error: function(err) {}
			});
		})
		.on('click', '.btn-item-cancel', function() {
			window.history.back();
		});
		
	</script>
</body>

</html>