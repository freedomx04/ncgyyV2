<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
	<meta name="keywords" content="">
    <meta name="description" content="">
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/paging/paging.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
</head>
<body class="body-enterprise">
	<div>
		<%@ include file="/WEB-INF/template/top.jsp"%>
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="index">首页</a>&nbsp;&gt;&nbsp;
			<a href="productlist">产品宣传</a>
	    </span>
	</div>
	
	<div class="clist">
		<div class="clist_r_title">
			<span>产品宣传</span>
		</div>
		<div class="clist_con" style="min-height: 600px;">
		</div>
		
		<div style="clear:both;"></div>
		<div id="pageTool" style="margin-bottom: 20px;"></div>
	</div>
	
	<div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $(".body-enterprise");
		var pageSize = 20;
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_product").addClass("nav_curr");
		
		$page.find('#pageTool').Paging({
			pagesize: pageSize, 
			count: '${count}', 
			callback: function(page, size, count) {
				getData(page-1, size);
			}
		});
		
		getData(0, pageSize);
		
		function getData(page, size) {
			$.ajax({
				url: "${ctx}/api/product/listAllPage",
				data: {
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0 && ret.data.length != 0) {
						$page.find(".clist_con").html("");
						$.each(ret.data, function(key, val) {
							
							var ht = '<div class="product_con">'+ 
										'<div class="product_ul">'+
											'<a href="product?productId='+ val.id +'" target="_blank">'+
												'<img border="0" data-original="${ctx}'+ val.imagePath +'" width="180" height="122">'+
											'</a>'+
										'</div>'+
										'<div class="product_wz"> <a href="" target="_blank">'+ val.name +'</a></div></div>';
							
							$(ht).appendTo($page.find(".clist_con"));
						});
						$('img').lazyload({
						    effect: 'fadeIn'
						}); 
					} else {
						$page.find(".clist_con").html("<div style='text-align: center; font-size: 16px;margin-top: 20px;'>暂无数据！</div>");
						$page.find('#pageTool').html("");
					}
				},
				error: function(err) {}
			});
		}
	})();
	
	</script>
</body>
</html>