<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>服务动态</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-power-dynamic">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#power-policy" data-tab="policy" aria-expanded="true">用电政策</a>
						</li>
						<li>
							<a data-toggle="tab" href="#power-cut" data-tab="cut" aria-expanded="false">停电信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#power-announce" data-tab="announce" aria-expanded="false">线上服务</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="power-policy" class="tab-pane active">
							<div class="panel-body">
								<div class="btn-group" id="policy-table-toolbar" role="group">
				 					<button type="button" class="btn btn-white btn-article-add">
				 						<i class="fa fa-plus fa-fw"></i>新增
				 					</button>
				 					<button type="button" class="btn btn-danger btn-article-delete-batch" disabled='disabled'>
				 						<i class="fa fa-trash-o fa-fw"></i>删除
				 					</button>
				 				</div>
				 				<table id="policy-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="power-cut" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="cut-table-toolbar" role="group">
				 					<button type="button" class="btn btn-white btn-article-add">
				 						<i class="fa fa-plus fa-fw"></i>新增
				 					</button>
				 					<button type="button" class="btn btn-danger btn-article-delete-batch" disabled='disabled'>
				 						<i class="fa fa-trash-o fa-fw"></i>删除
				 					</button>
				 				</div>
				 				<table id="cut-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="power-announce" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="announce-table-toolbar" role="group">
				 					<button type="button" class="btn btn-white btn-article-add">
				 						<i class="fa fa-plus fa-fw"></i>新增
				 					</button>
				 					<button type="button" class="btn btn-danger btn-article-delete-batch" disabled='disabled'>
				 						<i class="fa fa-trash-o fa-fw"></i>删除
				 					</button>
				 				</div>
				 				<table id="announce-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
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
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
    
    <script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-power-dynamic');
		
		var tab = Url.queryString('tab');
		if (!tab) {
			tab = 'policy';
		}
		$page.find('a[data-tab="' + tab + '"]').tab('show');
		initTable(tab);
		
		var $table, $toolbar, type, $bsTable;
		function initTable(tab) {
			switch (tab) {
			case 'policy':
				type = 40;
				$table = $page.find('#policy-table');
                $toolbar = $page.find('#policy-table-toolbar');
				break;
			case 'cut':
				type = 41;
				$table = $page.find('#cut-table');
                $toolbar = $page.find('#cut-table-toolbar');
				break;
			case 'announce':
				type = 42;
				$table = $page.find('#announce-table');
                $toolbar = $page.find('#announce-table-toolbar');
				break;
			}
			
			$bsTable = $k.util.bsTable($table, {
				url: '${ctx}/api/website/article/list?type=' + type,
				toolbar: $toolbar,
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns: [{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'title',
	            	title: '标题',
	            	formatter: function(value, row, index) {
	                    return '<a class="btn-article-detail">' + value + '</a>';
	                },
	                events: window.operateEvents = {
	                    'click .btn-article-detail': function(e, value, row, index) {
	                        e.stopPropagation();
	                        window.location.href = '${ctx}/website/article/get?articleId=' + row.id;
	                    },
	                }
	            }, {
	                field: 'updateTime',
	                title: '修改时间',
	                align: 'center',
	                width: '150',
	                formatter: formatDate2
	            }, {
	            	title: '操作',
	                align: 'center',
	                width: '120',
	                formatter: function(value, row,  index) {
	                    var $edit = '<a class="btn-article-edit a-operate">编辑</a>';
	                    var $delete = '<a class="btn-article-delete a-operate">删除</a>';
	                    return $edit + $delete;
	                },
	                events: window.operateEvents = {
	                    'click .btn-article-edit': function(e, value, row, index) {
	                        e.stopPropagation();
	                        window.location.href = '${ctx}/website/article/add?type=' + type + '&method=edit&articleId=' + row.id;
	                    },
	                    'click .btn-article-delete': function(e, value, row, index) {
	                        e.stopPropagation();
	                        swal({
	                            title: '',
	                            text: '确定删除选中记录',
	                            type: 'warning',
	                            showCancelButton: true,
	                            cancelButtonText: '取消',
	                            confirmButtonColor: '#DD6B55',
	                            confirmButtonText: '确定'
	                        }, function() {
	                            var articleId = row.id;
	                            $.ajax({
	                                url: '${ctx}/api/website/article/delete',
	                                data: { 
	                                    articleId: articleId
	                                },
	                                success: function(ret) {
	                                    if (ret.code == 0) {
	                                        toastr['success'](ret.msg);
	                                        $bsTable.bootstrapTable('refresh');
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
		 	$bsTable.on('all.bs.table', function(e, row) {
                var selNum = $table.bootstrapTable('getSelections').length;
                selNum > 0 ? $page.find('.btn-article-delete-batch').removeAttr('disabled') : $page.find('.btn-article-delete-batch').attr('disabled', 'disabled');
            });
		}
		
		$page
    	.on('click', 'a[data-toggle="tab"]', function() {
    		var tab = $(this).data('tab');
    		Url.updateSearchParam('tab', tab);
    		initTable(tab);
    	})
    	.on('click', '.btn-article-add', function() {
    		window.location.href = '${ctx}/website/article/add?method=add&type=' + type;
    	})
    	.on('click', '.btn-article-delete-batch', function() {
			swal({
				title: '',
				text: '确定批量删除选中记录',
				type: 'warning',
				showCancelButton: true,
				cancelButtonText: '取消',
				confirmButtonColor: '#DD6B55',
				confirmButtonText: '确定'
			}, function() {
				var rows = $table.bootstrapTable('getSelections');
				$.ajax({
					url: '${ctx}/api/website/article/batchDelete',
					data: {
						articleIdList: $k.util.getIdList(rows) 
					},
					success: function(ret) {
						if (ret.code == 0) {
                        	toastr['success'](ret.msg);
                        	$bsTable.bootstrapTable('refresh');
						} else {
							toastr['error'](ret.msg);
                        }
					},
					error: function(err) {}
				});
			});
		})
		
	}) ( jQuery );
	</script>
	
</body>
</html>