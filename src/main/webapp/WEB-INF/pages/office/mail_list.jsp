<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>邮箱</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.tabs-container .nav-tabs>li.active>a, 
	.tabs-container .nav-tabs>li.active>a:focus, 
	.tabs-container .nav-tabs>li.active>a:hover {
		background-color: #62a8ea;
		color: #fff;
	}
	.nav-tabs>li>a {
		color: #76838f;
	}
	</style>
	
</head>

<body class="gray-bg body-mail">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="tabs-container">
				<div class="col-sm-3">
					<div class="panel">
						<div class="panel-body">
							<div class="m-b">
								<button type="button" class="btn btn-primary btn-mail-add" style="width: 100%;">写&nbsp;&nbsp;&nbsp;&nbsp;信</button>
							</div>
						
							<div class="tabs-left">
								<ul class="nav nav-tabs" style="width: 100%;">
									<li class="active">
										<a data-toggle="tab" href="#mail-inbox" data-option="inbox" aria-expanded="true"><i class="fa fa-inbox fa-fw"></i>收件箱
										<span class="label label-warning pull-right"></span></a>
									</li>
									<li>
			                            <a data-toggle="tab" href="#mail-point" data-option="point" aria-expanded="true"><i class="fa fa-star-o fa-fw"></i>重要邮件</a>
			                        </li>
			                        <li>
			                            <a data-toggle="tab" href="#mail-draft" data-option="draft" aria-expanded="true"><i class="fa fa-file-text-o fa-fw"></i>草稿箱</a>
			                        </li>
			                        <li>
			                        	<a data-toggle="tab" href="#mail-send" data-option="send" aria-expanded="true"><i class="fa fa-send-o fa-fw"></i>已发送</a>
			                        </li>
			                        <li>
			                        	<a data-toggle="tab" href="#mail-delete" data-option="delete" aria-expanded="true"><i class="fa fa-trash-o fa-fw"></i>已删除</a>
			                        </li>			                        
								</ul>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col-sm-9 animated fadeInRight">
					<div class="tab-content">
						<div class="tab-pane active animated fadeInRight" id="mail-inbox">
							<div class="mail-box-header">
								<h2>收件箱(16)</h2>
								
								<div class="mail-tools m-t-md">
									<button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="" data-original-title="刷新邮件列表">
			                       		<i class="fa fa-refresh fa-fw"></i>刷新
			                   		</button>
								</div>
							</div>
							<div class="mail-box">
								<table class="table table-hover table-mail">
									<tbody>
										<tr>
											<td class="check-mail"></td>
											<td>孙某某</td>
											<td>阿萨德撒大所大撒多</td>
											<td><i class="fa fa-paperclip"></i></td>
											<td class="text-right mail-date">昨天 10:20</td>
										</tr>
										<tr>
											<td class="check-mail"></td>
											<td>孙某某</td>
											<td>阿萨德撒大所大撒多</td>
											<td><i class="fa fa-paperclip"></i></td>
											<td class="text-right mail-date">昨天 10:20</td>
										</tr>										
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-point">
							tab2
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-draft">
							<div class="mail-box-header">
								<h2>草稿箱</h2>
								<div class="hidden-xs" id="mail-draft-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-draft-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
									<button type="button" class="btn btn-white btn-draft-delete">
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>				                    
								</div>
								<table id="mail-draft-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-send">
							<div class="mail-box-header">
								<h2>已发送</h2>
								<div class="hidden-xs" id="mail-send-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-draft-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
									<button type="button" class="btn btn-white btn-draft-delete">
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>				                    
								</div>
								<table id="mail-send-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-delete">
							tab5
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
    <script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
    
    <script type="text/javascript">
    ;(function( $ ) {
    	
    	var $page = $('.body-mail');
    	//var userId = '${user.id}';
    	var userId = 9;
    	
    	var $inboxTable, $pointTable, $draftTable, $sendTable, $deleteTable;
    	
    	$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
    		var $this = $(this);
    		var option = $this.data('option');
    		switch (option) {
    		case 'inbox':
    			
    			break;
    		case 'point':
    			
    			break;
    		case 'draft':
    			$draftTable = $k.util.bsTable($page.find('#mail-draft-table'), {
    				url: '${ctx}/api/mail/listDraft?userId=' + userId,
    				cache: false,
     				toolbar: '#mail-draft-table-toolbar',
     				idField: 'id',
     				responseHandler: function(res) {
     	                return res.data;
     	            },
     				columns: [{
     					field: 'status',
     					checkbox: true
	   				}, {
	   					field: 'sender.username',
	   					title: '发件人',
	   					align: 'center',
	   					width: '160',
	   				}, {
	   					field: 'title',
	   					title: '主题',
	   					align: 'center',
	   					formatter: function(value, row, index) {
	   						return '<a class="mail-edit">' + value + '</a>';
	   					},
	   					events: window.operateEvents = {
   							'click .mail-edit': function(e, value, row, index) {
   								e.stopPropagation();
   								window.location.href = './mailAdd?method=edit&mailId=' + row.id;
   							}
	   					}
	   				}, {
	   					field: 'updateTime',
	   					title: '创建时间',
	   					align: 'center',
	   					width: '160',
	   					formatter: formatDate2
	   				}],
	   				showRefresh: false,
     				showColumns: false,
     				striped: false
     			  });
    			$draftTable.bootstrapTable('refresh');
    			break;
    		case 'send':
    			$sendTable = $k.util.bsTable($page.find('#mail-send-table'), {
    				url: '${ctx}/api/mail/listSend?userId=' + userId,
    				cache: false,
     				toolbar: '#mail-send-table-toolbar',
     				idField: 'id',
     				responseHandler: function(res) {
     	                return res.data;
     	            },
     				columns: [{
     					field: 'status',
     					checkbox: true
	   				}, {
	   					field: 'sender.username',
	   					title: '发件人',
	   					align: 'center',
	   					width: '160',
	   				}, {
	   					field: 'title',
	   					title: '主题',
	   					align: 'center',
	   					formatter: function(value, row, index) {
	   						return '<a class="mail-edit">' + value + '</a>';
	   					},
	   					events: window.operateEvents = {
   							'click .mail-edit': function(e, value, row, index) {
   								e.stopPropagation();
   								window.location.href = './mailAdd?method=edit&mailId=' + row.id;
   							}
	   					}
	   				}, {
	   					field: 'sendTime',
	   					title: '发送时间',
	   					align: 'center',
	   					width: '160',
	   					formatter: formatDate2
	   				}],
	   				showRefresh: false,
     				showColumns: false,
     				striped: false
     			  });
    			$draftTable.bootstrapTable('refresh');
    			break;
    		case 'delete':
    			
    			break;
    		}
    	});
    	
    	
    	$page
    	.on('click', '.btn-draft-refresh', function() {
    		$draftTable.bootstrapTable('refresh');
    	})
    	.on('click', '.btn-draft-delete', function() {
    		
    	});
    	
    	$page
    	.on('click', '.btn-mail-add', function() {
    		window.location.href = './mailAdd?method=add';
    	});
    	
    })( jQuery );
    </script>
    
</body>