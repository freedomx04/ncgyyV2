<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>精准帮扶平台</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body>
	<div>
		<c:choose>
		<c:when test="${user.role.resource.indexOf('agency_enterprise') > -1 || user.role.resource.indexOf('agency_department') > -1 || user.role.resource.indexOf('assist_appeal_dispatcher') > -1 }">
		<div class="weui_cells weui_cells_access">
			<c:if test="${user.role.resource.indexOf('agency_enterprise') > -1}">
	            <a class="weui_cell " href="${ctx}/wx/appealEP?userId=${user.id}">
	                <div class="weui_cell_bd weui_cell_primary">
	                    <p>诉求中心</p>
	                </div>
	                <div class="weui_cell_ft"></div>
	            </a>
            </c:if>
            
            <c:if test="${user.role.resource.indexOf('agency_department') > -1 && user.role.code != '00'}">
            	<a class="weui_cell " href="${ctx}/wx/appealGV?userId=${user.id}">
            		<div class="weui_cell_bd weui_cell_primary">
	                    <p>诉求中心</p>
	                </div>
	                <div class="weui_cell_ft"></div>
	            </a>
	            <a class="weui_cell " href="${ctx}/wx/appealPoint?pointUserId=${user.id}">
	                <div class="weui_cell_bd weui_cell_primary">
	                    <p>挂点企业</p>
	                </div>
	                <div class="weui_cell_ft"></div>
	            </a>
            </c:if>
            
            <c:if test="${user.role.resource.indexOf('assist_appeal_dispatcher') > -1}">
            	<a class="weui_cell " href="${ctx}/wx/appealDispatcher?userId=${user.id}">
            		<div class="weui_cell_bd weui_cell_primary">
	                    <p>诉求中心（派单）</p>
	                </div>
	                <div class="weui_cell_ft"></div>
	            </a>
            </c:if>
            
        </div>
        </c:when>
        
        <c:otherwise>
		<div class="weui_msg">
			<div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div>
			<div class="weui_text_area">
				<p class="weui_msg_desc">您的账号没有权限！</p>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	
</body>

</html>