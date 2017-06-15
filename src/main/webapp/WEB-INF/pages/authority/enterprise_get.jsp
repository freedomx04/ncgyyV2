<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${enterprise.name}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-enterprise-detail dt,
	.body-enterprise-detail dd {
		line-height: 2;
	}
	</style>
	
</head>

<body class="gray-bg body-enterprise-detail">
	<div class="wrapper wrapper-content animated fadeInRight">
	 	<div class="ibox float-e-margins">
	 		<div class="ibox-title">
	 			<button type="button" class="btn btn-white btn-enterprise-back btn-sm"><i class="fa fa-chevron-left fa-fw"></i>企业列表</button>
	 			<span style="padding-left: 15px; font-size: 16px;">${enterprise.name}</span>
	 		</div>
	 		
	 		<div class="ibox-content">
 				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
                        	<a data-toggle="tab" href="#enterprise-tab-info" aria-expanded="true"><i class="fa fa-briefcase"></i>企业信息</a>
                    	</li>
                    	<li>
                        	<a data-toggle="tab" href="#enterprise-tab-product" aria-expanded="true"><i class="fa fa-gift"></i>企业产品</a>
                    	</li>
                    	<li>
                        	<a data-toggle="tab" href="#enterprise-tab-news" aria-expanded="true"><i class="fa fa-newspaper-o"></i>企业新闻</a>
                    	</li>
					</ul> 
					<div class="tab-content">
						<div id="enterprise-tab-info" class="tab-pane active">
							<div class="panel-body">
								<dl class="dl-horizontal">
									<dt>企业名称:</dt><dd>${enterprise.name}</dd>
									<dt>所属园区:</dt><dd>${enterprise.area.name}</dd>
									<dt>行业类别:</dt><dd>${enterprise.industry.name}</dd>
									<dt>主要产品:</dt><dd>${enterprise.mainProduct}</dd>
									<dt>企业负责人:</dt><dd>${enterprise.principal}</dd>
									<dt>联系电话:</dt><dd>${enterprise.telephone}</dd>
									<dt>企业地址:</dt><dd>${enterprise.address}</dd>
									<dt>企业状态:</dt><dd>重点</dd>
									<dt>投产时间:</dt><dd>${enterprise.productionTime}</dd>
									<dt>企业法人:</dt><dd>${enterprise.representative}</dd>
									<dt>主要股东:</dt><dd>${enterprise.shareholder}</dd>
									<dt>注册资金:</dt><dd>${enterprise.registeredCapital}</dd>
									<dt>变更记录:</dt><dd>${enterprise.alterRecording}</dd>
									<dt>国税识别码:</dt><dd>${enterprise.nationalTax}</dd>
									<dt>地税识别码:</dt><dd>${enterprise.localTax}</dd>
									<dt>企业简介:</dt><dd>${enterprise.introduction}</dd>
								</dl>
							</div>
						</div>
						
						<div id="enterprise-tab-product" class="tab-pane">
							<div class="panel-body">
								product
							</div>
						</div>
						
						<div id="enterprise-tab-news" class="tab-pane">
							<div class="panel-body">
								news
							</div>
						</div>
					</div>
 				</div>
	 		</div>
	 	</div>
	
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>

	<script type="text/javascript">
	
		var $page = $('.body-enterprise-detail');
		
		$page.on('click', '.btn-enterprise-back', function() {
			window.location.href = './enterpriseList';
		});
		
	</script>
</body>

</html>