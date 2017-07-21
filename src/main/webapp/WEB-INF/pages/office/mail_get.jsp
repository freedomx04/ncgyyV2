<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	
</head>

<body class="gray-bg body-mail-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="mail-box-header">
			<div class="pull-right">
				<button type="button" class="btn btn-white btn-sm btn-mail-back">
					<i class="fa fa-chevron-left fa-fw"></i>返回
				</button>
				<c:if test="${mail.mailStatus == 3}">
					<c:if test="${mail.pointStatus == 0}">
						<button type="button" class="btn btn-white btn-sm btn-mail-point">
							<i class="fa fa-star-o fa-fw"></i>标记星标
						</button>
					</c:if>
					<c:if test="${mail.pointStatus == 1}">
						<button type="button" class="btn btn-white btn-sm btn-mail-unpoint">
							<i class="fa fa-star fa-fw"></i>取消星标
						</button>
					</c:if>
				</c:if>
				
				<c:if test="${mail.deleteStatus == 0}">
					<button type="button" class="btn btn-white btn-sm btn-mail-delete">
						<i class="fa fa-trash-o fa-fw"></i>删除
					</button>
				</c:if>
				<c:if test="${mail.deleteStatus == 1}">
					<button type="button" class="btn btn-white btn-sm btn-mail-deleteCompletely">
						<i class="fa fa-trash-o fa-fw"></i>彻底删除
					</button>
				</c:if>
			</div>
			
			<h2>${mail.title}</h2>
			<div class="">
				<table style="color: #999;">
					<tr>
						<td>发件人：</td>
						<td style="color: #3d882d;">${mail.sender.username}</td>
					</tr>
					<tr>
						<td>时&nbsp;&nbsp;&nbsp;间：</td>
						<td><fmt:formatDate value="${mail.updateTime}" pattern="yyyy年MM月dd日 HH:mm (E)"/></td>
					</tr>
					<tr>
						<td>收件人：</td>
						<c:if test="${mail.mailStatus == 2}">
							<td style="color: #0F6099;">${mail.receivers}</td>
						</c:if>
						<c:if test="${mail.mailStatus == 3}">
							<td style="color: #0F6099;">${mail.receiver.username}</td>
						</c:if>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="mail-box">
			<div class="mail-body">
				${mail.content}
			</div>
			
			<c:if test="${fn:length(mail.fileList) > 0}">
			<div class="mail-attachment">
				<p style="font-size: 14px;">
					<i class="fa fa-paperclip fa-fw"></i>
					<strong>附件</strong>
					<span style="color: #999;">(${fn:length(mail.fileList)})</span>
					<!-- <span>&nbsp;-&nbsp;</span>
					<a>打包下载</a> -->
				</p>
				
				<div class="attachment">
					<c:forEach var="file" items="${mail.fileList}">
						<c:if test="${file.fileIcon == 'fa-file-image-o'}">
							<div class="file-box">
								<div class="file">
									<a href="${ctx}/api/downloadFile?filename=${file.filename}&filepath=${file.filepath}">
										<span class="corner"></span>
										<div class="image">
											<img alt="image" class="img-responsive" src="${ctx}${file.filepath}">
										</div>
										<div class="file-name text-center">${file.filename}</div>
									</a>
								</div>
							</div>
						</c:if>
						<c:if test="${file.fileIcon != 'fa-file-image-o'}">
							<div class="file-box">
								<div class="file">
									<a href="${ctx}/api/downloadFile?filename=${file.filename}&filepath=${file.filepath}">
										<span class="corner"></span>
										<div class="icon"><i class="fa ${file.fileIcon}"></i></div>
										<div class="file-name text-center">${file.filename}</div>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<div class="clearfix"></div>
				</div>
			</div>
			</c:if>
			
			<div class="mail-body">
				<button type="button" class="btn btn-white btn-sm btn-mail-back">
					<i class="fa fa-chevron-left fa-fw"></i>返回
				</button>
				<c:if test="${mail.mailStatus == 3}">
					<c:if test="${mail.pointStatus == 0}">
						<button type="button" class="btn btn-white btn-sm btn-mail-point">
							<i class="fa fa-star-o fa-fw"></i>标记星标
						</button>
					</c:if>
					<c:if test="${mail.pointStatus == 1}">
						<button type="button" class="btn btn-white btn-sm btn-mail-unpoint">
							<i class="fa fa-star fa-fw"></i>取消星标
						</button>
					</c:if>
				</c:if>
				
				<c:if test="${mail.deleteStatus == 0}">
					<button type="button" class="btn btn-white btn-sm btn-mail-delete">
						<i class="fa fa-trash-o fa-fw"></i>删除
					</button>
				</c:if>
				<c:if test="${mail.deleteStatus == 1}">
					<button type="button" class="btn btn-white btn-sm btn-mail-deleteCompletely">
						<i class="fa fa-trash-o fa-fw"></i>彻底删除
					</button>
				</c:if>
			</div>
			
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-mail-detail');
		var mailId = '${mail.id}';
		
		$page
		.on('click', '.btn-mail-back', function() {
			window.history.back();
		})
		.on('click', '.btn-mail-delete', function() {
			swal({
                title: '',
                text: '确定删除该邮件吗？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
            	var mailIdList = [mailId];
                $.ajax({
                    url: '${ctx}/api/mail/delete',
                    data: { mailIdList: mailIdList },
                    success: function(ret) {
                        if (ret.code == 0) {
                            swal({
                            	title: '',
                            	text: '删除成功!',
                            	type: 'success'
                            }, function() {
                            	window.history.back();
                            });
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
                text: '确定彻底删除该邮件吗？',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
                closeOnConfirm: false
            }, function() {
            	var mailIdList = [mailId];
                $.ajax({
                    url: '${ctx}/api/mail/deleteCompletely',
                    data: { mailIdList: mailIdList },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	swal({
                            	title: '',
                            	text: '删除成功!',
                            	type: 'success'
                            }, function() {
                            	window.history.back();
                            });
                        }
                    },
                    error: function(err) {}
                });
            });
    	})
		.on('click', '.btn-mail-point', function() {
			var $this = $(this);
			var mailIdList = [mailId];
			$.ajax({
				url: '${ctx}/api/mail/point',
				data: { mailIdList: mailIdList },
				success: function(ret) {
					if (ret.code == 0) {
						$this.removeClass('btn-mail-point').addClass('btn-mail-unpoint');
						$this.html('<i class="fa fa-star fa-fw"></i>取消星标');
						toastr['success']('该邮件已被标记为星标邮件');
					}
				},
				error: function(err) {}
			});
		})
		.on('click', '.btn-mail-unpoint', function() {
			var $this = $(this);
			var mailIdList = [mailId];
			$.ajax({
				url: '${ctx}/api/mail/unpoint',
				data: { mailIdList: mailIdList },
				success: function(ret) {
					if (ret.code == 0) {
						$this.removeClass('btn-mail-unpoint').addClass('btn-mail-point');
						$this.html('<i class="fa fa-star-o fa-fw"></i>标记星标');
						toastr['success']('该邮件已取消星标邮件');
					}
				},
				error: function(err) {}
			});
		});
		
	})( jQuery );
	</script>
	
</body>

</html>