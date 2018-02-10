<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>企业管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/web-icons/css/web-icons.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-enterprise">
	<div class="animated fadeInRight height-full">
		<div class="ibox float-e-margins height-full" style="margin-bottom: 0;">
			<div class="height-full" style="position: relative;">
				<div class="page-aside">
					<div class="page-aside-inner height-full">
						<div class="page-aside-section">
							<div class="list-group">
								<a class="list-group-item active" href="javascript:;" data-id="0">
									<i class="fa fa-industry fa-fw"></i>所有企业
								</a>
							</div>
						</div>
						
						<div class="page-aside-section">
							<h4 class="page-aside-title"><i class="fa fa-bars fa-fw"></i>园区列表</h4>
							<div class="list-group has-actions">
								<c:forEach var="area" items="${areaList}">
									<div class="list-group-item" data-id="${area.id}">
										<div class="list-content">
											<span class="item-text">${area.name}</span>
											<div class="item-actions">
												<span class="btn btn-pure btn-area-edit" title="编辑"><i class="wb-edit"></i></span>
												<span class="btn btn-pure btn-area-delete" title="删除"><i class="wb-close"></i></span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
						<div class="page-aside-section">
							<a class="list-group-item btn-area-add" href="javascript:;">
								<i class="fa fa-plus fa-fw"></i>添加新园区
							</a>
						</div>
					</div>
				</div>
				
				<div class="page-main">
					<div class="ibox-content">
						<div class="page-title">
							<h2>企业列表</h2>
						</div>
						<div class="btn-group" id="enterprise-table-toolbar" role="group">
							<button type="button" class="btn btn-white btn-enterprise-add">
		 						<i class="fa fa-plus fa-fw"></i>新增
		 					</button>
		 					<button type="button" class="btn btn-danger btn-enterprise-delete-batch" disabled='disabled'>
		 						<i class="fa fa-trash-o fa-fw"></i>删除
		 					</button>
						</div>
						<table id="enterprise-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-area-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>园区名称</label>
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
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-enterprise');
		var $aside = $('.page-aside');
		
		var $table;
		var areaId = 0;
		initTable(areaId);
		
		function initTable(areaId) {
			$page.find('#enterprise-table').bootstrapTable('destroy');
			
			$table = $k.util.bsTable($page.find('#enterprise-table'), {
				url: '${ctx}/api/enterprise/listByArea?areaId=' + areaId,
				toolbar: '#enterprise-table-toolbar',
				idField: 'id',
				showExport: true, 
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns: [{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'avatar',
	            	title: '企业图标',
	            	align: 'center',
	            	width: '100',
	            	formatter: function(value, row, index) {
	            		return '<img src="${ctx}/api/avatar/' + value + '" style="width: 32px; height: 32px;">';
	            	}
	            }, {
	            	field: 'name',
	            	title: '企业名称',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-enterprise-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
            			'click .btn-enterprise-detail': function(e, value, row, index) {
            				e.stopPropagation();
    	            		window.location.href= '${ctx}/authority/enterprise/get?source=admin&enterpriseId=' + row.id;
            			}
	            	}
	            }, {
	            	field: 'area.name',
	            	title: '所属园区',
	            	align: 'center'
	            }, {
	            	field: 'industry.name',
	            	title: '行业类别',
	            	align: 'center'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	width: '80',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-enterprise-edit a-operate">编辑</a>';
	                    return $edit;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-enterprise-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			window.location.href= '${ctx}/authority/enterprise/add?method=edit&enterpriseId=' + row.id;
	            		}
	            	}
	            }]
			});
			
			$table.on('all.bs.table', function(e, row) {
	            var selNum = $table.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-enterprise-delete-batch').removeAttr('disabled') : $page.find('.btn-enterprise-delete-batch').attr('disabled', 'disabled');
	        });
		}
		
		// 园区添加/编辑对话框
		var $areaDialog = $page.find('#modal-area-dialog');
		var $areaForm = $areaDialog.find('form');
		$k.util.bsValidator($areaForm);
		$areaDialog.on('click', '.btn-confirm', function() {
			var validator = $areaForm.data('bootstrapValidator');
			validator.validate();
			
            if (validator.isValid()) {
            	var method = $areaDialog.data('method');
            	var name = $areaDialog.find('input[name = "name"]').val();
            	if (method == 'add') {
            		$.ajax({
 						url: '${ctx}/api/area/create',
                 		type: 'POST',
                 		data: {
                 			name: name,
                 		},
                 		success: function(ret) {
                 			if (ret.code == 0) {
	               				$areaDialog.modal('hide');
	               				toastr['success'](ret.msg);
	               				
	               				var area = ret.data;
	               				var $item = '<div class="list-group-item" data-id="' + area.id + '">'
	               							+ 	'<div class="list-content">'
	               							+		'<span class="item-text">' + area.name + '</span>'
	               							+ 		'<div class="item-actions">'
	               							+			'<span class="btn btn-pure btn-area-edit"><i class="wb-edit"></i></span>'
	               							+			'<span class="btn btn-pure btn-area-delete"><i class="wb-close"></i></span>'
	               							+		'</div>'
	               							+ 	'</div>'
	               							+ '</div>';
	               				$aside.find('.list-group.has-actions').append($item);
	               			} else {
	               				toastr['error'](ret.msg);
	               			}
                 		},
                 		error: function(err) {}
                 	});
            	} else {
            		var areaId = $areaDialog.data('areaId');
            		$.ajax({
                		url: '${ctx}/api/area/update',
                		type: 'POST',
                		data: { 
                			areaId: areaId, 
                			name: name,
                			resource: ''
                		},
                		success: function(ret) {
                			if (ret.code == 0) {
                				$areaDialog.modal('hide');
	               				toastr['success'](ret.msg);
	               				$aside.find('.list-group-item[data-id="' + areaId + '"]').find('.item-text').text(name);
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
		.on('click', '.list-group-item', function(e) {
			e.stopPropagation();
			areaId = $(this).data('id');
			if (areaId > -1) {
				$page.find('.list-group-item').removeClass('active');
				$(this).addClass('active');
				initTable(areaId);
			}
		})
		// area
		.on('hidden.bs.modal', '#modal-area-dialog', function() {
            $areaForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-area-add', function() {
			$areaDialog.find('.modal-title').text('添加园区');
			$areaDialog.data('method', 'add');
			$areaDialog.modal('show');
		})
		.on('click', '.btn-area-edit', function(e) {
			e.stopPropagation();
			var areaId = $(this).closest('.list-group-item').data('id');
			var areaName = $(this).closest('.list-group-item').find('.item-text').text();
			$areaDialog.find('.modal-title').text('编辑园区');
			$areaForm.find('input[name="name"]').val(areaName);
			$areaDialog.data('method', 'edit');
			$areaDialog.data('areaId', areaId);
			$areaDialog.modal('show');
		})
		.on('click', '.btn-area-delete', function(e) {
			e.stopPropagation();
			var areaId = $(this).closest('.list-group-item').data('id');
			swal({
				title: '',
                text: '确定批量删除选中园区',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定'
			}, function() {
				$.ajax({
					url: '${ctx}/api/area/delete',
					data: {
						areaId: areaId
					},
					success: function(ret) {
						if (ret.code == 0) {
							toastr['success'](ret.msg);
							$aside.find('.list-group-item[data-id="' + areaId + '"]').remove();
						} else {
							toastr['error'](ret.msg);
						}
					},
					error: function(err) {}
				});
			});
		})
		// enterprise
		.on('click', '.btn-enterprise-add', function() {
			window.location.href = '${ctx}/authority/enterprise/add?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>
</html>