<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title></title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

	<style>
	.mail-attachment {
		padding: 20px 0 60px;
	}
	.mail-attachment img {
		width: 100%;
	}
	.mail-menu ul {
		width: 100%;
	}
	.mail-menu li {
		float: left;
		width: 33%;
	}
	</style>
</head>

<body class="wx-mail" style="background-color: #fff;">
	<div style="padding: 20px 15px;">
		<div class="weui-border-b" style="padding: 10px 0 20px;">
			<div class="bold" style="margin-bottom: 10px;">
				<span>发件人：</span>
				<span class="f-blue">${mail.sender.username}</span>
			</div>
			<div class="f14">
				<span>收件人：</span>
				<span class="f-blue">
					<c:if test="${mail.mailStatus == 2}">${mail.receivers}</c:if>
					<c:if test="${mail.mailStatus == 3}">${mail.receiver.username}</c:if>
				</span>
			</div>
		</div>
		
		<div class="weui-border-b" style="padding: 20px 0;">
			<div class="bold">${mail.title}</div>
			<div class="f14" style="color: #999;">
				<fmt:formatDate value="${mail.updateTime}" pattern="yyyy年MM月dd日 HH:mm (E)"/>
			</div>
		</div>
		
		<div style="margin-top:5px;word-break: break-all;">
			${mail.content}
		</div>
		
		<c:if test="${fn:length(mail.fileList) > 0}">
			<div class="mail-attachment">
				<p class="f14" style="color: #999; margin-bottom: 10px;">
					<i class="fa fa-paperclip fa-fw"></i>
					<strong>附件</strong>
					<span>(${fn:length(mail.fileList)})</span>
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
	</div>
	
	<div class="weui-footer weui-footer-fixed-bottom weui_cells" style="bottom: 0; background-color: #F7F7FA;">
       	<div class="weui_cell mail-menu">
       		<ul>
       			<li>
       				<a href="javascript:" class="btn-mail-back">
						<span class="icon icon-109 f24 f-blue"></span>
					</a>
       			</li>
     			<c:if test="${type == 'inbox' || type == 'point'}">
       			<li>
					<c:if test="${mail.pointStatus == 0}">
					<a href="javascript:" class="btn-mail-point">
						<span class="icon icon-48 f24 f-blue"></span>
					</a>
					</c:if>
					<c:if test="${mail.pointStatus == 1}">
					<a href="javascript:" class="btn-mail-unpoint">
						<span class="icon icon-49 f24 f-blue"></span>
					</a>
					</c:if>
       			</li>
				</c:if>
       			<li>
       				<c:if test="${mail.deleteStatus == 0}">
					<a href="javascript:" class="btn-mail-delete">
						<span class="icon icon-26 f24 f-blue"></span>
					</a>
					</c:if>
					<c:if test="${mail.deleteStatus == 1}">
					<a href="javascript:" class="btn-mail-deleteCompletely">
						<span class="icon icon-26 f24 f-blue"></span>
					</a>
					</c:if>
       			</li>
				<c:if test="${type == 'delete'}">
				<li>
					<a href="javascript:" class="btn-mail-recovery">
						<span class="icon icon-21 f24 f-blue"></span>
					</a>
				</li>
				</c:if>
       		</ul>
		</div> 
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
	<script type="text/javascript">
	$(function( $ ) {
		var $page = $('.wx-mail');
		
		if ('${type}' == 'draft' || '${type}' == 'send') {
			$page.find('.mail-menu li').css("width", "50%");
		}
		
		$page
		.on("click", ".btn-mail-point", function() {
	        $.confirm("您确定要标记星标该邮件吗?", "确认标记?", function() {
	        	$.ajax({
					url: '${ctx}/api/mail/point',
					data: { mailIdList: [${mail.id}] },
					success: function(ret) {
						if (ret.code == 0) {
				            $.toast("标记成功!");
				            //window.location = "${ctx}/wx/mail/list?userId=${userId}&type=point";
				            window.location = "${ctx}/wx/mail?userId=${userId}";
						}
					},
					error: function(err) {}
				});
	          }, function() {
	            //取消操作
	          });
        })
        .on("click", ".btn-mail-unpoint", function() {
	        $.confirm("您确定要取消星标该邮件吗?", "确认取消?", function() {
	        	$.ajax({
					url: '${ctx}/api/mail/unpoint',
					data: { mailIdList: [${mail.id}] },
					success: function(ret) {
						if (ret.code == 0) {
				            $.toast("操作成功!");
				            //location.reload();
				            window.location = "${ctx}/wx/mail?userId=${userId}";
						}
					},
					error: function(err) {}
				});
			}, function() {
			});
        })
        .on("click", ".btn-mail-delete", function() {
	        $.confirm("您确定要删除该邮件吗?", "确认删除?", function() {
	        	$.ajax({
					url: '${ctx}/api/mail/delete',
					data: { mailIdList: [${mail.id}] },
					success: function(ret) {
						if (ret.code == 0) {
				            $.toast("删除成功!");
				            //window.location = "${ctx}/wx/mail/list?userId=${userId}&type=delete";
				            window.location = "${ctx}/wx/mail?userId=${userId}";
						}
					},
					error: function(err) {}
				});
	          }, function() {
	            //取消操作
	          });
        })
        .on("click", ".btn-mail-deleteCompletely", function() {
	        $.confirm("您确定要彻底删除该邮件吗?", "确认删除?", function() {
	        	$.ajax({
					url: '${ctx}/api/mail/deleteCompletely',
					data: { mailIdList: [${mail.id}] },
					success: function(ret) {
						if (ret.code == 0) {
				            $.toast("删除成功!");
				            window.location = "${ctx}/wx/mail?userId=${userId}";
						}
					},
					error: function(err) {}
				});
	          }, function() {
	            //取消操作
	          });
        })
        .on("click", ".btn-mail-recovery", function() {
	        $.confirm("您确定要恢复已删除邮件吗?", "确认恢复?", function() {
	        	$.ajax({
					url: '${ctx}/api/mail/recovery',
					data: { mailIdList: [${mail.id}] },
					success: function(ret) {
						if (ret.code == 0) {
				            $.toast("恢复成功!");
				            window.location = "${ctx}/wx/mail?userId=${userId}";
						}
					},
					error: function(err) {}
				});
	          }, function() {
	            //取消操作
	          });
        })
        .on('click', '.btn-mail-back', function() {
        	window.location = "${ctx}/wx/mail/list?userId=${userId}&type=${type}";
        });
	});
	</script>

</body>

</html>