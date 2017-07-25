<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心(部门)</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-appeal-department">
	<c:if test="${appealList == null}">
		<div class="weui_msg">
			<div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div>
			<div class="weui_text_area">
				<p class="weui_msg_desc">您的还不是企业用户，请联系管理员添加！</p>
			</div>
		</div>
	</c:if>
	
	<c:if test="${appealList != null}">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>诉求中心(部门)</h5>
			</div>
			
			<div class="ibox-content">
				<table id="appeal-department-table" class="table-hm" data-mobile-responsive="true"></table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-appeal-reject-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">驳回</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" autocomplete="off">
                        <div class="form-group">
                            <label for="rejectOpinion" class="col-sm-3 control-label"><i class="form-required">*</i>驳回意见</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" name="rejectOpinion" style="resize:none; height: 150px;" required></textarea>
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
    </c:if>
	
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
		
		var departmentId = '${user.department.id}';
		
		var $page = $('.body-appeal-department');
		
		var $dialogReject = $page.find('#modal-appeal-reject-dialog');
		var $formReject = $dialogReject.find('form');
		$k.util.bsValidator($formReject);
		
		var $table = $k.util.bsTable($page.find('#appeal-department-table'), {
			url: '${ctx}/api/appeal/listByDepartment?departmentId=' + departmentId,
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
            	field: 'enterprise.name',
            	title: '企业名称',
            	align: 'center'
            }, {
            	field: 'dispatchTime',
            	title: '派单时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	field: 'status',
                title: '状态',
                align: 'center',
                formatter: function(value, row, index) {
                	switch (value) {
                	case 2:
                		return '<span class="label label-warning">待受理</span>'; 
                	case 3:
            			return '<span class="label label-primary">处理中</span>';
            		case 4:
            			return '<span class="label label-info">待确认</span>';
            		case 5:
            			return '<span class="label label-success">已确认</span>';
            		case 6:
            			return '<span class="label label-danger">已驳回</span>';
                	}
                }
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    var $detail = '<a class="btn-appeal-detail a-operate">详情</a>';
                    var $accept = '<a class="btn-appeal-accept a-operate">受理</a>';
                    var $handle = '<a class="btn-appeal-handle a-operate">办结</a>';
                    var $reject = '<a class="btn-appeal-reject a-operate">驳回</a>';
                    
                    switch (row.status) {
                    case 2:
                    	return $detail + $accept + $reject;
                    case 3:
                    	return $detail + $handle;
                    case 4:case 5:case 6:
                    	return $detail;
                    }
                },
                events: window.operateEvents = {
                    'click .btn-appeal-detail': function(e, value, row, index) {
                        e.stopPropagation();
                        window.location.href= './appealGet?appealId=' + row.id;
                    },
                    'click .btn-appeal-accept': function(e, value, row, index) {
                        e.stopPropagation();
                        swal({
            				title: '',
            				text: '您确定受理该诉求吗?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
                            closeOnConfirm: false
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/appeal/accept',
            					data: {
            						appealId: row.id
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '受理成功!', 'success');
            						} else {
            							swal('', ret.msg, 'error');
            						}
            						$table.bootstrapTable('refresh'); 
            					},
            					error: function(err) {}
            				});
            			});
                    },
                    'click .btn-appeal-handle': function(e, value, row, index) {
                        e.stopPropagation();
                        swal({
            				title: '',
            				text: '您确定该诉求已办结吗?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
                            closeOnConfirm: false
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/appeal/handle',
            					data: {
            						appealId: row.id
            					},
            					success: function(ret) {
            						if (ret.code == 0) {
            							swal('', '办结成功!', 'success');
            						} else {
            							swal('', ret.msg, 'error');
            						}
            						$table.bootstrapTable('refresh'); 
            					},
            					error: function(err) {}
            				});
            			});
                    },
                    'click .btn-appeal-reject': function(e, value, row, index) {
                        e.stopPropagation();
                        $dialogReject.data('appealId', row.id);
                        $dialogReject.modal('show');
                    }
                }
            }]
		});
		
		$page
        .on('hidden.bs.modal', '#modal-appeal-reject-dialog', function() {
            $formReject.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        });
		 
		 $dialogReject.on('click', '.btn-confirm', function() {
            var appealId = $dialogReject.data('appealId');
            var validator = $formReject.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
                $.ajax({
                    url: '${ctx}/api/appeal/reject',
                    type: 'post',
                    data: {
                        appealId: appealId,
                        rejectOpinion: $dialogReject.find('textarea[name="rejectOpinion"]').val()
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            $dialogReject.modal('hide');
                            swal('', '操作成功!', 'success');
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