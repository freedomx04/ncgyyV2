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
	.main {
		width: 980px;
		margin: 0 auto;
	}
	.main-content {
		width: 770px;
	    float: left;
	    position: relative;
	    font-size: 14px;
	    line-height: 24px;
        padding: 29px 29px 240px;
   	}
   	.side-content {
   		position: relative;
	    float: left;
	    width: 150px;
	    font-size: 14px;
    	line-height: 19px;
   	}
   	.side-bar {
	    position: absolute;
	    top: 0;
	    width: 0;
	    height: 240px;
	    background-color: #eaeaea;
	    border: 1px solid #eaeaea;
	    border-top: 0;
	    border-bottom: 0;
	    left: 5px;
	}
	.side-catalog {
	    width: 150px;
	    height: 350px;
	    position: fixed;
	    bottom: 150px;
	    font-size: 14px;
	    line-height: 19px;
	}
	.side-catalog .side-bar .circle.start {
	    top: 0;
	}
	.side-catalog .side-bar .circle.end {
	    margin: 0;
	    bottom: 0;
	}
	.side-catalog .side-bar .circle.start, .side-catalog .side-bar .circle.end {
	    position: absolute;
	    left: -5px;
	    width: 10px;
	    height: 10px;
	    background: transparent url(https://bkssl.bdimg.com/static/wiki-lemma/widget/lemma_content/mainContent/sideCatalog/img/sideCatalog_a278e02.gif) 0 -199px no-repeat;
	    zoom: 1;
	    overflow: hidden;
	}
	.side-catalog .catalog-scroller {
	    padding-top: 15px;
	    position: absolute;
	    z-index: 1;
	    top: 0;
	    left: 0;
	    width: 110px;
	    height: 260px;
	    overflow: hidden;
	}
	.side-catalog .catalog-scroller .catalog-list {
	    width: 120px;
	    height: auto;
	    position: relative;
	}
	.side-catalog .catalog-scroller .catalog-list .catalog-title {
	    position: relative;
	    margin-bottom: 7px;
	    padding-left: 20px;
	}
	.side-catalog .catalog-scroller .catalog-list .catalog-title .pointer {
	    position: absolute;
	    display: block;
	    width: 10px;
	    height: 10px;
	    cursor: pointer;
	    margin-top: 4px;
	    left: 0;
	    background: transparent url(${ctx}/img/sideCatalog.gif) 3px -222px no-repeat;
	}
	.side-catalog .catalog-scroller .catalog-list .arrow {
	    left: 0;
	    z-index: 2;
	    top: 5px;
	    position: absolute;
	    height: 13px;
	    width: 18px;
	    cursor: pointer;
	    background: transparent url(${ctx}/img/sideCatalog.gif) -271px -38px no-repeat;
	}
	.side-catalog .catalog-scroller .catalog-list .catalog-title.level1 .title-link {
	    color: #555;
	    font-weight: 700;
	    text-decoration: none;
	}
	.side-catalog .catalog-scroller .catalog-list .catalog-title.level1 .text {
	    padding-left: 10px;
	}
	.side-catalog .catalog-scroller .catalog-list .catalog-title.level1 .title-index {
	    color: #999;
	    font-weight: 700;
	    font-family: Arial;
	    font-size: 14px;
	    padding-right: 5px;
	}
	.side-catalog .catalog-scroller .catalog-list .catalog-title.level1 .title-link {
	    color: #555;
	    font-weight: 700;
	    text-decoration: none;
	}
	
	.para-title.level-2 {
	    display: block;
	    clear: both;
	    zoom: 1;
	    overflow: hidden;
	    font-size: 20px;
	    border-left: 12px solid #4F9CEE;
	    line-height: 24px;
	    font-size: 22px;
	    font-weight: 400;
	    font-family: Microsoft YaHei,SimHei,Verdana;
	    margin: 35px 0 15px 0px;
	    background: url(${ctx}/img/paraTitle-line.png);
	    position: relative;
	}
	.para-title.level-2 .title-text {
	    float: left;
	    display: block;
	    padding: 0 8px 0 18px;
	    line-height: 24px;
	    font-size: 22px;
	    font-weight: 400;
	    color: #000;
	    background: #fff;
	}
	.side-catalog .bottom-wrap {
	    position: absolute;
	    bottom: 51px;
	    height: 45px;
	}
	.side-catalog .bottom-wrap .toggle-button, .side-catalog .bottom-wrap .gotop-button {
	    display: block;
	    width: 45px;
	    height: 45px;
	    cursor: pointer;
	}
	.side-catalog .bottom-wrap .toggle-button {
	    background: transparent url(${ctx}/img/sideCatalog.gif) no-repeat 0 0;
	}
	.side-catalog .bottom-wrap .gotop-button {
	    margin-top: 6px;
	    background: transparent url(${ctx}/img/sideCatalog.gif) no-repeat -1px -62px;
	}
	
	.lemma-summary {
	    clear: both;
	    font-size: 14px;
	    word-wrap: break-word;
	    color: #333;
	    margin-bottom: 15px;
	    text-indent: 2em;
	    line-height: 24px;
	    zoom: 1;
	}
	
	.basic-info {
	    margin: 20px 0 35px;
	    clear: both;
	    background: url(${ctx}/img/basicInfo-bg.png);
	}
	.basic-info .basicInfo-block {
	    width: 650px;
	    float: left;
	}
	.basic-info .basicInfo-block .basicInfo-item {
	    line-height: 26px;
	    display: block;
	    padding: 0;
	    margin: 0;
	    float: left;
	}
	.basic-info .basicInfo-block .basicInfo-item.name {
	    width: 90px;
	    padding: 0 5px 0 12px;
	    font-weight: 700;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    word-wrap: normal;
	    color: #999;
	}
	.basic-info .basicInfo-block .basicInfo-item.value {
	    zoom: 1;
	    color: #333;
	    width: 550px;
	    float: left;
	    position: relative;
	    word-break: break-all;
	}
	.cmn-clearfix{*zoom:1}
	.cmn-clearfix:after{content:'\0020';display:block;height:0;font-size:0;clear:both;overflow:hidden;visibility:hidden}
	
	.news-list {
	    padding: 0;
	    margin: 0;
	}
	.news-item {
	    color: #aaa;
	    line-height: 20px;
	    margin-top: 9px;
	    width: 100%;
	    font-size: 12px;
	}
	.news-item .index {
	    color: #666;
	    float: left;
	}
	.news-item a {
	    color: #666;
	    text-decoration: none;
	}
	
	.para-content {
		padding: 10px;
		margin-bottom: 40px;
	}
	</style>
	
</head>
<body class="body-enterpriseinfo">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav">
			<span>
				<a href="index">首页</a>&nbsp;&gt;&nbsp;
				<a href="enterpriselist">企业宣传</a>&nbsp;&gt;&nbsp;
				<a href="javascript: void(0);">${enterprise.name}</a>
		    </span>
		</div>
		
		<div class="main-content">
			<h2>${enterprise.name}</h2>
			<div id="1" class="para-title level-2">
				<h2 class="title-text">企业简介</h2>
			</div>
			<div class="para-content">
				<c:if test="${empty enterprise.introduction}">
					暂无信息！
				</c:if>
				<div class="lemma-summary">${enterprise.introduction}</div>
			</div>
			
			<div id="2" class="para-title level-2">
				<h2 class="title-text">企业信息</h2>
			</div>
			<div class="para-content">
				<div class="basic-info cmn-clearfix">
					<dl class="basicInfo-block">
						<dt class="basicInfo-item name">企业名称</dt>
						<dd class="basicInfo-item value">${enterprise.name}</dd>
						
						<dt class="basicInfo-item name">所属园区</dt>
						<dd class="basicInfo-item value">${enterprise.area.name}</dd>
						
						<dt class="basicInfo-item name">行业类别</dt>
						<dd class="basicInfo-item value">${enterprise.industry.name}</dd>
						
						<dt class="basicInfo-item name">主要产品</dt>
						<dd class="basicInfo-item value">${enterprise.mainProduct}</dd>
						
						<dt class="basicInfo-item name">企业负责人</dt>
						<dd class="basicInfo-item value">${enterprise.principal}</dd>
						
						<dt class="basicInfo-item name">联系电话</dt>
						<dd class="basicInfo-item value">${enterprise.telephone}</dd>
						
						<dt class="basicInfo-item name">企业地址</dt>
						<dd class="basicInfo-item value">${enterprise.address}</dd>
						
						<dt class="basicInfo-item name">投产时间</dt>
						<dd class="basicInfo-item value">${enterprise.productionTime}</dd>
					</dl>
				</div>
			</div>
			
			<div id="3" class="para-title level-2">
				<h2 class="title-text">企业产品</h2>
			</div>
			<div class="para-content">
				<c:if test="${empty enterprise.productList}">
					暂无信息！
				</c:if>
				<c:forEach var="product" items="${enterprise.productList}">
				<div class="product_con">
					<div class="product_ul">
						<a href="product?productId=${product.id}" target="_blank">
							<img border="0" data-original="${ctx}${product.imagePath}" width="180" height="122" style="display: inline;">
						</a>
					</div>
					<div class="product_wz" style="text-align: center;"> 
						<a href="product?productId=${product.id}" target="_blank">${product.name}</a>
					</div>
				</div>
				</c:forEach>
				<div style="clear: both;"></div>
			</div>
			
			<div id="4" class="para-title level-2">
				<h2 class="title-text">企业新闻</h2>
			</div>
			<div class="para-content">
				<ul class="news-list">
					<c:if test="${empty enterprise.newsList}">
						暂无信息！
					</c:if>
					<c:forEach var="news" items="${enterprise.newsList}" varStatus="status">
						<li class="news-item">
							<a href="epnews?newsId=${news.id}&enterpriseId=${enterprise.id}" target="_blank" class="text">
								<span class="index">${status.index + 1}.${news.title}</span>
							</a>
							<span>．<fmt:formatDate value="${news.updateTime}" pattern="yyyy-MM-dd"/></span>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>
		
		<div class="side-content">
			<div class="side-catalog" style="visibility: visible;">
				<div class="side-bar">
					<em class="circle start"></em>
					<em class="circle end"></em>
				</div>
				<div class="catalog-scroller">
					<dl class="catalog-list">
						<dt class="catalog-title level1">
							<em class="pointer"></em>
							<a href="#1" class="title-link">
								<span class="text">
									<span class="title-index">1</span>
									<span class="title-link">企业简介</span>
								</span>
							</a>
						</dt>
						<dt class="catalog-title level1">
							<em class="pointer"></em>
							<a href="#2" class="title-link">
								<span class="text">
									<span class="title-index">2</span>
									<span class="title-link">企业信息</span>
								</span>
							</a>
						</dt>
						<dt class="catalog-title level1">
							<em class="pointer"></em>
							<a href="#3" class="title-link">
								<span class="text">
									<span class="title-index">3</span>
									<span class="title-link">企业产品</span>
								</span>
							</a>
						</dt>
						<dt class="catalog-title level1">
							<em class="pointer"></em>
							<a href="#4" class="title-link">
								<span class="text">
									<span class="title-index">4</span>
									<span class="title-link">企业新闻</span>
								</span>
							</a>
						</dt>
						<a class="arrow" href="javascript:void(0);"></a>
					</dl>
				</div>
				
				<div class="bottom-wrap">
					<a class="toggle-button" href="javascript:void(0);"></a>
					<a class="gotop-button" href="javascript:void(0);" onclick="gotop()"></a>
				</div>
				
			</div>
			
		</div>
		
		<div style="clear: both;"></div>
	</div>
	
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $('.body-enterpriseinfo');
		var enterpriseId = ${enterprise.id};
		var pageSize = 25;
		
		$page.find('.menu a').removeClass('nav_curr');
		$page.find('.menu .m_enterprise').addClass('nav_curr');
		
		$page.find('img').lazyload({
		    effect: 'fadeIn'
		}); 
		
		$('a[href*=#]').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var $target = $(this.hash);
                $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
                $page.find('.arrow').css('top', (parseInt(this.hash.replace('#', ''))-1)*28);
                if ($target.length) {
                    var targetOffset = $target.offset().top;
                    $('html,body').animate({
                        scrollTop: targetOffset
                    }, 1000);
                    return false;
                }
            }
        });
		
		$(window).scroll(function(){
			var topVal1 = $('.para-title:eq(0)').position().top;
            var topVal2 = $('.para-title:eq(1)').position().top;
            var topVal3 = $('.para-title:eq(2)').position().top;
            var topVal4 = $('.para-title:eq(3)').position().top;

            if( $(window).scrollTop() >= topVal1 ){
            	$page.find('.arrow').css('top', 0);
            }
           if( $(window).scrollTop() >= topVal2 ){
            	$page.find('.arrow').css('top', 28);
            }
            if( $(window).scrollTop() >= topVal3 ){
            	$page.find('.arrow').css('top', 56);
            }
            if( $(window).scrollTop() >= topVal4 ){
            	$page.find('.arrow').css('top', 84);
            }
            
            
			// 获得窗口滚动上去的距离
			var ling = $(document).scrollTop();
			//document.title = ling;
			// 如果滚动距离大于的时候让滚动框出来
/* 			if(ling > 100){
				$page.find('.side-content').removeClass('hide');
			}
			if(ling > 8800 || ling < 200){
				$page.find('.side-content').addClass('hide');
			} */
		});
		
		$page.on('click', '.toggle-button', function() {
			if($page.find('.catalog-scroller').hasClass('hide')) {
				$page.find('.catalog-scroller').removeClass('hide');
				$page.find('.side-bar').removeClass('hide');
			} else {
				$page.find('.catalog-scroller').addClass('hide');
				$page.find('.side-bar').addClass('hide');
			}
		});
		
	})();
	function gotop() {
		window.scrollBy(0,-150);
		scrolldelay = setTimeout('gotop()', 100);
		var sTop = document.documentElement.scrollTop + document.body.scrollTop; 
		if(sTop == 0) clearTimeout(scrolldelay); 
	};
	</script>
</body>
</html>