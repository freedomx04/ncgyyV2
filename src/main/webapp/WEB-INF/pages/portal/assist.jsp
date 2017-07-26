<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/paging/paging.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
</head>
<body class="body-assist">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav">
			<span>
				<a href="index">首页</a>&nbsp;&gt;&nbsp;
				<a href="assistlist">帮扶平台</a>
		    </span>
		</div>
		
		<div class="clist">
			<div class="clist_r_title">
				<span>帮扶平台</span>
			</div>
			<div class="clist_con" style="min-height: 450px;">
				<ul>
				</ul>
			</div>
			
			<div style="clear:both;"></div>
			<div id="pageTool" style="margin-bottom: 20px;"></div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery-doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	;(function() {
		var $page = $(".body-assist");
		var pageSize = 25;
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_assist").addClass("nav_curr");
		
		$page.find('#pageTool').Paging({
			pagesize: pageSize, 
			count: '${count}', 
			callback: function(page, size, count) {
				getData(page -1 , size);
			}
		});
		
		getData(0, pageSize);
		
		function getData(page, size) {
			$.ajax({
				url: "${ctx}/api/appeal/listPaging",
				data: {
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0) {
						$page.find(".clist_con ul").html("");
						
						$.each(ret.data.content, function(key, val) {
							var title = val.title.length > 80 ? (val.title.substr(0, 80) + "...") : val.title;
							
							var ht = '<li>'+
								'<a href="assist?appealId='+ val.id +'" target="_blank" style="width: 600px;">'+ title +'</a>'+
								'<span><a href="" target="_blank">'+ new Date(val.createTime).Format("yyyy-MM-dd") +'</a></span>'+
								'</li>';
							
							$(ht).appendTo($page.find(".clist_con ul"));
						});
					}
				},
				error: function(err) {}
			});
		}
	})();
	
	</script>
</body>
</html>