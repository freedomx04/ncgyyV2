<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>南城县工业园区综合信息服务平台</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/swiper/css/swiper.min.css">
	
	<style type="text/css">
	.page-index {
		font-family: "Microsoft YaHei";
	}
	
	.index-title {
		min-height: 34px;
		border-bottom: 1px solid #e7e7eb;
		margin-bottom: 10px;
	}
	.index-title h2 {
		font-size: 20px;
		padding-left: 10px;
	}
	.index-title a {
		font-size: 14px;
	}
	.index-content {
		padding-bottom: 20px;
	}
	.index-content li {
		font-size: 16px;
		margin: 20px 100px 20px 10px;
	}
	.index-content li a:HOVER {
		text-decoration: underline;
	}
	.index-content .index-time {
		position: absolute;
		right: 20px;
		color: #999;
	}
	
	/** swiper */
	.swiper-container img {
		width: 100%;
		height: 100%;
	}
	.swiper-container .swiper-title {
		position: absolute;
		bottom: 15px;
		left: 15px;
		color: #fff;
		font-size: 18px;
		width: 90%;
	}
	.swiper-product img {
		padding-bottom: 40px;
	}
	.swiper-product .product-title {
		position: absolute;
		bottom: 0;
		background: #eee;
		width: 100%;
		padding: 10px;
	}
	
	/** enterprise */
	.enterprise-block {
		padding: 20px 40px;
		border: 1px solid #eee;
	}
	.enterprise-block .enterprise-title {
		font-size: 20px;
		margin-bottom: 5px;
	}
	.enterprise-block p {
		margin: 0;
		line-height: 2em;
	}
	.enterprise-block .enterprise-classify {
		font-weight: 600;
		margin-right: 15px;
	}
	.enterprise-block .enterprise-avatar {
		position: absolute;
		top: 30px;
		right: 20px;
		width: 160px;
		height: 160px;
	}
	
	/** service */
	.main-service .tabs-container .nav-tabs>li>a {
		font-size: 20px;
		padding: 10px;
		font-weight: normal;
	}
	.main-service .tabs-container .nav-tabs>li.active>a, 
	.main-service .tabs-container .nav-tabs>li.active>a:focus, 
	.main-service .tabs-container .nav-tabs>li.active>a:hover {
		border: none;
		color: #e94e38;
	}
	.main-service .division {
		padding: 15px 0; 
		color: #999;
	}
	.main-service .service-more {
		margin-top: 20px;
		margin-bottom: 10px;
		float: right;
		font-size: 14px;
	}
	
	#saftyVideo {
		margin: 0 auto;
	}
	</style>
</head>

