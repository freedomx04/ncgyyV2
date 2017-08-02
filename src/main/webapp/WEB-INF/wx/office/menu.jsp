<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>邮箱</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

	<style>
		p .fa {
    		margin-right: 5px;
		}
		.mail-inbox-unread, .mail-delete-unread, 
		.mail-point-unread {
			color: #999;
		}
		
	</style>
</head>

<body class="body-mail">
	<div>
		<div class="weui_cells weui_cells_access">
			<a class="weui_cell " href="${ctx}/wx/mail/list?userId=${user.id}&type=inbox">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                    	<i class="fa fa-inbox fa-fw f-blue"></i>收件箱
                    	<span class="right mail-inbox-unread"></span>
                    </p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/mail/list?userId=${user.id}&type=point">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                    	<i class="fa fa-star fa-fw f-blue"></i>星标邮件
                    	<span class="right mail-point-unread"></span>
                    </p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
        </div>
        
        <div class="weui_cells weui_cells_access">
			<a class="weui_cell " href="${ctx}/wx/mail/list?userId=${user.id}&type=draft">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                    	<i class="fa fa-file-text-o fa-fw f-blue"></i>草稿箱
                    </p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/mail/list?userId=${user.id}&type=send">
                <div class="weui_cell_bd weui_cell_primary">
                    <p><i class="fa fa-send-o fa-fw f-blue"></i>已发送</p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
            <a class="weui_cell " href="${ctx}/wx/mail/list?userId=${user.id}&type=delete">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                    	<i class="fa fa-trash-o fa-fw f-blue"></i>已删除
                    	<span class="right mail-delete-unread"></span>
                    </p>
                </div>
                <div class="weui_cell_ft"></div>
            </a>
        </div>
        
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
	<script>
	;(function( $ ){
		var $page = $('.body-mail');
		$.ajax({
			url: '${ctx}/api/mail/unread',
			data: {
				userId: 4
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
	})( jQuery );
	</script>
	
</body>

</html>