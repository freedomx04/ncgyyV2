<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>主要指标</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

</head>

<body>
	<div>
		<c:choose>
		<c:when test="${fn:contains(user.role.resource, 'authority-target-report')
						|| fn:contains(user.role.resource, 'authority-target-enterprise')
						|| fn:contains(user.role.resource, 'authority-target-industry')
						|| fn:contains(user.role.resource, 'authority-target-area')
						|| fn:contains(user.role.resource, 'authority-target-point-enterprise')
						|| fn:contains(user.role.resource, 'authority-target-ep')}">
		<div class="searchbar_wrap"></div>
	    <div class="page-bd wx-monitor-list">  
			<ul>
				<c:if test="${fn:contains(user.role.resource, 'authority-target-enterprise')}">
				<li>
					<div class="weui-flex js-category">
						<p class="weui-flex-item">企业主要指标</p>
						<i class="icon icon-74"></i>
					</div>
					<div class="page-category js-categoryInner">
						<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=0-1">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>主营业务收入及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>   
				             <a class="weui_cell" href="${ctx}/wx/monitorGV?type=0-2">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>用电量及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a> 
                         	<a class="weui_cell" href="${ctx}/wx/monitorGV?type=0-3">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>利润总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=0-4">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>实现税金总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				        </div>
			        </div>
			    </li>
			    </c:if>
			    
			    <c:if test="${fn:contains(user.role.resource, 'authority-target-ep')}">
				<li>
					<div class="weui-flex js-category">
						<p class="weui-flex-item">企业主要指标</p>
						<i class="icon icon-74"></i>
					</div>
					<div class="page-category js-categoryInner">
						<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
				            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=0-1&userId=${user.id}">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>主营业务收入及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>   
				             <a class="weui_cell" href="${ctx}/wx/monitorEP?type=0-1&userId=${user.id}">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>用电量及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a> 
                         	<a class="weui_cell" href="${ctx}/wx/monitorEP?type=0-3&userId=${user.id}">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>利润总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				            <a class="weui_cell" href="${ctx}/wx/monitorEP?type=0-3&userId=${user.id}">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>实现税金总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				        </div>
			        </div>
			    </li>
			    </c:if>
			    
			    <c:if test="${fn:contains(user.role.resource, 'authority-target-industry')}">
				<li>
					<div class="weui-flex js-category">
						<p class="weui-flex-item">行业主要指标</p>
						<i class="icon icon-74"></i>
					</div>
					<div class="page-category js-categoryInner">
						<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=1-1">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>主营业务收入及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>   
				             <a class="weui_cell" href="${ctx}/wx/monitorGV?type=1-2">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>用电量及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a> 
                         	<a class="weui_cell" href="${ctx}/wx/monitorGV?type=1-3">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>利润总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=1-4">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>实现税金总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				        </div>
			        </div>
			    </li>
			    </c:if>
			    
			    
			    <c:if test="${fn:contains(user.role.resource, 'authority-target-area')}">
				<li>
					<div class="weui-flex js-category">
						<p class="weui-flex-item">区域主要指标</p>
						<i class="icon icon-74"></i>
					</div>
					<div class="page-category js-categoryInner">
						<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=2-1">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>主营业务收入及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>   
				             <a class="weui_cell" href="${ctx}/wx/monitorGV?type=2-2">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>用电量及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a> 
                         	<a class="weui_cell" href="${ctx}/wx/monitorGV?type=2-3">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>利润总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=2-4">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>实现税金总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				        </div>
			        </div>
			    </li>
			    </c:if>
			    
			    <c:if test="${fn:contains(user.role.resource, 'authority-target-point-enterprise')}">
				<li>
					<div class="weui-flex js-category">
						<p class="weui-flex-item">重点企业主要指标</p>
						<i class="icon icon-74"></i>
					</div>
					<div class="page-category js-categoryInner">
						<div class="weui_cells weui_cells_access" style="margin-top: 0px;">
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=3-1">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>主营业务收入及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>   
				             <a class="weui_cell" href="${ctx}/wx/monitorGV?type=3-2">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>用电量及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a> 
                         	<a class="weui_cell" href="${ctx}/wx/monitorGV?type=3-3">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>利润总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				            <a class="weui_cell" href="${ctx}/wx/monitorGV?type=3-4">
				                <div class="weui_cell_bd weui_cell_primary">
				                    <p>实现税金总额及增幅图表</p>
				                </div>
				                <div class="weui_cell_ft"></div>
				            </a>
				        </div>
			        </div>
			    </li>
			    </c:if>
			    
			    
			</ul>
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
	
	<script type="text/javascript">
	$(function( $ ) {
		$('.js-category').click(function(){
			$parent = $(this).parent('li');
			if($parent.hasClass('js-show')){
				$parent.removeClass('js-show');
				$(this).children('i').removeClass('icon-35').addClass('icon-74');
			}else{
				$parent.siblings().removeClass('js-show');
				$parent.addClass('js-show');
				$(this).children('i').removeClass('icon-74').addClass('icon-35');
				$parent.siblings().find('i').removeClass('icon-35').addClass('icon-74');
			}
		});
	});
	</script>

</body>

</html>