<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/template/top_footer.jsp"%>

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
	<div class="header">
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="/index">首页</a>&nbsp;&gt;&nbsp;
			<a href="">产品宣传</a>&nbsp;&gt;&nbsp;
			<a href=""></a>
	    </span>
	</div>
	
	<div class="clist">
		<div class="clist_r_title">
			<span>产品宣传</span>
		</div>
		<div class="clist_con" style="min-height: 600px;">
		</div>
		
		
		<div id="pageTool" style="margin-bottom: 20px;"></div>
	</div>
	
	<div class="footer">
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery-doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script>
	;(function() {
		var $page = $(".body-enterprise");
		$page.find(".header").html($(".template.Top").doT());
		$page.find(".footer").append($(".template.Footer").doT());
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_product").addClass("nav_curr");
		
		$page.find('#pageTool').Paging({
			pagesize: 1, 
			count: '${count}', 
			callback: function(page, size, count) {
			}
		});
		
		$.ajax({
			url: "${ctx}/api/product/listAll",
			data: {
			},
			success: function(ret) {
				if (ret.code == 0) {
					$page.find(".clist_con").html("");
					$.each(ret.data, function(key, val) {
						
						var ht = '<div class="product_con">'+ 
									'<div class="product_ul">'+
										'<a href="index_productinfo?productId='+ val.id +'" target="_blank">'+
											'<img border="0" src="${ctx}'+ val.imagePath +'" width="180" height="122">'+
										'</a>'+
									'</div>'+
									'<div class="product_wz"> <a href="" target="_blank">'+ val.name +'</a></div></div>';
						
						$(ht).appendTo($page.find(".clist_con"));
					});
				}
			},
			error: function(err) {}
		});
	})();
	
	</script>
</body>
</html>