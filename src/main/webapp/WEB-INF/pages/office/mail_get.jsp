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
	
</head>

<body class="gray-bg body-mail-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="mail-box-header">
			<div class="pull-right">
				<button type="button" class="btn btn-white btn-sm btn-mail-delete">
					<i class="fa fa-chevron-left fa-fw"></i>返回
				</button>
				<button type="button" class="btn btn-white btn-sm btn-mail-delete">
					<i class="fa fa-star-o fa-fw"></i>标记星标
				</button>
				<button type="button" class="btn btn-white btn-sm btn-mail-delete">
					<i class="fa fa-trash-o fa-fw"></i>删除
				</button>
			</div>
			
			<h2>${mail.title}</h2>
			<div class="">
				<table style="color: #999;">
					<tr>
						<td>发件人：</td>
						<td style="color: #3d882d;">孙某某 </td>
					</tr>
					<tr>
						<td>时&nbsp;&nbsp;&nbsp;间：</td>
						<td><fmt:formatDate value="${mail.updateTime}" pattern="yyyy年MM月dd日 HH:mm (E)"/></td>
					</tr>
					<tr>
						<td>收件人：</td>
						<td style="color: #0F6099;">梅赛德斯的</td>
					</tr>
					<tr>
						<td>附&nbsp;&nbsp;&nbsp;件：</td>
						<td>2个 查看附件</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="mail-box">
			<div class="mail-body">
				${mail.content}
			</div>
			
			<div class="mail-attachment">
				<p>
					<span><i class="fa fa-paperclip fa-fw"></i>附件(2)</span>
				</p>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		
		
	})( jQuery );
	</script>
	
</body>

</html>