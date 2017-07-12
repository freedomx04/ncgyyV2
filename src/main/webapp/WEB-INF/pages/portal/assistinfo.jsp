<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
	
	<style>
	.dl-horizontal dt, .dl-horizontal dd {
		line-height: 2.5em;
	}
	.fa-star {
		color: 
	}
	</style>
</head>
<body class="body-assistinfo">
	<div>
		<%@ include file="/WEB-INF/template/top.jsp"%>
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="index">首页</a>&nbsp;&gt;&nbsp;
			<a href="assistlist">帮扶平台</a>
	    </span>
	</div>
	
	<div class="" style="margin: 20px auto 0 auto; width: 980px;">
		<div class="panel-body" style="font-size: 14px;">
             <div>
				<dl class="dl-horizontal">
					<dt>诉求名称</dt><dd>${appeal.title}</dd>
					<dt>诉求企业</dt><dd>${appeal.enterprise.name}</dd>
					<dt>诉求类型</dt><dd>${appeal.appealType.name}</dd>
					
					<c:choose> 
						<c:when test="${appeal.status == 0}">  
					  		<dt>诉求状态</dt><dd>新增</dd> 
						</c:when> 
					
						<c:when test="${appeal.status == 1}"> 
							<dt>诉求状态</dt><dd>待派发</dd>   
							<dt>诉求发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
						</c:when> 
					  
						<c:when test="${appeal.status == 2}"> 
							<dt>诉求状态</dt><dd>待受理</dd> 
							<dt>诉求发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							<dt>诉求派发时间</dt><dd><fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd hh:mm"/></dd> 
							<dt>诉求派发部门</dt><dd>${appeal.department.name}</dd>
						</c:when>
						
						<c:when test="${appeal.status == 3}"> 
							<dt>诉求状态</dt><dd>处理中</dd>
							<dt>诉求发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							<dt>诉求派发时间</dt><dd><fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd hh:mm"/></dd>  
							<dt>诉求受理时间</dt><dd><fmt:formatDate value="${appeal.acceptTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							<dt>诉求派发部门</dt><dd>${appeal.department.name}</dd>
						</c:when>
						
						<c:when test="${appeal.status == 4}"> 
							<dt>诉求状态</dt><dd>待确认</dd>  
							<dt>诉求发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							<dt>诉求派发时间</dt><dd><fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd hh:mm"/></dd>  
							<dt>诉求受理时间</dt><dd><fmt:formatDate value="${appeal.acceptTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							<dt>诉求处理时间</dt><dd><fmt:formatDate value="${appeal.handleTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							<dt>诉求派发部门</dt><dd>${appeal.department.name}</dd>
						</c:when>
						
						<c:when test="${appeal.status == 5}"> 
							<dt>诉求状态</dt><dd>已确认</dd>  
							<dt>评价</dt>
							<dd>
								<p>受理速度<span class="evaluation-accept evaluation-star" data-star="${appeal.evaluation.accept}"></span></p>
		            			<p>办结速度<span class="evaluation-handle evaluation-star" data-star="${appeal.evaluation.handle}"></span></p>
		            			<p>办结结果<span class="evaluation-result evaluation-star" data-star="${appeal.evaluation.result}"></span></p>
		            			<p>评价内容<span style="word-break: break-all;">${appeal.evaluation.content}</span></p>
							</dd>
						</c:when>
					
						<c:when test="${appeal.status == 6}"> 
							<dt>诉求状态</dt><dd>已驳回</dd>
							<dt>驳回意见</dt><dd>${appeal.rejectOpinion}</dd>  
						</c:when> 
					</c:choose> 
					
				</dl>
			</div>
			<div>
				<dl class="dl-horizontal">
					<dt>诉求详情</dt><dd>${appeal.description}</dd>
				</dl>
			</div>
        </div>	
	</div>
	
	<div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/raty/jquery.raty.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $(".body-assistinfo");
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_assist").addClass("nav_curr");
		
		$page.find('.evaluation-star').each(function(k, val) {
			var $star = $(val);
			var star = $star.data('star');
			$k.util.raty($star, {
				readOnly: true
			});
		});
		
	})();
	
	</script>
</body>
</html>