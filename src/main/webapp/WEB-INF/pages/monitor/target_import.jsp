<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>主要指标上报</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/chosen/chosen.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-target">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>主要指标</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs row" id="target-list-table-toolbar" role="group">
					<div class="col-sm-4">
						<div class="input-group date">
	                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                        <input type="text" id="monthlyStart" class="form-control">
	                        <span class="input-group-addon btn btn-sm btn-primary">
	                    		查询
	                   		</span>
	                    </div>
	                </div>
					<div class="col-sm-8 text-right">
	                    <button type="button" class="btn btn-white btn-target-add" data-toggle="modal" data-target="#modal-target-dialog">
	                        <i class="fa fa-plus fa-fw"></i>新增
	                    </button>
	                    <button type="button" class="btn btn-white btn-target-delete-batch" disabled='disabled'>
	                        <i class="fa fa-trash-o fa-fw"></i>批量删除
	                    </button>
	                    <button type="button" class="btn btn-white btn-target-export" data-toggle="modal" data-target="#modal-target-dialog">
	                        <i class="fa fa-save fa-fw"></i>导出到excel
	                    </button>
	                    <button type="button" class="btn btn-white btn-target-import" data-toggle="modal" data-target="#modal-target-dialog">
	                        <i class="fa fa-cloud-upload fa-fw"></i>导入excel
	                    </button>
	                    <button type="button" class="btn btn-white btn-target-download" data-toggle="modal" data-target="#modal-target-dialog">
	                        <i class="fa fa-download fa-fw"></i>下载
	                    </button>
	                </div>
                </div>
                <table id="target-list-table" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<!-- 新增,编辑对话框 -->
    <div class="modal" id="modal-target-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><strong></strong></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-target" autocomplete="off">
                    	<div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>企业名称</label>
                            <div class="col-sm-7">
                                <select data-placeholder="选择企业" class="chosen-select">
		                        	<option value="0">企业总览</option>
		                        </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>年月</label>
                            <div class="col-sm-7">
                                <div class="input-group date">
			                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
			                        <input type="text" name="monthly" class="form-control">
			                    </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>本月止主营业务收入(万元)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="mainBusiness" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>本月止用电量(万度)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="electricity" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>本月止利润总额(万元)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="profit" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>本月止实现税金总额(万元)</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="tax" required>
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
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/chosen/chosen.jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-target');
		var $targetDialog = $page.find('#modal-target-dialog');
		var $targetForm = $targetDialog.find('form');
		
		//日期选择器，只选月份
		$k.util.initDatePicker($page.find(".date"));
		
		var $table = $k.util.bsTable($page.find('#target-list-table'), {
			url: '${ctx}/api/target/listByMonthly',
			method: "post",
			contentType : "application/x-www-form-urlencoded",
			queryParams: {monthly: $page.find(".date input").val()},
			toolbar: '#target-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'enterprise.name',
            	title: '企业名称',
            	align: 'center'
            }, {
            	field: 'target_current',
            	title: '本月止主营业务收入',
            	align: 'center',
            	formatter: function (value, row, index) {
                    return value != null ? value.mainBusiness : "-";
               	}
            }, {
            	field: 'target_current',
            	title: '本月止用电量',
            	align: 'center',
            	formatter: function (value, row, index) {
                    return value != null ? value.electricity : "-";
               	}
            }, {
            	field: 'target_current',
            	title: '本月止利润总额',
            	align: 'center',
            	formatter: function (value, row, index) {
                    return value != null ? value.profit : "-";
               	}
            }, {
            	field: 'target_current',
            	title: '本月止实现税金总额',
            	align: 'center',
            	formatter: function (value, row, index) {
                    return value != null ? value.tax : "-";
               	}
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-target-delete a-operate">删除</a>';
                },
            	events: window.operateEvents = {
            		'click .btn-target-delete': function(e, value, row, index) {
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
            				var targetId = row['id'];
            				
            				$.ajax({
            					url: '${ctx}/api/target/delete',
            					data: {
            						targetId: targetId
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
            selNum > 0 ? $page.find('.btn-target-delete-batch').removeAttr('disabled') : $page.find('.btn-target-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('hidden.bs.modal', '#modal-target-dialog', function() {
            $targetForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-target-add', function() {
			 getSelectList()
			 $k.util.initDatePicker($page.find("input[name='monthly']"));
			 $targetDialog.find('.modal-title strong').text('新增');
			 $targetForm.find('input').removeAttr('disabled');
			 
			 $targetDialog.on('click', '.btn-confirm', function() {
 				var validator = $targetForm.data('bootstrapValidator');
 				validator.validate();
 				
 				if (validator.isValid()) {
 					$.ajax({
 						url: '${ctx}/api/target/create',
                 		type: 'POST',
                 		data: {
                 			name: $targetForm.find('input[name = "name"]').val(),
                 			description: $targetForm.find('input[name = "description"]').val()
                 		},
                 		success: function(ret) {
                 			$targetDialog.modal('hide');
                 			swal('', '添加成功!', 'success');
                 			$table.bootstrapTable('refresh'); 
                 		},
                 		error: function(err) {}
                 	});
                 }
 			});
		})
		.on('click', '.btn-target-delete-batch', function() {
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
                    url: '${ctx}/api/target/batchDelete',
                    data: { 
                        targetIdList: $k.util.getIdList(rows) 
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
        $targetDialog.find('form').bootstrapValidator({
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
	                    	url: '${ctx}/api/target/exist',
	                    	message: '行业已存在',
	                    	delay: 2000,
	                    	type: 'GET',
	                    }
					} 
				}
            }
        });
		
		function getSelectList() {
			//下拉选框数据获取
			$.ajax({
				type: "POST",
				url: '${ctx}/api/enterprise/listBase',
				success: function(data) {
					if (data.code == 0) {
						$.each(data.data, function(key, val) {
							$('<option value="'+ val.id +'">'+ val.name +'</option>').appendTo($page.find(".chosen-select"));
						});
						$k.util.chosen();
					}
				},
				error: function(err) {}
			});
		}
	})( jQuery );
	
	</script>
	
</body>

</html>