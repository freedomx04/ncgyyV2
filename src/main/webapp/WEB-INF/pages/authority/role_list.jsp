<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>角色管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-role-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>角色管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="role-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-user-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                    <button type="button" class="btn btn-white btn-role-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>批量删除
                    </button>
                </div>
                <table id="role-list-table" class="table-hm" data-mobile-responsive="true"> </table>
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
		
		var $page = $('.body-role-list');
		
		var $table = $k.util.bsTable($page.find('#role-list-table'), {
			url: '${ctx}/api/role/list',
			toolbar: '#role-list-table-toolbar',
			idField: 'id',
			showExport: true, 
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '角色名称',
            	align: 'center'
            }, {
            	field: 'description',
            	title: '角色描述',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $detail = '<a class="btn-role-detail a-operate">查看</a>';
            		var $edit = '<a class="btn-role-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-role-delete a-operate">删除</a>';
            		return $detail + $edit + $delete;
            	},
            	events: window.operateEvents = {
            		'click .btn-role-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('detail');
            		},
            		'click .btn-role-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('edit');
            		},
            		'click .btn-role-delete': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('delete');
            		},
            	}
            }]
		});
		
		$page
		.on('click', '.btn-role-add', function() {
			window.location.href = './roleAdd?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>