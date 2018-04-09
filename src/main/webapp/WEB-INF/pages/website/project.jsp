<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>工程进度管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-project">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>工程进度管理</h2>
				</div>
			
				<div class="btn-group" id="project-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-project-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                    <button type="button" class="btn btn-danger btn-project-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>删除
                    </button>
                </div>
                <table id="project-list-table" class="table-hm table-fixed" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<!-- 工程新增,编辑对话框 -->
    <div class="modal" id="modal-project-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">工程信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-project" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>工程名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-3 control-label"><i class="form-required">*</i>工程概述</label>
                            <div class="col-sm-7">
                                <textarea class="form-control" name="description" style="resize:none; height: 150px;" required></textarea>
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
    
    <!-- 工程进度列表 -->
    <div class="modal" id="modal-progress-list-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    	<div class="modal-dialog modal-lg modal-center">
    		<div class="modal-content animated fadeInDown">
    			<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">工程进度管理</h4>
                </div>
                <div class="modal-body" style="max-height: 560px;">
                	<div class="btn-group" id="progress-list-table-toolbar" role="group">
	                    <button type="button" class="btn btn-white btn-progress-add">
	                        <i class="fa fa-plus fa-fw"></i>新增
	                    </button>
	                    <button type="button" class="btn btn-danger btn-progress-delete-batch" disabled='disabled'>
	                        <i class="fa fa-trash-o fa-fw"></i>删除
	                    </button>
	                </div>
	                <table id="progress-list-table" class="table-hm table-fixed" data-mobile-responsive="true"> </table>
                </div>
    		</div>
    	</div>
    </div>
    
     <!-- 工程进度新增,编辑对话框  -->
    <div class="modal" id="modal-progress-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    	<div class="modal-dialog modal-center">
    		<div class="modal-content animated fadeInDown">
    			<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">工程进度信息</h4>
                </div>
                <div class="modal-body">
                	<form class="form-horizontal" role="form" id="form-progress" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>进度</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
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
    
    <!-- 工程详细信息对话框 -->
    <div class="modal" id="modal-project-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
    	<div class="modal-dialog modal-center">
    		<div class="modal-content animated fadeInDown">
    			<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">工程进度信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>工程名称</dt><dd data-name="name"></dd>
                		<dt>工程概述</dt><dd data-name="description"></dd>
                		<dt>工程进度</dt>
                		<dd data-name="progress">
                			<ul class="list-unstyled"></ul>
                		</dd>
                	</dl>
                </div>
    		</div>
    	</div>
    </div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-project');
		
		var $dialog = $page.find('#modal-project-dialog');
		var $projectDetailDialog = $('#modal-project-detail-dialog');
		var $form = $dialog.find('form');
		$k.util.bsValidator($form);
		
		var $progressListDialog = $page.find('#modal-progress-list-dialog');
		var $progressDialog = $page.find('#modal-progress-dialog');
		var $progressTable;
		var $progressForm = $progressDialog.find('form');
		$k.util.bsValidator($progressForm);
		
		var $table = $k.util.bsTable($page.find('#project-list-table'), {
			url: '${ctx}/api/website/project/list',
			toolbar: '#project-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '工程名称',
            	formatter: function(value, row, index) {
            		return '<a class="btn-project-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
                    'click .btn-project-detail': function(e, value, row, index) {
                        e.stopPropagation();
                        $.each(row, function(key, val) {
                        	if (key == 'progressList') {
                        		$projectDetailDialog.find('ul').empty();
                        		$.each(val, function(k, progress) {
                        			$projectDetailDialog.find('ul').append('<li>' + progress.name + '</li>');
                        		})
                        	} else {
                        		$projectDetailDialog.find('dd[data-name="' + key + '"]').text(val);
                        	}
            			});
            			$projectDetailDialog.modal('show');
                    },
                }
            }, {
            	field: 'updateTime',
            	title: '时间',
            	align: 'center',
                width: '150',
                formatter: formatDate2
            }, {
            	title: '操作',
            	align: 'center',
            	width: '180',
            	formatter: function(value, row, index) {
                    var $edit = '<a class="btn-project-edit a-operate">编辑</a>';
                    var $progress = '<a class="btn-project-progress a-operate">工程进度</a>';
                    var $delete = '<a class="btn-project-delete a-operate">删除</a>';
                    return $edit + $progress + $delete;
                },
            	events: window.operateEvents = {
            		'click .btn-project-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$form.find('input[name="' + key + '"]').val(val);
            				$form.find('textarea[name="' + key + '"]').val(val);
            			});
            			$dialog.data('method', 'edit');
            			$dialog.data('projectId', row.id);
            			$dialog.modal('show');
            		},
            		'click .btn-project-progress': function(e, value, row, index) {
            			e.stopPropagation();
            			$progressListDialog.find('#progress-list-table').bootstrapTable('destroy');
            			
            			var projectId = row.id;
            			$progressTable = $k.util.bsTable($progressListDialog.find('#progress-list-table'), {
            				url: '${ctx}/api/website/project/progress/list?projectId=' + projectId,
            				toolbar: '#progress-list-table-toolbar',
            				idField: 'id',
            				pageSize: 10, 	
            				responseHandler: function(res) {
            	                return res.data;
            	            },
            				columns: [{
            					field: 'state',
            					checkbox: true
            				}, {
            					field: 'name',
            					title: '进度'
            				}, {
            	            	field: 'updateTime',
            	            	title: '时间',
            	            	align: 'center',
            	                width: '150',
            	                formatter: formatDate2
            	            }, {
            	            	title: '操作',
            	            	align: 'center',
            	            	width: '120',
            	            	formatter: function(value, row, index) {
            	                    var $edit = '<a class="btn-progress-edit a-operate">编辑</a>';
            	                    var $delete = '<a class="btn-progress-delete a-operate">删除</a>';
            	                    return $edit + $delete;
            	                },
            	                events: window.operateEvents = {
            	                	'click .btn-progress-edit': function(e, value, row, index) {
            	                		e.stopPropagation();
            	            			$progressForm.find('input[name="name"]').val(row.name);
            	            			$progressDialog.data('method', 'edit');
            	            			$progressDialog.data('progressId', row.id);
            	            			
            	            			$progressListDialog.modal('hide');
            	            			$progressDialog.modal('show');
            	                	},
            	                	'click .btn-progress-delete': function(e, value, row, index) {
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
            	            					url: '${ctx}/api/website/project/progress/delete',
            	            					data: {
            	            						progressId: row.id
            	            					},
            	            					success: function(ret) {
            	            						if (ret.code == 0) {
            	                                    	toastr['success'](ret.msg);
            	                                    	$progressTable.bootstrapTable('refresh');
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
            			$progressTable.on('all.bs.table', function(e, row) {
            	            var selNum = $progressTable.bootstrapTable('getSelections').length;
            	            selNum > 0 ? $progressListDialog.find('.btn-progress-delete-batch').removeAttr('disabled') : $progressListDialog.find('.btn-progress-delete-batch').attr('disabled', 'disabled');
            	        });
            			
            			$progressListDialog.data('projectId', projectId);
            			$progressListDialog.modal('show');
            		},
            		'click .btn-project-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/website/project/delete',
            					data: {
            						projectId: row.id
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
            		}
            	}
            }]
		});
		$table.on('all.bs.table', function(e, row) {
            var selNum = $table.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-project-delete-batch').removeAttr('disabled') : $page.find('.btn-project-delete-batch').attr('disabled', 'disabled');
        });
		
		// project dialog
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var method = $dialog.data('method');
				if (method == 'add') {
					$.ajax({
 						url: '${ctx}/api/website/project/create',
                 		type: 'POST',
                 		data: {
                 			name: $dialog.find('input[name = "name"]').val(),
                			description: $dialog.find('textarea[name = "description"]').val(),
                 		},
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
					$.ajax({
	            		url: '${ctx}/api/website/project/update',
	            		type: 'POST',
	            		data: {
	            			projectId: $dialog.data('projectId'),
	            			name: $dialog.find('input[name = "name"]').val(),
	            			description: $dialog.find('textarea[name = "description"]').val(),
	            		},
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
		
		// progress dialog
		$progressDialog.on('click', '.btn-confirm', function() {
			var validator = $progressForm.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var method = $progressDialog.data('method');
				if (method == 'add') {
					$.ajax({
 						url: '${ctx}/api/website/project/progress/create',
                 		type: 'post',
                 		data: {
                 			projectId: $progressListDialog.data('projectId'),
                 			name: $progressDialog.find('input[name = "name"]').val(),
                 		},
                 		success: function(ret) {
                 			if (ret.code == 0) {
                 				$progressDialog.modal('hide');
                 				toastr['success'](ret.msg);
                     			$progressTable.bootstrapTable('refresh');
                     			$progressListDialog.modal('show');
                 			} else {
                 				toastr['error'](ret.msg);
                 			}
                 		},
                 		error: function(err) {}
                 	});
				} else {
					$.ajax({
	            		url: '${ctx}/api/website/project/progress/update',
	            		type: 'post',
	            		data: {
	            			progressId: $progressDialog.data('progressId'),
	            			name: $progressDialog.find('input[name = "name"]').val(),
	            		},
	            		success: function(ret) {
	            			if (ret.code == 0) {
	            				$progressDialog.modal('hide');
	            				toastr['success'](ret.msg);
		                        $progressTable.bootstrapTable('refresh');
		                        $progressListDialog.modal('show');
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
		.on('hidden.bs.modal', '#modal-project-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-project-add', function() {
			$dialog.data('method', 'add');
			$dialog.modal('show');
		})
		.on('click', '.btn-project-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/website/project/deleteBatch',
                    data: { 
                    	projectIdList: $k.util.getIdList(rows) 
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
        })
        // progress
        .on('click', '.btn-progress-add', function() {
        	$progressListDialog.modal('hide');
			$progressDialog.data('method', 'add');
			$progressDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-progress-dialog', function() {
			$progressForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            
			$progressDialog.modal('hide');
            $progressListDialog.modal('show');
        })
        .on('click', '.btn-progress-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $progressTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/website/project/progress/deleteBatch',
                    data: { 
                    	progressIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
                        	$progressTable.bootstrapTable('refresh');
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