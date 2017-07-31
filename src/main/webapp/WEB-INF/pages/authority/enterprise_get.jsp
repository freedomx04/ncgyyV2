<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${enterprise.name}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/iCheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/cropper/cropper.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/sitelogo/sitelogo.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-enterprise-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<c:if test="${source == 'admin'}">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-enterprise-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>企业列表</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${enterprise.name}</span>
	 		</div>
	 		</c:if>
	 		
	 		<div class="ibox-content">
 				<div class="tabs-container">
					<ul class="nav nav-tabs nav-tabs-line">
						<li class="active">
                        	<a data-toggle="tab" href="#enterprise-tab-info" data-option="enterprise" aria-expanded="true">
                        		<i class="fa fa-briefcase"></i>企业信息
                        	</a>
                    	</li>
                    	<li>
                        	<a data-toggle="tab" href="#enterprise-tab-product" data-option="product" aria-expanded="true">
                        		<i class="fa fa-gift"></i>企业产品
                        	</a>
                    	</li>
                    	<li>
                        	<a data-toggle="tab" href="#enterprise-tab-news" data-option="news" aria-expanded="true">
                        		<i class="fa fa-newspaper-o"></i>企业新闻
                        	</a>
                    	</li>
					</ul> 
					<div class="tab-content">
						<div id="enterprise-tab-info" class="tab-pane active">
							<div class="panel-body">
								<form class="form-horizontal" role="form" autocomplete="off" id="form-enterprise">
									<div class="form-group">
				                        <label for="avatar" class="col-sm-3 control-label">企业图标</label>
				                        <div id="crop-avatar" class="col-md-5">
				                            <div class="avatar-view disabled" title="点击修改企业图标" style="width: 160px; height: 160px;" disabled>
				                                <img src="${ctx}/api/avatar/${enterprise.avatar}" alt="企业图标">
				                            </div>
				                        </div>
				                    </div>
				                
				                    <div class="form-group">
				                        <label for="name" class="col-sm-3 control-label"><i class="form-required hide">*</i>企业名称</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="name" value="${enterprise.name}" required disabled>
				                        </div>
				                    </div>
			                    
				                    <div class="form-group">
				                        <label for="areaId" class="col-sm-3 control-label"><i class="form-required hide">*</i>所属园区</label>
				                        <div class="col-sm-5">
				                            <select class="form-control editable" name="areaId" required disabled> 
				                                <option value="">请选择</option>
				                                <c:forEach var="area" items="${areaList}">
				                                    <option value="${area.id}">${area.name}</option>
				                                </c:forEach> 
				                            </select>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="industryId" class="col-sm-3 control-label"><i class="form-required hide">*</i>行业类别</label>
				                        <div class="col-sm-5">
				                            <select class="form-control editable" name="industryId" required disabled> 
				                                <option value="">请选择</option>
				                                <c:forEach var="industry" items="${industryList}">
				                                    <option value="${industry.id}">${industry.name}</option>
				                                </c:forEach> 
				                            </select>
				                        </div>
				                    </div>
			                        
				                    <div class="form-group">
				                        <label for="mainProduct" class="col-sm-3 control-label"><i class="form-required hide">*</i>主要产品</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="mainProduct" value="${enterprise.mainProduct}" required disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="principal" class="col-sm-3 control-label"><i class="form-required hide">*</i>企业负责人</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="principal" value="${enterprise.principal}" required disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="telephone" class="col-sm-3 control-label"><i class="form-required hide">*</i>联系电话</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="telephone" value="${enterprise.telephone}" required disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="address" class="col-sm-3 control-label"><i class="form-required hide">*</i>企业地址</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="address" value="${enterprise.address}" required disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="pointStatus" class="col-sm-3 control-label">重点企业</label>
				                        <div class="col-sm-5">
				                            <label class="checkbox-inline i-checks pointStatus">
				                                <input type="checkbox" disabled>
				                            </label>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="productionTime" class="col-sm-3 control-label">投产时间</label>
				                        <div class="col-sm-5 input-group date productTime" style="padding-left: 15px; padding-right: 15px;">
				                            <span class="input-group-addon editable disabled"><i class="fa fa-calendar"></i></span>
				                            <input type="text" class="form-control editable" name="productionTime" value="${enterprise.productionTime}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="representative" class="col-sm-3 control-label">企业法人</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="representative" value="${enterprise.representative}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="shareholder" class="col-sm-3 control-label">主要股东</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="shareholder" value="${enterprise.shareholder}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="registeredCapital" class="col-sm-3 control-label">注册资金</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="registeredCapital" value="${enterprise.registeredCapital}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="alterRecording" class="col-sm-3 control-label">变更记录</label>
				                        <div class="col-sm-5">
				                            <textarea class="form-control editable" name="alterRecording" style="resize:none; height: 100px;" disabled>${enterprise.alterRecording}</textarea>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="nationalTax" class="col-sm-3 control-label">国税识别码</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="nationalTax" value="${enterprise.nationalTax}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="localTax" class="col-sm-3 control-label">地税识别码</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="localTax" value="${enterprise.localTax}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="introduction" class="col-sm-3 control-label">企业简介</label>
				                        <div class="col-sm-5">
				                            <textarea class="form-control editable" name="introduction" style="resize:none; height: 150px;" disabled>${enterprise.introduction}</textarea>
				                        </div>
				                    </div>
				                    
				                    <div class="hr-line-dashed"></div>
				                    
				                    <div class="form-group">
				                        <div class="col-sm-4 col-sm-offset-3">
				                        	<button type="button" class="btn btn-primary btn-enterprise-edit">
				                                <i class="fa fa-edit fa-fw"></i>编辑
				                            </button>
				                            <button type="button" class="btn btn-primary btn-enterprise-save hide">
				                                <i class="fa fa-save fa-fw"></i>保存
				                            </button>
				                            <button type="button" class="btn btn-white btn-enterprise-cancel hide">
				                                <i class="fa fa-close fa-fw"></i>取消
				                            </button>
				                        
				                        </div>
				                    </div>
								</form>
							</div>
						</div>
						
						<div id="enterprise-tab-product" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group hidden-xs" id="product-list-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-product-add">
				                        <i class="fa fa-plus fa-fw"></i>新增
				                    </button>
				                    <button type="button" class="btn btn-white btn-product-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>批量删除
				                    </button>
								</div>
								<table id="product-list-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="enterprise-tab-news" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group hidden-xs" id="news-list-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-news-add">
				                        <i class="fa fa-plus fa-fw"></i>新增
				                    </button>
				                    <button type="button" class="btn btn-white btn-news-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>批量删除
				                    </button>
								</div>
								<table id="news-list-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
 				</div>
	 		</div>
	 	</div>
	
		<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<form class="avatar-form" action="${ctx}/api/avatarUpload" enctype="multipart/form-data" method="post">
						<div class="modal-header">
							<button class="close" data-dismiss="modal" type="button">&times;</button>
							<h4 class="modal-title" id="avatar-modal-label">头像上传</h4>
						</div>
						<div class="modal-body">
							<div class="avatar-body">
								<div class="avatar-upload">
									<input class="avatar-src" name="avatar_src" type="hidden">
									<input class="avatar-data" name="avatar_data" type="hidden">
									<label for="avatarInput">图片上传</label> <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
								</div>
								<div class="row">
									<div class="col-md-9">
										<div class="avatar-wrapper"></div>
									</div>
									<div class="col-md-3">
										<div class="avatar-preview preview-lg"></div>
										<div class="avatar-preview preview-md"></div>
										<div class="avatar-preview preview-sm"></div>
									</div>
								</div>
								<div class="row avatar-btns">
									<div class="col-md-9">
										<div class="btn-group">
											<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees">
												<i class="fa fa-undo"></i> 向左旋转
											</button>
										</div>
										<div class="btn-group">
											<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees">
												<i class="fa fa-repeat"></i> 向右旋转
											</button>
										</div>
									</div>
									<div class="col-md-3">
										<button class="btn btn-primary btn-block avatar-save" type="submit">
											<i class="fa fa-save"></i> 保存修改
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
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
    <script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/cropper/cropper.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/sitelogo/sitelogo.js"></script>
     <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>

	<script type="text/javascript">
	
		var $page = $('.body-enterprise-detail');
		var source = '${source}';
		
		var option = Url.queryString('tab');
		if (!option) {
			option = 'enterprise';
		}
		$page.find('a[data-option="' + option + '"]').tab('show');
		
		// product
		var $productTable = $k.util.bsTable($page.find('#product-list-table'), {
			url: '${ctx}/api/product/listByEnterpriseId?enterpriseId=${enterprise.id}',
			toolbar: '#product-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'imagePath',
            	title: '产品图片',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return '<img style="max-width: 100px;" src="${ctx}' + value + '">';
            	}
            }, {
            	field: 'name',
            	title: '产品名称',
            	align: 'center'
            }, {
            	field: 'specification',
            	title: '规格参数',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-product-get a-operate">详情</a><a class="btn-product-edit a-operate">编辑</a><a class="btn-product-delete a-operate">删除</a>';
                },
                events: window.operateEvents = {
                	'click .btn-product-get': function(e, value, row, index) {
                		e.stopPropagation();
                		window.location.href= './productGet?productId=' + row.id;
                	},
                	'click .btn-product-edit': function(e, value, row, index) {
                		e.stopPropagation();
                		window.location.href= './productAdd?method=edit&productId=' + row.id;
                	},
                	'click .btn-product-delete': function(e, value, row, index) {
                		e.stopPropagation();
                		swal({
							title: '',
							text: '确定删除选中记录',
							type: 'warning',
							showCancelButton: true,
							cancelButtonText: '取消',
							confirmButtonColor: '#DD6B55',
							confirmButtonText: '确定',
							closeOnConfirm: false
						}, function() {
							var productId = row.id;
							
							$.ajax({
								url: '${ctx}/api/product/delete',
								data: { 
									productId: productId
								},
								success: function(ret) {
									if (ret.code == '0') {
										swal('', '删除成功!', 'success');
									} else {
										swal('', ret.msg, 'error');
									}
									$productTable.bootstrapTable('refresh'); 
								},
								error: function(err) {}
							});
						});
                	}
                }
            }]
		});
		
		$productTable.on('all.bs.table', function(e, row) {
            var selNum = $productTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-product-delete-batch').removeAttr('disabled') : $page.find('.btn-product-delete-batch').attr('disabled', 'disabled');
        });
		
		// news
		var $newsTable = $k.util.bsTable($page.find('#news-list-table'), {
			url: '${ctx}/api/news/list?enterpriseId=${enterprise.id}',
			toolbar: '#news-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'title',
            	title: '新闻标题',
            	align: 'center'
            }, {
            	field: 'updateTime',
            	title: '修改时间',
            	align: 'center',
            	formatter: formatDate2
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    return '<a class="btn-news-get a-operate">详情</a><a class="btn-news-edit a-operate">编辑</a><a class="btn-news-delete a-operate">删除</a>';
                },
                events: window.operateEvents = {
                	'click .btn-news-get': function(e, value, row, index) {
                		e.stopPropagation();
                		window.location.href = './newsGet?newsId=' + row.id;
                	},
                	'click .btn-news-edit': function(e, value, row, index) {
                		e.stopPropagation();
                		window.location.href= './newsAdd?method=edit&newsId=' + row.id;
                	},
                	'click .btn-news-delete': function(e, value, row, index) {
                		e.stopPropagation();
                		swal({
							title: '',
							text: '确定删除选中记录',
							type: 'warning',
							showCancelButton: true,
							cancelButtonText: '取消',
							confirmButtonColor: '#DD6B55',
							confirmButtonText: '确定',
							closeOnConfirm: false
						}, function() {
							$.ajax({
								url: '${ctx}/api/news/delete',
								data: { 
									newsId: row.id
								},
								success: function(ret) {
									if (ret.code == '0') {
										swal('', '删除成功!', 'success');
									} else {
										swal('', ret.msg, 'error');
									}
									$newsTable.bootstrapTable('refresh'); 
								},
								error: function(err) {}
							});
						});
                	}
                }
            }]
		});
		
		$newsTable.on('all.bs.table', function(e, row) {
            var selNum = $newsTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-news-delete-batch').removeAttr('disabled') : $page.find('.btn-news-delete-batch').attr('disabled', 'disabled');
        });
		
		// enterprise
		var $form = $page.find('#form-enterprise');
		$k.util.bsValidator($form);
        
        $form.find(".i-checks").iCheck({
            checkboxClass: "icheckbox_square-green", 
            radioClass: "iradio_square-green"
        });
        
        $form.find(".productTime").datepicker({
            autoclose: true
        });
		
		$form.find('select[name="areaId"]').val(${enterprise.area.id});
        $form.find('select[name="industryId"]').val(${enterprise.industry.id});
        var pointStatus = '${enterprise.pointStatus}';
        if (pointStatus == 1) {
            $form.find('.pointStatus').iCheck('check');
        }
		
		$page
		.on('click', 'a[data-toggle="tab"]', function() {
    		var option = $(this).data('option');
    		Url.updateSearchParam("tab", option);
    	})
		.on('click', '.btn-enterprise-back', function() {
			window.location.href = './enterpriseList';
		})
		.on('click', '.btn-enterprise-edit', function() {
			$form.find('.editable').removeAttr('disabled').removeClass('disabled');
			$form.find('.form-required').removeClass('hide');
			$form.find('.avatar-view').removeClass('disabled').removeAttr('disabled');
			
			if (source == 'admin') {
				var $icheck = $form.find('.i-checks');
				$icheck.find('div').removeClass('disabled');
				$icheck.find('input').removeAttr('disabled');
			}
			
			$form.find('.btn-enterprise-edit').addClass('hide');
			$form.find('.btn-enterprise-save, .btn-enterprise-cancel').removeClass('hide');
		})
		.on('click', '.btn-enterprise-save', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				formData.append('enterpriseId', '${enterprise.id}');
				formData.append('avatar', $k.util.getAvatar($form.find('.avatar-view > img')));
				var pointStatus = 0;
                if ($(".pointStatus input").is(':checked')) {
                    pointStatus = 1;
                }
                formData.append('pointStatus', pointStatus);
				
				$.ajax({
					url: '${ctx}/api/enterprise/update',
					type: 'post',
					data: formData,
                    processData: false,
                    contentType: false,
                    cache: false, 
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal({
                                title: '',
                                text: '编辑成功',
                                type: 'success'
                            }, function() {
                            	window.location.reload();
                            });
                        } else {
                            swal('', ret.msg, 'error');
                        }
                    },
                    error: function(err) {}
				});
			}
		})
		.on('click', '.btn-enterprise-cancel', function() {
			window.location.reload();
		})
		.on('click', '.btn-product-add', function() {
			window.location.href = './productAdd?method=add&enterpriseId=${enterprise.id}';
		})
		.on('click', '.btn-product-delete-batch', function() {
			swal({
				title: '',
				text: '确定批量删除选中记录',
				type: 'warning',
				showCancelButton: true,
				cancelButtonText: '取消',
				confirmButtonColor: '#DD6B55',
				confirmButtonText: '确定',
				closeOnConfirm: false
			}, function() {
				var rows = $productTable.bootstrapTable('getSelections');
				$.ajax({
					url: '${ctx}/api/product/batchDelete',
					data: {
						productIdList: $k.util.getIdList(rows) 
					},
					success: function(ret) {
						if (ret.code == '0') {
							swal('', '删除成功!', 'success');
						} else {
							swal('', ret.msg, 'error');
						}
						$productTable.bootstrapTable('refresh');
					},
					error: function(err) {}
				});
			});
		})
		.on('click', '.btn-news-add', function() {
			window.location.href = './newsAdd?method=add&enterpriseId=${enterprise.id}';
		})
		.on('click', '.btn-news-delete-batch', function() {
			swal({
				title: '',
				text: '确定批量删除选中记录',
				type: 'warning',
				showCancelButton: true,
				cancelButtonText: '取消',
				confirmButtonColor: '#DD6B55',
				confirmButtonText: '确定',
				closeOnConfirm: false
			}, function() {
				var rows = $newsTable.bootstrapTable('getSelections');
				$.ajax({
					url: '${ctx}/api/news/batchDelete',
					data: {
						newsIdList: $k.util.getIdList(rows) 
					},
					success: function(ret) {
						if (ret.code == '0') {
							swal('', '删除成功!', 'success');
						} else {
							swal('', ret.msg, 'error');
						}
						$newsTable.bootstrapTable('refresh');
					},
					error: function(err) {}
				});
			});
		});
		
	</script>
</body>

</html>