<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>反馈管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-feedback-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>反馈管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="feedback-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-danger btn-feedback-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>删除
                    </button>
                </div>
                <table id="feedback-list-table" class="table-hm table-fixed" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-feedback-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    	<div class="modal-dialog modal-center">
    		<div class="modal-content animated fadeInDown">
    			<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">反馈内容</h4>
                </div>
    			<div class="modal-body" style="max-height: 500px; overflow: auto;">
    				<p class="feedback-content"></p>
    			</div>
    			<div class="modal-footer">
    				<button type="button" class="btn btn-primary btn-fw" data-dismiss="modal">取消</button>
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

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-feedback-list');
		var $detailDialog = $page.find('#modal-feedback-detail-dialog');
		
		var $table = $k.util.bsTable($page.find('#feedback-list-table'), {
			url: '${ctx}/api/authority/feedback/list',
			toolbar: '#feedback-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'content',
            	title: '反馈内容',
            	formatter: function(value, row, index) {
            		return '<a class="btn-feedback-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-feedback-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$detailDialog.find('.feedback-content').text(value);
            			$detailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'user',
            	title: '反馈用户',
            	align: 'center',
            	width: '120',
            	formatter: function(value, row, index) {
            		return value.name;
            	}
            }, {
            	field: 'updateTime',
            	title: '反馈时间',
            	align: 'center',
            	width: '180',
            	formatter: formatDate2
            }]
		});
		
		$table.on('all.bs.table', function(e, row) {
            var selNum = $table.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-feedback-delete-batch').removeAttr('disabled') : $page.find('.btn-feedback-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('click', '.btn-feedback-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/authority/feedback/deleteBatch',
                    data: { 
                        feedbackIdList: $k.util.getIdList(rows) 
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
        });
		
	})( jQuery );
	</script>
	
</body>

</html>