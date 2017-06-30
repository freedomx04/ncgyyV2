<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${appeal.title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-appeal-detail dt,
	.body-appeal-detail dd {
		line-height: 2;
	}
	.body-appeal-detail table td {
		padding: 4px!important;
	}
	.body-appeal-detail .appeal-evaluation p {
		margin: 0;
	}
	.body-appeal-detail .appeal-evaluation span {
		padding-left: 20px;
	}
	</style>
</head>

<body class="gray-bg body-appeal-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
                <button type="button" class="btn btn-white btn-appeal-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>诉求中心</button>
                <span style="padding-left: 15px; font-size: 16px;">${appeal.title}</span>
            </div>
            
            <div class="ibox-content">
            	<dl class="dl-horizontal" style="padding-right: 60px;">
            		<dt>诉求状态</dt><dd class="appeal-status"></dd>
            		<dt>诉求标题</dt><dd>${appeal.title}</dd>
            		<dt>诉求类型</dt><dd>${appeal.appealType.name}</dd>
            		<dt>企业名称</dt><dd>${appeal.enterprise.name}</dd>
            		<dt>诉求描述</dt><dd>${appeal.description}</dd>
            		<dt>创建时间</dt><dd><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></dd>
            		
            		<dt>派单时间</dt><dd><fmt:formatDate value="${appeal.sendTime}" pattern="yyyy-MM-dd HH:mm"/></dd>
            		<dt>派单意见</dt><dd>${appeal.dispatchOpinion}</dd>
            		
            		<dt>处理部门</dt><dd>${appeal.department.name}</dd>
            		<dt>受理时间</dt><dd><fmt:formatDate value="${appeal.acceptTime}" pattern="yyyy-MM-dd HH:mm"/></dd>
            		<dt>办结时间</dt><dd><fmt:formatDate value="${appeal.handleTime}" pattern="yyyy-MM-dd HH:mm"/></dd>
            		
            		<dt>驳回意见</dt><dd>${appeal.rejectOpinion}</dd>
            		
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
            		
            		<c:if test="${!empty appeal.evaluation}">
            		<dt>评价详情</dt>
            		<dd class="appeal-evaluation">
            			<p>受理速度<span class="evaluation-accept evaluation-star" data-star="${appeal.evaluation.accept}"></span></p>
            			<p>办结速度<span class="evaluation-handle evaluation-star" data-star="${appeal.evaluation.handle}"></span></p>
            			<p>办结结果<span class="evaluation-result evaluation-star" data-star="${appeal.evaluation.result}"></span></p>
            			<p>评价内容<span style="word-break: break-all;">${appeal.evaluation.content}</span></p>
            		</dd>
            		</c:if>
            	</dl>
            </div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/raty/jquery.raty.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-appeal-detail');
		
		var $label;
		var status = ${appeal.status};
		switch (status) {
		case 0:
			 $label = '<span class="label label-warning">待发送</span>';
			 break;
		case 1:
			$label = '<span class="label label-warning">待派发</span>';
			break;
		case 2:
			$label = '<span class="label label-warning">待受理</span>';
			break;
		case 3:
			$label = '<span class="label label-primary">处理中</span>';
			break;
		case 4:
			$label = '<span class="label label-info">待确认</span>';
			break;
		case 5:
			$label = '<span class="label label-success">已确认</span>';
			break;
		case 6:
			$label = '<span class="label label-danger">已驳回</span>';
			break;
		}
		$page.find('.appeal-status').html($label);
		
		$page.find('.evaluation-star').each(function(k, val) {
			var $star = $(val);
			var star = $star.data('star');
			$k.util.raty($star, {
				readOnly: true
			});
		});
		
		$page.on('click', '.btn-appeal-back', function() {
			window.history.back();
		});
		
	})( jQuery );
	</script>
	
</body>
</html>