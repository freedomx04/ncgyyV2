<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>企业管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-news-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-news">
					<div class="form-group">
						<label for="title" class="col-sm-1 control-label"><i class="form-required">*</i>标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="title" value="${news.title}" required>
						</div>
					</div>	
					<div class="form-group" >
						<label for="source" class="col-sm-1 control-label">正文</label>
						<div class="col-sm-10">
							<div id="summernote"></div>
						</div>
					</div>	
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-1">
							<c:if test="${method == 'add'}">
								<button type="button" class="btn btn-primary btn-fw btn-submit btn-news-add">确定</button>
		                    </c:if>
		                    <c:if test="${method == 'edit'}">
		                    	<button type="button" class="btn btn-primary btn-fw btn-news-edit">确定</button>
		                    </c:if>
							<button type="button" class="btn btn-white btn-fw btn-news-cancel">取消</button>
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
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-news-add');
		var $form = $page.find('#form-news');
		var method = '${method}';
		
		var enterpriseId = '${enterpriseId}';
		if (enterpriseId == '') {
			enterpriseId = '${news.enterprise.id}';
		}
		
		$k.util.bsValidator($form);
		$k.util.summernote($page.find('#summernote'), {
			ctx: '${ctx}'
		});
		
		if (method == 'edit') {
			$page.find('#summernote').summernote('code', '${news.content}');
		}
		
		$page
		.on('click', '.btn-news-add', function() {
			var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	$.ajax({
            		url: '${ctx}/api/news/create',
            		type: 'POST',
            		data: {
            			enterpriseId: enterpriseId,
            			title: $form.find('input[name="title"]').val(),
            			content: $page.find('#summernote').summernote('code')
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
            }
		})
		.on('click', '.btn-news-edit', function() {
			var validator = $form.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	$.ajax({
            		url: '${ctx}/api/news/update',
            		type: 'POST',
            		data: {
            			newsId: '${news.id}',
            			title: $form.find('input[name="title"]').val(),
            			content: $page.find('#summernote').summernote('code')
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
            }
		})
		.on('click', '.btn-news-cancel', function() {
			window.history.back();
		});
		
	})( jQuery );
	</script>
	
</body>

</html>