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

<body class="body-enterprise">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav" style="border-bottom:1px #ccc solid;">
			<span>
				<a href="index">首页</a>&nbsp;&gt;&nbsp;
				<a href="enterpriselist">企业宣传</a>
		    </span>
		</div>
		
		<div class="clist">
			<div class="clist_r_title">
				<span>企业宣传</span>
			</div>
			<div class="clist_con" style="min-height: 450px;">
				<ul>
				</ul>
			</div>
			
			<div style="clear:both;"></div>
			<div id="pageTool" style="margin: 20px;"></div>
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
		var $page = $(".body-enterprise");
		var pageSize = 25;
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_enterprise").addClass("nav_curr");
		
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
				url: "${ctx}/api/enterprise/listPaging",
				data: {
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0) {
						$page.find(".clist_con ul").html("");
						
						$.each(ret.data.content, function(key, val) {
							var name = val.name.length > 80 ? (val.name.substr(0, 80) + "...") : val.name;
							
							var ht = '<li style="height: 45px;">'+
										'<img src="api/avatar/'+ val.avatar +'" width="35" height="35" style="margin: 5px 0;">'+
										'<a href="enterprise?enterpriseId='+ val.id +'" target="_blank" style="line-height: 45px; display: inline-block; padding-left: 25px;">'+ name +'</a>'+
										'<span><a href="" target="_blank">'+ val.industry.name +'</a></span>'+
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