<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>项目管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	#modal-item-detail-dialog img {
		max-width: 100%;
		height: auto;
		display: block;
	}
	</style>
</head>

<body class="gray-bg body-item">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>项目管理</h2>
				</div>
			
				<div class="btn-group" id="item-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-item-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                </div>
                <table id="item-list-table" class="table-hm table-fixed" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<!-- 项目详情 -->
	<div class="modal" id="modal-item-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-lg modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">项目信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>项目状态</dt><dd data-name="status"></dd>
                        <dt>项目名称</dt><dd data-name="name"></dd>
                        <dt>项目级别</dt><dd data-name="level"></dd>
                        <dt>主管单位</dt><dd data-name="unit"></dd>
                        <dt>截止日期</dt><dd data-name="deadline"></dd>
                        <dt>项目概述</dt><dd data-name="content"></dd>
                        <dt>附件</dt><dd data-name="fileList"><ul class="list-unstyled"></ul></dd>
                    </dl>
                </div>
			</div>
		</div>
	</div>
	
	<!-- 公示结果 -->
	<div class="modal" id="modal-item-result-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
        <div class="modal-dialog modal-lg modal-center">
            <div class="modal-content animated fadeInDown bounceIn">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">公示结果</h4>
                </div>
                <div class="modal-body">
                    <div class="result padding-15"></div>
                </div>
            </div>
        </div>
    </div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/local/dialog.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-item');
		var $dialog = $page.find('#modal-item-dialog');
		var $detailDialog = $page.find('#modal-item-detail-dialog');
		var $resultDialog = $page.find('#modal-item-result-dialog');
		
		var $table = $k.util.bsTable($page.find('#item-list-table'), {
			url: '${ctx}/api/website/item/list',
			toolbar: '#item-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
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
                    		if (key == 'status') {
                    			var $status;
                    			switch (val) {
                        		case 0:
                        			$status = '<span class="label label-primary">未申报</span>';
                        		case 1:
                        			$status = '<span class="label label-success">申报中</span>';
                        		case 2:
                        			$status = '<span class="label label-warning">已截止</span>';
                        		case 3:
                        			$status = '<span class="label label-info">已公示</span>';
                        		}
                    			$detailDialog.find('dd[data-name="status"]').html($status);
                    		} else if (key == 'content') {
                    			$detailDialog.find('dd[data-name="content"]').html(val);
                    		} else if (key == 'fileList') {
                    			var $fileList = $detailDialog.find('dd[data-name="fileList"] ul');
                    			$fileList.empty();
                    			$.each(val, function(k, file) {
                    				var $li = '<li><a href="${ctx}/api/downloadFile?' + 
                    						'filename=' + file.filename + 
                    						'&filepath=' + file.filepath + '">' + file.filename + '</li>';
                    				$fileList.append($li);
                    			});
                    		} else {
                    			$detailDialog.find('dd[data-name="' + key + '"]').text(val);
                    		}
                        });
            			$detailDialog.modal('show');
                    },
                }
            }, {
            	field: 'deadline',
            	title: '截止日期',
            	align: 'center',
            	width: '100',
            	formatter: formatDate
            }, {
            	field: 'status',
            	title: '项目状态',
            	align: 'center',
            	width: '100',
            	formatter: function(value, row, index) {
            		switch (value) {
            		case 0:
            			return '<span class="label label-primary">未申报</span>';
            		case 1:
            			return '<span class="label label-success">申报中</span>';
            		case 2:
            			return '<span class="label label-warning">已截止</span>';
            		case 3:
            			return '<span class="label label-info">已公示</span>';
            		}
            	}
            }, {
            	field: 'updateTime',
            	title: '发布时间',
            	align: 'center',
            	width: '150',
            	formatter: formatDate2
            }, {
            	title: '操作',
            	align: 'center',
            	width: '150',
            	formatter: function(value, row, index) {
                    var $edit = '<a class="btn-item-edit a-operate">编辑</a>';
                    var $declare = '<a class="btn-item-declare a-operate">申报</a>';
                    var $delete = '<a class="btn-item-delete a-operate">删除</a>';
                    var $public = '<a class="btn-item-public a-operate">公示</a>';
                    var $result = '<a class="btn-item-result a-operate">公示结果</a>';
                    
                    var status = row.status;
                    switch (status) {
                    case 0:
                    	 return $edit + $declare+ $delete;
                    case 2:
                    	return $public;
                    case 3:
                    	return $result;
                    }
                },
            	events: window.operateEvents = {
            		'click .btn-item-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href = '${ctx}/website/item/add?method=edit&itemId=' + row.id;
            		},
            		'click .btn-item-declare': function(e, value, row, index) {
            			e.stopPropagation();
            			new ConfirmDialog($page, {
            				title: '申报确认',
            				text: '确定申报该项目？<br>申报的项目不能编辑和删除'
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/website/item/declare',
            					data: {
            						itemId: row.id
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
            		'click .btn-item-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/website/item/delete',
            					data: {
            						itemId: row.id
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
            		'click .btn-item-public': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href = '${ctx}/website/item/public?itemId=' + row.id;
            		},
            		'click .btn-item-result': function(e, value, row, index) {
            			e.stopPropagation();
            			$resultDialog.find('.result').html(row.result);
            			$resultDialog.modal('show');
            		}
            	}
            }]
		});
		
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var method = $dialog.data('method');
				if (method == 'add') {
					$.ajax({
 						url: '${ctx}/api/department/create',
                 		type: 'POST',
                 		data: {
                 			name: $dialog.find('input[name = "name"]').val(),
                			principal: $dialog.find('input[name = "principal"]').val(),
                 		},
                 		success: function(ret) {
                 			if (ret.code == 0) {
                 				$dialog.modal('hide');
                 				toastr['success'](ret.msg);
                     			$table.bootstrapTable('refresh');
                 			} else {
                 				toastr['error'](ret.msg);
                 			}
                 		},
                 		error: function(err) {}
                 	});
				} else {
					$.ajax({
	            		url: '${ctx}/api/department/update',
	            		type: 'POST',
	            		data: {
	            			departmentId: $dialog.data('departmentId'),
	            			name: $dialog.find('input[name = "name"]').val(),
	            			principal: $dialog.find('input[name = "principal"]').val(),
	            		},
	            		success: function(ret) {
	            			if (ret.code == 0) {
	            				$dialog.modal('hide');
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
		.on('hidden.bs.modal', '#modal-item-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('click', '.btn-item-add', function() {
			window.location.href = '${ctx}/website/item/add?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>