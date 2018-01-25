<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商项目</title>
	
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

<body class="gray-bg body-business">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>招商项目</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group" id="business-list-table-toolbar" role="group">
					<button type="button" class="btn btn-white btn-business-add">
             			<i class="fa fa-plus fa-fw"></i>新增
              		</button>
                    <button type="button" class="btn btn-danger btn-business-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>删除
                    </button>
                </div>
                <table id="business-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-business-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招商信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-business" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>项目名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>项目地址</label>
                            <div class="col-sm-7">
                            	<input type="text" class="form-control" name="address" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="overview" class="col-sm-3 control-label"><i class="form-required">*</i>项目概况</label>
                        	 <div class="col-sm-7">
                                <textarea class="form-control" name="overview" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="content" class="col-sm-3 control-label"><i class="form-required">*</i>建设内容</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="content" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="scale" class="col-sm-3 control-label"><i class="form-required">*</i>投资规模</label>
                            <div class="col-sm-7">
                            	<input type="text" class="form-control" name="scale" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="mode" class="col-sm-3 control-label"><i class="form-required">*</i>合作方式</label>
                            <div class="col-sm-7">
                            	<input type="text" class="form-control" name="mode" required>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="contactUser" class="col-sm-3 control-label"><i class="form-required">*</i>联系人</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contactUser" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contact" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label"><i class="form-required">*</i>邮箱</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="email" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="fax" class="col-sm-3 control-label"><i class="form-required">*</i>传真</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="fax" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal" id="modal-business-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招商信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>项目名称</dt><dd data-name="name"></dd>
                		<dt>项目地址</dt><dd data-name="address"></dd>
                		<dt>项目概况</dt><dd data-name="overview"></dd>
                		<dt>建设内容</dt><dd data-name="content"></dd>
                		<dt>投资规模</dt><dd data-name="scale"></dd>
                		<dt>合作方式</dt><dd data-name="mode"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                		<dt>联系人</dt><dd data-name="email"></dd>
                		<dt>联系电话</dt><dd data-name="fax"></dd>
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
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-business');
		
		var $businessTable = $('#business-list-table');
		var $businessDialog = $('#modal-business-dialog');
		var $businessDetailDialog = $('#modal-business-detail-dialog');
		var $businessForm = $('#form-business');
		$k.util.bsValidator($businessForm);
		
		$businessTable = $k.util.bsTable($page.find('#business-list-table'), {
			url: '${ctx}/api/business/business/list',
			toolbar: '#business-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns:[{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '项目名称',
            	formatter: function(value, row, index) {
            		return '<a class="btn-business-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-business-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$businessDetailDialog.find('dd[data-name="' + key + '"]').text(val);
            			});
            			$businessDetailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'address',
            	title: '项目地点',
            }, {
            	field: 'scale',
            	title: '投资规模'
            }, {
            	field: 'mode',
            	title: '合作方式'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $edit = '<a class="btn-business-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-business-delete a-operate">删除</a>';
            		return $edit + $delete;
            	},
            	events: window.operateEvents = {
            		'click .btn-business-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$businessForm.find('input[name="' + key + '"]').val(val);
            				$businessForm.find('textarea[name="' + key + '"]').val(val);
            				$businessForm.find('select[name="' + key + '"]').val(val);
            			});
            			$businessDialog.data('method', 'edit');
        				$businessDialog.data('businessId', row.id);
            			$businessDialog.modal('show');
            		},
            		'click .btn-business-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/business/business/delete',
            					data: {
            						businessId: row.id
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['success'](ret.msg);
        		                		$businessTable.bootstrapTable('refresh'); 
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
		$businessTable.on('all.bs.table', function(e, row) {
            var selNum = $businessTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-business-delete-batch').removeAttr('disabled') : $page.find('.btn-business-delete-batch').attr('disabled', 'disabled');
        });
		
		$businessDialog.on('click', '.btn-confirm', function() {
			var validator = $businessForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($businessForm[0]); 
        		var method = $businessDialog.data('method');
        		if (method == 'add') {
        			$.ajax({
					    url: '${ctx}/api/business/business/create',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$businessDialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$businessTable.bootstrapTable('refresh'); 
		                	} else {
		                		toastr['error'](ret.msg);
		                	}
		                },
		                error: function(err) {}
		            });
        		} else {
        			formData.append('businessId', $businessDialog.data('businessId'));
        			$.ajax({
					    url: '${ctx}/api/business/business/update',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$businessDialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$businessTable.bootstrapTable('refresh'); 
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
		.on('click', '.btn-business-add', function() {
			$businessDialog.data('method', 'add');
			$businessDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-business-dialog', function() {
            $businessForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
        .on('click', '.btn-business-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $businessTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/business/business/deleteBatch',
                    data: { 
                    	businessIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$businessTable.bootstrapTable('refresh'); 
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