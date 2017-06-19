<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-appeal">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 诉求列表</a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">诉求预警</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
                    	<div class="ibox float-e-margins">
							
							<div class="ibox-content">
								<div class="btn-group hidden-xs" id="appeal-list-table-toolbar" role="group">
				                    <button type="button" class="btn btn-white btn-appeal-add" data-toggle="modal" data-target="#modal-appeal-dialog">
				                        <i class="fa fa-plus fa-fw"></i>新增
				                    </button>
				                    <button type="button" class="btn btn-white btn-appeal-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>批量删除
				                    </button>
				                </div>
				                <table id="appeal-list-table" class="table-hm" data-mobile-responsive="true"> </table>
							</div>
						</div>
                    </div>
                </div>
             </div>
        </div>
		
	</div>
	
	<!-- 用户新增,编辑对话框 -->
    <div class="modal" id="modal-appeal-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><strong></strong></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-appeal" autocomplete="off">
                        <div class="form-group">
                            <label for="title" class="col-sm-3 control-label"><i class="form-required">*</i>诉求标题</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="title" required data-bv-notempty-message="标题不能为空">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="appealTypeIdId" class="col-sm-3 control-label"><i class="form-required">*</i>诉求类别</label>
                            <div class="col-sm-7">
                                <select data-placeholder="选择类别" class="chosen-select form-control" name="appealTypeIdId" required data-bv-notempty-message="诉求类别不能为空">
                                	<option value="">请选择</option>
		                        </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-3 control-label">诉求详情</label>
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
		
		var $page = $('.body-appeal');
		var $appealDialog = $page.find('#modal-appeal-dialog');
		var $appealForm = $appealDialog.find('form');
		
		var $table = $k.util.bsTable($page.find('#area-list-table'), {
			url: '${ctx}/api/area/list',
			toolbar: '#area-list-table-toolbar',
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
            	field: 'description',
            	title: '描述',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-appeal-edit a-operate">编辑</a><a class="btn-appeal-delete a-operate">删除</a><a class="btn-appeal-send a-operate">发送</a><a class="btn-appeal-urge a-operate">催办</a><a class="btn-appeal-confirm a-operate">确认办结</a>';
                },
            	events: window.operateEvents = {
            		'click .btn-appeal-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			
            			$appealDialog.find('.modal-title strong').text('编辑');
            			$.each(row, function(key, val) {
            				if (key == 'name') {
                                $appealForm.find('input[name = "name"]').attr('disabled', 'disabled');
                            }
            				$appealForm.find('input[name="' + key + '"]').val(val);
            			});
            			$appealDialog.modal('show');
            			
            			$appealDialog.on('click', '.btn-confirm', function() {
            				/* var validator = $appealForm.data('bootstrapValidator');
            				validator.validate(); */
            				
                            if (validator.isValid()) {
                            	$.ajax({
                            		url: '${ctx}/api/area/update',
                            		type: 'POST',
                            		data: {
                            			appealId: row.id,
                            			description: $appealForm.find('input[name = "description"]').val()
                            		},
                            		success: function(ret) {
                            			$appealDialog.modal('hide');
                                        swal('', '编辑成功!', 'success');
                                        $table.bootstrapTable('refresh'); 
                            		},
                            		error: function(err) {}
                            	});
                            }
            			});
            		},
            		'click .btn-appeal-delete': function(e, value, row, index) {
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
            				var appealId = row['id'];
            				
            				$.ajax({
            					url: '${ctx}/api/area/delete',
            					data: {
            						appealId: appealId
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
            selNum > 0 ? $page.find('.btn-appeal-delete-batch').removeAttr('disabled') : $page.find('.btn-appeal-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('hidden.bs.modal', '#modal-appeal-dialog', function() {
            $appealForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-appeal-add', function() {
			 $appealDialog.find('.modal-title strong').text('新增');
			 $appealForm.find('input').removeAttr('disabled');
			 
			 $appealDialog.on('click', '.btn-confirm', function() {
 				var validator = $appealForm.data('bootstrapValidator');
 				console.info($appealForm.html())
 				validator.validate();
 				return;
 				//if (validator.isValid()) {
 					$.ajax({
 						url: '${ctx}/api/area/create',
                 		type: 'POST',
                 		data: {
                 			name: $appealForm.find('input[name = "name"]').val(),
                 			description: $appealForm.find('input[name = "description"]').val()
                 		},
                 		success: function(ret) {
                 			$appealDialog.modal('hide');
                 			swal('', '添加成功!', 'success');
                 			$table.bootstrapTable('refresh'); 
                 		},
                 		error: function(err) {}
                 	});
                 //}
 			});
		})
		.on('click', '.btn-appeal-delete-batch', function() {
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
                    url: '${ctx}/api/area/batchDelete',
                    data: { 
                        appealIdList: $k.util.getIdList(rows) 
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
		
	})( jQuery );
	</script>
	
</body>

</html>