<body class="gray-bg page-index">
	
	<!-- header -->
	<%@ include file="/WEB-INF/page/header.jsp"%>
	
	<div class="main">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="swiper-container swiper-photonews" style="width: 100%; height: 300px; margin: 20px 0;">
						<div class="swiper-wrapper">
							<c:forEach var="photonews" items="${photonewsList}">
								<div class="swiper-slide">
									<a href="${ctx}/news/get?newsid=${photonews.id}" target="_blank">
										<img src="${ctx}${photonews.imagePath}">
										<span class="swiper-title text-ellipsis">${photonews.title}</span>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-prev"></div>
    					<div class="swiper-button-next"></div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>公示公告<a href="${ctx}/news?tab=announce" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="announce" items="${announceList}">
									<li class="text-ellipsis">
										<a href="${ctx}/news/get?newsid=${announce.id}" target="_blank">${announce.title}</a>
										<span class="index-time"><fmt:formatDate value="${announce.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>政策法规<a href="${ctx}/news?tab=policy" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="policy" items="${policyList}">
									<li class="text-ellipsis">
										<a href="${ctx}/news/get?newsid=${policy.id}" target="_blank">${policy.title}</a>
										<span class="index-time"><fmt:formatDate value="${policy.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>工业信息<a href="${ctx}/news?tab=overview" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="overview" items="${overviewList}">
									<li class="list-unstyled text-ellipsis">
										<a href="${ctx}/news/get?newsid=${overview.id}" target="_blank">${overview.title}</a>
										<span class="index-time"><fmt:formatDate value="${overview.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 企业宣传 -->
	<div class="main">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-12">
					<div class="index-block">
						<div class="index-title">
							<h2>企业名片<a href="${ctx}/enterprise" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<div class="swiper-container swiper-enterprise" style="height: 220px;">
								<div class="swiper-wrapper">
									<c:forEach var="enterprise" items="${enterpriseList}">
										<div class="swiper-slide enterprise-block">
											<p class="enterprise-title">
												<a href="${ctx}/enterprise/get?eid=${enterprise.id}" target="_blank">${enterprise.name}</a>
											</p>
											<p><span class="enterprise-classify">所属园区</span><span>${enterprise.area.name}</span></p>
											<p><span class="enterprise-classify">行业类别</span><span>${enterprise.industry.name}</span></p>
											<p><span class="enterprise-classify">主要产品</span><span>${enterprise.mainProduct}</span></p>
											<p><span class="enterprise-classify">企业地址</span><span>${enterprise.address}</span></p>
											<p><span class="enterprise-classify">联系电话</span><span>${enterprise.telephone}</span></p>
											<img class="enterprise-avatar" src="${ctx}/api/avatar/${enterprise.avatar}">
										</div>
									</c:forEach>
								</div>
								<div class="swiper-button-prev"></div>
    							<div class="swiper-button-next"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>  
	
	<!-- 产品宣传 -->
	<div class="main">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-12">
					<div class="index-block">
						<div class="index-title">
							<h2>产品宣传<a href="${ctx}/product" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<div class="swiper-container swiper-product" style="height: 220px;">
								<div class="swiper-wrapper">
									<c:forEach var="product" items="${productList}">
										<div class="swiper-slide">
											<a href="${ctx}/product/get?productid=${product.id}" target="_blank">
												<img class="img-thumbnail" src="${ctx}${product.imagePath}">
												<span class="text-ellipsis product-title">${product.name}</span>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 安全生产 -->
	<div class="main main-safty">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>安全生产动态<a href="${ctx}/safty?tab=dynamic" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="safty" items="${saftyList}">
									<li class="text-ellipsis">
										<a href="${ctx}/safty/dynamic/get?dynamicid=${safty.id}" target="_blank">${safty.title}</a>
										<span class="index-time"><fmt:formatDate value="${safty.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>安全生产视频<a href="${ctx}/safty?tab=video" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<div id="saftyVideo"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 帮扶平台 -->
	<div class="main main-assist">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-12">
					<div class="index-block">
						<div class="index-title">
							<h2>诉求列表<a href="${ctx}/appeal" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<table class="table">
								<thead>
									<tr>
										<td>诉求名称</td>
										<td>诉求企业</td>
										<td>诉求状态</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="appeal" items="${appealList}">
										<tr>
											<td><a href="${ctx}/appeal/get?appealid=${appeal.id}" target="_blank">${appeal.title}</a></td>
											<td>${appeal.enterprise.name}</td>
											<c:choose>
												<c:when test="${appeal.status==0}"><td>待发送</td></c:when>
												<c:when test="${appeal.status==1}"><td>待派发</td></c:when>
												<c:when test="${appeal.status==2}"><td>待受理</td></c:when>
												<c:when test="${appeal.status==3}"><td>处理中</td></c:when>
												<c:when test="${appeal.status==4}"><td>待确认</td></c:when>
												<c:when test="${appeal.status==5}"><td>已确认</td></c:when>
												<c:when test="${appeal.status==6}"><td>已驳回</td></c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 招商管理 -->
	<div class="main main-business">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>招商动态<a href="${ctx}/business/dynamic" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="dynamic" items="${businessDynamicList}">
									<li class="text-ellipsis">
										<a href="${ctx}/business/dynamic/info?dynamicId=${dynamic.id}" target="_blank">${dynamic.title}</a>
										<span class="index-time"><fmt:formatDate value="${dynamic.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>招商政策<a href="${ctx}/business/policy" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="policy" items="${businessPolicyList}">
									<li class="text-ellipsis">
										<a href="${ctx}/business/policy/info?policyId=${policy.id}" target="_blank">${policy.title}</a>
										<span class="index-time"><fmt:formatDate value="${policy.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row white-bg">
				<div class="col-sm-12">
					<div class="index-block">
						<div class="index-title">
							<h2>招商项目<a href="${ctx}/business/item" target="_blank" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="item" items="${itemList}">
									<li class="text-ellipsis">
										<a href="${ctx}/business/item/info?itemId=${item.id}" target="_blank">${item.name}</a>
										<span class="index-time"><fmt:formatDate value="${item.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 服务平台 -->
	<div class="main main-service">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="index-block">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li class="active">
									<a data-toggle="tab" href="#tab-recruit" aria-expanded="true">找工作</a>
								</li>
								<li class="division">|</li>
								<li>
									<a data-toggle="tab" href="#tab-job" aria-expanded="true">找人才</a>
								</li>
								<a href="${ctx}/service/talent" target="_blank" class="service-more">更多></a>
							</ul>
							<div class="tab-content index-content">
								<div id="tab-recruit" class="tab-pane active">
									<ul class="list-unstyled">
										<c:forEach var="recruit" items="${recruitList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/talent/recruit/info?recruitId=${recruit.id}" target="_blank">${recruit.position}</a>
												<span class="index-time"><fmt:formatDate value="${recruit.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>
								
								<div id="tab-job" class="tab-pane">
									<ul class="list-unstyled">
										<c:forEach var="job" items="${jobList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/talent/job/info?jobId=${job.id}" target="_blank">${job.intention}</a>
												<span class="index-time"><fmt:formatDate value="${job.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li class="active">
									<a data-toggle="tab" href="#tab-service" aria-expanded="true">找服务</a>
								</li>
								<li class="division">|</li>
								<li>
									<a data-toggle="tab" href="#tab-demand" aria-expanded="true">找需求</a>
								</li>
								<a href="${ctx}/service/information" target="_blank" class="service-more">更多></a>
							</ul>
							<div class="tab-content index-content">
								<div id="tab-service" class="tab-pane active">
									<ul class="list-unstyled">
										<c:forEach var="service" items="${serviceList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/information/service/info?serviceId=${service.id}" target="_blank">${service.title}</a>
												<span class="index-time"><fmt:formatDate value="${service.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>
								
								<div id="tab-demand" class="tab-pane">
									<ul class="list-unstyled">
										<c:forEach var="demand" items="${demandList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/information/demand/info?demandId=${demand.id}" target="_blank">${demand.title}</a>
												<span class="index-time"><fmt:formatDate value="${demand.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="index-block">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li class="active">
									<a data-toggle="tab" href="#tab-financing" aria-expanded="true">找资金</a>
								</li>
								<li class="division">|</li>
								<li>
									<a data-toggle="tab" href="#tab-invest" aria-expanded="true">找项目</a>
								</li>
								<a href="${ctx}/service/financing" target="_blank" class="service-more">更多></a>
							</ul>
							<div class="tab-content index-content">
								<div id="tab-financing" class="tab-pane active">
									<ul class="list-unstyled">
										<c:forEach var="financing" items="${financingList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/financing/financing/info?financingId=${financing.id}" target="_blank">${financing.title}</a>
												<span class="index-time"><fmt:formatDate value="${financing.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>
								
								<div id="tab-invest" class="tab-pane">
									<ul class="list-unstyled">
										<c:forEach var="invest" items="${investList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/financing/invest/info?investId=${invest.id}" target="_blank">${invest.title}</a>
												<span class="index-time"><fmt:formatDate value="${invest.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li class="active">
									<a data-toggle="tab" href="#tab-line" aria-expanded="true">物流路线</a>
								</li>
								<li class="division">|</li>
								<li>
									<a data-toggle="tab" href="#tab-supply" aria-expanded="true">货源信息</a>
								</li>
								<a href="${ctx}/service/logistics" target="_blank" class="service-more">更多></a>
							</ul>
							<div class="tab-content index-content">
								<div id="tab-line" class="tab-pane active">
									<ul class="list-unstyled">
										<c:forEach var="line" items="${lineList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/logistics/line/info?lineId=${line.id}" target="_blank">${line.origin} - ${line.destination}</a>
												<span class="index-time"><fmt:formatDate value="${line.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>
								
								<div id="tab-supply" class="tab-pane">
									<ul class="list-unstyled">
										<c:forEach var="supply" items="${supplyList}">
											<li class="list-unstyled text-ellipsis">
												<a href="${ctx}/service/logistics/supply/info?supplyId=${supply.id}" target="_blank">${supply.origin} - ${supply.destination}</a>
												<span class="index-time"><fmt:formatDate value="${supply.updateTime}" pattern="yyyy/MM/dd"/></span>
											</li>
										</c:forEach>
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/page/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/swiper/js/swiper.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/jwplayer/jwplayer.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jwplayer/jwplayer.controls.js"></script>
	<script>jwplayer.key="1XjAHokrtWKykp8f4kSZSg4wQI0BgQlvblMGKA==";</script>  
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.page-index');
		
		// 图片新闻
		new Swiper('.swiper-photonews', {
			autoplay: {
				delay: 5000
			},
			loop: true,
			navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
		});
		
		// 企业列表
		new Swiper('.swiper-enterprise', {
			loop: true,
			navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
			spaceBetween: 20,
			width: 560,
			height: 150
		});
		
		// 产品宣传
		new Swiper('.swiper-product', {
			autoplay: {
				delay: 3000,
			},
			loop: true,
			spaceBetween: 12,
			width: 180,
			height: 150,
		});
		
		// 安全生产视频
		jwplayer('saftyVideo').setup({
			flashplayer: './jwplayer/jwplayer.flash.swf',
			file: '${ctx}${video.videoPath}',
			width: '80%', 
			aspectratio: '16:9',
			image: '${ctx}${video.imagePath}'
		});
		
		
	})( jQuery );
	</script>
	
</body>
</html>