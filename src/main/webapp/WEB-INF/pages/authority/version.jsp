<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>版本管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/summernote/summernote-bs3.css">
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

<body class="gray-bg body-version">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>版本管理</h2>
				</div>
			
				<div class="btn-group" id="version-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-version-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                    <button type="button" class="btn btn-danger btn-version-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>删除
                    </button>
                </div>
                <table id="version-list-table" class="table-hm" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-version-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center modal-lg">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">版本信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-version" autocomplete="off">
                        <div class="form-group">
							<label for="code" class="col-sm-2 control-label"><i class="form-required">*</i>版本号</label>
	                        <div class="col-sm-5">
	                            <input type="text" class="form-control" name="code" value="${version.code}" required>
	                        </div>
						</div>
						
						<div class="form-group">
							<label for="releaseTime" class="col-sm-2 control-label"><i class="form-required">*</i>发布时间</label>
	                        <div class="col-sm-5">
	                            <input type="text" class="form-control releaseTime" name="releaseTime" placeholder="yyyy-MM-dd" 
	                            	value="${version.releaseTime}" required
	                            	data-bv-date="true"
	                            	data-bv-date-format="YYYY-MM-DD"
	                            	data-bv-date-message="请输入正确的时间格式yyyy-MM-dd">
	                        </div>
						</div>
						
						<div class="form-group" >
							<label for="content" class="col-sm-2 control-label">版本内容</label>
							<div class="col-sm-9">
								<div id="summernote"></div>
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
    
    <div class="modal" id="modal-version-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">版本信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>版本号</dt><dd data-name="code"></dd>
                		<dt>发布时间</dt><dd data-name="releaseTime"></dd>
                		<dt>发布内容</dt><dd data-name="content"></dd>
                	</dl>
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
	<script type="text/javascript" src="${ctx}/plugins/summernote/summernote.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/summernote/lang/summernote-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-version');
		
		var $versionDialog = $('#modal-version-dialog');
		var $versionDetailDialog = $('#modal-version-detail-dialog');
	   	var $versionForm = $('#form-version');
	   	$k.util.bsValidator($versionForm);
	   	
	   	$k.util.summernote($page.find('#summernote'), {
			toolbar: [['para', ['ul', 'ol', 'paragraph']]],
			minHeight: 200
		});
		
		var $table = $k.util.bsTable($page.find('#version-list-table'), {
			url: '${ctx}/api/version/list',
			toolbar: '#version-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'code',
            	title: '版本号',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return '<a class="btn-version-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-version-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				if (key == 'content') {
            					$versionDetailDialog.find('dd[data-name="content"]').html(val);
            				} else {
            					$versionDetailDialog.find('dd[data-name="' + key + '"]').text(val);
            				}
            			});
            			$versionDetailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'releaseTime',
            	title: '发布时间',
            	align: 'center',
            }, {
            	title: '操作',
            	align: 'center',
            	width: '120',
            	formatter: function(value, row, index) {
            		var $edit = '<a class="btn-version-edit a-operate">编辑</a>';
                    var $delete = '<a class="btn-version-delete a-operate">删除</a>';
                    return $edit + $delete;
                },
            	events: window.operateEvents = {
            		'click .btn-version-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			 $.each(row, function(key, val) {
            				 if (key == 'content') {
            					 $('#summernote').summernote('code', val);
            				 } else {
            					 $versionForm.find('input[name="' + key + '"]').val(val); 
            				 }
                         });
                         $versionDialog.data('method', 'edit');
                         $versionDialog.data('versionId', row.id);
                         $versionDialog.modal('show');
            		},
            		'click .btn-version-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/version/delete',
            					data: {
            						versionId: row.id
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
            selNum > 0 ? $page.find('.btn-version-delete-batch').removeAttr('disabled') : $page.find('.btn-version-delete-batch').attr('disabled', 'disabled');
        });
		
		$versionDialog.on('click', '.btn-confirm', function() {
            var validator = $versionForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
                var formData = new FormData($versionForm[0]); 
                formData.append('content', $('#summernote').summernote('code'));
                var method = $versionDialog.data('method');
                if (method == 'add') {
                	$.ajax({
    					url: '${ctx}/api/version/create',
    					type: 'post',
    					data: formData,
    					processData: false,
    					contentType: false,
    					cache: false, 
    					success: function(ret) {
    						if (ret.code == 0) {
    							$versionDialog.modal('hide');
                                toastr['success'](ret.msg);
                                $table.bootstrapTable('refresh'); 
                            } else {
                            	toastr['error'](ret.msg);
                            }
    					},
    					error: function(err) {}
    				});
                } else {
                	formData.append('versionId', $versionDialog.data('versionId'));
                	$.ajax({
    					url: '${ctx}/api/version/update',
    					type: 'post',
    					data: formData,
    					processData: false,
    					contentType: false,
    					cache: false, 
    					success: function(ret) {
    						if (ret.code == 0) {
    							$versionDialog.modal('hide');
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
		.on('click', '.btn-version-add', function() {
			$versionDialog.data('method', 'add');
            $versionDialog.modal('show');
            $versionDialog.find('#summernote').summernote('code', '');
		})
		.on('hidden.bs.modal', '#modal-version-dialog', function() {
            $versionForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
		.on('click', '.btn-version-delete-batch', function() {
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
                    url: '${ctx}/api/version/batchDelete',
                    data: { 
                        versionIdList: $k.util.getIdList(rows) 
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