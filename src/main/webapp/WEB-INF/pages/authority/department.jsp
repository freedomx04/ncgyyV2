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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-department">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>部门管理</h2>
				</div>
			
				<div class="btn-group" id="department-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-department-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                    <button type="button" class="btn btn-danger btn-department-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>删除
                    </button>
                </div>
                <table id="department-list-table" class="table-hm" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<!-- 部门新增,编辑对话框 -->
    <div class="modal" id="modal-department-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">部门信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-department" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>部门名称</label>
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
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
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
		
		var $page = $('.body-department');
		var $dialog = $page.find('#modal-department-dialog');
		var $form = $dialog.find('form');
		
		$k.util.bsValidator($form);
		
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
            	title: '部门名称',
            	align: 'center'
            }, {
            	field: 'principal',
            	title: '部门负责人',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	width: '120',
            	formatter: function(value, row, index) {
                    var $edit = '<a class="btn-department-edit a-operate">编辑</a>';
                    var $delete = '<a class="btn-department-delete a-operate">删除</a>';
                    return $edit + $delete;
                },
            	events: window.operateEvents = {
            		'click .btn-department-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$dialog.find('.modal-title strong').text('编辑');
            			$.each(row, function(key, val) {
            				$form.find('input[name="' + key + '"]').val(val);
            			});
            			$dialog.data('method', 'edit');
            			$dialog.data('departmentId', row.id);
            			$dialog.modal('show');
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
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/department/delete',
            					data: {
            						departmentId: row.id
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
            selNum > 0 ? $page.find('.btn-department-delete-batch').removeAttr('disabled') : $page.find('.btn-department-delete-batch').attr('disabled', 'disabled');
        });
		
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var method = $dialog.data('method');
				if (method == 'add') {
					$.ajax({
 						url: '${ctx}/api/department/create',
                 		type: 'POST',
                 		data: {
                 			name: $dialog.find('input[name = "name"]').val(),
                			principal: $dialog.find('input[name = "principal"]').val(),
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
	            		url: '${ctx}/api/department/update',
	            		type: 'POST',
	            		data: {
	            			departmentId: $dialog.data('departmentId'),
	            			name: $dialog.find('input[name = "name"]').val(),
	            			principal: $dialog.find('input[name = "principal"]').val(),
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
		
		$page
		.on('hidden.bs.modal', '#modal-department-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-department-add', function() {
			$dialog.data('method', 'add');
			$dialog.modal('show');
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
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/department/batchDelete',
                    data: { 
                        departmentIdList: $k.util.getIdList(rows) 
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
        });
		
	})( jQuery );
	</script>
	
</body>

</html>