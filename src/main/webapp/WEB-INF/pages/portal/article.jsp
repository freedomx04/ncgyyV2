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
<body class="body-article">
	<div class="header">
	</div>
	
	<div class="mnav" style="border-bottom:1px #ccc solid;">
		<span>
			<a href="index">首页</a>&nbsp;&gt;&nbsp;
			<a href="index_article?type=1">新闻动态</a>
			&nbsp;&gt;&nbsp;
	    </span>
	</div>
	
	<div class="clist">
		<table width="100%" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td width="217" bgcolor="fafafa" valign="top">
						<div class="ctree">
							<div class="ctree_title"><h1>新闻动态</h1></div>
								<dl>
									<dt><a href="index_article?type=1" type="1">图片新闻</a></dt>
									<dt><a href="index_article?type=2" type="2">公示公告</a></dt>
									<dt><a href="index_article?type=3" type="3">政策法规</a></dt>
									<dt><a href="index_article?type=4" type="4">工业信息</a></dt>
								</dl>
							<div style="height:30px;">&nbsp;</div>

						</div>
					</td>
					<td width="40">&nbsp;</td>
					<td valign="top">
						<div class="clist_r_title">
							<span></span>
						</div>
						<div class="clist_con" style="min-height: 600px;">
							<ul></ul>
                       		<div class="pnews_con">
                       		</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
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
	var $page = $(".body-article");
	;(function() {
		var type = $k.util.getRequestParam("type");
		var pageSize = 2;
		
		$page.find(".header").html($(".template.Top").doT());
		$page.find(".footer").append($(".template.Footer").doT());
		
		$page.find(".ctree").removeClass("ctree_curr");
		$page.find(".ctree").find("[type='"+ type +"']").addClass("ctree_curr");
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu").find("a[type='"+ type +"']").addClass("nav_curr");
		
		switch (type) {
		case '1':
			$page.find(".clist_r_title span").html("图片新闻");
			$page.find(".mnav span").append('<a href="index_article?type=1">图片新闻</a>');
			break;
		case '2':
			$page.find(".clist_r_title span").html("公示公告");
			$page.find(".mnav span").append('<a href="index_article?type=2">公示公告</a>');
			break;
		case '3':
			$page.find(".clist_r_title span").html("政策法规");
			$page.find(".mnav span").append('<a href="index_article?type=3">政策法规</a>');
			break;
		case '4':
			$page.find(".clist_r_title span").html("工业信息");
			$page.find(".mnav span").append('<a href="index_article?type=4">工业信息</a>');
			break;
		}
		$page.find('#pageTool').Paging({
			pagesize: pageSize, 
			count: '${count}', 
			callback: function(page, size, count) {
				getData(type, page-1, size);
			}
		});
		getData(type, 0, pageSize);
		
		function getData(type, page, size) {
			$.ajax({
				url: "${ctx}/api/article/listPage",
				data: {
					type: type,
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0) {
						$page.find(".clist_con ul").html("");
						$.each(ret.data.content, function(key, val) {
							var title = val.title.length > 45 ? (val.title.substr(0, 45) + "...") : val.title;
							var ht = '<li>'+
							'<a href="index_articleContent/'+ val.path +'" target="_blank" style="width: 600px;">'+ title +'</a>'+
							'<span><a href="index_articleContent/'+ val.path +'" target="_blank">'+ new Date(val.createTime).Format("yyyy-MM-dd") +'</a></span>'+
							'</li>';
							var $obj = $page.find(".clist_con ul");
							if (type == 1) {
								ht = '<div class="pnews">'+
										'<div class="pnews_ul">'+ 
											'<a href="index_articleContent/'+ val.path +'" target="_blank">'+
												'<img border="0" src="${ctx}'+ (val.imagePath || "") +'" width="180" height="122">'+
											'</a>'+
										'</div>'+
										'<div class="pnews_wz"> <a href="index_articleContent/'+ val.path +'" target="_blank"> '+ val.title +'</a></div>'+
									'</div>';
								$obj.hide();
								$obj = $page.find(".clist_con .pnews_con");
							}
							
							$(ht).appendTo($obj);
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