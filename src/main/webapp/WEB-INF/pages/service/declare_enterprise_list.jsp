<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>申报企业列表</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-declare">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<button type="button" class="btn btn-white btn-declare-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>申报列表</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${declare.title}</span>
			</div>
			
			<div class="ibox-content">
                <table id="declare-enterprise-list-table" class="table-hm" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-apply-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title"><strong>审批</strong></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-apply" autocomplete="off">
                    	<div class="form-group">
                            <label for="status" class="col-sm-3 control-label"><i class="form-required">*</i>审核原因</label>
                            <div class="col-sm-7">
                            	<select name="status" class="form-control" required> 
                            		<option value="">请选择</option> 
                            		<option value="2">通过</option> 
                            		<option value="3">未通过</option> 
                            	</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="opinion" class="col-sm-3 control-label"><i class="form-required">*</i>审核原因</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="opinion" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">
                        <i class="fa fa-close fa-fw"></i>关闭
                    </button>
                    <button type="button" class="btn btn-primary btn-confirm">
                        <i class="fa fa-check fa-fw"></i>确定
                    </button>
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
		
		var $page = $('.body-declare');
		var $dialog = $page.find('#modal-apply-dialog');
		var $form = $dialog.find('form');
		
		$k.util.bsValidator($form);
		
		var $table = $k.util.bsTable($page.find('#declare-enterprise-list-table'), {
			url: '${ctx}/api/apply/listByDeclareId?declareId=' + $k.util.getRequestParam('declareId'),
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'enterprise.name',
            	title: '企业名称',
            	align: 'center'
            }, {
            	field: 'status',
            	title: '审核状态',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var status = '';
            		switch(row.status) {
            		case 0:
            			status = '新增';
            			break;
            		case 1:
            			status = '未审批';
            			break;
            		case 2:
            			status = '审批通过';
            			break;
            		case 3:
            			status = '审批未通过';
            			break;
            		}
            		return status;
            	}
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-apply-detail a-operate">详情</a><a class="btn-apply-approve a-operate">审核</a>';
                },
            	events: window.operateEvents = {
           			'click .btn-apply-approve': function(e, value, row, index) {
               			e.stopPropagation();
               			$dialog.data('approveId', row.id);
               			$dialog.modal('show');
               		},
            	}
            }]
		});
		$page
		.on('click', '.btn-declare-back', function() {
			window.location.href = '${ctx}/declareGV';
		})
		.on('hidden.bs.modal', '#modal-apply-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        });

		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				$.ajax({
					url: '${ctx}/api/apply/approve',
               		type: 'POST',
               		data: {
               			applyId: $dialog.data('applyId'),
               			opinion: $form.find('input[name = "opinion"]').val(),
               			status: $form.find('select[name = "status"]').val()
               		},
               		success: function(ret) {
               			if (ret.code == 0) {
               				$dialog.modal('hide');
                   			swal('', '添加成功!', 'success');
                   			$table.bootstrapTable('refresh'); 
               			} else {
               				swal('', ret.msg, 'error');
               			}
               		},
               		error: function(err) {}
               	});
			}
		});
		
	})( jQuery );
	</script>
	
</body>

</html>