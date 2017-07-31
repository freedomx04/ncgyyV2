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
	.body-mail th,
	.body-mail td {
		border-left: none!important;
		border-right: none!important;
	}
	.body-mail .mail-unread {
		font-weight: 700;
	}
	.body-mail .point,
	.body-mail .unpoint {
		cursor: pointer;
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
										<a data-toggle="tab" href="#mail-inbox" data-option="inbox" aria-expanded="true">
											<i class="fa fa-inbox fa-fw"></i>收件箱
											<span class="label label-warning pull-right mail-inbox-unread"></span>
										</a>
									</li>
									<li>
			                            <a data-toggle="tab" href="#mail-point" data-option="point" aria-expanded="true">
			                            	<i class="fa fa-star fa-fw"></i>星标邮件
			                            	<span class="label label-warning pull-right mail-point-unread"></span>
			                            </a>
			                        </li>
			                        <li>
			                            <a data-toggle="tab" href="#mail-draft" data-option="draft" aria-expanded="true"><i class="fa fa-file-text-o fa-fw"></i>草稿箱</a>
			                        </li>
			                        <li>
			                        	<a data-toggle="tab" href="#mail-send" data-option="send" aria-expanded="true"><i class="fa fa-send-o fa-fw"></i>已发送</a>
			                        </li>
			                        <li>
			                        	<a data-toggle="tab" href="#mail-delete" data-option="delete" aria-expanded="true">
			                        		<i class="fa fa-trash-o fa-fw"></i>已删除
			                        		<span class="label label-warning pull-right mail-delete-unread"></span>
			                        	</a>
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
								<h2>收件箱</h2>
								<div class="hidden-xs" id="mail-inbox-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-sm btn-mail-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
				                    <button type="button" class="btn btn-white btn-sm btn-mail-point" disabled='disabled'>
				                        <i class="fa fa-star fa-fw"></i>标记星标
				                    </button>
				                    <button type="button" class="btn btn-white btn-sm btn-mail-unpoint" disabled='disabled'>
				                        <i class="fa fa-star-o fa-fw"></i>取消星标
				                    </button>
									<button type="button" class="btn btn-white btn-sm btn-mail-delete" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>				                    
								</div>
								<table id="mail-inbox-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-point">
							<div class="mail-box-header">
								<h2>收件箱</h2>
								<div class="hidden-xs" id="mail-point-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-sm btn-mail-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
				                    <button type="button" class="btn btn-white btn-sm btn-mail-unpoint" disabled='disabled'>
				                        <i class="fa fa-star-o fa-fw"></i>取消星标
				                    </button>
									<button type="button" class="btn btn-white btn-sm btn-mail-delete" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>				                    
								</div>
								<table id="mail-point-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-draft">
							<div class="mail-box-header">
								<h2>草稿箱</h2>
								<div class="hidden-xs" id="mail-draft-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-sm btn-mail-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
									<button type="button" class="btn btn-white btn-sm btn-mail-delete" disabled='disabled'>
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
									<button type="button" class="btn btn-white btn-sm btn-mail-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
									<button type="button" class="btn btn-white btn-sm btn-mail-delete" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>				                    
								</div>
								<table id="mail-send-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div class="tab-pane animated fadeInRight" id="mail-delete">
							<div class="mail-box-header">
								<h2>已删除</h2>
								<div class="hidden-xs" id="mail-delete-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-sm btn-mail-refresh">
				                        <i class="fa fa-refresh fa-fw"></i>刷新
				                    </button>
				                    <button type="button" class="btn btn-white btn-sm btn-mail-recovery">
				                        <i class="fa fa-repeat fa-fw"></i>恢复
				                    </button>
									<button type="button" class="btn btn-white btn-sm btn-mail-deleteCompletely" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>彻底删除
				                    </button>				                    
								</div>
								<table id="mail-delete-table" class="table-hm" data-mobile-responsive="true"></table>
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
    <script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	
    <script type="text/javascript">
    ;(function( $ ) {
    	
    	var $page = $('.body-mail');
    	var userId = '${user.id}';
    	
    	var $inbox = $page.find('#mail-inbox');
    	var $point = $page.find('#mail-point');
    	var $draft = $page.find('#mail-draft');
    	var $send = $page.find('#mail-send');
    	var $delete = $page.find('#mail-delete');
    	var $inboxTable, $pointTable, $draftTable, $sendTable, $deleteTable;
    	
    	var option = Url.queryString('tab');
    	if (!option) {
    		option = 'inbox';
    	}
    	$page.find('a[data-option="' + option + '"]').tab('show');
    	initTable(option);
    	refreshUnread();
    	
    	function initTable(option) {
    		switch (option) {
    		case 'inbox':
    			$inboxTable = $k.util.bsTable($page.find('#mail-inbox-table'), {
        			url: '${ctx}/api/mail/listInbox?userId=' + userId,
        			toolbar: '#mail-inbox-table-toolbar',
        			idField: 'id',
        			responseHandler: function(res) {
     	                return res.data;
     	            },
     	            columns: [{
     	            	field: 'status',
     	            	checkbox: true,
     	            	width: '36',
     	            }, {
     	            	field: 'readStatus',
     	            	width: '16',
     	            	formatter: function(value, row, index) {
     	            		return value == 0 ? '<i class="fa fa-envelope" title="未读"></i>' : '';
     	            	}
     	            }, {
     	            	field: 'sender.username',
     	            	title: '发件人',
     	            	width: '120',
     	            	formatter: function(value, row, index) {
     	            		return row.readStatus == 0 ? '<span class="mail-unread">' + value + '</span>' : value; 
     	            	}
     	            }, {
     	            	field: 'pointStatus',
     	            	width: '16',
     	            	formatter: function(value, row, index) {
     	            		return value == 0 ? '<i class="fa fa-star-o fa-fw point" title="标记星标"></i>' : '<i class="fa fa-star fa-fw unpoint" title="取消星标"></i>';
     	            	}
     	            }, {
     	            	field: 'title',
     	            	title: '主题',
     	            	formatter: function(value, row, index) {
     	            		return row.readStatus == 0 
     	            			? '<a class="mail-unread" href="./mailGet?mailId=' + row.id + '">' + value + '</a>'
     	            			: '<a href="./mailGet?mailId=' + row.id + '">' + value + '</a>';
     	            	}
     	            }, {
     	            	field: 'fileList',
     	            	width: '16',
     	            	formatter: function(value, row, index) {
     	            		return value.length > 0 ? '<i class="fa fa-paperclip" title="附件"></i>' : '';
     	            	}
     	            }, {
     	            	field: 'sendTime',
     	            	title: '时间',
     	            	width: '100',
     	            	formatter: formatDate,
     	            }],
     	            showRefresh: false,
     	            showColumns: false,
     	            clickToSelect: false
        		});
        		$inboxTable.bootstrapTable('refresh');
        		
        		$inboxTable.on('all.bs.table', function(e, row) {
                    var selNum = $inboxTable.bootstrapTable('getSelections').length;
                    selNum > 0 ? $inbox.find('.btn-mail-point').removeAttr('disabled') : $inbox.find('.btn-mail-point').attr('disabled', 'disabled');
                    selNum > 0 ? $inbox.find('.btn-mail-unpoint').removeAttr('disabled') : $inbox.find('.btn-mail-unpoint').attr('disabled', 'disabled');
                    selNum > 0 ? $inbox.find('.btn-mail-delete').removeAttr('disabled') : $inbox.find('.btn-mail-delete').attr('disabled', 'disabled');
                });
    			break;
    		case 'point':
    			$pointTable = $k.util.bsTable($page.find('#mail-point-table'), {
    				url: '${ctx}/api/mail/listPoint?userId=' + userId,
     				toolbar: '#mail-point-table-toolbar',
     				idField: 'id',
     				responseHandler: function(res) {
     	                return res.data;
     	            },
     				columns: [{
     					field: 'status',
     					checkbox: true
	   				}, {
     	            	field: 'readStatus',
     	            	width: '16',
     	            	formatter: function(value, row, index) {
     	            		return value == 0 ? '<i class="fa fa-envelope" title="未读"></i>' : '';
     	            	}
     	            }, {
	   					field: 'sender.username',
	   					title: '发件人',
	   					width: '120',
	   					formatter: function(value, row, index) {
     	            		return row.readStatus == 0 ? '<span class="mail-unread">' + value + '</span>' : value; 
     	            	}
	   				}, {
	 	            	field: 'pointStatus',
	 	            	width: '16',
	 	            	formatter: function(value, row, index) {
	 	            		return value == 0 ? '<i class="fa fa-star-o fa-fw point" title="标记星标"></i>' : '<i class="fa fa-star fa-fw unpoint" title="取消星标"></i>';
	 	            	}
	 	            },{
	   					field: 'title',
	   					title: '主题',
	   					formatter: function(value, row, index) {
	   						return row.readStatus == 0 
 	            				? '<a class="mail-unread" href="./mailGet?mailId=' + row.id + '">' + value + '</a>'
 	            				: '<a href="./mailGet?mailId=' + row.id + '">' + value + '</a>';
	 	            	}
	   				}, {
	 	            	field: 'fileList',
	 	            	width: '16',
	 	            	formatter: function(value, row, index) {
	 	            		return value.length > 0 ? '<i class="fa fa-paperclip" title="附件"></i>' : '';
	 	            	}
	 	            }, {
	   					field: 'sendTime',
	   					title: '时间',
	   					width: '100',
	   					formatter: formatDate,
	   				}],
	   				showRefresh: false,
     				showColumns: false,
     				clickToSelect: false
     			  });
    			$pointTable.bootstrapTable('refresh');
    			
    			$pointTable.on('all.bs.table', function(e, row) {
    	            var selNum = $pointTable.bootstrapTable('getSelections').length;
    	            selNum > 0 ? $point.find('.btn-mail-unpoint').removeAttr('disabled') : $point.find('.btn-mail-unpoint').attr('disabled', 'disabled');
    	            selNum > 0 ? $point.find('.btn-mail-delete').removeAttr('disabled') : $point.find('.btn-mail-delete').attr('disabled', 'disabled');
    	        });
    			break;
    		case 'draft':
    			$draftTable = $k.util.bsTable($page.find('#mail-draft-table'), {
    				url: '${ctx}/api/mail/listDraft?userId=' + userId,
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
	   					width: '120',
	   				}, {
	   					field: 'title',
	   					title: '主题',
	   					formatter: function(value, row, index) {
	 	            		return '<a href="./mailAdd?method=edit&mailId=' + row.id + '">' + value + '</a>';
	 	            	}
	   				}, {
	 	            	field: 'fileList',
	 	            	width: '16',
	 	            	formatter: function(value, row, index) {
	 	            		return value.length > 0 ? '<i class="fa fa-paperclip" title="附件"></i>' : '';
	 	            	}
	 	            }, {
	   					field: 'updateTime',
	   					title: '时间',
	   					width: '120',
	   					formatter: formatDate,
	   				}],
	   				showRefresh: false,
     				showColumns: false,
     				clickToSelect: false
     			  });
    			$draftTable.bootstrapTable('refresh');
    			
    			$draftTable.on('all.bs.table', function(e, row) {
    	            var selNum = $draftTable.bootstrapTable('getSelections').length;
    	            selNum > 0 ? $draft.find('.btn-mail-delete').removeAttr('disabled') : $draft.find('.btn-mail-delete').attr('disabled', 'disabled');
    	        });
    			break;
    		case 'send':
    			$sendTable = $k.util.bsTable($page.find('#mail-send-table'), {
    				url: '${ctx}/api/mail/listSend?userId=' + userId,
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
	   					width: '120',
	   				}, {
	   					field: 'title',
	   					title: '主题',
	   					formatter: function(value, row, index) {
	 	            		return '<a href="./mailGet?mailId=' + row.id + '">' + value + '</a>';
	 	            	}
	   				}, {
	 	            	field: 'fileList',
	 	            	width: '16',
	 	            	formatter: function(value, row, index) {
	 	            		return value.length > 0 ? '<i class="fa fa-paperclip" title="附件"></i>' : '';
	 	            	}
	 	            }, {
	   					field: 'sendTime',
	   					title: '时间',
	   					width: '120',
	   					formatter: formatDate,
	   				}],
	   				showRefresh: false,
     				showColumns: false,
     				clickToSelect: false
     			  });
    			$sendTable.bootstrapTable('refresh');
    			
    			$sendTable.on('all.bs.table', function(e, row) {
    	            var selNum = $sendTable.bootstrapTable('getSelections').length;
    	            selNum > 0 ? $send.find('.btn-mail-delete').removeAttr('disabled') : $send.find('.btn-mail-delete').attr('disabled', 'disabled');
    	        });
    			break;
    		case 'delete':
    			$deleteTable = $k.util.bsTable($page.find('#mail-delete-table'), {
    				url: '${ctx}/api/mail/listDelete?userId=' + userId,
     				toolbar: '#mail-delete-table-toolbar',
     				idField: 'id',
     				responseHandler: function(res) {
     	                return res.data;
     	            },
     				columns: [{
     					field: 'status',
     					checkbox: true
	   				}, {
     	            	field: 'readStatus',
     	            	width: '16',
     	            	formatter: function(value, row, index) {
     	            		return value == 0 ? '<i class="fa fa-envelope" title="未读"></i>' : '';
     	            	}
     	            }, {
	   					field: 'sender.username',
	   					title: '发件人',
	   					width: '120',
	   				}, {
	   					field: 'title',
	   					title: '主题',
	   					formatter: function(value, row, index) {
	 	            		return '<a href="./mailGet?mailId=' + row.id + '">' + value + '</a>';
	 	            	}
	   				}, {
	 	            	field: 'fileList',
	 	            	width: '16',
	 	            	formatter: function(value, row, index) {
	 	            		return value.length > 0 ? '<i class="fa fa-paperclip" title="附件"></i>' : '';
	 	            	}
	 	            }, {
	   					field: 'updateTime',
	   					title: '时间',
	   					width: '100',
	   					formatter: formatDate,
	   				}, {
	   					field: 'mailStatus',
	   					title: '',
	   					width: '70',
	   					formatter: function(value, row, index) {
	   						switch (value) {
	   						case 1:
	   							return '<span class="label label-warning">草稿箱</span>';
	   						case 2: 
	   							return '<span class="label label-primary">已发送</span>';
	   						case 3:
	   							return '<span class="label label-info">收件箱</span>';
	   						}
	   					}
	   				}],
	   				showRefresh: false,
     				showColumns: false,
     				clickToSelect: false
     			  });
    			$deleteTable.bootstrapTable('refresh');
    			
    			$deleteTable.on('all.bs.table', function(e, row) {
    	            var selNum = $deleteTable.bootstrapTable('getSelections').length;
    			 	selNum > 0 ? $delete.find('.btn-mail-recovery').removeAttr('disabled') : $delete.find('.btn-mail-recovery').attr('disabled', 'disabled');
    	            selNum > 0 ? $delete.find('.btn-mail-deleteCompletely').removeAttr('disabled') : $delete.find('.btn-mail-deleteCompletely').attr('disabled', 'disabled');
    	        }); 
    			break;
    		default:
    			break;
    		}
    	}
    	
    	function refreshUnread() {
    		$.ajax({
    			url: '${ctx}/api/mail/unread',
    			data: {
    				userId: userId
    			},
    			cache: false,
    			success: function(ret) {
    				var arr = ret.data;
    				arr[0] > 0 ? $page.find('.mail-inbox-unread').html(arr[0]) : $page.find('.mail-inbox-unread').empty();
    				arr[1] > 0 ? $page.find('.mail-point-unread').html(arr[1]) : $page.find('.mail-point-unread').empty();
    				arr[2] > 0 ? $page.find('.mail-delete-unread').html(arr[2]) : $page.find('.mail-delete-unread').empty();
    			},
    			error: function(err) {}
    		});
    	}
    	
    	$page
    	.on('click', 'a[data-toggle="tab"]', function() {
    		var option = $(this).data('option');
    		Url.updateSearchParam("tab", option);
    		initTable(option);
    	})
    	.on('click', '.btn-mail-add', function() {
    		window.location.href = './mailAdd?method=add';
    	})
    	.on('click', '.btn-mail-refresh', function() {
    		var $table = $(this).closest('.mail-box-header').find('.table-hm');
    		$table.bootstrapTable('refresh');
    	})
    	.on('click', '.btn-mail-delete', function() {
    		var $table = $(this).closest('.mail-box-header').find('.table-hm');
    		swal({
                title: '',
                text: '确定删除邮件吗？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/mail/delete',
                    data: { 
                        mailIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '删除成功!', 'success');
                            $table.bootstrapTable('refresh');
                            refreshUnread();
						} else {
                            swal('', ret.msg, 'error');
                        }
                    },
                    error: function(err) {}
                });
            });
    	})
    	.on('click', '.btn-mail-deleteCompletely', function() {
    		swal({
                title: '',
                text: '确定彻底删除邮件吗？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
                var rows = $deleteTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/mail/deleteCompletely',
                    data: { 
                        mailIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '删除成功!', 'success');
                            $deleteTable.bootstrapTable('refresh');
                            refreshUnread();
						} else {
                            swal('', ret.msg, 'error');
                        }
                    },
                    error: function(err) {}
                });
            });
    	})
    	.on('click', '.btn-mail-point', function() {
    		var $this = $(this);
    		swal({
                title: '',
                text: '标记为重要邮件？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
            	var $table = $this.closest('.mail-box-header').find('.table-hm');
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/mail/point',
                    data: { 
                        mailIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '标记成功!', 'success');
                            $table.bootstrapTable('refresh'); 
                            refreshUnread();
						} else {
                            swal('', ret.msg, 'error');
                        }
                    },
                    error: function(err) {}
                });
            });
    	})
    	.on('click', '.btn-mail-unpoint', function() {
    		var $this = $(this);
    		swal({
                title: '',
                text: '取消标记重要邮件？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
            	var $table = $this.closest('.mail-box-header').find('.table-hm');
                var rows = $table.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/mail/unpoint',
                    data: { 
                        mailIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '取消标记成功!', 'success');
                            $table.bootstrapTable('refresh'); 
                            refreshUnread();
						} else {
                            swal('', ret.msg, 'error');
                        }
                    },
                    error: function(err) {}
                });
            });
    	})
    	.on('click', '.point', function(e) {
   			e.stopPropagation();
   			var $this = $(this);
   			var mailId = $this.closest('tr').find('input').val();
   			var mailIdList = [mailId];
   			$.ajax({
   				url: '${ctx}/api/mail/point',
   				data: { mailIdList: mailIdList },
                success: function(ret) {
                	if (ret.code == 0) {
                		$this.removeClass('fa-star-o').addClass('fa-star');
                		$this.removeClass('point').addClass('unpoint');
                		refreshUnread();
                    }
                },
                error: function(err) {}
   			});
   		})
   		.on('click', '.unpoint', function(e) {
   			e.stopPropagation();
   			var $this = $(this);
   			var mailId = $this.closest('tr').find('input').val();
   			var mailIdList = [mailId];
   			$.ajax({
   				url: '${ctx}/api/mail/unpoint',
   				data: { mailIdList: mailIdList },
   				success: function(ret) {
   					if (ret.code == 0) {
   						$this.removeClass('fa-star').addClass('fa-star-o');
                       	$this.removeClass('unpoint').addClass('point');
                       	refreshUnread();
                    }
                },
                error: function(err) {}
   			});
   		})
   		.on('click', '.btn-mail-recovery', function() {
   			swal({
                title: '',
                text: '确定恢复选中的删除邮件吗？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
                var rows = $deleteTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/mail/recovery',
                    data: { 
                        mailIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal('', '恢复成功!', 'success');
                            $deleteTable.bootstrapTable('refresh'); 
                            refreshUnread();
						} else {
                            swal('', ret.msg, 'error');
                        }
                    },
                    error: function(err) {}
                });
            });
   		});
    	
    })( jQuery );
    </script>
    
</body>