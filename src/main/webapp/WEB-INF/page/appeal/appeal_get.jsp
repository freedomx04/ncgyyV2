<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${appeal.title}</title>
	
	<style type="text/css">
	.main-appeal {
		padding: 40px 0;
	}
	</style>
</head>
<body class="gray-bg">
	
	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main animated fadeInDown">
		<div class="container white-bg">
			<div class="row">
				<div class="main-appeal">
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
								<dt>发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
							</c:when> 
						  
							<c:when test="${appeal.status == 2}"> 
								<dt>诉求状态</dt><dd>待受理</dd> 
								<dt>发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
								<dt>派发时间</dt><dd><fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd hh:mm"/></dd> 
								<dt>派发部门</dt><dd>${appeal.department.name}</dd>
							</c:when>
							
							<c:when test="${appeal.status == 3}"> 
								<dt>诉求状态</dt><dd>处理中</dd>
								<dt>发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
								<dt>派发时间</dt><dd><fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd hh:mm"/></dd>  
								<dt>受理时间</dt><dd><fmt:formatDate value="${appeal.acceptTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
								<dt>派发部门</dt><dd>${appeal.department.name}</dd>
							</c:when>
							
							<c:when test="${appeal.status == 4}"> 
								<dt>诉求状态</dt><dd>待确认</dd>  
								<dt>发送时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
								<dt>派发时间</dt><dd><fmt:formatDate value="${appeal.dispatchTime}" pattern="yyyy-MM-dd hh:mm"/></dd>  
								<dt>受理时间</dt><dd><fmt:formatDate value="${appeal.acceptTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
								<dt>处理时间</dt><dd><fmt:formatDate value="${appeal.handleTime}" pattern="yyyy-MM-dd hh:mm"/></dd>
								<dt>派发部门</dt><dd>${appeal.department.name}</dd>
							</c:when>
							
							<c:when test="${appeal.status == 5}"> 
								<dt>诉求状态</dt><dd>已确认</dd>  
								<dt>评价详情</dt>
								<dd>
									<p>受理速度&nbsp;&nbsp;<span class="evaluation-accept evaluation-star" data-star="${appeal.evaluation.accept}"></span></p>
			            			<p>办结速度&nbsp;&nbsp;<span class="evaluation-handle evaluation-star" data-star="${appeal.evaluation.handle}"></span></p>
			            			<p>办结结果&nbsp;&nbsp;<span class="evaluation-result evaluation-star" data-star="${appeal.evaluation.result}"></span></p>
			            			<p>评价内容&nbsp;&nbsp;<span style="word-break: break-all;">${appeal.evaluation.content}</span></p>
								</dd>
							</c:when>
						
							<c:when test="${appeal.status == 6}"> 
								<dt>诉求状态</dt><dd>已驳回</dd>
								<dt>驳回意见</dt><dd>${appeal.rejectOpinion}</dd>  
							</c:when> 
						</c:choose> 
						
						<c:if test="${!empty appeal.urgeList}">
	            		<dt>催办详情</dt>
	            		<dd>
	            			<table class="table table-hover" data-mobile-responsive="true">
	            				<thead>
	            					<tr>
		            					<td>催办人</td>
		            					<td>催办意见</td>
		            					<td>催办时间</td>
		            				</tr>
	            				</thead>
	            				<tbody>
	            					<c:forEach var="urge" items="${appeal.urgeList}">
	            						<tr>
	            							<td>${urge.user.name}</td>
	            							<td>${urge.content}</td>
	            							<td><fmt:formatDate value="${urge.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
	            						</tr>
	            					</c:forEach>
	            				</tbody>
	            			</table>
	            		</dd>
	            		</c:if>
					</dl>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
</body>
</html>