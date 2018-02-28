<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>用户管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/iCheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/web-icons/css/web-icons.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	#modal-role-dialog .checkbox-inline {
		min-width: 120px;
	}
	</style>
</head>

<body class="gray-bg body-user">
	<div class="animated fadeInRight height-full">
		<div class="ibox float-e-margins height-full" style="margin-bottom: 0;">
			<div class="height-full" style="position: relative;">
				<div class="page-aside">
					<div class="page-aside-inner height-full">
						<div class="page-aside-section">
							<div class="list-group">
								<a class="list-group-item active" href="javascript:;" data-id="0">
									<i class="fa fa-user fa-fw"></i>所有用户
								</a>
							</div>
						</div>
						
						<div class="page-aside-section">
							<h4 class="page-aside-title"><i class="fa fa-bars fa-fw"></i>角色列表</h4>
							<div class="list-group has-actions">
								<c:forEach var="role" items="${roleList}">
									<div class="list-group-item" data-id="${role.id}" data-resource="${role.resource}">
										<div class="list-content">
											<span class="item-text">${role.name}</span>
											<div class="item-actions">
												<span class="btn btn-pure btn-role-edit" title="编辑"><i class="wb-edit"></i></span>
												<span class="btn btn-pure btn-role-delete" title="删除"><i class="wb-close"></i></span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
						<div class="page-aside-section">
							<a class="list-group-item btn-role-add" href="javascript:;">
								<i class="fa fa-plus fa-fw"></i>添加新角色
							</a>
						</div>
					</div>
				</div>
				
				<div class="page-main">
					<div class="ibox-content">
						<div class="page-title">
							<h2>用户列表</h2>
						</div>
						<div class="btn-group" id="user-table-toolbar" role="group">
							<button type="button" class="btn btn-white btn-user-add">
		 						<i class="fa fa-user-plus fa-fw"></i>新增
		 					</button>
						</div>
						<table id="user-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-role-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center modal-lg">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="form-required">*</i>角色名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="resource" class="col-sm-2 control-label">系统管理</label>
                        	<div class="col-sm-9">
                       			<label class="checkbox-inline i-checks" data-role="role-authority-data">
									<input type="checkbox">基础数据管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-user">
									<input type="checkbox">用户管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-enterprise">
									<input type="checkbox">企业管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-department">
									<input type="checkbox">部门管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-supplier">
									<input type="checkbox">供应商管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-website">
									<input type="checkbox">网站管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-business">
									<input type="checkbox">招商管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-feedback">
									<input type="checkbox">反馈管理
								</label>
								<label class="checkbox-inline i-checks" data-role="role-authority-version">
									<input type="checkbox">版本管理
								</label>
                        	</div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="resource" class="col-sm-2 control-label">监测平台</label>
                        	<div class="col-sm-9">
                       			<label class="checkbox-inline i-checks" data-role="role-monitor-report">
									<input type="checkbox">主要指标上报
								</label>
								<label class="checkbox-inline i-checks" data-role="role-monitor-enterprise">
									<input type="checkbox">企业主要指标
								</label>
								<label class="checkbox-inline i-checks" data-role="role-monitor-industry">
									<input type="checkbox">行业主要指标
								</label>
								<label class="checkbox-inline i-checks" data-role="role-monitor-area">
									<input type="checkbox">园区主要指标
								</label>
								<label class="checkbox-inline i-checks" data-role="role-monitor-pointEnterprise">
									<input type="checkbox">重点主要主要指标
								</label>
								<label class="checkbox-inline i-checks" data-role="role-monitor-myEnterprise">
									<input type="checkbox">主要指标(企业)
								</label>
                        	</div>
                        </div> 
                        
                        <div class="form-group">
                        	<label for="resource" class="col-sm-2 control-label">服务平台</label>
                        	<div class="col-sm-9">
                       			<label class="checkbox-inline i-checks" data-role="role-service-talent">
									<input type="checkbox">用工平台
								</label>
								<label class="checkbox-inline i-checks" data-role="role-service-information">
									<input type="checkbox">信息化平台
								</label>
								<label class="checkbox-inline i-checks" data-role="role-service-financing">
									<input type="checkbox">融资平台
								</label>
								<label class="checkbox-inline i-checks" data-role="role-service-logistics">
									<input type="checkbox">物流平台
								</label>
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
    
    <div class="modal" id="modal-password-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-password" autocomplete="off">
                        <div class="form-group">
							<label for="newPassword" class="col-sm-3 control-label"><i class="form-required">*</i>新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="newPassword" id="newPassword" required 
									data-bv-notempty-message="请输入新密码" 
									data-bv-stringlength="true"
									data-bv-stringlength-min="6" 
									data-bv-stringlength-max="16" 
									data-bv-stringlength-message="密码长度必须在6到16之间"
									data-bv-identical="true" 
									data-bv-identical-field="confirmPassword" 
									data-bv-identical-message="输入的两次密码不一致">
							</div>
						</div>
						
						<div class="form-group">
							<label for="confirmPassword" class="col-sm-3 control-label"><i class="form-required">*</i>确认密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="confirmPassword" required 
									data-bv-notempty-message="请输入确认密码"
									data-bv-stringlength="true"
									data-bv-stringlength-min="6" 
									data-bv-stringlength-max="16" 
									data-bv-stringlength-message="密码长度必须在6到16之间"
									data-bv-identical="true" 
									data-bv-identical-field="newPassword" 
									data-bv-identical-message="输入的两次密码不一致">
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
    
    <div class="modal" id="modal-user-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">用户信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>用户名</dt><dd data-name="username"></dd>
                		<dt>姓名</dt><dd data-name="name"></dd>
                		<dt>联系电话</dt><dd data-name="mobile"></dd>
                		<dt>角色</dt><dd data-name="role"></dd>
                		<dt>性别</dt><dd data-name="gender"></dd>
                		<dt>邮箱</dt><dd data-name="email"></dd>
                		<dt>所属企业</dt><dd data-name="enterprise"></dd>
                		<dt>所属部门</dt><dd data-name="department"></dd>
                		<dt>个人描述</dt><dd data-name="introduction"></dd>
                	</dl>
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
	<script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-user');
		var $aside = $('.page-aside');
		
		var $table;
		var roleId = 0;
		initTable(roleId);
		
		var $userDetailDialog = $('#modal-user-detail-dialog');
		
		function initTable(roleId) {
			$page.find('#user-table').bootstrapTable('destroy');
			
			$table = $k.util.bsTable($page.find('#user-table'), {
				url: '${ctx}/api/user/listByRole?roleId=' + roleId,
				toolbar: '#user-table-toolbar',
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
	            	title: '头像',
	            	align: 'center',
	            	width: '100',
	            	formatter: function(value, row, index) {
	            		return '<img src="${ctx}/api/avatar/' + value + '" style="width: 32px; height: 32px;">';
	            	}
	            }, {
	            	field: 'username',
	            	title: '用户名',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-user-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-user-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				if (key == 'role' || key == 'enterprise' || key == 'department') {
	            					$userDetailDialog.find('dd[data-name="' + key + '"]').text(val.name);
	            				} else if (key == 'gender') {
	            					var gender;
	            					switch (val) {
	            					case 0:	gender = '';		break;
	            					case 1:	gender = '男';		break;
	            					case 2:	gender = '女';		break;
	            					}
	            					$userDetailDialog.find('dd[data-name="gender"]').text(gender);
	            				} else {
	            					$userDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	            				}
	            			});
	            			$userDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'name',
	            	title: '姓名',
	            	align: 'center',
	            }, {
	            	field: 'mobile',
	            	title: '手机号',
	            	align: 'center'
	            }, {
	            	field: 'role.name',
	            	title: '角色',
	            	align: 'center',
	            }, {
	            	field: 'status',
	            	title: '状态',
	            	align: 'center',
	            	width: '100',
	            	formatter: function(value, row, index) {
	            		if (value == 0) {
	            			return '<span class="label label-primary">正常</span>';
	            		} else {
	            			return '<span class="label label-warning">禁用</span>';
	            		}
	            	}
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	width: '200',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-user-edit a-operate">编辑</a>';
	            		var $password = '<a class="btn-user-password a-operate">修改密码</a>';
	            		var $status;
	            		if (row.status == 0) {
	            			$status = '<a class="btn-user-disable a-operate">禁用</a>';
	            		} else {
	            			$status = '<a class="btn-user-enable a-operate">启用</a>';
	            		}
	            		var $delete = '<a class="btn-user-delete a-operate">删除</a>'; 
	                    return $edit + $password + $status + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-user-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			window.location.href= '${ctx}/authority/user/add?method=edit&userId=' + row.id;
	            		},
	            		'click .btn-user-password': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$passwordDialog.data('userId', row.id);
	            			$passwordDialog.modal('show');
	            		},
	            		'click .btn-user-enable': function(e, value, row, index) {
	            			e.stopPropagation();
	            			swal({
	            				title: '',
	            				text: '确定启用该用户?',
	            				type: 'warning',
	            				showCancelButton: true,
	                            cancelButtonText: '取消',
	                            confirmButtonColor: '#DD6B55',
	                            confirmButtonText: '确定',
	            			}, function() {
	            				$.ajax({
	                				url: '${ctx}/api/user/enable',
	                				data: {
	                					userId: row.id,
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
	            		},
	            		'click .btn-user-disable': function(e, value, row, index) {
	            			e.stopPropagation();
	            			swal({
	            				title: '',
	            				text: '确定禁用该用户?',
	            				type: 'warning',
	            				showCancelButton: true,
	                            cancelButtonText: '取消',
	                            confirmButtonColor: '#DD6B55',
	                            confirmButtonText: '确定',
	            			}, function() {
	            				$.ajax({
	                				url: '${ctx}/api/user/disable',
	                				data: {
	                					userId: row.id,
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
	            		},
	            		'click .btn-user-delete': function(e, value, row, index) {
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
	                                url: '${ctx}/api/user/delete',
	                                data: {
	                                    userId: row.id
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
	            selNum > 0 ? $page.find('.btn-user-delete-batch').removeAttr('disabled') : $page.find('.btn-user-delete-batch').attr('disabled', 'disabled');
	        });
		}
		
		var $passwordDialog = $page.find('#modal-password-dialog');
		var $passwordForm = $passwordDialog.find('form');
		$k.util.bsValidator($passwordForm);
		$passwordDialog.on('click', '.btn-confirm', function() {
			var validator = $passwordForm.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				$.ajax({
					url: '${ctx}/api/user/password2',
					type: 'post',
					data: {
						userId: $passwordDialog.data('userId'),
						password: $passwordDialog.find('input[name="newPassword"]').val()
					},
					success: function(ret) {
						if (ret.code == 0) {
							$passwordDialog.modal('hide');
							toastr['success'](ret.msg);
                    	} else {
                    		toastr['error'](ret.msg);
                    	}
					},
					error: function(err) {}
				});
			}
		});
		
		// 角色添加/编辑对话框
		var $roleDialog = $page.find('#modal-role-dialog');
		var $roleForm = $roleDialog.find('form');
		$page.find(".i-checks").iCheck({
        	checkboxClass: "icheckbox_square-green", 
        	radioClass: "iradio_square-green"
        });
		
		$k.util.bsValidator($roleForm);
		$roleDialog.on('click', '.btn-confirm', function() {
			var validator = $roleForm.data('bootstrapValidator');
			validator.validate();
			
            if (validator.isValid()) {
            	var method = $roleDialog.data('method');
            	var name = $roleDialog.find('input[name = "name"]').val();
            	var arr = [];
				$page.find('.i-checks input').each(function() {
					if (true == $(this).is(':checked')) {
						var role = $(this).closest('label').data('role');
						arr.push(role);
					}
				});
            	if (method == 'add') {
            		$.ajax({
 						url: '${ctx}/api/role/create',
                 		type: 'POST',
                 		data: {
                 			name: name,
                 			resource: arr.join(',')
                 		},
                 		success: function(ret) {
                 			if (ret.code == 0) {
	               				$roleDialog.modal('hide');
	               				toastr['success'](ret.msg);
	               				
	               				var role = ret.data;
	               				var $item = '<div class="list-group-item" data-id="' + role.id + '" data-resource="' + role.resource + '">'
	               							+ 	'<div class="list-content">'
	               							+		'<span class="item-text">' + role.name + '</span>'
	               							+ 		'<div class="item-actions">'
	               							+			'<span class="btn btn-pure btn-role-edit"><i class="wb-edit"></i></span>'
	               							+			'<span class="btn btn-pure btn-role-delete"><i class="wb-close"></i></span>'
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
            		var roleId = $roleDialog.data('roleId');
            		$.ajax({
                		url: '${ctx}/api/role/update',
                		type: 'POST',
                		data: { 
                			roleId: roleId, 
                			name: name,
                			resource: arr.join(',')
                		},
                		success: function(ret) {
                			if (ret.code == 0) {
                				$roleDialog.modal('hide');
	               				toastr['success'](ret.msg);
	               				$aside.find('.list-group-item[data-id="' + roleId + '"]').find('.item-text').text(name);
	               				$aside.find('.list-group-item[data-id="' + roleId + '"]').data('resource', arr.join(','));
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
			roleId = $(this).data('id');
			if (roleId > -1) {
				$page.find('.list-group-item').removeClass('active');
				$(this).addClass('active');
				initTable(roleId);
			}
		})
		.on('hidden.bs.modal', '#modal-password-dialog', function() {
			$passwordForm.bootstrapValidator('resetForm', true);
			$(this).removeData('bs.modal');
		})
		// role
		.on('hidden.bs.modal', '#modal-role-dialog', function() {
            $roleForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $page.find(".i-checks").iCheck('uncheck');
        }) 
		.on('click', '.btn-role-add', function() {
			$roleDialog.find('.modal-title').text('添加角色');
			$roleDialog.data('method', 'add');
			$roleDialog.modal('show');
		})
		.on('click', '.btn-role-edit', function(e) {
			e.stopPropagation();
			var roleId = $(this).closest('.list-group-item').data('id');
			var roleResource = $(this).closest('.list-group-item').data('resource');
			var roleName = $(this).closest('.list-group-item').find('.item-text').text();
			
			$roleDialog.find('.modal-title').text('编辑角色');
			$roleForm.find('input[name="name"]').val(roleName);
			var arr = roleResource.split(',');
			$.each(arr, function(k, val) {
				if (val != '') {
					var $label = $page.find('.i-checks[data-role=' + val + ']');
					$label.iCheck('check');
				}
			});
			
			$roleDialog.data('method', 'edit');
			$roleDialog.data('roleId', roleId);
			$roleDialog.modal('show');
		})
		.on('click', '.btn-role-delete', function(e) {
			e.stopPropagation();
			var roleId = $(this).closest('.list-group-item').data('id');
			swal({
				title: '',
                text: '确定批量删除选中角色',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定'
			}, function() {
				$.ajax({
					url: '${ctx}/api/role/delete',
					data: {
						roleId: roleId
					},
					success: function(ret) {
						if (ret.code == 0) {
							toastr['success'](ret.msg);
							$aside.find('.list-group-item[data-id="' + roleId + '"]').remove();
						} else {
							toastr['error'](ret.msg);
						}
					},
					error: function(err) {}
				});
			});
		})
		.on('ifChecked', '.authority-classify', function(e) {
			var $this = $(this);
			$this.closest('.row').find('.authority-classify-function').removeClass('disabled').iCheck('check');
		})
		.on('ifUnchecked', '.authority-classify', function(e) {
			var $this = $(this);
			$this.closest('.row').find('.authority-classify-function').addClass('disabled').iCheck('uncheck');
		})
		// user
		.on('click', '.btn-user-add', function() {
			window.location.href = '${ctx}/authority/user/add?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>
</html>