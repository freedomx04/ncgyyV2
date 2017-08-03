<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title></title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

	<style>
	.mail-sender {
		margin-bottom: 5px;
		font-weight: normal;
	}
	.mail-time {
		color: #999;
	}
	.mail-title {
		word-break: break-all;
		color: #999;
	}
	.weui_media_box {
		padding: 5px;
		width: 100%;
	}
	</style>
</head>

<body class="wx-mail">
	<div>
		<div class="searchbar_wrap"></div>
		
		<div class="page-mail" style="padding-bottom: 42px; transform: none;">
			<div class="weui_cells weui_cells_access" style="margin-top: 0;">
				<c:if test="${empty mailList}">
					<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
				</c:if>
		
				<c:forEach var="mail" items="${mailList}">
	            <a class="weui_cell" href="${ctx}/wx/mailinfo?userId=${userId}&mailId=${mail.id}&type=${type}">
	            	<c:if test="${mail.readStatus == 0}">
                   		<div class="iblock weui-badge weui-badge-dot" style="margin: -13px 5px 0;background-color: #18b4ed;"></div>
                   	</c:if>
                   	<c:if test="${mail.readStatus != 0}">
                   		<div class="iblock" style="margin: -13px 5px 0;width: 9.59px;"></div>
                   	</c:if>
	            	<div class="iblock weui_media_box">
             			<div>
	                    	<h4 class="f15 left mail-sender">${mail.sender.name}</h4>
	                    	<span class="f13 right mail-time weui_cell_ft">
	                    		<fmt:formatDate value="${mail.updateTime}" pattern="yyyy年MM月dd日 HH:mm"/>
	                    	</span>
	                    </div>
	                    <p class="clear f13 mail-title">
	                    	<c:if test="${fn:length(mail.title) > 30}">
								${fn:substring(mail.title, 0, 30)}...
							</c:if>
							<c:if test="${fn:length(mail.title) <= 30}">
								${mail.title}
							</c:if>
	                    </p>
	                </div>
	            </a>
	            </c:forEach>
	        </div> 
	        
	         
		</div>
		
		<div class="page-search" style="display: none;">
			<div class="weui_cells weui_cells_access" style="margin-top: 0;"></div> 
		</div>
        
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
	<script type="text/javascript">
	$(function( $ ) {
		
		var $page = $('.wx-mail');
		var $search = $page.find('.page-search .weui_cells_access');
		var type = '${type}';
		var userId = '${userId}';
		switch (type) {
		case "inbox":  document.title = '收件箱';  break;
		case "point":  document.title = '星标邮件';  break;
		case "draft":  document.title = '草稿箱';  break;
		case "send":   document.title = '已发送';  break;
		case "delete": document.title = '已删除';
			
		}
		
		$('.searchbar_wrap').searchBar({
			cancelText : "取消",
			searchText : '搜索',
			onfocus: function(value) {
			},
			onblur: function(value) {
			},
			oninput: function(value) {
			},
			onsubmit: function(value) {
				if (value == '') {
					return;
				}
				
				$search.empty();
				$page.find('.page-mail').hide();
				$page.find('.page-search').show();
				
				$.ajax({
					url: '${ctx}/api/mail/search',
					data: {
						userId: userId,
						input: value,
						type: type
					},
					success: function(ret) {
						if(ret.code == 0) {
							var mailList = ret.data;
							if (mailList.length > 0) {
								$.each(mailList, function(key, mail) {
									var title = mail.title.length > 30 ? (mail.title.substr(0, 30) + "...") : mail.title;
									
									$('<a class="weui_cell" href="${ctx}/wx/mailinfo?userId='+ userId +'&mailId=' + mail.id + '&type=${type}">'
					                + '<div class="iblock weui-badge weui-badge-dot" style="margin: -13px 5px 0;background-color: ' + (mail.readStatus == 0 ? '#18b4ed' : '#fff') + ';"></div>'
						            + '<div class="iblock weui_media_box"><div>'
						            + '<h4 class="f15 left mail-sender">' + mail.sender.name + '</h4>'
						            + '<span class="f13 right mail-time weui_cell_ft"></span>'
						            + '</div>'
						            + '<p class="clear f13 mail-title">' + title + '</p>'
						            + '</div>'
						            + '</a>')
						            .appendTo($search);
									
								});
							} else {
								$('<div class="weui-footer" style="padding: 10px;"><p>未找到内容</p></div>').appendTo($search);
							}
						}
					},
					error: function(err) {}
				}); 
			},
			oncancel: function() {
				$page.find('.page-search').hide();
				$page.find('.page-mail').show();
				$page.find('.page-mail').css('transform', 'none');
			},
			onclear: function() {
			}
		});
		
	});
	</script>

</body>

</html>