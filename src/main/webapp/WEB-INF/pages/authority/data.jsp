<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>基础数据管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-data">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#data-industry" data-tab="industry" aria-expanded="true">行业管理</a>
						</li>
						<li>
							<a data-toggle="tab" href="#data-appealType" data-tab="appealType" aria-expanded="false">诉求类别管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="data-industry" class="tab-pane active">
							<div class="panel-body">
								<div class="btn-group" id="industry-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-industry-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-industry-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="industry-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="data-appealType" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="appealType-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-appealType-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-appealType-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="appealType-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- industry -->
	<div class="modal" id="modal-industry-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">行业信息</h4>
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
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- appealType -->
    <div class="modal" id="modal-appealType-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">诉求类别信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-appealType" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>诉求类别</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="acceptDays" class="col-sm-3 control-label"><i class="form-required">*</i>最大受理天数</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="acceptDays" required data-bv-integer="true">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="handleDays" class="col-sm-3 control-label"><i class="form-required">*</i>最大处理天数</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="handleDays" required data-bv-integer="true">
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
    
    <script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-data');
		
		// industry
		var $industryDialog = $('#modal-industry-dialog');
        var $industryForm = $('#form-industry');
        $k.util.bsValidator($industryForm);
        
        var $industryTable = $k.util.bsTable($page.find('#industry-table'), {
            url: '${ctx}/api/industry/list',
            toolbar: '#industry-table-toolbar',
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
                	var $edit = '<a class="btn-industry-edit a-operate">编辑</a>';
                    var $delete = '<a class="btn-industry-delete a-operate">删除</a>';
                    return $edit + $delete;
                },
                events: window.operateEvents = {
                    'click .btn-industry-edit': function(e, value, row, index) {
                        e.stopPropagation();
                        $industryDialog.find('input[name="name"]').val(row.name);
                        $industryDialog.data('method', 'edit');
                        $industryDialog.data('industryId', row.id);
                        $industryDialog.modal('show');
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
                        }, function() {
                            $.ajax({
                                url: '${ctx}/api/industry/delete',
                                data: {
                                    industryId: row.id
                                },
                                success: function(ret) {
                                	if (ret.code == 0) {
                                        toastr['success'](ret.msg);
                                        $industryTable.bootstrapTable('refresh'); 
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
        $industryTable.on('all.bs.table', function(e, row) {
            var selNum = $industryTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-industry-delete-batch').removeAttr('disabled') : $page.find('.btn-industry-delete-batch').attr('disabled', 'disabled');
        });
        
        $industryDialog.on('click', '.btn-confirm', function() {
            var validator = $industryForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
                var formData = new FormData($industryForm[0]); 
                var method = $industryDialog.data('method');
                if (method == 'add') {
                	$.ajax({
                        url: '${ctx}/api/industry/create',
                        type: 'POST',
                        data: {
                            name: $industryForm.find('input[name = "name"]').val(),
                        },
                        success: function(ret) {
                            if (ret.code == 0) {
                            	$industryDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $industryTable.bootstrapTable('refresh'); 
                            } else {
                            	toastr['error'](ret.msg);
                            }
                        },
                        error: function(err) {}
                    });
                } else {
                    $.ajax({
                        url: '${ctx}/api/industry/update',
                        type: 'POST',
                        data: {
                            industryId: $industryDialog.data('industryId'),
                            name: $industryForm.find('input[name="name"]').val()
                        },
                        success: function(ret) {
                            if (ret.code == 0) {
                            	$industryDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $industryTable.bootstrapTable('refresh');
                            } else {
                            	toastr['error'](ret.msg);
                            }
                        },
                        error: function(err) {}
                    });
                }
            }
        });
        
        // apppealType
        var $appealTypeDialog = $('#modal-appealType-dialog');
        var $appealTypeForm = $('#form-appealType');
        $k.util.bsValidator($appealTypeForm);
        
        var $appealTypeTable = $k.util.bsTable($page.find('#appealType-table'), {
            url: '${ctx}/api/appealType/list',
            toolbar: '#appealType-table-toolbar',
            idField: 'id',
            responseHandler: function(res) {
                return res.data;
            },
            columns: [{
                field: 'state',
                checkbox: true
            }, {
                field: 'name',
                title: '诉求类别',
                align: 'center'
            }, {
                field: 'acceptDays',
                title: '最大受理天数',
                align: 'center'
            }, {
                field: 'handleDays',
                title: '最大处理天数',
                align: 'center'
            }, {
                title: '操作',
                align: 'center',
                formatter: function(value, row, index) {
                	var $edit = '<a class="btn-appealType-edit a-operate">编辑</a>';
                    var $delete = '<a class="btn-appealType-delete a-operate">删除</a>';
                    return $edit + $delete;
                },
                events: window.operateEvents = {
                    'click .btn-appealType-edit': function(e, value, row, index) {
                    	e.stopPropagation();
                        $.each(row, function(key, val) {
                            $appealTypeForm.find('input[name="' + key + '"]').val(val);
                        });
                        $appealTypeDialog.data('method', 'edit');
                        $appealTypeDialog.data('appealTypeId', row.id);
                        $appealTypeDialog.modal('show');
                    },
                    'click .btn-appealType-delete': function(e, value, row, index) {
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
                                url: '${ctx}/api/appealType/delete',
                                data: {
                                    appealTypeId: row.id
                                },
                                success: function(ret) {
                                	if (ret.code == 0) {
                                        toastr['success'](ret.msg);
                                        $appealTypeTable.bootstrapTable('refresh'); 
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
        $appealTypeTable.on('all.bs.table', function(e, row) {
            var selNum = $appealTypeTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-appealType-delete-batch').removeAttr('disabled') : $page.find('.btn-appealType-delete-batch').attr('disabled', 'disabled');
        });
        
        $appealTypeDialog.on('click', '.btn-confirm', function() {
            var validator = $appealTypeForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($appealTypeForm[0]); 
                var method = $appealTypeDialog.data('method');
                if (method == 'add') {
                	$.ajax({
                        url: '${ctx}/api/appealType/create',
                        type: 'post',
                        data: formData,
                        processData: false,
                        contentType: false,
                        cache: false, 
                        success: function(ret) {
                            if (ret.code == 0) {
                                $appealTypeDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $appealTypeTable.bootstrapTable('refresh'); 
                            } else {
                                toastr['error'](ret.msg);
                            }
                        },
                        error: function(err) {}
                    });
                } else {
                	formData.append('appealTypeId', $appealTypeDialog.data('appealTypeId'));
                    $.ajax({
                        url: '${ctx}/api/appealType/update',
                        type: 'post',
                        data: formData,
                        processData: false,
                        contentType: false,
                        cache: false, 
                        success: function(ret) {
                            if (ret.code == 0) {
                                $appealTypeDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $appealTypeTable.bootstrapTable('refresh'); 
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
        .on('click', '.btn-industry-add', function() {
            $industryDialog.data('method', 'add');
            $industryDialog.modal('show');
        })
        .on('hidden.bs.modal', '#modal-industry-dialog', function() {
            $industryForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
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
            }, function() {
                var rows = $industryTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/industry/batchDelete',
                    data: { 
                        industryIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                    	if (ret.code == 0) {
                        	toastr['success'](ret.msg);
                        	$industryTable.bootstrapTable('refresh');
						} else {
							toastr['error'](ret.msg);
                        } 
                    },
                    error: function(err) {}
                });
            });
        })
        .on('click', '.btn-appealType-add', function() {
            $appealTypeDialog.data('method', 'add');
            $appealTypeDialog.modal('show');
        })
        .on('hidden.bs.modal', '#modal-appealType-dialog', function() {
            $appealTypeForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
        .on('click', '.btn-appealType-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $appealTypeTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/appealType/batchDelete',
                    data: { 
                    	appealTypeIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                    	if (ret.code == 0) {
                        	toastr['success'](ret.msg);
                        	$appealTypeTable.bootstrapTable('refresh');
						} else {
							toastr['error'](ret.msg);
                        } 
                    },
                    error: function(err) {}
                });
            });
        });
        
	}) ( jQuery );
	</script>
	
</body>
</html>