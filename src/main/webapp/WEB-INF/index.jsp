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
	}
	.index-title a {
		font-size: 14px;
	}
	.index-content li {
		font-size: 16px;
		margin: 20px 120px 20px 0;
	}
	.index-content li a:HOVER {
		text-decoration: underline;
	}
	.index-content .news-time {
		position: absolute;
		right: 20px;
		color: #999;
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
					<%-- <div class="slideBox block-photonews" style="padding-top: 20px;">
						<ul class="items">
							<c:forEach var="photonews" items="${photonewsList}">
								<li>
									<a href="#" title="${photonews.title}">
										<img src="${ctx}${photonews.imagePath}">
									</a>
								</li>
							</c:forEach>
						</ul>
					</div> --%>
					<div class="swiper-container" style="width: 100%; height: 400px;">
						<div class="swiper-wrapper">
							<div class="swiper-slide">slide 1</div>
							<div class="swiper-slide">slide 2</div>
							<div class="swiper-slide">slide 3</div>
							<div class="swiper-slide">slide 4</div>
						</div>
						
						<div class="swiper-button-prev"></div>
    					<div class="swiper-button-next"></div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>公式公告<a href="#" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="announce" items="${announceList}">
									<li class="text-ellipsis">
										<i class="fa fa-file-text-o fa-fw"></i>
										<a href="#" target="_blank">${announce.title}</a>
										<span class="news-time"><fmt:formatDate value="${announce.updateTime}" pattern="yyyy/MM/dd"/></span>
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
							<h2>政策法规<a href="#" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="policy" items="${policyList}">
									<li class="text-ellipsis">
										<i class="fa fa-file-text-o fa-fw"></i>
										<a href="#" target="_blank">${policy.title}</a>
										<span class="news-time"><fmt:formatDate value="${policy.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>工业信息<a href="#" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							<ul class="list-unstyled">
								<c:forEach var="overview" items="${overviewList}">
									<li class="list-unstyled text-ellipsis">
										<i class="fa fa-file-text-o fa-fw"></i>
										<a href="#" target="_blank">${overview.title}</a>
										<span class="news-time"><fmt:formatDate value="${overview.updateTime}" pattern="yyyy/MM/dd"/></span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="main">
		<div class="container">
			<div class="row white-bg">
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>政策法规<a href="#" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							
						</div>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="index-block">
						<div class="index-title">
							<h2>工业信息<a href="#" class="pull-right">更多></a></h2>
						</div>
						<div class="index-content">
							
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
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.page-index');
		
		var mySwiper = new Swiper('.swiper-container', {
			direction: 'vertical',
			loop: true,
			
			navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
		});
		
	})( jQuery );
	</script>
	
</body>
</html>