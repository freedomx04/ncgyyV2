<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招商平台</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-platform-business">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-supplier" aria-expanded="true">供应商信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-business" aria-expanded="false">招商管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-supplier" class="tab-pane active">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是招商服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-business-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<div class="panel-body">
									<dl class="dl-horizontal" style="padding-right: 60px;">
										<dt>供应商类型</dt><dd>招商服务供应商</dd>
										<dt>审核状态</dt>
										<dd>
										<c:choose>
											<c:when test="${supplier.status == 1}">
												<span class="label label-warning">审核中</span>
											</c:when>
											<c:when test="${supplier.status == 2}">
												<span class="label label-success">已认证</span>
											</c:when>
											<c:when test="${supplier.status == 3}">
												<span class="label label-danger">已驳回</span>
											</c:when>
										</c:choose>
										</dd>
										<dt>供应商名称</dt><dd>${supplier.name}</dd>
										<dt>供应商图片</dt><dd><img src="${ctx}/api/avatar/${supplier.imagePath}" style="max-width: 200px; max-height: 200px;"></dd>
										<dt>行业类别</dt><dd>${supplier.profession}</dd>
										<dt>企业性质</dt><dd>${supplier.property}</dd>
										<dt>企业规模</dt><dd>${supplier.scale}</dd>
										<dt>地址</dt><dd>${supplier.address}</dd>
										<dt>联系人</dt><dd>${supplier.contactUser}</dd>
										<dt>联系电话</dt><dd>${supplier.contact}</dd>
										<dt>座机</dt><dd>${supplier.phone}</dd>
										<dt>传真</dt><dd>${supplier.fax}</dd>
										<dt>简介</dt><dd>${supplier.introduction}</dd>
										<dt>营业执照</dt><dd>${supplier.license}</dd>
										<dt>营业执照图片</dt><dd><img src="${ctx}${supplier.licensePath}" class="img-responsive"></dd>
									</dl>
								</div>
							</c:if>
						</div>
						
						<div id="tab-business" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是招商服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-business-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<c:if test="${supplier.status != 2}">
									<div class="panel-body text-center">
										<img src="${ctx}/img/operate-success.png" style="max-width: 100px;">
										<h3 style="padding: 5px;">申请提交完成，正在为你审核...</h3>
										<p>我们会在3个工作日内完成供应商信息的审核工作，审核通过后，你可以使用供应商所提供的平台服务。</p>
									</div>
								</c:if>
								<c:if test="${supplier.status == 2}">
									<div class="panel-body">
										<div class="btn-group" id="business-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-business-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-business-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="business-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-business-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招商信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-business" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>项目名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>项目地址</label>
                            <div class="col-sm-7">
                            	<input type="text" class="form-control" name="address" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="overview" class="col-sm-3 control-label"><i class="form-required">*</i>项目概况</label>
                        	 <div class="col-sm-7">
                                <textarea class="form-control" name="overview" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="content" class="col-sm-3 control-label"><i class="form-required">*</i>建设内容</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="content" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="scale" class="col-sm-3 control-label"><i class="form-required">*</i>投资规模</label>
                            <div class="col-sm-7">
                            	<input type="text" class="form-control" name="scale" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="mode" class="col-sm-3 control-label"><i class="form-required">*</i>合作方式</label>
                            <div class="col-sm-7">
                            	<input type="text" class="form-control" name="mode" required>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="contactUser" class="col-sm-3 control-label"><i class="form-required">*</i>联系人</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contactUser" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contact" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal" id="modal-business-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招商信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>项目名称</dt><dd data-name="name"></dd>
                		<dt>项目地址</dt><dd data-name="address"></dd>
                		<dt>项目概况</dt><dd data-name="overview"></dd>
                		<dt>建设内容</dt><dd data-name="content"></dd>
                		<dt>投资规模</dt><dd data-name="scale"></dd>
                		<dt>合作方式</dt><dd data-name="mode"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {	
		
		var $page = $('.body-platform-business');
		var supplierId = '${supplier.id}';
		var userId = '${userId}';
		
		var $businessTable = $('#business-list-table');
		if ($businessTable) {
			var $businessDialog = $('#modal-business-dialog');
			var $businessDetailDialog = $('#modal-business-detail-dialog');
			var $businessForm = $('#form-business');
			$k.util.bsValidator($businessForm);
			
			$businessTable = $k.util.bsTable($page.find('#business-list-table'), {
				url: '${ctx}/api/service/business/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#business-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns:[{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'name',
	            	title: '项目名称',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-business-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-business-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$businessDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	            			});
	            			$businessDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'address',
	            	title: '项目地点',
	            }, {
	            	field: 'scale',
	            	title: '投资规模'
	            }, {
	            	field: 'mode',
	            	title: '合作方式'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-business-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-business-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-business-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$businessForm.find('input[name="' + key + '"]').val(val);
	            				$businessForm.find('textarea[name="' + key + '"]').val(val);
	            				$businessForm.find('select[name="' + key + '"]').val(val);
	            			});
	            			$businessDialog.data('method', 'edit');
            				$businessDialog.data('businessId', row.id);
	            			$businessDialog.modal('show');
	            		},
	            		'click .btn-business-delete': function(e, value, row, index) {
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
	            					url: '${ctx}/api/service/business/delete',
	            					data: {
	            						businessId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$businessTable.bootstrapTable('refresh'); 
            							} else {
            								toastr['error'](ret.msg);
            	                        }
	            					},
	            					error: function(err) {}
	            				});
	            			});
	            		}
	            	}
	            }]
			});
			$businessTable.on('all.bs.table', function(e, row) {
	            var selNum = $businessTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-business-delete-batch').removeAttr('disabled') : $page.find('.btn-business-delete-batch').attr('disabled', 'disabled');
	        });
			
			$businessDialog.on('click', '.btn-confirm', function() {
				var validator = $businessForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($businessForm[0]); 
            		var method = $businessDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			$.ajax({
    					    url: '${ctx}/api/service/business/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$businessDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$businessTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('businessId', $businessDialog.data('businessId'));
            			$.ajax({
    					    url: '${ctx}/api/service/business/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$businessDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$businessTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		}
	            }
			});
		}
		
		$page
		.on('click', '.btn-business-supplier', function() {
			window.location.href = '${ctx}/supplierApply?type=2';
		})
		.on('click', '.btn-business-add', function() {
			$businessDialog.data('method', 'add');
			$businessDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-business-dialog', function() {
            $businessForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
        .on('click', '.btn-business-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $businessTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/business/deleteBatch',
                    data: { 
                    	businessIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$businessTable.bootstrapTable('refresh'); 
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