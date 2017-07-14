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

<body class="gray-bg body-email">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="tabs-container">
				<div class="col-sm-3">
					<div class="panel">
						<div class="panel-body">
							<div class="m-b">
								<button type="button" class="btn btn-primary btn-email-add" style="width: 100%;">写&nbsp;&nbsp;&nbsp;&nbsp;信</button>
							</div>
						
							<div class="tabs-left">
								<ul class="nav nav-tabs" style="width: 100%;">
									<li class="active">
										<a data-toggle="tab" href="#tab-1" aria-expanded="true"><i class="fa fa-inbox fa-fw"></i>收件箱
										<span class="label label-warning pull-right"></span></a>
									</li>
									<li>
			                            <a data-toggle="tab" href="#tab-2" aria-expanded="true"><i class="fa fa-star-o fa-fw"></i>重要邮件</a>
			                        </li>
			                        <li>
			                            <a data-toggle="tab" href="#tab-3" aria-expanded="true"><i class="fa fa-file-text-o fa-fw"></i>草稿箱</a>
			                        </li>
			                        <li>
			                        	<a data-toggle="tab" href="#tab-4" aria-expanded="true"><i class="fa fa-send-o fa-fw"></i>已发送</a>
			                        </li>
			                        <li>
			                        	<a data-toggle="tab" href="#tab-5" aria-expanded="true"><i class="fa fa-trash-o fa-fw"></i>已删除</a>
			                        </li>			                        
								</ul>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col-sm-9 animated fadeInRight">
					<div class="tab-content">
						<div class="tab-pane active" id="tab-1">
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
						
						<div class="tab-pane" id="tab-2">
							tab2
						</div>
						
						<div class="tab-pane" id="tab-3">
							tab3
						</div>
						
						<div class="tab-pane" id="tab-4">
							tab4
						</div>
						
						<div class="tab-pane" id="tab-5">
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
    	
    	var $page = $('.body-email');
    	
    	$page
    	.on('click', '.btn-email-add', function() {
    		window.location.href = './emailAdd?method=add';
    	});
    	
    })( jQuery );
    </script>
    
</body>