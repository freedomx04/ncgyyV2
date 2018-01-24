<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>供应商管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-supplier-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-uncertified" aria-expanded="true">待审核</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-certified" aria-expanded="false">已审核</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-uncertified" class="tab-pane active">
							<div class="panel-body">
								<table id="uncertified-list-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="tab-certified" class="tab-pane">
							<div class="panel-body">
								<table id="certified-list-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-supplier-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-lg modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">供应商信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>供应商名称</dt><dd data-name="name"></dd>
                		<dt>申请类型</dt><dd data-name="type"></dd>
                		<dt>行业类别</dt><dd data-name="profession"></dd>
                		<dt>企业性质</dt><dd data-name="property"></dd>
                		<dt>企业规模</dt><dd data-name="scale"></dd>
                		<dt>地址</dt><dd data-name="address"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                		<dt>座机</dt><dd data-name="phone"></dd>
                		<dt>传真</dt><dd data-name="fax"></dd>
                		<dt>简介</dt><dd data-name="introduction"></dd>
                		<dt>营业执照</dt><dd data-name="license"></dd>
                		<dt>营业执照照片</dt><dd data-name="licensePath"></dd>
                	</dl>
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
	
	<script type="text/javascript">
	;(function( $ ) {	
		
		var $page = $('.body-supplier-list');
		var $supplierDetailDialog = $('#modal-supplier-detail-dialog');
		
		var $uncertifiedTable;
		var $certifiedTable;
		
		$uncertifiedTable = $k.util.bsTable($page.find('#uncertified-list-table'), {
			url: '${ctx}/api/service/supplier/listUncertified',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'name',
            	title: '供应商名称',
            	formatter: function(value, row, index) {
            		return '<a class="btn-supplier-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
               		'click .btn-supplier-detail': function(e, value, row, index) {
               			e.stopPropagation();
               			$.each(row, function(key, val) {
               				if (key == 'type') {
               					var typeName;
               					switch (val) {
               					case 1:		typeName = '人才服务';		break;
                        		case 2:		typeName = '招商服务';		break;
                        		case 3:		typeName = '融资服务';		break;
                        		case 4:		typeName = '物流服务';		break;
               					}
               					$supplierDetailDialog.find('dd[data-name="' + key + '"]').text(typeName);
               				} else if (key == 'licensePath') {
               					$supplierDetailDialog.find('dd[data-name="licensePath"]').empty();
               					$supplierDetailDialog.find('dd[data-name="licensePath"]').append('<img src="${ctx}' + val + '" class="img-responsive">');
               				} else {
               					$supplierDetailDialog.find('dd[data-name="' + key + '"]').text(val);
               				}
               			});
               			$supplierDetailDialog.modal('show');
               		}
               	}
            	
            }, {
            	field: 'type',
            	title: '申请类型',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var typeName;
            		switch (value) {
            		case 1:		typeName = '人才服务';		break;
            		case 2:		typeName = '招商服务';		break;
            		case 3:		typeName = '融资服务';		break;
            		case 4:		typeName = '物流服务';		break;
            		}
            		return typeName;
            	}
            }, {
            	field: 'profession',
            	title: '行业类别',
            	align: 'center'
            }, {
            	field: 'property',
            	title: '企业性质',
            	align: 'center'
            }, {
            	field: 'scale',
            	title: '企业规模',
            	align: 'center'
            }, {
            	field: 'license',
            	title: '营业执照'
            }, {
            	field: 'status',
            	title: '认证状态',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return '<span class="label label-warning">待审核</span>';
            	}
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $pass = '<a class="btn-supplier-pass a-operate">通过</a>';
            		var $deny = '<a class="btn-supplier-deny a-operate">驳回</a>';
            		return $pass + $deny;
            	},
            	events: window.operateEvents = {
            		'click .btn-supplier-pass': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定通过选中记录?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/service/supplier/certification',
            					data: {
            						supplierId: row.id,
            						status: 2
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['info']('供应商申请已通过');
        		                		$uncertifiedTable.bootstrapTable('refresh'); 
        		                		$certifiedTable.bootstrapTable('refresh'); 
        							} else {
        								toastr['error'](ret.msg);
        	                        }
            					},
            					error: function(err) {}
            				});
            			});
            		},
            		'click .btn-supplier-deny': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定驳回选中记录?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/service/supplier/certification',
            					data: {
            						supplierId: row.id,
            						status: 3
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['info']('供应商申请已驳回');
        		                		$uncertifiedTable.bootstrapTable('refresh'); 
        		                		$certifiedTable.bootstrapTable('refresh'); 
        							} else {
        								toastr['error'](ret.msg);
        	                        }
            					},
            					error: function(err) {}
            				});
            			});
            		}
            	}
            }]
		});
		
		$certifiedTable = $k.util.bsTable($page.find('#certified-list-table'), {
			url: '${ctx}/api/service/supplier/listCertified',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'name',
            	title: '供应商名称',
            	formatter: function(value, row, index) {
            		return '<a class="btn-supplier-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
               		'click .btn-supplier-detail': function(e, value, row, index) {
               			e.stopPropagation();
               			$.each(row, function(key, val) {
               				if (key == 'type') {
               					var typeName;
               					switch (val) {
               					case 1:		typeName = '人才服务';		break;
                        		case 2:		typeName = '招商服务';		break;
                        		case 3:		typeName = '融资服务';		break;
                        		case 4:		typeName = '物流服务';		break;
               					}
               					$supplierDetailDialog.find('dd[data-name="' + key + '"]').text(typeName);
               				} else if (key == 'licensePath') {
               					$supplierDetailDialog.find('dd[data-name="licensePath"]').empty();
               					$supplierDetailDialog.find('dd[data-name="licensePath"]').append('<img src="${ctx}' + val + '" class="img-responsive">');
               				} else {
               					$supplierDetailDialog.find('dd[data-name="' + key + '"]').text(val);
               				}
               			});
               			$supplierDetailDialog.modal('show');
               		}
               	}
            	
            }, {
            	field: 'type',
            	title: '申请类型',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var typeName;
            		switch (value) {
            		case 1:		typeName = '人才服务';		break;
            		case 2:		typeName = '招商服务';		break;
            		case 3:		typeName = '融资服务';		break;
            		case 4:		typeName = '物流服务';		break;
            		}
            		return typeName;
            	}
            }, {
            	field: 'profession',
            	title: '行业类别',
            	align: 'center'
            }, {
            	field: 'property',
            	title: '企业性质',
            	align: 'center'
            }, {
            	field: 'scale',
            	title: '企业规模',
            	align: 'center'
            }, {
            	field: 'license',
            	title: '营业执照',
            	align: 'center'
            }, {
            	field: 'status',
            	title: '认证状态',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var statusLabel;
            		switch (value) {
            		case 1:
            			statusLabel = '<span class="label label-warning">待审核</span>';
            			break;
            		case 2:
            			statusLabel = '<span class="label label-info">已认证</span>';
            			break;
            		case 3:
            			statusLabel = '<span class="label label-danger">已驳回</span>';
            			break;
            		}
            		return statusLabel;
            	}
            }]
		});
		
	}) ( jQuery );
	</script>
	
</body>
</html>