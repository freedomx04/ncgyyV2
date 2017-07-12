<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/paging/paging.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
	
	<style>
	.dl-horizontal dt,
	.dl-horizontal dd {
		line-height: 2em;
	}
	</style>
	
</head>
<body class="body-enterpriseinfo">
	<div>
		<%@ include file="/WEB-INF/template/top.jsp"%>
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="index">首页</a>&nbsp;&gt;&nbsp;
			<a href="enterpriselist">企业宣传</a>&nbsp;&gt;&nbsp;
			<a href="javascript: void(0);">${enterprise.name}</a>
	    </span>
	</div>
	
	<div class="enterpriseinfo-tab" style="margin-top: 20px;">
	
		<div class="tabs-container">
             <ul class="nav nav-tabs">
                 <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 企业信息</a>
                 </li>
                 <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">企业产品</a>
                 </li>
                 <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">企业新闻</a>
                 </li>
             </ul>
             <div class="tab-content">
                 <div id="tab-1" class="tab-pane active">
                     <div class="panel-body" style="font-size: 14px;">
                         <div class="col-sm-7">
							<dl class="dl-horizontal">
								<dt>企业名称</dt><dd>${enterprise.name}</dd>
								<dt>所属园区</dt><dd>${enterprise.area.name}</dd>
								<dt>行业类别</dt><dd>${enterprise.industry.name}</dd>
								<dt>主要产品</dt><dd>${enterprise.mainProduct}</dd>
								<dt>企业负责人</dt><dd>${enterprise.principal}</dd>
								<dt>联系电话</dt><dd>${enterprise.telephone}</dd>
								<dt>企业地址</dt><dd>${enterprise.address}</dd>
								<dt>企业状态</dt><dd>重点</dd>
							</dl>
						</div>
						<div class="col-sm-5 text-right">
							<img src="${ctx}/api/avatar/${enterprise.avatar}" style="padding: 20px; width: 300px; height: 300px;">
						</div>
						<div class="col-sm-12">
							<dl class="dl-horizontal">
								<dt>企业简介:</dt><dd>${enterprise.introduction}</dd>
							</dl>
						</div>
                     </div>
                 </div>
                 
                 <div id="tab-2" class="tab-pane">
                     <div class="panel-body">
                     	<div class="product_list" style="min-height: 450px;"></div>
	 					<div style="clear: both;"></div>
	 					<div class="pageTool" style="margin-bottom: 20px;"></div>
                     </div>
                 </div>
                 
                 <div id="tab-3" class="tab-pane">
                     <div class="panel-body">
                     	<div class="clist_con" style="min-height: 450px;">
	                     	<ul>
	                     	</ul>
                     	</div>
                     	<div class="pageTool" style="margin-top: 30px; clear: both;"></div>
                     </div>
                 </div>
             </div>

         </div>
	
	</div>
	
	<div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $(".body-enterpriseinfo");
		var enterpriseId = ${enterprise.id};
		var pageSize = 25;
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_enterprise").addClass("nav_curr");
		
		$page.find('#tab-3 .pageTool').Paging({
			pagesize: pageSize, 
			count: '${newsList.size()}', 
			callback: function(page, size, count) {
				getProductData(page-1, size);
			}
		});
		getProductData(0, pageSize);
		
		$page.find('#tab-2 .pageTool').Paging({
			pagesize: pageSize, 
			count: '${productList.size()}', 
			callback: function(page, size, count) {
				getNewsData(page-1, size);
			}
		});
		getNewsData(0, pageSize);
		
		function getProductData(page, size) {
			$.ajax({
				url: "${ctx}/api/product/listPage",
				data: {
					enterpriseId: enterpriseId,
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0 && ret.data.length != 0) {
						$page.find("#tab-2 .product_list").html("");
						
						$.each(ret.data, function(key, val) {
							var name = val.name.length > 80 ? (val.name.substr(0, 80) + "...") : val.name;
							
							var ht = '<div class="product_con">'+
												'<div class="product_ul">'+
											'<a href="product?productId='+ val.id +'" target="_blank">'+
												'<img border="0" data-original="${ctx}'+ val.imagePath +'" width="180" height="122">'+
											'</a>'+
										'</div>'+
										'<div class="product_wz"> <a href="product?productId='+ val.id +'" target="_blank">'+ val.name +'</a></div>'+
									'</div>';
							
							$(ht).appendTo($page.find("#tab-2 .product_list"));
						});
						$('img').lazyload({
						    effect: 'fadeIn'
						}); 
					} else {
						$page.find(".product_list").html("<div style='text-align: center; font-size: 16px;margin-top: 20px;'>暂无数据！</div>");
						$page.find('#tab-2 .pageTool').html("");
					}
				},
				error: function(err) {}
			});
		}
		
		function getNewsData(page, size) {
			$.ajax({
				url: "${ctx}/api/news/listPage",
				data: {
					enterpriseId: enterpriseId,
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0 && ret.data.length != 0) {
						$page.find("#tab-3 .clist_con ul").html("");
						$.each(ret.data, function(key, val) {
							var title = val.title.length > 80 ? (val.title.substr(0, 80) + "...") : val.title;
							
							var ht = '<li>'+
										'<a href="epnews?newsId='+ val.id +'&enterpriseId='+ enterpriseId +'" target="_blank" style="width: 600px;">'+ title +'</a>'+
										'<span><a href="epnews?newsId='+ val.id +'&enterpriseId='+ enterpriseId +'" target="_blank">'+ new Date(val.createTime).Format("yyyy-MM-dd") +'</a></span>'+
									'</li>';
							
							$(ht).appendTo($page.find("#tab-3 .clist_con ul"));
						});
					} else {
						$page.find(".clist_con").html("<div style='text-align: center; font-size: 16px;margin-top: 20px;'>暂无数据！</div>");
						$page.find('#tab-3 .pageTool').html("");
					}
				},
				error: function(err) {}
			});
		}
		
	})();
	
	</script>
</body>
</html>