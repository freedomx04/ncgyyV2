<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>网上申报</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-declare-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="tabs-container">
		            <ul class="nav nav-tabs">
		                <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">申报项目</a></li>
		                <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">我的申报</a></li>
		            </ul>
		            <div class="tab-content">
		                <div id="tab-1" class="tab-pane active">
		                    <div class="panel-body">
				                <table id="declare-list-table" class="table-hm" data-mobile-responsive="true"></table>
		                    </div>
		                </div>
		                <div id="tab-2" class="tab-pane">
		                    <div class="panel-body">
		                    	<div class="btn-group hidden-xs" id="my-declare-list-table-toolbar" role="group">
				                    <button type="button" class="btn btn-white btn-declare-apply-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>批量删除
				                    </button>
				                </div>
				                <table id="my-declare-list-table" class="table-hm" data-mobile-responsive="true"> </table>
		                    </div>
		                </div>
		             </div>
		        </div>
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/fileinput.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-declare-list');
		var enterpriseId = ${user.enterprise.id};
		
		var $eclareTable = $k.util.bsTable($page.find('#declare-list-table'), {
			url: '${ctx}/api/declare/listOnline?enterpriseId=' + enterpriseId,
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'title',
            	title: '项目名称',
            	align: 'center',
            }, {
            	field: 'startTime',
            	title: '申报开始时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	field: 'endTime',
            	title: '申报结束时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	field: 'status',
            	title: '是否申报',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return row.applyStatus == 0 ? '<span class="label label-warning">未申报</span>' : '<span class="label label-success">已申报</span>';
            	}
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $detail = '<a class="btn-declare-apply-detail a-operate">详情</a>';
            		var $apply = '<a class="btn-declare-apply-add a-operate">申报</a>';
            		
            		switch (row.applyStatus) {
            		case 0:
            			return $detail + $apply;
            		case 1:
            			return $detail;
            		}
            	},
            	events: window.operateEvents = {
            		'click .btn-declare-apply-add': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './applyAdd?method=add&declareId=' + row.id + '&enterpriseId=' + enterpriseId;
            		},
            		'click .btn-declare-apply-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './declareGet?declareId=' + row.id + '&type=ep';
            		}
            	}
            }]
		});
		
		var $myDeclareTable = $k.util.bsTable($page.find('#my-declare-list-table'), {
			url: '${ctx}/api/apply/listByEnterpriseId?enterpriseId=' + enterpriseId,
			toolbar: '#my-declare-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
				field: 'state',
				checkbox: true
			}, {
            	field: 'declare.title',
            	title: '项目名称',
            	align: 'center',
            }, {
            	field: 'declare.status',
            	title: '发布状态',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var status = '';
            		switch (row.declare.status) {
           			case 0:
            			status = '新增';
           			break;
           			case 1:
            			status = '上架';
           			break;
           			case 2:
            			status = '下架';
           			break;
            		}
            		
            		if (new Date(row.declare.endTime) < new Date()) {
            			status = '逾期';
            		}
            		return status;
            	},
            }, {
            	field: 'declare.startTime',
            	title: '申报开始时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	field: 'declare.endTime',
            	title: '申报结束时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	field: 'status',
            	title: '审批状态',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var status = '';
            		switch(row.status) {
            		case 0:
            			status = '<span class="label label-warning">新增</span>';
            			break;
            		case 1:
            			status = '<span class="label label-warning">未审批</span>';
            			break;
            		case 2:
            			status = '<span class="label label-success">审批通过</span>';
            			break;
            		case 3:
            			status = '<span class="label label-danger">审批未通过</span>';
            			break;
            		}
            		return status;
            	}
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		if (row.status == 2 || row.status == 3 || (new Date(row.declare.endTime) < new Date())) {
            			return '<a class="btn-declare-apply-detail a-operate">详情</a><a class="btn-declare-apply-delete a-operate">删除</a>';
            		} else {
            			return '<a class="btn-declare-apply-detail a-operate">详情</a><a class="btn-declare-apply-edit a-operate">编辑</a><a class="btn-declare-apply-delete a-operate">删除</a>';
            		}
            	},
            	events: window.operateEvents = {
            		'click .btn-declare-apply-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './applyAdd?method=edit&applyId=' + row.id;
            		},
            		'click .btn-declare-apply-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './applyGet?applyId=' + row.id + '&type=ep';
            		},
            		'click .btn-declare-apply-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/apply/delete',
            					data: {
            						applyId: row.id
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '删除成功!', 'success');
            						} else {
            							swal('', ret.msg, 'error');
            						}
            						$myDeclareTable.bootstrapTable('refresh'); 
            					},
            					error: function(err) {}
            				});
            			});
            		}
            	}
            }]
		});
		
		$myDeclareTable.on('all.bs.table', function(e, row) {
            var selNum = $myDeclareTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-declare-apply-delete-batch').removeAttr('disabled') : $page.find('.btn-declare-apply-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('click', '.btn-declare-apply-delete-batch', function() {
            var rows = $myDeclareTable.bootstrapTable('getSelections');
            var applyStatus = false;
            $.each(rows, function(key, val) {
            	if (val.status == 2 || val.status == 3) {
            		applyStatus = true;
            	}
            });
            if (applyStatus) {
            	swal('', '包含已审批项目,不能删除', 'error');
            	return;
            }
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
                
                $.ajax({
                    url: '${ctx}/api/apply/batchDelete',
                    data: { 
                        applyIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '删除成功!', 'success');
						} else {
                            swal('', ret.msg, 'error');
                        }
                        $myDeclareTable.bootstrapTable('refresh'); 
                    },
                    error: function(err) {}
                });
            });
        });
	})( jQuery );
	</script>
	
</body>

</html>