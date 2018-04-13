<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>主要经济指标</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-economic">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="page-title">
					<h2>主要经济指标</h2>
				</div>
			
				<div class="btn-group" id="economic-list-table-toolbar" role="group">
                   <select class="form-control select-year" style="width: 120px;">
                   		<option value="2017">2017</option>
                   		<option value="2018">2018</option>
                   </select>
                </div>
                <table id="economic-list-table" class="table-hm" data-mobile-responsive="true"> </table>
			</div>
		</div>
	</div>
	
    <div class="modal" id="modal-economic-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">主要经济指标</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">时间</label>
                            <div class="col-sm-7">
                            	<p class="form-control-static economic-year"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="industry" class="col-sm-3 control-label">工业增加值</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="industry" data-bv-numeric="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="business" class="col-sm-3 control-label">主营业务收入</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="business" data-bv-numeric="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="investmentFund" class="col-sm-3 control-label">招商到位资金</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="investmentFund" data-bv-numeric="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="profit" class="col-sm-3 control-label">利润总额</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="profit" data-bv-numeric="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="developmentArea" class="col-sm-3 control-label">园区开发面积</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="developmentArea" data-bv-numeric="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="export" class="col-sm-3 control-label">出口交货值</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="export" data-bv-numeric="true">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-economic');
		var $dialog = $page.find('#modal-economic-dialog');
		var $form = $dialog.find('form');
		$k.util.bsValidator($form);
		
		var year = new Date().getFullYear();
		var $select = $page.find('.select-year');
		initTable(year);
		$select.val(year);
		
		var $table;
		function initTable(year) {
			$page.find('#economic-list-table').bootstrapTable('destroy');
			
			$table = $k.util.bsTable($page.find('#economic-list-table'), {
				url: '${ctx}/api/dataCenter/economic/list?year=' + year,
				toolbar: '#economic-list-table-toolbar',
				idField: 'id',
				pagination: false,
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns: [{
	            	field: 'month',
	            	title: '月份',
	            	align: 'center',
	            	width: '100',
	            	formatter: function(value, row, index) {
	            		return value + '月';
	            	}
	            }, {
	            	field: 'industry',
	            	title: '工业增加值',
	            	align: 'center',
	            }, {
	            	field: 'business',
	            	title: '主营业务收入',
	            	align: 'center'
	            }, {
	            	field: 'investmentFund',
	            	title: '招商到位资金',
	            	align: 'center'
	            }, {
	            	field: 'profit',
	            	title: '利润总额',
	            	align: 'center'
	            }, {
	            	field: 'developmentArea',
	            	title: '园区开发面积',
	            	align: 'center'
	            }, {
	            	field: 'export',
	            	title: '出口交货值',
	            	align: 'center'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	width: '100',
	            	formatter: function(value, row, index) {
	                    var $edit = '<a class="btn-economic-edit a-operate">编辑</a>';
	                    return $edit;
	                },
	                events: window.operateEvents = {
	                	'click .btn-economic-edit': function(e, value, row, index) {
	                		e.stopPropagation();
	                		$form.find('.economic-year').text(row.year + '年' + row.month + '月');
	            			$.each(row, function(key, val) {
	            				$form.find('input[name="' + key + '"]').val(val);
	            			});
	            			$dialog.data('year', row.year);
	            			$dialog.data('month', row.month);
	            			$dialog.modal('show');
	                	}
	                }
	            }]
			});
		}
		
		$dialog.on('click', '.btn-confirm', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]); 
				formData.append('year', $dialog.data('year'));
				formData.append('month', $dialog.data('month'));
    			$.ajax({
				    url: '${ctx}/api/dataCenter/economic/update',
	            	type: 'post',
	            	data: formData,
	        		processData: false,
	                contentType: false,
	                cache: false, 
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
		});
		
		$page
		.on('hidden.bs.modal', '#modal-economic-dialog', function() {
            $form.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        }) 
		.on('change', '.select-year', function() {
			var year = $(this).val();
			initTable(year);
		});
		
	})( jQuery );
	</script>
	
</body>

</html>