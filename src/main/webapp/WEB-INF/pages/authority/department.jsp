<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>部门管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-department">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>部门管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="department-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-department-add" data-toggle="modal" data-target="#modal-department-dialog">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                    <button type="button" class="btn btn-white btn-department-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>批量删除
                    </button>
                </div>
                <table id="department-list-table" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<!-- 部门新增,编辑对话框 -->
    <div class="modal" id="modal-department-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><strong></strong></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-department" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="principal" class="col-sm-3 control-label"><i class="form-required">*</i>部门负责人</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="principal" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-3 control-label">描述</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="description">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">
                        <i class="fa fa-close fa-fw"></i>关闭
                    </button>
                    <button type="button" class="btn btn-primary btn-confirm">
                        <i class="fa fa-check fa-fw"></i>确定
                    </button>
                </div>
            </div>
        </div>
    </div>
	
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-department');
		var $departmentDialog = $page.find('#modal-department-dialog');
		var $departmentForm = $departmentDialog.find('form');
		
		var $table = $k.util.bsTable($page.find('#department-list-table'), {
			url: '${ctx}/api/department/list',
			toolbar: '#department-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '名称',
            	align: 'center'
            }, {
            	field: 'principal',
            	title: '部门负责人',
            	align: 'center'
            }, {
            	field: 'description',
            	title: '描述',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-department-edit a-operate">编辑</a><a class="btn-department-delete a-operate">删除</a>';
                },
            	events: window.operateEvents = {
            		'click .btn-department-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			
            			$departmentDialog.find('.modal-title strong').text('编辑');
            			$.each(row, function(key, val) {
            				if (key == 'name') {
                                $departmentForm.find('input[name = "name"]').attr('disabled', 'disabled');
                            }
            				$departmentForm.find('input[name="' + key + '"]').val(val);
            			});
            			
            			$departmentDialog.modal('show');
            			
            			$departmentDialog.on('click', '.btn-confirm', function() {
            				var validator = $departmentForm.data('bootstrapValidator');
            				validator.validate();
            				
                            if (validator.isValid()) {
                            	$.ajax({
                            		url: '${ctx}/api/department/update',
                            		type: 'POST',
                            		data: {
                            			departmentId: row.id,
                            			principal: $departmentForm.find('input[name = "principal"]').val(),
                            			description: $departmentForm.find('input[name = "description"]').val()
                            		},
                            		success: function(ret) {
                            			$departmentDialog.modal('hide');
                                        swal('', '编辑成功!', 'success');
                                        $table.bootstrapTable('refresh'); 
                            		},
                            		error: function(err) {}
                            	});
                            }
            			});
            		},
            		'click .btn-department-delete': function(e, value, row, index) {
            			e.stopPropagation();
            			
            			swal({
            				title: '',
            				text: '确定删除选中记录?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
                            closeOnConfirm: false
            			}, function() {
            				var departmentId = row['id'];
            				
            				$.ajax({
            					url: '${ctx}/api/department/delete',
            					data: {
            						departmentId: departmentId
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '删除成功!', 'success');
            						} else if (ret.code == 1004) {
            							swal('', '该数据存在关联, 无法删除', 'error');
            						} else {
            							swal('', ret.msg, 'error');
            						}
            						$table.bootstrapTable('refresh'); 
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
            selNum > 0 ? $page.find('.btn-department-delete-batch').removeAttr('disabled') : $page.find('.btn-department-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('hidden.bs.modal', '#modal-department-dialog', function() {
            $departmentForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-department-add', function() {
			 $departmentDialog.find('.modal-title strong').text('新增');
			 $departmentForm.find('input').removeAttr('disabled');
			 
			 $departmentDialog.on('click', '.btn-confirm', function() {
 				var validator = $departmentForm.data('bootstrapValidator');
 				validator.validate();
 				
 				if (validator.isValid()) {
 					$.ajax({
 						url: '${ctx}/api/department/create',
                 		type: 'POST',
                 		data: {
                 			name: $departmentForm.find('input[name = "name"]').val(),
                			principal: $departmentForm.find('input[name = "principal"]').val(),
                 			description: $departmentForm.find('input[name = "description"]').val()
                 		},
                 		success: function(ret) {
                 			$departmentDialog.modal('hide');
                 			swal('', '添加成功!', 'success');
                 			$table.bootstrapTable('refresh'); 
                 		},
                 		error: function(err) {}
                 	});
                 }
 			});
		})
		.on('click', '.btn-department-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                
                $.ajax({
                    url: '${ctx}/api/department/batchDelete',
                    data: { 
                        departmentIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '删除成功!', 'success');
                        } else if (ret.code == 1004) {
							swal('', '该数据存在关联, 无法删除', 'error');
						} else {
                            swal('', ret.msg, 'error');
                        }
                        $table.bootstrapTable('refresh'); 
                    },
                    error: function(err) {}
                });
            });
        });
		
		// 添加验证器
        $departmentDialog.find('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            excluded: [':disabled'],
            fields: {
            	name: {
					validators: {
						threshold: 6,
	                    remote: {
	                    	url: '${ctx}/api/department/exist',
	                    	message: '部门已存在',
	                    	delay: 2000,
	                    	type: 'GET',
	                    }
					} 
				},
				description: {}
            }
        });
		
	})( jQuery );
	</script>
	
</body>

</html>