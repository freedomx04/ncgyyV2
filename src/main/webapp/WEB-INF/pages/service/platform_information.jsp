<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>信息化平台</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-platform-information">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-supplier" aria-expanded="true">供应商信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-service" aria-expanded="false">服务管理</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-demand" aria-expanded="false">需求管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-supplier" class="tab-pane active">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是信息化服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-information-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<div class="panel-body">
									<dl class="dl-horizontal" style="padding-right: 60px;">
										<dt>供应商类型</dt><dd>信息化服务供应商</dd>
										<dt>审核状态</dt>
										<dd>
										<c:choose>
											<c:when test="${supplier.status == 1}">
												<span class="label label-warning">审核中</span>
											</c:when>
											<c:when test="${supplier.status == 2}">
												<span class="label label-success">已认证</span>
											</c:when>
											<c:when test="${supplier.status == 3}">
												<span class="label label-danger">已驳回</span>
											</c:when>
										</c:choose>
										</dd>
										<dt>供应商名称</dt><dd>${supplier.name}</dd>
										<dt>供应商图片</dt><dd><img src="${ctx}/api/avatar/${supplier.imagePath}" style="max-width: 200px; max-height: 200px;"></dd>
										<dt>行业类别</dt><dd>${supplier.profession}</dd>
										<dt>企业性质</dt><dd>${supplier.property}</dd>
										<dt>企业规模</dt><dd>${supplier.scale}</dd>
										<dt>地址</dt><dd>${supplier.address}</dd>
										<dt>联系人</dt><dd>${supplier.contactUser}</dd>
										<dt>联系电话</dt><dd>${supplier.contact}</dd>
										<dt>座机</dt><dd>${supplier.phone}</dd>
										<dt>传真</dt><dd>${supplier.fax}</dd>
										<dt>简介</dt><dd>${supplier.introduction}</dd>
										<dt>营业执照</dt><dd>${supplier.license}</dd>
										<dt>营业执照图片</dt><dd><img src="${ctx}${supplier.licensePath}" class="img-responsive"></dd>
									</dl>
								</div>
							</c:if>
						</div>
						
						<div id="tab-service" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是信息化服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-information-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<c:if test="${supplier.status != 2}">
									<div class="panel-body text-center">
										<img src="${ctx}/img/operate-success.png" style="max-width: 100px;">
										<h3 style="padding: 5px;">申请提交完成，正在为你审核...</h3>
										<p>我们会在3个工作日内完成供应商信息的审核工作，审核通过后，你可以使用供应商所提供的平台服务。</p>
									</div>
								</c:if>
								<c:if test="${supplier.status == 2}">
									<div class="panel-body">
										<div class="btn-group" id="service-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-service-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-service-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="service-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
						
						<div id="tab-demand" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="demand-list-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-demand-add">
                       					<i class="fa fa-plus fa-fw"></i>新增
                    				</button>
				                    <button type="button" class="btn btn-danger btn-demand-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>
				                </div>
				                <table id="demand-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-service-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">服务信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-service" autocomplete="off">
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label"><i class="form-required">*</i>服务标题</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="title" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">服务内容</label>
                            <div class="col-sm-9">
                                <div id="service-content"></div>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="contactUser" class="col-sm-2 control-label"><i class="form-required">*</i>联系人</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="contactUser" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-2 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-5">
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
    
    <div class="modal" id="modal-service-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">服务信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>服务标题</dt><dd data-name="title"></dd>
                		<dt>服务内容</dt><dd data-name="content"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
    
    <div class="modal" id="modal-demand-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">需求信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-demand" autocomplete="off">
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label"><i class="form-required">*</i>需求标题</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="title" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="content" class="col-sm-2 control-label">需求内容</label>
                            <div class="col-sm-9">
                                <div id="demand-content"></div>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="contactUser" class="col-sm-2 control-label"><i class="form-required">*</i>联系人</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="contactUser" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-2 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-5">
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
    
     <div class="modal" id="modal-demand-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">需求信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>需求标题</dt><dd data-name="title"></dd>
                		<dt>需求内容</dt><dd data-name="content"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {	
		
		var $page = $('.body-platform-information');
		var supplierId = '${supplier.id}';
		var userId = '${userId}';
		
		$k.util.summernote($page.find('#service-content'), {
			ctx: '${ctx}',
			simple: true
		});
		$k.util.summernote($page.find('#demand-content'), {
			ctx: '${ctx}',
			simple: true
		});
		// 服务
		var $serviceTable = $('#service-list-table');
		if ($serviceTable) {
			var $serviceDialog = $('#modal-service-dialog');
			var $serviceDetailDialog = $('#modal-service-detail-dialog');
			var $serviceForm = $('#form-service');
			$k.util.bsValidator($serviceForm);
			
			$serviceTable = $k.util.bsTable($page.find('#service-list-table'), {
				url: '${ctx}/api/service/information/service/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#service-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns:[{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'title',
	            	title: '服务标题',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-service-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-service-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$serviceDetailDialog.find('dd[data-name="' + key + '"]').html(val);
	            			});
	            			$serviceDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'contactUser',
	            	title: '联系人',
	            	align: 'center',
	            }, {
	            	field: 'contact',
	            	title: '联系电话',
	            	align: 'center',
	            }, {
	            	field: 'updateTime',
	            	title: '更新时间',
	            	align: 'center',
	            	formatter: formatDate2
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-service-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-service-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-service-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				if (key == 'content') {
	            					$serviceForm.find('#service-content').summernote('code', val);
	            				} else {
	            					$serviceForm.find('input[name="' + key + '"]').val(val);
	            				}
	            			});
	            			$serviceDialog.data('method', 'edit');
            				$serviceDialog.data('serviceId', row.id);
	            			$serviceDialog.modal('show');
	            		},
	            		'click .btn-service-delete': function(e, value, row, index) {
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
	            					url: '${ctx}/api/service/information/service/delete',
	            					data: {
	            						serviceId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$serviceTable.bootstrapTable('refresh'); 
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
			$serviceTable.on('all.bs.table', function(e, row) {
	            var selNum = $serviceTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-service-delete-batch').removeAttr('disabled') : $page.find('.btn-service-delete-batch').attr('disabled', 'disabled');
	        });
			
			$serviceDialog.on('click', '.btn-confirm', function() {
				var validator = $serviceForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($serviceForm[0]); 
            		var method = $serviceDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			formData.append('content', $('#service-content').summernote('code'));
            			$.ajax({
    					    url: '${ctx}/api/service/information/service/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$serviceDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$serviceTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('serviceId', $serviceDialog.data('serviceId'));
            			formData.append('content', $('#service-content').summernote('code'));
            			$.ajax({
    					    url: '${ctx}/api/service/information/service/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$serviceDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$serviceTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		}
	            }
			});
		}
		
		// 需求
		var $demandDialog = $('#modal-demand-dialog');
		var $demandDetailDialog = $('#modal-demand-detail-dialog');
		var $demandForm = $('#form-demand');
		$k.util.bsValidator($demandForm);
		var $demandTable = $k.util.bsTable($page.find('#demand-list-table'), {
			url: '${ctx}/api/service/information/demand/listByUserId?userId=' + userId,
			toolbar: '#demand-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns:[{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'title',
            	title: '需求标题',
            	formatter: function(value, row, index) {
            		return '<a class="btn-demand-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-demand-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$demandDetailDialog.find('dd[data-name="' + key + '"]').html(val);
            			});
            			$demandDetailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'contactUser',
            	title: '联系人',
            	align: 'center',
            }, {
            	field: 'contact',
            	title: '联系电话',
            	align: 'center',
            }, {
            	field: 'updateTime',
            	title: '更新时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $edit = '<a class="btn-demand-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-demand-delete a-operate">删除</a>';
            		return $edit + $delete;
            	},
            	events: window.operateEvents = {
            		'click .btn-demand-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				if (key == 'content') {
            					$demandForm.find('#demand-content').summernote('code', val);
            				} else {
            					$demandForm.find('input[name="' + key + '"]').val(val);
            				}
            			});
            			$demandDialog.data('method', 'edit');
        				$demandDialog.data('demandId', row.id);
            			$demandDialog.modal('show');
            		},
            		'click .btn-demand-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/service/information/demand/delete',
            					data: {
            						demandId: row.id
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['success'](ret.msg);
        		                		$demandTable.bootstrapTable('refresh'); 
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
		$demandTable.on('all.bs.table', function(e, row) {
            var selNum = $demandTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-demand-delete-batch').removeAttr('disabled') : $page.find('.btn-demand-delete-batch').attr('disabled', 'disabled');
        });
		
		$demandDialog.on('click', '.btn-confirm', function() {
			var validator = $demandForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($demandForm[0]);
            	var method = $demandDialog.data('method');
            	if (method == 'add') {
            		formData.append('userId', userId);
            		formData.append('content', $('#demand-content').summernote('code'));
            		$.ajax({
					    url: '${ctx}/api/service/information/demand/create',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$demandDialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$demandTable.bootstrapTable('refresh'); 
		                	} else {
		                		toastr['error'](ret.msg);
		                	}
		                },
		                error: function(err) {}
		            });
            	} else {
            		formData.append('demandId', $demandDialog.data('demandId'));
            		formData.append('content', $('#service-content').summernote('code'));
        			$.ajax({
					    url: '${ctx}/api/service/information/demand/update',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$demandDialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$demandTable.bootstrapTable('refresh'); 
		                	} else {
		                		toastr['error'](ret.msg);
		                	}
		                },
		                error: function(err) {}
		            });
            	}
            }
		});
		
		$page
		.on('click', '.btn-information-supplier', function() {
			window.location.href = '${ctx}/service/supplierApply?type=1';
		})
		.on('click', '.btn-service-add', function() {
			$serviceDialog.data('method', 'add');
			$serviceDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-service-dialog', function() {
            $serviceForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $('#service-content').summernote('code', '');
        })
        .on('click', '.btn-service-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $serviceTable.bootstrapTable('getSelections');
                
                $.ajax({
                    url: '${ctx}/api/service/information/service/deleteBatch',
                    data: { 
                        serviceIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$serviceTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        })
        .on('click', '.btn-demand-add', function() {
        	$demandDialog.data('method', 'add');
        	$demandDialog.modal('show');
        })
        .on('hidden.bs.modal', '#modal-demand-dialog', function() {
            $demandForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $('#demand-content').summernote('code', '');
        })
         .on('click', '.btn-demand-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $demandTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/information/demand/deleteBatch',
                    data: { 
                        demandIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$demandTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        });
		
		
	})( jQuery );
	</script>
</body>
</html>