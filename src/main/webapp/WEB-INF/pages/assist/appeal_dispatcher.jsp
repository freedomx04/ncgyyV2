<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-appeal">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 诉求列表</a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">诉求分类</a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">诉求预警</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
		                <table id="appeal-list-table" class="table-hm" data-mobile-responsive="true"> </table>
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-appeal');
		
		var $table = $k.util.bsTable($page.find('#appeal-list-table'), {
			url: '${ctx}/api/area/list',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '名称',
            	align: 'center'
            }, {
            	field: 'description',
            	title: '描述',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-appeal-dispatch a-operate">派单</a><a class="btn-appeal-reject a-operate">驳回</a><a class="btn-appeal-detail a-operate">查看</a><a class="btn-appeal-urge-detail a-operate">催办详情</a>';
                },
            	events: window.operateEvents = {
            		'click .btn-area-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			
            			$areaDialog.find('.modal-title strong').text('编辑');
            			$.each(row, function(key, val) {
            				if (key == 'name') {
                                $areaForm.find('input[name = "name"]').attr('disabled', 'disabled');
                            }
            				$areaForm.find('input[name="' + key + '"]').val(val);
            			});
            			$areaDialog.modal('show');
            			
            			$areaDialog.on('click', '.btn-confirm', function() {
            				var validator = $areaForm.data('bootstrapValidator');
            				validator.validate();
            				
                            if (validator.isValid()) {
                            	$.ajax({
                            		url: '${ctx}/api/area/update',
                            		type: 'POST',
                            		data: {
                            			areaId: row.id,
                            			description: $areaForm.find('input[name = "description"]').val()
                            		},
                            		success: function(ret) {
                            			$areaDialog.modal('hide');
                                        swal('', '编辑成功!', 'success');
                                        $table.bootstrapTable('refresh'); 
                            		},
                            		error: function(err) {}
                            	});
                            }
            			});
            		},
            		'click .btn-area-delete': function(e, value, row, index) {
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
            				var areaId = row['id'];
            				
            				$.ajax({
            					url: '${ctx}/api/area/delete',
            					data: {
            						areaId: areaId
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '删除成功!', 'success');
            						} else if (ret.code == 1004) {
            							swal('', '该数据存在关联, 无法删除', 'error');
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
            selNum > 0 ? $page.find('.btn-area-delete-batch').removeAttr('disabled') : $page.find('.btn-area-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('hidden.bs.modal', '#modal-area-dialog', function() {
            $areaForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		
	})( jQuery );
	</script>
	
</body>

</html>