<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>版本管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-version-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>版本管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="version-list-table-toolbar" role="group">
					<c:if test="${fn:contains(role.resource, 'authority-version-add')}">
	                    <button type="button" class="btn btn-white btn-version-add" data-toggle="modal" data-target="#modal-version-dialog">
	                        <i class="fa fa-plus fa-fw"></i>新增
	                    </button>
                    </c:if>
                    <c:if test="${fn:contains(role.resource, 'authority-version-delete-batch')}">
	                    <button type="button" class="btn btn-white btn-version-delete-batch" disabled='disabled'>
	                        <i class="fa fa-trash-o fa-fw"></i>批量删除
	                    </button>
                    </c:if>
                </div>
                <table id="version-list-table" class="table-hm" data-mobile-responsive="true"> </table>
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
		
		var $page = $('.body-version-list');
		
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
            }, {
            	field: 'releaseTime',
            	title: '发布时间',
            	align: 'center',
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var resource = '${role.resource}'.split(',');
                    var $operate = '<a class="btn-version-detail a-operate">详情</a>';
                    if ($.inArray('authority-version-edit', resource) != -1) {
                        $operate += '<a class="btn-version-edit a-operate">编辑</a>';
                    }
                    if ($.inArray('authority-version-delete', resource) != -1) {
                        $operate += '<a class="btn-version-delete a-operate">删除</a>';
                    }
                    return $operate;
                },
            	events: window.operateEvents = {
           			'click .btn-version-detail': function(e, value, row, index) {
   						e.stopPropagation();
   						window.location.href = './versionAdd?method=detail&versionId=' + row.id;
   					},
            		'click .btn-version-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href = './versionAdd?method=edit&versionId=' + row.id;
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
                            closeOnConfirm: false
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/version/delete',
            					data: {
            						versionId: row.id
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
            		}
            	}
            }]
		});
		
		$table.on('all.bs.table', function(e, row) {
            var selNum = $table.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-version-delete-batch').removeAttr('disabled') : $page.find('.btn-version-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('click', '.btn-version-add', function() {
			window.location.href = './versionAdd?method=add';
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
                closeOnConfirm: false
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/version/batchDelete',
                    data: { 
                        versionIdList: $k.util.getIdList(rows) 
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
        });
		
	})( jQuery );
	</script>
	
</body>

</html>