<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求中心</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	
</head>

<body class="wx-appealCenter-info">
	<c:if test="${appealList == null}">
		<div class="weui_msg">
			<div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div>
			<div class="weui_text_area">
				<p class="weui_msg_desc">您的还不是企业用户，请联系管理员添加！</p>
			</div>
		</div>
	</c:if>
	
	<c:if test="${appealList != null}">
	<div class="weui_tab appealCenter-tab">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">诉求列表</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">诉求预警</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty appealList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="appeal" items="${appealList}">
						<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
			                <div class="weui_cell_hd" style="width: 100%;">
			                	<p style="font-size: 16px;">
									<c:if test="${fn:length(appeal.title) > 40}">
										${fn:substring(appeal.title, 0, 40)}...
									</c:if>
									<c:if test="${fn:length(appeal.title) <= 40}">
										${appeal.title}
									</c:if>
								</p>
								<p style="color: #999;">
				                	<c:if test="${fn:length(appeal.appealType.name) > 20}">
										${fn:substring(appeal.appealType.name, 0, 20)}...
									</c:if>
									<c:if test="${fn:length(appeal.appealType.name) <= 20}">
										${appeal.appealType.name}
									</c:if>
				                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02; float: right;" data-status="${appeal.status}"></span>
								</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
			                </div>
            			</a>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item">
				<h1 class="page-hd-title" style="margin-left: 1em;"> 超过受理天数诉求</h1>
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${acceptDayAppealLength == 0}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="list" items="${overDaysList}">
						<c:forEach var="appeal" items="${list.acceptDays}">
							<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
				                <div class="weui_cell_hd" style="width: 100%;">
				                	<p style="font-size: 16px;">
				                		<c:if test="${fn:length(appeal.title) > 40}">
											${fn:substring(appeal.title, 0, 40)}...
										</c:if>
										<c:if test="${fn:length(appeal.title) <= 40}">
											${appeal.title}
										</c:if>
									</p>
									<p style="color: #999;">
					                	<c:if test="${fn:length(appeal.appealType.name) > 20}">
											${fn:substring(appeal.appealType.name, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(appeal.appealType.name) <= 20}">
											${appeal.appealType.name}
										</c:if>
					                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02; float: right;" data-status="${appeal.status}"></span>
									</p>
									<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
				                </div>
	            			</a>
	            		</c:forEach>
					</c:forEach>
				</div>
				
				<h1 class="page-hd-title" style="margin-left: 1em; margin-top: 50px;">超过处理天数诉求</h1>
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${handleDayAppealLength == 0}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="list" items="${overDaysList}">
						<c:forEach var="appeal" items="${list.handleDays}">
							<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
				                <div class="weui_cell_hd" style="width: 100%;">
				                	<p style="font-size: 16px;">
										<c:if test="${fn:length(appeal.title) > 40}">
											${fn:substring(appeal.title, 0, 40)}...
										</c:if>
										<c:if test="${fn:length(appeal.title) <= 40}">
											${appeal.title}
										</c:if>
									</p>
									<p style="color: #999;">
					                	<c:if test="${fn:length(appeal.appealType.name) > 20}">
											${fn:substring(appeal.appealType.name, 0, 20)}...
										</c:if>
										<c:if test="${fn:length(appeal.appealType.name) <= 20}">
											${appeal.appealType.name}
										</c:if>
					                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02; float: right;" data-status="${appeal.status}"></span>
									</p>
									<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
				                </div>
	            			</a>
            			</c:forEach>
					</c:forEach>
				</div>
			</div>
			
		</div>
	</div>
	</c:if>

	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-appealCenter-info');
		var userId = Url.queryString("userId");
		var defaultIndex = Url.queryString("index");
		
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.appealCenter-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$.each($page.find(".weui-badge"), function(k, y) {
			var status = $page.find(".weui-badge").eq(k).data('status');
			$page.find(".weui-badge").eq(k).text($k.util.getAppealStatus(status));
		});
		
		$page
		.on('click', '.appeal-info', function() {
			var appealId = $(this).data('appealId');
			window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=ep&userId=" + 12;
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
		});
		
	});
	
	</script>

</body>

</html>