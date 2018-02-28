<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>供应商管理</title>
	
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
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#business-dynamic" data-tab="dynamic" aria-expanded="true">招商动态</a>
						</li>
						<li>
							<a data-toggle="tab" href="#business-policy" data-tab="policy" aria-expanded="false">招商政策</a>
						</li>
						<li>
							<a data-toggle="tab" href="#business-item" data-tab="item" aria-expanded="false">招商项目</a>
						</li>
						<li>
							<a data-toggle="tab" href="#business-message" data-tab="message" aria-expanded="false">留言管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="business-dynamic" class="tab-pane active">
							<div class="panel-body">
								<div class="btn-group" id="dynamic-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-article-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-article-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="dynamic-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="business-policy" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="policy-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-article-add">
										<i class="fa fa-plus fa-fw"></i>新增
									</button>
                        			<button type="button" class="btn btn-danger btn-article-delete-batch" disabled='disabled'>
                        				<i class="fa fa-trash-o fa-fw"></i>删除
                        			</button>
								</div>
								<table id="policy-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="business-item" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="item-table-toolbar" role="group">
				                    <button type="button" class="btn btn-white btn-item-add">
				                        <i class="fa fa-plus fa-fw"></i>新增
				                    </button>
				                    <button type="button" class="btn btn-danger btn-item-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>
				                </div>
								<table id="item-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="business-message" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="message-table-toolbar" role="group">
				                    <button type="button" class="btn btn-danger btn-message-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>
				                </div>
								<table id="message-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- item -->
	<div class="modal" id="modal-item-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">项目信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-item" autocomplete="off">
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
                            <label for="email" class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="email">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="fax" class="col-sm-3 control-label">传真</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="fax">
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
    
    <div class="modal" id="modal-item-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">项目信息</h4>
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
	
	<!-- message -->
	<div class="modal" id="modal-message-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">留言信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>姓名</dt><dd data-name="name"></dd>
                		<dt>电话</dt><dd data-name="contact"></dd>
                		<dt>地区</dt><dd data-name="area"></dd>
                		<dt>邮箱</dt><dd data-name="email"></dd>
                		<dt>QQ</dt><dd data-name="qq"></dd>
                		<dt>留言</dt><dd data-name="content"></dd>
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
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-business');
		
		// dynamic, policy
		var tab = Url.queryString('tab');
		if (!tab) {
			tab = 'dynamic';
		}
		$page.find('a[data-tab="' + tab + '"]').tab('show');
		if (tab == 'dynamic' || tab == 'policy') {
			initTable(tab);
		}
		
		var $table, $toolbar, type, $bsTable;
		function initTable(tab) {
			switch (tab) {
			case 'dynamic':
				type = '10';
				$table = $page.find('#dynamic-table');
				$toolbar = $page.find('#dynamic-table-toolbar');
				break;
			case 'policy':
				type = '11';
				$table = $page.find('#policy-table');
				$toolbar = $page.find('#policy-table-toolbar');
				break;
			}
			
			$bsTable = $k.util.bsTable($table, {
				url: '${ctx}/api/article/list?type=' + type,
				toolbar: $toolbar,
				idField: 'id',
				responseHandler: function(res) {
    				return res.data;
    			},
    			columns:[{
                    field: 'state',
                    checkbox: true
                }, {
                    field: 'title',
                    title: '标题',
                    formatter: function(value, row, index) {
                        return '<a class="btn-article-detail">' + value + '</a>';
                    },
                    events: window.operateEvents = {
                        'click .btn-article-detail': function(e, value, row, index) {
                            e.stopPropagation();
                            window.location.href = '${ctx}/authority/article/get?articleId=' + row.id;
                        },
                    }
                }, {
                    field: 'updateTime',
                    title: '修改时间',
                    align: 'center',
                    width: '150',
                    formatter: formatDate2
                }, {
                	title: '操作',
                	align: 'center',
                	width: '120',
                	formatter: function(value, row,  index) {
    					var $edit = '<a class="btn-article-edit a-operate">编辑</a>';
    					var $delete = '<a class="btn-article-delete a-operate">删除</a>';
    					return $edit + $delete;
    				},
    				events: window.operateEvents = {
       					'click .btn-article-edit': function(e, value, row, index) {
       						e.stopPropagation();
       						window.location.href = '${ctx}/authority/article/add?type=' + type + '&method=edit&articleId=' + row.id;
       					},
       					'click .btn-article-delete': function(e, value, row, index) {
       						e.stopPropagation();
       						swal({
       							title: '',
       							text: '确定删除选中记录',
       							type: 'warning',
       							showCancelButton: true,
       							cancelButtonText: '取消',
       							confirmButtonColor: '#DD6B55',
       							confirmButtonText: '确定'
       						}, function() {
       							var articleId = row.id;
       							$.ajax({
       								url: '${ctx}/api/article/delete',
       								data: { 
       									articleId: articleId
       								},
       								success: function(ret) {
       									if (ret.code == 0) {
       			                        	toastr['success'](ret.msg);
       			                        	$bsTable.bootstrapTable('refresh');
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
    			selNum > 0 ? $page.find('.btn-article-delete-batch').removeAttr('disabled') : $page.find('.btn-article-delete-batch').attr('disabled', 'disabled');
    		});
		}
		
		// item
		var $itemDialog = $('#modal-item-dialog');
        var $itemDetailDialog = $('#modal-item-detail-dialog');
        var $itemForm = $('#form-item');
        $k.util.bsValidator($itemForm);
        
        var $itemTable = $k.util.bsTable($page.find('#item-table'), {
            url: '${ctx}/api/business/business/list',
            toolbar: '#item-table-toolbar',
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
                    return '<a class="btn-item-detail">' + value + '</a>';
                },
                events: window.operateEvents = {
                    'click .btn-item-detail': function(e, value, row, index) {
                        e.stopPropagation();
                        $.each(row, function(key, val) {
                            $itemDetailDialog.find('dd[data-name="' + key + '"]').text(val);
                        });
                        $itemDetailDialog.modal('show');
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
                    var $edit = '<a class="btn-item-edit a-operate">编辑</a>';
                    var $delete = '<a class="btn-item-delete a-operate">删除</a>';
                    return $edit + $delete;
                },
                events: window.operateEvents = {
                    'click .btn-item-edit': function(e, value, row, index) {
                        e.stopPropagation();
                        $.each(row, function(key, val) {
                            $itemForm.find('input[name="' + key + '"]').val(val);
                            $itemForm.find('textarea[name="' + key + '"]').val(val);
                            $itemForm.find('select[name="' + key + '"]').val(val);
                        });
                        $itemDialog.data('method', 'edit');
                        $itemDialog.data('itemId', row.id);
                        $itemDialog.modal('show');
                    },
                    'click .btn-item-delete': function(e, value, row, index) {
                        e.stopPropagation();
                        swal({
                            title: '',
                            text: '确定删除选中记录?',
                            type: 'warning',
                            showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定'
                        }, function() {
                            $.ajax({
                                url: '${ctx}/api/business/business/delete',
                                data: {
                                    businessId: row.id
                                },
                                success: function(ret) {
                                     if (ret.code == 0) {
                                        toastr['success'](ret.msg);
                                        $itemTable.bootstrapTable('refresh'); 
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
        $itemTable.on('all.bs.table', function(e, row) {
            var selNum = $itemTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-item-delete-batch').removeAttr('disabled') : $page.find('.btn-item-delete-batch').attr('disabled', 'disabled');
        });
        
        $itemDialog.on('click', '.btn-confirm', function() {
            var validator = $itemForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
                var formData = new FormData($itemForm[0]); 
                var method = $itemDialog.data('method');
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
                                $itemDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $itemTable.bootstrapTable('refresh'); 
                            } else {
                                toastr['error'](ret.msg);
                            }
                        },
                        error: function(err) {}
                    });
                } else {
                    formData.append('businessId', $itemDialog.data('itemId'));
                    $.ajax({
                        url: '${ctx}/api/business/business/update',
                        type: 'post',
                        data: formData,
                        processData: false,
                        contentType: false,
                        cache: false, 
                        success: function(ret) {
                            if (ret.code == 0) {
                                $itemDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $itemTable.bootstrapTable('refresh'); 
                            } else {
                                toastr['error'](ret.msg);
                            }
                        },
                        error: function(err) {}
                    });
                }
            }
        });
		
		// message
		var $messageDetailDialog = $page.find('#modal-message-detail-dialog');
		var $messageTable = $k.util.bsTable($page.find('#message-table'), {
			url: '${ctx}/api/business/message/list',
			toolbar: '#message-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '姓名',
            	formatter: function(value, row, index) {
            		return '<a class="btn-message-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-message-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$messageDetailDialog.find('dd[data-name="' + key + '"]').text(val);
            			});
            			$messageDetailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'contact',
            	title: '电话',
            }, {
            	field: 'area',
            	title: '地区',
            }, {
            	field: 'email',
            	title: '邮箱'
            }, {
            	field: 'qq',
            	title: 'QQ'
            }, {
            	field: 'updateTime',
            	title: '反馈时间',
            	align: 'center',
            	width: '180',
            	formatter: formatDate2
            }]
		});
		$messageTable.on('all.bs.table', function(e, row) {
            var selNum = $messageTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-message-delete-batch').removeAttr('disabled') : $page.find('.btn-message-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		// dynamic, policy
    	.on('click', 'a[data-toggle="tab"]', function() {
    		var tab = $(this).data('tab');
    		Url.updateSearchParam('tab', tab);
    		if (tab == 'dynamic' || tab == 'policy') {
    			initTable(tab);
    		}
    	})
    	.on('click', '.btn-article-add', function() {
    		window.location.href = '${ctx}/authority/article/add?method=add&type=' + type;
    	})
    	.on('click', '.btn-article-delete-batch', function() {
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
					url: '${ctx}/api/article/batchDelete',
					data: {
						articleIdList: $k.util.getIdList(rows) 
					},
					success: function(ret) {
						if (ret.code == 0) {
                        	toastr['success'](ret.msg);
                        	$bsTable.bootstrapTable('refresh');
						} else {
							toastr['error'](ret.msg);
                        }
					},
					error: function(err) {}
				});
			});
		})
		// item
		.on('click', '.btn-item-add', function() {
            $itemDialog.data('method', 'add');
            $itemDialog.modal('show');
        })
        .on('hidden.bs.modal', '#modal-item-dialog', function() {
            $itemForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $itemForm.find('input').val('');
        })
        .on('click', '.btn-item-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $itemTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/business/business/deleteBatch',
                    data: { 
                        businessIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            toastr['success'](ret.msg);
                            $itemTable.bootstrapTable('refresh'); 
                        } else {
                            toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        })
		// message
		.on('click', '.btn-message-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定'
            }, function() {
                var rows = $messageTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/business/message/deleteBatch',
                    data: { 
                        messageIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
                        	$messageTable.bootstrapTable('refresh');
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