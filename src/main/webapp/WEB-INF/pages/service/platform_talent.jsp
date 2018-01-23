<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>招工平台</title>
	
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

<body class="gray-bg body-platform-talent">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-supplier" aria-expanded="true">供应商信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-recruit" aria-expanded="false">招聘管理</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-job" aria-expanded="false">求职管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-supplier" class="tab-pane active">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是人才服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-talent-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<div class="panel-body">
									<dl class="dl-horizontal" style="padding-right: 60px;">
										<dt>供应商类型</dt><dd>人才服务供应商</dd>
										<dt>审核状态</dt>
										<dd>
										<c:choose>
											<c:when test="${supplier.status == 1}">
												<span class="label label-warning">审核中</span>
											</c:when>
											<c:when test="${supplier.status == 2}">
												<span class="label label-success">已通过</span>
											</c:when>
											<c:when test="${supplier.status == 3}">
												<span class="label label-danger">未通过</span>
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
						
						<div id="tab-recruit" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是人才服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-talent-supplier">申请成为供应商</button></p>
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
										<div class="btn-group" id="recruit-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-recruit-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-recruit-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="recruit-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
						
						<div id="tab-job" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="job-list-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-job-add">
                       					<i class="fa fa-plus fa-fw"></i>新增
                    				</button>
				                    <button type="button" class="btn btn-danger btn-job-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>
				                </div>
				                <table id="job-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="modal-recruit-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招聘信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-recruit" autocomplete="off">
                        <div class="form-group">
                            <label for="position" class="col-sm-3 control-label"><i class="form-required">*</i>招聘职位</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="position" required>
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
                            <label for="salary" class="col-sm-3 control-label"><i class="form-required">*</i>薪资待遇</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="salary" required>
                                	<option value="">请选择薪资待遇</option>
									<c:forEach var="salary" items="${salarys}">
										<option value="${salary}">${salary}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="workingYears" class="col-sm-3 control-label"><i class="form-required">*</i>工作年限</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="workingYears" required>
                               		<option value="">请选择工作年限</option>
									<c:forEach var="workingYears" items="${workingYearss}">
										<option value="${workingYears}">${workingYears}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="education" class="col-sm-3 control-label"><i class="form-required">*</i>学历</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="education" required>
                                	<option value="">请选择学历</option>
									<c:forEach var="education" items="${educations}">
										<option value="${education}">${education}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        
                        <div class="form-group">
                        	<label for="responsibility" class="col-sm-3 control-label"><i class="form-required">*</i>岗位职责</label>
                        	 <div class="col-sm-7">
                                <textarea class="form-control" name="responsibility" style="resize:none; height: 100px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="requirement" class="col-sm-3 control-label"><i class="form-required">*</i>任职要求</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="requirement" style="resize:none; height: 100px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>工作地点</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="address" required>
                            </div>
                        </div>
                        
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
    
    <div class="modal" id="modal-recruit-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">招聘信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>招聘职位</dt><dd data-name="position"></dd>
                		<dt>行业类型</dt><dd data-name="profession"></dd>
                		<dt>薪资待遇</dt><dd data-name="salary"></dd>
                		<dt>工作年限</dt><dd data-name="workingYears"></dd>
                		<dt>学历</dt><dd data-name="education"></dd>
                		<dt>岗位职责</dt><dd data-name="responsibility"></dd>
                		<dt>任职要求</dt><dd data-name=requirement></dd>
                		<dt>工作地点</dt><dd data-name="address"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
    
    <div class="modal" id="modal-job-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">求职信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-job" autocomplete="off">
                        <div class="form-group">
                            <label for="intention" class="col-sm-3 control-label"><i class="form-required">*</i>求职意向</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="intention" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        
                      	<div class="form-group">
                            <label for="sex" class="col-sm-3 control-label"><i class="form-required">*</i>性别</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="sex" required>
                                	<option value="">请选择性别</option>
                                	<option value="男">男</option>
                                	<option value="女">女</option>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="age" class="col-sm-3 control-label"><i class="form-required">*</i>年龄</label>
                            <div class="col-sm-7">
                                <input type="number" class="form-control" name="age" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="profession" class="col-sm-3 control-label"><i class="form-required">*</i>专业</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="profession" required>
                                	<option value="">请选择专业</option>
									<c:forEach var="profession" items="${professions}">
										<option value="${profession}">${profession}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="education" class="col-sm-3 control-label"><i class="form-required">*</i>学历</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="education" required>
                                	<option value="">请选择学历</option>
									<c:forEach var="education" items="${educations}">
										<option value="${education}">${education}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="workingYears" class="col-sm-3 control-label"><i class="form-required">*</i>工作年限</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="workingYears" required>
                               		<option value="">请选择工作年限</option>
									<c:forEach var="workingYears" items="${workingYearss}">
										<option value="${workingYears}">${workingYears}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="salary" class="col-sm-3 control-label"><i class="form-required">*</i>期望薪资</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="salary" required>
                                	<option value="">请选择期望薪资</option>
									<c:forEach var="salary" items="${salarys}">
										<option value="${salary}">${salary}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="area" class="col-sm-3 control-label"><i class="form-required">*</i>期望地区</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="area" required>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                        	<label for="introduction" class="col-sm-3 control-label"><i class="form-required">*</i>自我介绍</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="introduction" style="resize:none; height: 100px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="experience" class="col-sm-3 control-label"><i class="form-required">*</i>工作经历</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="experience" style="resize:none; height: 100px;" required></textarea>
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
    
     <div class="modal" id="modal-job-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">求职信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>求职意向</dt><dd data-name="intention"></dd>
                		<dt>姓名</dt><dd data-name="name"></dd>
                		<dt>性别</dt><dd data-name="sex"></dd>
                		<dt>专业</dt><dd data-name="profession"></dd>
                		<dt>学历</dt><dd data-name="education"></dd>
                		<dt>工作年限</dt><dd data-name="workingYears"></dd>
                		<dt>期望薪资</dt><dd data-name="salary"></dd>
                		<dt>期望地区</dt><dd data-name="area"></dd>
                		<dt>自我介绍</dt><dd data-name="introduction"></dd>
                		<dt>工作经历</dt><dd data-name="experience"></dd>
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
		
		var $page = $('.body-platform-talent');
		var supplierId = '${supplier.id}';
		var userId = '${userId}';
		
		// 招聘
		var $recruitTable = $('#recruit-list-table');
		if ($recruitTable) {
			var $recruitDialog = $('#modal-recruit-dialog');
			var $recruitDetailDialog = $('#modal-recruit-detail-dialog');
			var $recruitForm = $('#form-recruit');
			$k.util.bsValidator($recruitForm);
			
			$recruitTable = $k.util.bsTable($page.find('#recruit-list-table'), {
				url: '${ctx}/api/service/talent/recruit/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#recruit-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns:[{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'position',
	            	title: '招聘职位',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-recruit-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-recruit-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$recruitDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	            			});
	            			$recruitDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'profession',
	            	title: '行业类别',
	            	align: 'center',
	            }, {
	            	field: 'salary',
	            	title: '薪资待遇',
	            	align: 'center',
	            }, {
	            	field: 'workingYears',
	            	title: '工作年限',
	            	align: 'center',
	            }, {
	            	field: 'education',
	            	title: '学历',
	            	align: 'center',
	            }, {
	            	field: 'updateTime',
	            	title: '更新时间',
	            	align: 'center',
	            	formatter: formatDate2
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-recruit-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-recruit-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-recruit-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$recruitForm.find('input[name="' + key + '"]').val(val);
	            				$recruitForm.find('textarea[name="' + key + '"]').val(val);
	            				$recruitForm.find('select[name="' + key + '"]').val(val);
	            			});
	            			$recruitDialog.data('method', 'edit');
            				$recruitDialog.data('recruitId', row.id);
	            			$recruitDialog.modal('show');
	            		},
	            		'click .btn-recruit-delete': function(e, value, row, index) {
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
	            					url: '${ctx}/api/service/talent/recruit/delete',
	            					data: {
	            						recruitId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$recruitTable.bootstrapTable('refresh'); 
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
			
			$recruitTable.on('all.bs.table', function(e, row) {
	            var selNum = $recruitTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-recruit-delete-batch').removeAttr('disabled') : $page.find('.btn-recruit-delete-batch').attr('disabled', 'disabled');
	        });
			
			$recruitDialog.on('click', '.btn-confirm', function() {
				var validator = $recruitForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($recruitForm[0]); 
            		var method = $recruitDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			$.ajax({
    					    url: '${ctx}/api/service/talent/recruit/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$recruitDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$recruitTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('recruitId', $recruitDialog.data('recruitId'));
            			$.ajax({
    					    url: '${ctx}/api/service/talent/recruit/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$recruitDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$recruitTable.bootstrapTable('refresh'); 
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
		
		// 求职
		var $jobDialog = $('#modal-job-dialog');
		var $jobDetailDialog = $('#modal-job-detail-dialog');
		var $jobForm = $('#form-job');
		$k.util.bsValidator($jobForm);
		var $jobTable = $k.util.bsTable($page.find('#job-list-table'), {
			url: '${ctx}/api/service/talent/job/listByUserId?userId=' + userId,
			toolbar: '#job-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'intention',
            	title: '求职意向',
            	formatter: function(value, row, index) {
            		return '<a class="btn-job-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-job-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$jobDetailDialog.find('dd[data-name="' + key + '"]').text(val);
            			});
            			$jobDetailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'name',
            	title: '姓名',
            	align: 'center'
            }, {
            	field: 'sex',
            	title: '性别',
            	align: 'center'
            }, {
            	field: 'age',
            	title: '年龄',
            	align: 'center'
            }, {
            	field: 'profession',
            	title: '专业',
            	align: 'center'
            }, {
            	field: 'education',
            	title: '学历',
            	align: 'center'
            }, {
            	field: 'workingYears',
            	title: '工作年限',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $edit = '<a class="btn-job-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-job-delete a-operate">删除</a>';
            		return $edit + $delete;
            	},
            	events: window.operateEvents = {
            		'click .btn-job-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$jobForm.find('input[name="' + key + '"]').val(val);
            				$jobForm.find('textarea[name="' + key + '"]').val(val);
            				$jobForm.find('select[name="' + key + '"]').val(val);
            			});
            			$jobDialog.data('method', 'edit');
        				$jobDialog.data('jobId', row.id);
        				$jobDialog.modal('show');
            		},
            		'click .btn-job-delete': function(e, value, row, index) {
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
            					url: '${ctx}/api/service/talent/job/delete',
            					data: {
            						jobId: row.id
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
        	                        	toastr['success'](ret.msg);
        		                		$jobTable.bootstrapTable('refresh'); 
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
		$jobTable.on('all.bs.table', function(e, row) {
            var selNum = $jobTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-job-delete-batch').removeAttr('disabled') : $page.find('.btn-job-delete-batch').attr('disabled', 'disabled');
        });
		
		$jobDialog.on('click', '.btn-confirm', function() {
			var validator = $jobForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($jobForm[0]);
            	var method = $jobDialog.data('method');
            	if (method == 'add') {
            		formData.append('userId', userId);
            		$.ajax({
					    url: '${ctx}/api/service/talent/job/create',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$jobDialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$jobTable.bootstrapTable('refresh'); 
		                	} else {
		                		toastr['error'](ret.msg);
		                	}
		                },
		                error: function(err) {}
		            });
            	} else {
            		formData.append('jobId', $jobDialog.data('jobId'));
        			$.ajax({
					    url: '${ctx}/api/service/talent/job/update',
		            	type: 'post',
		            	data: formData,
		        		processData: false,
		                contentType: false,
		                cache: false, 
		                success: function(ret) {
		                	if (ret.code == 0) {
		                		$jobDialog.modal('hide');
		                		toastr['success'](ret.msg);
		                		$jobTable.bootstrapTable('refresh'); 
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
		.on('click', '.btn-talent-supplier', function() {
			window.location.href = '${ctx}/supplierApply?type=1';
		})
		.on('click', '.btn-recruit-add', function() {
			$recruitDialog.data('method', 'add');
			$recruitDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-recruit-dialog', function() {
            $recruitForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
        .on('click', '.btn-recruit-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $recruitTable.bootstrapTable('getSelections');
                
                $.ajax({
                    url: '${ctx}/api/service/talent/recruit/deleteBatch',
                    data: { 
                        recruitIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$recruitTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        })
        .on('click', '.btn-job-add', function() {
        	$jobDialog.data('method', 'add');
        	$jobDialog.modal('show');
        })
        .on('hidden.bs.modal', '#modal-job-dialog', function() {
            $jobForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
         .on('click', '.btn-job-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $jobTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/talent/job/deleteBatch',
                    data: { 
                        jobIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$jobTable.bootstrapTable('refresh'); 
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