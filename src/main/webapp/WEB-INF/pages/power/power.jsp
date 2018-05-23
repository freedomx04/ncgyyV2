<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>电力服务平台</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	#modal-power-confirm-dialog .evaluation-star {
		padding: 6px 12px 6px 0;
	}
	</style>
</head>

<body class="gray-bg body-power">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>电力服务</h2>
				</div>
				
				<c:if test="${empty user.enterprise}">
					<div class="text-center padding-15">
						<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
						<p>您还不是企业用户</p>
					</div>
				</c:if>
				<c:if test="${not empty user.enterprise}">
					<div class="btn-group" id="power-table-toolbar" role="group">
						<button type="button" class="btn btn-white btn-power-add">
	                        <i class="fa fa-plus fa-fw"></i>新增
	                    </button>
					</div>
					<table id="power-table" class="table-hm" data-mobile-responsive="true"></table>
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-power-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog modal-center modal-lg">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">电力服务信息</h4>
                </div>
                
                <div class="modal-body">
                	<form class="form-horizontal" role="form" autocomplete="off">
                		<div class="form-group">
                			<label for="title" class="col-sm-2 control-label">申请企业</label>
                			<div class="col-sm-9">
                				<p class="form-control-static">${user.enterprise.name}</p>
                			</div>
                		</div>
                	
                		<div class="form-group">
							<label for="title" class="col-sm-2 control-label"><i class="form-required">*</i>服务标题</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="title" required>
							</div>
						</div>
						
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label"><i class="form-required">*</i>服务内容</label>
	                        <div class="col-sm-9">
	                            <textarea class="form-control" name="content" style="resize:none; height: 250px;" required></textarea>
	                        </div>
						</div>
						
						<div class="form-group">
							<label for="contactUser" class="col-sm-2 control-label"><i class="form-required">*</i>联系人</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="contactUser" required>
							</div>
						</div>
						
						<div class="form-group">
							<label for="contact" class="col-sm-2 control-label"><i class="form-required">*</i>联系电话</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="contact" required>
							</div>
						</div>
                	</form>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-power-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center modal-lg">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">电力服务信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>申请企业</dt><dd data-name="enterprise"></dd>
                		<dt>订单状态</dt><dd data-name="status"></dd>
                		<dt>服务标题</dt><dd data-name="title"></dd>
                		<dt>服务内容</dt><dd data-name="content"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-power-confirm-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog modal-center">
			 <div class="modal-content animated fadeInDown">
			 	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">服务评价</h4>
                </div>
                <div class="modal-body">
                	<form class="form-horizontal" role="form" autocomplete="off">
                		<div class="form-group">
                        	<label for="result" class="col-sm-3 control-label">服务评价</label>
                        	<div class="col-sm-8">
                        		<div class="result evaluation-star"></div>
                        	</div>
                        </div>
                        <div class="form-group">
                            <label for="evaluate" class="col-sm-3 control-label">评价内容</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" name="evaluate" style="resize:none; height: 250px;"></textarea>
                            </div>
                        </div>
                	</form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
			 </div>
		</div>
	</div>
	
	<div class="modal" id="modal-power-evaluate-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">评价详情</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>服务评价</dt><dd data-name="result"><div class="evaluation-star"></div></dd>
                		<dt>评价内容</dt><dd data-name="evaluate"></dd>
                	</dl>
                </div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-white btn-fw" data-dismiss="modal">取消</button>
                </div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/raty/jquery.raty.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var enterpriseId = '${user.enterprise.id}';
		
		var $page = $('.body-power');
		var $dialog = $page.find('#modal-power-dialog');
		var $form = $dialog.find('form');
		$k.util.bsValidator($form);
		var $detailDialog = $page.find('#modal-power-detail-dialog');
		var $confirmDialog = $page.find('#modal-power-confirm-dialog');
		var $evaluateDialog = $page.find('#modal-power-evaluate-dialog');
		
		var $table = $k.util.bsTable($page.find('#power-table'), {
			url: '${ctx}/api/power/order/listByEnterpriseId?enterpriseId=' + enterpriseId,
			toolbar: '#power-table-toolbar',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'title',
            	title: '服务标题',
            	formatter: function(value, row, index) {
            		return '<a class="btn-power-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
           			'click .btn-power-detail': function(e, value, row, index) {
               			e.stopPropagation();
               			$.each(row, function(key, val) {
               				if (key == 'status') {
               					var status;
               					switch (val) {
               					case 0:	status = '<span class="label label-warning">待发送</span>';	break;
               					case 1:	status = '<span class="label label-warning">待处理</span>';	break;
               					case 2:	status = '<span class="label label-info">已处理</span>';		break;
               					case 3:	status = '<span class="label label-success">已评价</span>';	break;
               					case 4:	status = '<span class="label label-danger">已驳回</span>';		break;
               					}
               					$detailDialog.find('dd[data-name="status"]').html(status);
               				} else {
               					$detailDialog.find('dd[data-name="' + key + '"]').text(val);
               				}
            			});
               			$detailDialog.find('dd[data-name="enterprise"]').text('${user.enterprise.name}');
            			$detailDialog.modal('show');
               		},
            	}
            }, {
            	field: 'contactUser',
            	title: '联系人',
            	width: '100'
            }, {
            	field: 'contact',
            	title: '联系电话',
            	width: '120'
            }, {
            	field: 'status',
            	title: '订单状态',
            	align: 'center',
            	width: '100',
            	formatter: function(value, row, index) {
            		switch (value) {
            		case 0:
            			return '<span class="label label-warning">待发送</span>';
            		case 1:
            			return '<span class="label label-warning">待处理</span>';
            		case 2:
            			return '<span class="label label-info">已处理</span>';
            		case 3:
            			return '<span class="label label-success">已评价</span>';
            		case 4:
            			return '<span class="label label-danger">已驳回</span>';
            		}
            	}
            }, {
            	title: '操作',
            	align: 'center',
            	width: '140',
            	formatter: function(value, row, index) {
            		var $edit = '<a class="btn-power-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-power-delete a-operate">删除</a>';
            		var $send = '<a class="btn-power-send a-operate">发送</a>';
            		var $evaluate = '<a class="btn-power-evaluate a-operate">评价</a>';
            		var $result = '<a class="btn-power-result a-operate">评价详情</a>';
            		
            		switch (row.status) {
            		case 0:
            			return $edit + $delete + $send;
            		case 2:
            			return $evaluate;
            		case 3:
            			return $result;
            		}
            	},
            	events: window.operateEvents = {
            		'click .btn-power-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$dialog.find('input[name="' + key + '"]').val(val);
            				$dialog.find('textarea[name="' + key + '"]').val(val);
            			});
            			$dialog.data('method', 'edit');
            			$dialog.data('orderId', row.id);
            			$dialog.modal('show');
            		},
            		'click .btn-power-delete': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定删除选中记录?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/power/order/delete',
            					data: {
            						orderId: row.id
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['success'](ret.msg);
        		                		$table.bootstrapTable('refresh'); 
        							} else {
        								toastr['error'](ret.msg);
        	                        }
            					},
            					error: function(err) {}
            				});
            			});
            		},
            		'click .btn-power-send': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定发送该服务申请?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/power/order/status',
            					data: {
            						orderId: row.id,
            						status: 1
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['success'](ret.msg);
        		                		$table.bootstrapTable('refresh'); 
        							} else {
        								toastr['error'](ret.msg);
        	                        }
            					},
            					error: function(err) {}
            				});
            			});
            		},
            		'click .btn-power-evaluate': function(e, value, row, index) {
            			e.stopPropagation();
            			$k.util.raty($confirmDialog.find('.evaluation-star'), 5, {
            				path: '${ctx}/plugins/raty/images/'
            			});
            			$confirmDialog.data('orderId', row.id);
            			$confirmDialog.modal('show');
            		},
            		'click .btn-power-result': function(e, value, row, index) {
            			e.stopPropagation();
            			$evaluateDialog.find('dd[data-name="result"] .evaluation-star').raty({
            				score: row.result,
            				hints: ['非常差', '差', '一般', '好', '非常好'],
            				path: '${ctx}/plugins/raty/images/',
            				readOnly: true,
            			});
            			$evaluateDialog.find('dd[data-name="evaluate"]').text(row.evaluate);
            			$evaluateDialog.modal('show');
            		}
            	}
            }]
		});
		
		$page
		.on('hidden.bs.modal', '#modal-power-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
		.on('click', '.btn-power-add', function() {
			$dialog.data('method', 'add');
			$dialog.modal('show');
		});
		
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				var method = $dialog.data('method');
				if (method == 'add') {
					formData.append('enterpriseId', enterpriseId);
					$.ajax({
						url: '${ctx}/api/power/order/create',
						type: 'post',
						data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$dialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$table.bootstrapTable('refresh'); 
		                	} else {
		                		toastr['error'](ret.msg);
		                	}
		                },
		                error: function(err) {}
					});
				} else {
					formData.append('orderId', $dialog.data('orderId'));
					$.ajax({
					    url: '${ctx}/api/power/order/update',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$dialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$table.bootstrapTable('refresh'); 
		                	} else {
		                		toastr['error'](ret.msg);
		                	}
		                },
		                error: function(err) {}
		            });
				}
			}
		});
		
		$confirmDialog.on('click', '.btn-confirm', function() {
			$.ajax({
				url: '${ctx}/api/power/order/confirm',
				type: 'post',
				data: {
					orderId: $confirmDialog.data('orderId'),
					result: $confirmDialog.find('.evaluation-star').raty('getScore'),
					evaluate: $confirmDialog.find('textarea[name="evaluate"]').val()
				},
				success: function(ret) {
					if (ret.code == 0) {
						$confirmDialog.modal('hide');
						toastr['success'](ret.msg);
						$table.bootstrapTable('refresh'); 
					}
				},
				error: function(err) {}
			});
		});
		
	})( jQuery );
	</script>

</body>
</html>