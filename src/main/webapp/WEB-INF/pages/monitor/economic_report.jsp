<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>经济数据上报</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.datepicker.dropdown-menu {
		z-index: 999999!important;
	}
	</style>
</head>

<body class="gray-bg body-economic-report">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#economic-country" data-tab="country" aria-expanded="true">全国主要指标</a>
						</li>
						<li>
							<a data-toggle="tab" href="#economic-province" data-tab="province" aria-expanded="false">全省主要指标</a>
						</li>
						<li>
							<a data-toggle="tab" href="#economic-city" data-tab="city" aria-expanded="false">全市主要指标</a>
						</li>
						<li>
							<a data-toggle="tab" href="#economic-county" data-tab="county" aria-expanded="false">全县主要指标</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="economic-country" class="tab-pane active">
							<div class="panel-body">
								<div class="btn-group" id="country-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-economic-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-economic-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="country-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="economic-province" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="province-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-economic-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-economic-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="province-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="economic-city" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="city-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-economic-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-economic-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="city-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="economic-county" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="county-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-economic-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-economic-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="county-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 新增,编辑对话框 -->
    <div class="modal" id="modal-economic-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">经济数据</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-economic" autocomplete="off">
                        <div class="form-group">
	                        <label for="monthly" class="col-sm-3 control-label"><i class="form-required">*</i>月份</label>
                            <div class="col-sm-8 input-group date monthly" style="padding-left: 15px; padding-right: 15px;">
                            	<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input type="text" class="form-control" name="monthly" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">主营业务收入</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="business" data-bv-numeric>
                                    <span class="input-group-addon">万元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">用电量</label>
                            <div class="col-sm-8">
                            	<div class="input-group">
                            	    <input type="text" class="form-control" name="electricity" data-bv-numeric>
                            	    <span class="input-group-addon">万度</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">利润总额</label>
                            <div class="col-sm-8">
                            	<div class="input-group">
                            	    <input type="text" class="form-control" name="profit" data-bv-numeric>
                            	    <span class="input-group-addon">万元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">实现税金总额</label>
                            <div class="col-sm-8">
                            	<div class="input-group">
                            	    <input type="text" class="form-control" name="tax" data-bv-numeric>
                            	    <span class="input-group-addon">万元</span>
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
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
    
    <script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-economic-report');
		var $dialog = $page.find('#modal-economic-dialog');
		var $form = $dialog.find('form');
		
		$k.util.bsValidator($form);
		
		var tab = 'country';
		initTable(tab);
		
		var $table, $toolbar, type, $bsTable;
		function initTable(tab) {
			switch (tab) {
			case 'country':
				type = 0;
				$table = $page.find('#country-table');
				$toolbar = $page.find('#country-table-toolbar');
				break;
			case 'province':
				type = 1;
				$table = $page.find('#province-table');
				$toolbar = $page.find('#province-table-toolbar');
				break;
			case 'city':
				type = 2;
				$table = $page.find('#city-table');
				$toolbar = $page.find('#city-table-toolbar');
				break;
			case 'county':
				type = 3;
				$table = $page.find('#county-table');
				$toolbar = $page.find('#county-table-toolbar');
				break;
			}
			
			$bsTable = $k.util.bsTable($table, {
				url: '${ctx}/api/monitor/economic/list?type=' + type,
				toolbar: $toolbar,
				idField: 'id',
				responseHandler: function(res) {
    				return res.data;
    			},
    			columns: [{
    				field: 'state',
    				checkbox: true
    			}, {
    				field: 'monthly',
    				title: '月份',
    				align: 'center'
    			}, {
    				field: 'business',
    				title: '主营业务收入(万元)',
    				align: 'center'
    			}, {
    				field: 'electricity',
    				title: '用电量(万度)',
    				align: 'center'
    			}, {
    				field: 'profit',
    				title: '利润总额(万元)',
    				align: 'center'
    			}, {
    				field: 'tax',
    				title: '实现税金总额(万元)',
    				align: 'center'
    			}, {
    				title: '操作',
    				align: 'center',
    				width: '100',
    				formatter: function(value, row, index) {
            			var $edit = '<a class="btn-economic-edit a-operate">编辑</a>';
            			var $delete = '<a class="btn-economic-delete a-operate">删除</a>';
            			return $edit + $delete;	
	                },
	                events: window.operateEvents = {
	                	'click .btn-economic-edit': function(e, value, row, index) {
	                		e.stopPropagation();
	                		$.each(row, function(key, val) {
	                			$form.find('input[name="' + key + '"]').val(val);
	                		});
	                		$form.find('input[name = "monthly"]').attr('disabled', 'disabled');
	                		$dialog.data('method', 'edit');
            				$dialog.data('economicId', row.id);
	            			$dialog.modal('show');
	                	},
	                	'click .btn-economic-delete': function(e, value, row, index) {
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
	            					url: '${ctx}/api/monitor/economic/delete',
	            					data: {
	            						economicId: row.id
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
			$bsTable.on('all.bs.table', function(e, row) {
    			var selNum = $table.bootstrapTable('getSelections').length;
    			selNum > 0 ? $page.find('.btn-economic-delete-batch').removeAttr('disabled') : $page.find('.btn-economic-delete-batch').attr('disabled', 'disabled');
    		});
		}
		
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				var method = $dialog.data('method');
				if (method == 'add') {
					formData.append('type', type);
					$.ajax({
						url: '${ctx}/api/monitor/economic/create',
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
					formData.append('economicId', $dialog.data('economicId'));
					$.ajax({
                   		url: '${ctx}/api/monitor/economic/update',
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
		
		$page
		.on('click', 'a[data-toggle="tab"]', function() {
			var tab = $(this).data('tab');
			initTable(tab);
		})
		.on('click', '.btn-economic-add', function() {
			$k.util.initDatePicker($page.find(".date"));
			$dialog.find('.monthly').datepicker({
				autoclose: true
			});
			$dialog.data('method', 'add');
			$dialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-economic-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $form.find('input').removeAttr('disabled');
        })
        .on('click', '.btn-economic-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定'
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/monitor/economic/deleteBatch',
                    data: { 
                    	economicIdList: $k.util.getIdList(rows) 
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
        });;
		
	}) ( jQuery );
	</script>
	
</body>
</html>