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
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-enterprise-detail dt,
	.body-enterprise-detail dd {
		line-height: 2;
	}
	</style>
	
</head>

<body class="gray-bg body-enterprise-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-enterprise-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>企业列表</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${enterprise.name}</span>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<div class="tabs-container">
					<ul class="nav nav-tabs nav-tabs-line">
						<li class="active">
                        	<a data-toggle="tab" href="#enterprise-tab-info" aria-expanded="true"><i class="fa fa-briefcase"></i>企业信息</a>
                    	</li>
                    	<li>
                        	<a data-toggle="tab" href="#enterprise-tab-product" aria-expanded="true"><i class="fa fa-gift"></i>企业产品</a>
                    	</li>
                    	<li>
                        	<a data-toggle="tab" href="#enterprise-tab-news" aria-expanded="true"><i class="fa fa-newspaper-o"></i>企业新闻</a>
                    	</li>
					</ul> 
					<div class="tab-content">
						<div id="enterprise-tab-info" class="tab-pane active">
							<div class="panel-body">
								<div class="col-sm-7">
									<dl class="dl-horizontal">
										<dt>企业名称</dt><dd>${enterprise.name}</dd>
										<dt>所属园区</dt><dd>${enterprise.area.name}</dd>
										<dt>行业类别</dt><dd>${enterprise.industry.name}</dd>
										<dt>主要产品</dt><dd>${enterprise.mainProduct}</dd>
										<dt>企业负责人</dt><dd>${enterprise.principal}</dd>
										<dt>联系电话</dt><dd>${enterprise.telephone}</dd>
										<dt>企业地址</dt><dd>${enterprise.address}</dd>
										<dt>企业状态</dt><dd>重点</dd>
										<dt>投产时间</dt><dd>${enterprise.productionTime}</dd>
										<dt>企业法人</dt><dd>${enterprise.representative}</dd>
										<dt>主要股东</dt><dd>${enterprise.shareholder}</dd>
										<dt>注册资金</dt><dd>${enterprise.registeredCapital}</dd>
										<dt>变更记录</dt><dd>${enterprise.alterRecording}</dd>
										<dt>国税识别码</dt><dd>${enterprise.nationalTax}</dd>
										<dt>地税识别码</dt><dd>${enterprise.localTax}</dd>
									</dl>
								</div>
								<div class="col-sm-5 text-right">
									<img src="${ctx}/api/avatar/${enterprise.avatar}" style="max-width: 300px; padding: 20px;">
								</div>
								<div class="col-sm-12">
									<dl class="dl-horizontal">
										<dt>企业简介:</dt><dd>${enterprise.introduction}</dd>
									</dl>
								</div>
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
	
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<script type="text/javascript">
	
		var $page = $('.body-enterprise-detail');
		
		var $productTable = $k.util.bsTable($page.find('#product-list-table'), {
			url: '${ctx}/api/product/list?enterpriseId=${enterprise.id}',
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
		
		$page
		.on('click', '.btn-enterprise-back', function() {
			window.location.href = './enterpriseList';
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