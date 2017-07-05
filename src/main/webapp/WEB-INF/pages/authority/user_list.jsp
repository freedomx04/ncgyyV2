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
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-user-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>用户管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="user-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-user-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                </div>
                <table id="user-list-table" class="table-hm" data-mobile-responsive="true"> </table>
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

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-user-list');
		
		var $table = $k.util.bsTable($page.find('#user-list-table'), {
			url: '${ctx}/api/user/list',
			toolbar: '#user-list-table-toolbar',
			idField: 'id',
			showExport: true, 
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'avatar',
            	title: '头像',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return '<img src="${ctx}/api/avatar/' + value + '" style="width: 32px; height: 32px;">';
            	}
            }, {
            	field: 'username',
            	title: '用户名',
            	align: 'center'
            }, {
            	field: 'name',
            	title: '姓名',
            	align: 'center'
            }, {
            	field: 'mobile',
            	title: '手机号',
            	align: 'center'
            }, {
            	field: 'role.name',
            	title: '角色',
            	align: 'center'
            }, {
            	field: 'status',
            	title: '状态',
            	align: 'center',
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
            	formatter: function(value, row, index) {
            		var $operate;
            		if (row.status == 0) {
            			$operate = '<a class="btn-user-disable a-operate">禁用</a>';
            		} else {
            			$operate = '<a class="btn-user-enable a-operate">启用</a>';
            		}
            		
            		return '<a class="btn-user-detail a-operate">详情</a><a class="btn-user-edit a-operate">编辑</a><a class="btn-user-password a-operate">修改密码</a>' + $operate;
            	},
            	events: window.operateEvents = {
            		'click .btn-user-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('get');
            		},
            		'click .btn-user-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href = './userAdd?method=edit&userId=' + row.id;
            		},
            		'click .btn-user-password': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('password');
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
                            closeOnConfirm: false		
            			}, function() {
            				$.ajax({
                				url: '${ctx}/api/user/status',
                				data: {
                					userId: row.id,
                					status: 0
                				},
                				success: function(ret) {
                					if (ret.code == 0) {
                						swal({
                                            title: '',
                                            text: '操作成功',
                                            type: 'success'
                                        }, function() {
                                        	$table.bootstrapTable('refresh'); 
                                        });
                					} else {
                						swal('', ret.msg, 'error');
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
                            closeOnConfirm: false		
            			}, function() {
            				$.ajax({
                				url: '${ctx}/api/user/status',
                				data: {
                					userId: row.id,
                					status: 1
                				},
                				success: function(ret) {
                					if (ret.code == 0) {
                						swal({
                                            title: '',
                                            text: '操作成功',
                                            type: 'success'
                                        }, function() {
                                        	$table.bootstrapTable('refresh'); 
                                        });
                					} else {
                						swal('', ret.msg, 'error');
                					}
                				},
                				error: function(err) {}
                			});
            			});
            		}
            	}
            }]
		});
		
		$page
		.on('click', '.btn-user-add', function() {
			window.location.href = './userAdd?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>