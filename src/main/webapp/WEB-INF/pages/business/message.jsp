<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>留言管理</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-message-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>留言管理</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="message-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-danger btn-message-delete-batch" disabled='disabled'>
                        <i class="fa fa-trash-o fa-fw"></i>删除
                    </button>
                </div>
                <table id="message-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
			</div>
		</div>
	</div>
	
    <div class="modal" id="modal-message-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">留言信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>姓名</dt><dd data-name="name"></dd>
                		<dt>电话</dt><dd data-name="contact"></dd>
                		<dt>地区</dt><dd data-name="area"></dd>
                		<dt>邮箱</dt><dd data-name="email"></dd>
                		<dt>QQ</dt><dd data-name="qq"></dd>
                		<dt>留言</dt><dd data-name="content"></dd>
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

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-message-list');
		var $detailDialog = $page.find('#modal-message-detail-dialog');
		
		var $table = $k.util.bsTable($page.find('#message-list-table'), {
			url: '${ctx}/api/business/message/list',
			toolbar: '#message-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'name',
            	title: '姓名',
            	formatter: function(value, row, index) {
            		return '<a class="btn-message-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-message-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$detailDialog.find('dd[data-name="' + key + '"]').text(val);
            			});
            			$detailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'contact',
            	title: '电话',
            }, {
            	field: 'area',
            	title: '地区',
            }, {
            	field: 'email',
            	title: '邮箱'
            }, {
            	field: 'qq',
            	title: 'QQ'
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
            selNum > 0 ? $page.find('.btn-message-delete-batch').removeAttr('disabled') : $page.find('.btn-message-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('click', '.btn-message-delete-batch', function() {
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
                    url: '${ctx}/api/business/message/deleteBatch',
                    data: { 
                        messageIdList: $k.util.getIdList(rows) 
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