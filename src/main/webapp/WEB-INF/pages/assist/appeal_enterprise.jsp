<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心(企业)</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-appeal-enterprise">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>诉求中心(企业)</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="appeal-enterprise-table-toolbar" role="group">
					<button type="button" class="btn btn-white btn-appeal-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
				</div>
				<table id="appeal-enterprise-table" class="table-hm" data-mobile-responsive="true"></table>
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
		
		//var enterpriseId = ${enterpriseId};
		var enterpriseId = 2;
		
		var $page = $('.body-appeal-enterprise');
		
		var $table = $k.util.bsTable($page.find('#appeal-enterprise-table'), {
			url: '${ctx}/api/appeal/listByEnterprise?enterpriseId=' + enterpriseId,
			toolbar: '#appeal-enterprise-table-toolbar',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'title',
            	title: '诉求标题',
            	align: 'center'
            }, {
            	field: 'appealType.name',
            	title: '诉求类型',
            	align: 'center'
            }, {
            	field: 'status',
            	title: '状态',
            	align: 'center',
            	formatter: function(value, row, index) {
            		switch (value) {
            		case 0:
            			return '<span class="label label-warning">待发送</span>';
            		case 1:
            			return '<span class="label label-warning">待派发</span>';
            		case 2:
            			return '<span class="label label-primary">待受理</span>';
            		case 3:
            			return '<span class="label label-primary">处理中</span>';
            		case 4:
            			return '<span class="label label-primary">待确认</span>';
            		case 5:
            			return '<span class="label label-primary">已确认</span>';
            		case 6:
            			return '<span class="label label-warning">已驳回</span>';
            		}
            	}
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $detail = '<a class="btn-appeal-detail a-operate">详情</a>';
            		var $edit = '<a class="btn-appeal-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-appeal-delete a-operate">删除</a>';
            		var $send = '<a class="btn-appeal-send a-operate">发送</a>';
            		var $urge = '<a class="btn-appeal-urge a-operate">催办</a>';
            		var $confirm = '<a class="btn-appeal-confirm a-operate">确认办结</a>';
            		
            		switch (row.status) {
            		case 0:
            			return $detail + $edit + $delete + $send;
            		case 1:
            			return $detail + $urge;
            		}
            	},
            	events: window.operateEvents = {
            		'click .btn-appeal-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './appealGet?appealId=' + row.id;
            		},
            		'click .btn-appeal-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './appealAdd?method=edit&appealId=' + row.id;
            		},
            		'click .btn-appeal-delete': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定删除选中记录?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
                            closeOnConfirm: false
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/appeal/delete',
            					data: {
            						appealId: row.id
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '删除成功!', 'success');
            						} else {
            							swal('', ret.msg, 'error');
            						}
            						$table.bootstrapTable('refresh'); 
            					},
            					error: function(err) {}
            				});
            			});
            		},
            		'click .btn-appeal-send': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定发送给派单员吗?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
                            closeOnConfirm: false
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/appeal/send',
            					data: {
            						appealId: row.id
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '发送成功!', 'success');
            						} else {
            							swal('', ret.msg, 'error');
            						}
            						$table.bootstrapTable('refresh'); 
            					},
            					error: function(err) {}
            				});
            			});
            		},
            		'click .btn-appeal-urge': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('urge');
            		},
            		'click .btn-appeal-confirm': function(e, value, row, index) {
            			e.stopPropagation();
            			alert('confirm');
            		}
            	}
            }]
		});
		
		$page
		.on('click', '.btn-appeal-add', function() {
			window.location.href = './appealAdd?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>