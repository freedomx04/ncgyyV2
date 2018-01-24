<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>融资平台</title>
	
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

<body class="gray-bg body-platform-financing">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-supplier" aria-expanded="true">供应商信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-financing" aria-expanded="false">融资管理</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-invest" aria-expanded="false">投资管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-supplier" class="tab-pane active">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是融资服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-financing-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<div class="panel-body">
									<dl class="dl-horizontal" style="padding-right: 60px;">
										<dt>供应商类型</dt><dd>融资服务供应商</dd>
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
												<span class="label label-danger">未驳回</span>
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
						
						<div id="tab-financing" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是融资服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-financing-supplier">申请成为供应商</button></p>
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
										<div class="btn-group" id="financing-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-financing-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-financing-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="financing-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
						
						<div id="tab-invest" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是融资服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-financing-supplier">申请成为供应商</button></p>
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
										<div class="btn-group" id="invest-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-invest-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-invest-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="invest-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-financing-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">融资信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-financing" autocomplete="off">
                        <div class="form-group">
                            <label for="title" class="col-sm-3 control-label"><i class="form-required">*</i>项目名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="title" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="profession" class="col-sm-3 control-label"><i class="form-required">*</i>行业类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="profession" required>
                                	<option value="">请选择行业类别</option>
									<c:forEach var="profession" items="${professions}">
										<option value="${profession}">${profession}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="prupose" class="col-sm-3 control-label"><i class="form-required">*</i>融资用途</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="prupose" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="amount" class="col-sm-3 control-label"><i class="form-required">*</i>融资金额</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="amount" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="financingType" class="col-sm-3 control-label"><i class="form-required">*</i>融资类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="financingType" required>
                                	<option value="">请选择行业类别</option>
									<c:forEach var="financingType" items="${financingTypes}">
										<option value="${financingType}">${financingType}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        
                        <div class="form-group">
                        	<label for="description" class="col-sm-3 control-label"><i class="form-required">*</i>项目概述</label>
                        	 <div class="col-sm-7">
                                <textarea class="form-control" name="description" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="advantage" class="col-sm-3 control-label"><i class="form-required">*</i>项目优势</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="advantage" style="resize:none; height: 150px;" required></textarea>
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
    
    <div class="modal" id="modal-financing-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招聘信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>项目名称</dt><dd data-name="title"></dd>
                		<dt>行业类型</dt><dd data-name="profession"></dd>
                		<dt>融资用途</dt><dd data-name="prupose"></dd>
                		<dt>融资金额</dt><dd data-name="amount"></dd>
                		<dt>融资类型</dt><dd data-name="financingType"></dd>
                		<dt>项目概述</dt><dd data-name="description"></dd>
                		<dt>项目优势</dt><dd data-name="advantage"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-invest-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">投资信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-invest" autocomplete="off">
                        <div class="form-group">
                            <label for="title" class="col-sm-3 control-label"><i class="form-required">*</i>项目名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="title" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="investType" class="col-sm-3 control-label"><i class="form-required">*</i>投资方式</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="investType" required>
                                	<option value="">请选择投资方式</option>
									<c:forEach var="investType" items="${investTypes}">
										<option value="${investType}">${investType}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="fundType" class="col-sm-3 control-label"><i class="form-required">*</i>资金类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="fundType" required>
                                	<option value="">请选择资金类型</option>
									<c:forEach var="fundType" items="${fundTypes}">
										<option value="${fundType}">${fundType}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="profession" class="col-sm-3 control-label"><i class="form-required">*</i>投资行业</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="profession" required>
                                	<option value="">请选择投资行业</option>
									<c:forEach var="profession" items="${professions}">
										<option value="${profession}">${profession}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="amount" class="col-sm-3 control-label"><i class="form-required">*</i>投资金额</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="amount" required>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                        	<label for="description" class="col-sm-3 control-label"><i class="form-required">*</i>项目概述</label>
                        	 <div class="col-sm-7">
                                <textarea class="form-control" name="description" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="remark" class="col-sm-3 control-label"><i class="form-required">*</i>其他备注</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="remark" style="resize:none; height: 150px;" required></textarea>
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
    
    <div class="modal" id="modal-invest-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">投资信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>项目名称</dt><dd data-name="title"></dd>
                		<dt>投资方式</dt><dd data-name="investType"></dd>
                		<dt>资金类型</dt><dd data-name="fundType"></dd>
                		<dt>投资行业</dt><dd data-name="profession"></dd>
                		<dt>投资金额</dt><dd data-name="amount"></dd>
                		<dt>项目概述</dt><dd data-name="description"></dd>
                		<dt>其他备注</dt><dd data-name="remark"></dd>
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
		
		var $page = $('.body-platform-financing');
		var supplierId = '${supplier.id}';
		var userId = '${userId}';
		
		// 融资
		var $financingTable = $('#financing-list-table');
		if ($financingTable) {
			var $financingDialog = $('#modal-financing-dialog');
			var $financingDetailDialog = $('#modal-financing-detail-dialog');
			var $financingForm = $('#form-financing');
			$k.util.bsValidator($financingForm);
			
			$financingTable = $k.util.bsTable($page.find('#financing-list-table'), {
				url: '${ctx}/api/service/financing/financing/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#financing-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns: [{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'title',
	            	title: '项目名称',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-financing-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-financing-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$financingDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	            			});
	            			$financingDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'profession',
	            	title: '行业类别',
	            	align: 'center'
	            }, {
	            	field: 'amount',
	            	title: '融资金额',
	            	align: 'center'
	            }, {
	            	field: 'financingType',
	            	title: '融资类型',
	            	align: 'center'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-financing-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-financing-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-financing-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$financingForm.find('input[name="' + key + '"]').val(val);
	            				$financingForm.find('textarea[name="' + key + '"]').val(val);
	            				$financingForm.find('select[name="' + key + '"]').val(val);
	            			});
	            			$financingDialog.data('method', 'edit');
            				$financingDialog.data('financingId', row.id);
	            			$financingDialog.modal('show');
	            		},
	            		'click .btn-financing-delete': function(e, value, row, index) {
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
	            					url: '${ctx}/api/service/financing/financing/delete',
	            					data: {
	            						financingId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$financingTable.bootstrapTable('refresh'); 
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
			
			$financingTable.on('all.bs.table', function(e, row) {
	            var selNum = $financingTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-financing-delete-batch').removeAttr('disabled') : $page.find('.btn-financing-delete-batch').attr('disabled', 'disabled');
	        });
			
			$financingDialog.on('click', '.btn-confirm', function() {
				var validator = $financingForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($financingForm[0]); 
            		var method = $financingDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			$.ajax({
    					    url: '${ctx}/api/service/financing/financing/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$financingDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$financingTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('financingId', $financingDialog.data('financingId'));
            			$.ajax({
    					    url: '${ctx}/api/service/financing/financing/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$financingDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$financingTable.bootstrapTable('refresh'); 
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
		
		//投资
		var $investTable = $('#invest-list-table');
		if ($investTable) {
			var $investDialog = $('#modal-invest-dialog');
			var $investDetailDialog = $('#modal-invest-detail-dialog');
			var $investForm = $('#form-invest');
			$k.util.bsValidator($investForm);
			
			$investTable = $k.util.bsTable($page.find('#invest-list-table'), {
				url: '${ctx}/api/service/financing/invest/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#invest-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns: [{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'title',
	            	title: '项目名称',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-invest-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-invest-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$investDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	            			});
	            			$investDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'investType',
	            	title: '投资方式',
	            	align: 'center'
	            }, {
	            	field: 'fundType',
	            	title: '资金类型',
	            	align: 'center'
	            }, {
	            	field: 'profession',
	            	title: '投资行业',
	            	align: 'center'
	            }, {
	            	field: 'amount',
	            	title: '投资金额',
	            	align: 'center'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-invest-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-invest-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-invest-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$investForm.find('input[name="' + key + '"]').val(val);
	            				$investForm.find('textarea[name="' + key + '"]').val(val);
	            				$investForm.find('select[name="' + key + '"]').val(val);
	            			});
	            			$investDialog.data('method', 'edit');
            				$investDialog.data('investId', row.id);
	            			$investDialog.modal('show');
	            		},
	            		'click .btn-invest-delete': function(e, value, row, index) {
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
	            					url: '${ctx}/api/service/financing/invest/delete',
	            					data: {
	            						investId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$investTable.bootstrapTable('refresh'); 
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
			
			$investTable.on('all.bs.table', function(e, row) {
	            var selNum = $investTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-invest-delete-batch').removeAttr('disabled') : $page.find('.btn-invest-delete-batch').attr('disabled', 'disabled');
	        });
			
			$investDialog.on('click', '.btn-confirm', function() {
				var validator = $investForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($investForm[0]); 
            		var method = $investDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			$.ajax({
    					    url: '${ctx}/api/service/financing/invest/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$investDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$investTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('investId', $investDialog.data('investId'));
            			$.ajax({
    					    url: '${ctx}/api/service/financing/invest/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$investDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$investTable.bootstrapTable('refresh'); 
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
		.on('click', '.btn-financing-supplier', function() {
			window.location.href = '${ctx}/supplierApply?type=3';
		})
		.on('click', '.btn-financing-add', function() {
			$financingDialog.data('method', 'add');
			$financingDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-financing-dialog', function() {
            $financingForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
         .on('click', '.btn-financing-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $financingTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/financing/financing/deleteBatch',
                    data: { 
                    	financingIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$financingTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        })
        .on('click', '.btn-invest-add', function() {
			$investDialog.data('method', 'add');
			$investDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-invest-dialog', function() {
            $investForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
         .on('click', '.btn-invest-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $investTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/financing/invest/deleteBatch',
                    data: { 
                    	investIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$investTable.bootstrapTable('refresh'); 
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