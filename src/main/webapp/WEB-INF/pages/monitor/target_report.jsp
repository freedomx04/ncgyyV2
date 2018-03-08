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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/chosen/chosen.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style>
	.datepicker.dropdown-menu {
		z-index: 999999!important;
	}
	</style>
</head>

<body class="gray-bg body-target">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>主要指标上报</h2>
				</div>
			
				<div class="btn-group row" id="target-list-table-toolbar" role="group">
					<div class="col-sm-3">
						<div class="input-group date">
	                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                        <input type="text" id="search-monthly" class="form-control">
	                        <span id="search" class="btn btn-primary" style="cursor: pointer; display: table-cell; width: 80px;"><i class="fa fa-search fa-fw"></i>查询</span>
	                    </div>
	                </div>
					<div class="col-sm-9 text-right">
	                    <button type="button" class="btn btn-white btn-target-add" data-toggle="modal" data-target="#modal-target-dialog">
	                        <i class="fa fa-plus fa-fw"></i>新增
	                    </button>
	                    <button type="button" class="btn btn-white btn-target-export">
	                        <i class="fa fa-save fa-fw"></i>导出
	                    </button>
					    <input id="importTarget-file-input" type="file" style="display:none">
					    <button class="btn btn-white btn-target-import">
					    	<i class="fa fa-file-excel-o fa-save fa-fw"></i>导入excel
					    </button>
	                    <button type="button" class="btn btn-white btn-target-download">
	                        <i class="fa fa-download fa-fw"></i>下载模板
	                    </button>
	                </div>
                </div>
                <table id="target-list-table" class="table-hm" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<!-- 新增,编辑对话框 -->
    <div class="modal" id="modal-target-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">主要指标信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-target" autocomplete="off">
                    	<div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>企业名称</label>
                            <div class="col-sm-9">
                                <select data-placeholder="选择企业" class="chosen-select form-control" name="enterpriseId" required>
                                	<option value="">请选择</option>
		                        </select>
                            </div>
                        </div>
                        <div class="form-group">
	                        <label for="monthly" class="col-sm-3 control-label"><i class="form-required">*</i>月份</label>
                            <div class="col-sm-9 input-group date monthly" style="padding-left: 15px; padding-right: 15px;">
                            	<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control" name="monthly" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>主营业务收入</label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="mainBusiness" data-bv-numeric data-bv-numeric-message="请输入整数" required><span class="input-group-addon">万元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>用电量</label>
                            <div class="col-sm-9">
                            	<div class="input-group">
                            	    <input type="text" class="form-control" name="electricity" data-bv-numeric data-bv-numeric-message="请输入整数" required><span class="input-group-addon">万度</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>利润总额</label>
                            <div class="col-sm-9">
                            	<div class="input-group">
                            	    <input type="text" class="form-control" name="profit" data-bv-numeric data-bv-numeric-message="请输入整数" required><span class="input-group-addon">万元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>实现税金总额</label>
                            <div class="col-sm-9">
                            	<div class="input-group">
                            	    <input type="text" class="form-control" name="tax" data-bv-numeric data-bv-numeric-message="请输入整数" required><span class="input-group-addon">万元</span>
                                </div>
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
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/chosen/chosen.jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-target');
		var $dialog = $page.find('#modal-target-dialog');
		var $form = $dialog.find('form');
		
		$k.util.bsValidator($form);
		
		//日期选择器，只选月份
		$k.util.initDatePicker($page.find(".date"));
		
		var $table = initTable();
		
		$page
		.on('hidden.bs.modal', '#modal-target-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-target-add', function() {
			 getSelectList();
			 $dialog.find('.monthly').datepicker({
				 //format: 'yyyy-mm',
			     //minViewMode: 1,
			     autoclose: true
			 });
			 $dialog.data('method', 'add');
			 $form.find('input').removeAttr('disabled');
			 $form.find('input[name = "monthly"]').val("");
			 $form.find('select[name = "enterpriseId"]').val("").trigger("chosen:updated");
		})
        .on("change", "#importTarget-file-input", function() {
        	var oMyForm = new FormData();
			oMyForm.append("uploadfile",this.files[0]);

			$.ajax({
				url: "${ctx}/api/target/import",
				type: "POST",
				data: oMyForm,
				enctype : 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				success: function(ret) {
					if(ret.code != 0) {
						swal('', '上传数据格式不正确，请重新上传！', 'error');
					} else {
						initTable();
						swal('', '上传成功!', 'success');
					}
					$page.find('#importTarget-file-input').val("");
				},
				error: function(data) {}
			});
		})
		.on("click", ".btn-target-import", function() {
			$('input[id=importTarget-file-input]').click();
		})
		.on("click", ".btn-target-export", function() {
			var monthly = $page.find(".date input").val();
			location.href = "${ctx}/api/target/export?monthly=" + monthly + "&type=1";
		})
		.on("click", ".btn-target-download", function() {
			var monthly = $page.find(".date input").val();
			location.href = "${ctx}/api/target/template?monthly=" + monthly + "&type=6";
		})
		.on("click", "#search", function() {
			initTable();
		});
		
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				var method = $dialog.data('method');
				if (method == 'add') {
					$.ajax({
						url: '${ctx}/api/target/create',
	            		type: 'POST',
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
					formData.append('targetId', $dialog.data('targetId'));
					$.ajax({
                   		url: '${ctx}/api/target/update',
                   		type: 'POST',
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
		
		function getSelectList(fn) {
			//下拉选框数据获取
			$.ajax({
				type: "POST",
				url: '${ctx}/api/enterprise/listBase',
				success: function(data) {
					if (data.code == 0) {
						$.each(data.data, function(key, val) {
							$('<option value="'+ val.id +'">'+ val.name +'</option>').appendTo($page.find(".chosen-select"));
						});
						if (typeof fn === 'function') {
							fn();
						}
						$k.util.chosen($page.find('.chosen-select'));
					}
				},
				error: function(err) {}
			});
		}
		
		function initTable() {
			//先销毁表格  
	        $page.find('#target-list-table').bootstrapTable('destroy'); 
			var monthly = $page.find("#search-monthly").val();
			
			var $table = $k.util.bsTable($page.find('#target-list-table'), {
				url: '${ctx}/api/target/listByMonthly?monthly=' + monthly,
				toolbar: '#target-list-table-toolbar',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns: [{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'enterprise',
	            	title: '企业名称',
	            	formatter: function(value, row, index) {
	            		return value != null ? value.name : '-';
	            	}
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
	            	width: '100',
	            	formatter: function(value, row, index) {
	            		if (row.target_current == null) {
	            			return '-'
	            		} else {
	            			var $edit = '<a class="btn-target-edit a-operate">编辑</a>';
	            			var $delete = '<a class="btn-target-delete a-operate">删除</a>';
	            			return $edit + $delete;	
	            		}
	                },
	            	events: window.operateEvents = {
	           			'click .btn-target-edit': function(e, value, row, index) {
	               			e.stopPropagation();
	               			if (row.target_current == null) {
	               				return;
	               			}
	               			$form.find('input[name = "monthly"]').val(row.monthly);
	                        $form.find('input[name = "monthly"]').attr('disabled', 'disabled');
	                        
	               			$.each(row, function(key, val) {
	               				if (key == 'enterprise') {
	               					getSelectList(function() {
	               						$form.find('select[name = "enterpriseId"]').val(val.id);
	               					});
	               					$form.find('select[name = "enterpriseId"]').prop('disabled', true).trigger("chosen:updated");
	                            } else if (key == 'target_current') {
	                            	$form.find('input[name="mainBusiness"]').val(val.mainBusiness);
	                            	$form.find('input[name="electricity"]').val(val.electricity);
	                            	$form.find('input[name="profit"]').val(val.profit);
	                            	$form.find('input[name="tax"]').val(val.tax);
	                            }
	               			});
	               			$dialog.data('method', 'edit');
	                        $dialog.data('targetId', row.target_current.id);
	               			$dialog.modal('show');
	               		},
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
	            			}, function() {
	            				$.ajax({
	            					url: '${ctx}/api/target/delete',
	            					data: {
	            						targetId: row.target_current.id
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
	            			});
	            		}
	            	}
	            }]
			});
			return $table;
		}
	})( jQuery );
	</script>
	
</body>
</html>