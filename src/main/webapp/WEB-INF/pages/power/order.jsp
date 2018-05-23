<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>服务订单</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-order">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>服务订单</h2>
				</div>
				<table id="order-table" class="table-hm" data-mobile-responsive="true"></table>
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
		
		var $page = $('.body-order');
		
		var $detailDialog = $page.find('#modal-power-detail-dialog');
		var $evaluateDialog = $page.find('#modal-power-evaluate-dialog');
		
		var $table = $k.util.bsTable($page.find('#order-table'), {
			url: '${ctx}/api/power/order/list',
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
               				} else if (key == 'enterprise') {
               					$detailDialog.find('dd[data-name="enterprise"]').text(val.name);
               				} else {
               					$detailDialog.find('dd[data-name="' + key + '"]').text(val);
               				}
            			});
            			$detailDialog.modal('show');
               		},
            	}
            }, {
            	field: 'enterprise.name',
            	title: '申请企业',
            }, {
            	field: 'status',
            	title: '订单状态',
            	align: 'center',
            	width: '100',
            	formatter: function(value, row, index) {
            		switch (value) {
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
            		var $handle = '<a class="btn-power-handle a-operate">处理</a>';
            		var $reject = '<a class="btn-power-reject a-operate">驳回</a>';
            		var $result = '<a class="btn-power-result a-operate">评价详情</a>';
            		
            		switch (row.status) {
            		case 1:
            			return $handle + $reject;
            		case 3:
            			return $result;
            		}
            	},
            	events: window.operateEvents = {
            		'click .btn-power-handle': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定已处理该服务申请?',
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
            						status: 2
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
            		'click .btn-power-reject': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定驳回该服务申请?',
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
            						status: 4
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
		
	})( jQuery );
	</script>
	
</body>
</html>