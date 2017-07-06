<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>行业管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-industry">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>行业管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="industry-list-table-toolbar" role="group">
					<c:if test="${fn:contains(role.resource, 'authority-industry-add')}">
                    <button type="button" class="btn btn-white btn-industry-add" data-toggle="modal" data-target="#modal-industry-dialog">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                    </c:if>
                    <c:if test="${fn:contains(role.resource, 'authority-industry-delete-batch')}">
                    <button type="button" class="btn btn-white btn-industry-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>批量删除
                    </button>
                    </c:if>
                </div>
                <table id="industry-list-table" class="table-hm" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
    <div class="modal" id="modal-industry-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><strong></strong></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-industry" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>行业名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
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
		
		var $page = $('.body-industry');
		var $dialog = $page.find('#modal-industry-dialog');
		var $form = $dialog.find('form');
		
		$k.util.bsValidator($form);
		
		var $table = $k.util.bsTable($page.find('#industry-list-table'), {
			url: '${ctx}/api/industry/list',
			toolbar: '#industry-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '行业名称',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var resource = '${role.resource}'.split(',');
                    var $operate = '';
                    if ($.inArray('authority-industry-edit', resource) != -1) {
                        $operate += '<a class="btn-industry-edit a-operate">编辑</a>';
                    }
                    if ($.inArray('authority-industry-delete', resource) != -1) {
                        $operate += '<a class="btn-industry-delete a-operate">删除</a>';
                    }
                    if ($operate == '') {
                        $operate = '-';
                    }
                    return $operate;
                },
            	events: window.operateEvents = {
            		'click .btn-industry-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$dialog.find('.modal-title strong').text('编辑');
            			$dialog.find('input[name="name"]').val(row.name);
            			$dialog.data('method', 'edit');
            			$dialog.data('industryId', row.id);
            			$dialog.modal('show');
            		},
            		'click .btn-industry-delete': function(e, value, row, index) {
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
            				$.ajax({
            					url: '${ctx}/api/industry/delete',
            					data: {
            						industryId: row.id
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '删除成功!', 'success');
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
            selNum > 0 ? $page.find('.btn-industry-delete-batch').removeAttr('disabled') : $page.find('.btn-industry-delete-batch').attr('disabled', 'disabled');
        });
			
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var method = $dialog.data('method');
				if (method == 'add') {
					$.ajax({
						url: '${ctx}/api/industry/create',
	               		type: 'POST',
	               		data: {
	               			name: $form.find('input[name = "name"]').val(),
	               		},
	               		success: function(ret) {
	               			if (ret.code == 0) {
	               				$dialog.modal('hide');
	                   			swal('', '添加成功!', 'success');
	                   			$table.bootstrapTable('refresh'); 
	               			} else {
	               				swal('', ret.msg, 'error');
	               			}
	               		},
	               		error: function(err) {}
	               	});
				} else {
					$.ajax({
 						url: '${ctx}/api/industry/update',
 						type: 'POST',
 						data: {
 							industryId: $dialog.data('industryId'),
 							name: $dialog.find('input[name="name"]').val()
 						},
 						success: function(ret) {
 							if (ret.code == 0) {
 								$dialog.modal('hide');
                     			swal('', '编辑成功!', 'success');
                     			$table.bootstrapTable('refresh');
 							} else {
 								swal('', ret.msg, 'error');
 							}
 						},
 						error: function(err) {}
 					});
				}
			}
		});
		
		$page
		.on('hidden.bs.modal', '#modal-industry-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-industry-add', function() {
			$dialog.find('.modal-title strong').text('新增');
			$dialog.data('method', 'add');
		})
		.on('click', '.btn-industry-delete-batch', function() {
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
                    url: '${ctx}/api/industry/batchDelete',
                    data: { 
                        industryIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '删除成功!', 'success');
						} else {
                            swal('', ret.msg, 'error');
                        }
                        $table.bootstrapTable('refresh'); 
                    },
                    error: function(err) {}
                });
            });
        });
		
	})( jQuery );
	</script>
	
</body>

</html>