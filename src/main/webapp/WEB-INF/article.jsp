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
			<a href="/index">首页</a>&nbsp;&gt;&nbsp;
			<a href="/article">新闻动态</a>&nbsp;&gt;&nbsp;
			<a href="">时政要闻</a>   &gt;&nbsp;正文
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
									<dt><a href="" type="1">图片新闻</a></dt>
									<dt><a class="ctree_curr" href="" type="2">公示公告</a></dt>
									<dt><a href="" type="3">政策法规</a></dt>
									<dt><a href="" type="4">工业信息</a></dt>
								</dl>
							<div style="height:30px;">&nbsp;</div>

						</div>
					</td>
					<td width="40">&nbsp;</td>
					<td valign="top">
						<div class="clist_r_title">
							<span>时政要闻 </span>
						</div>
						<div class="clist_con" style="min-height: 600px;">
							<ul> 
								<li>
								<a href="../../n1146290/n1146392/c5711525/content.html" target="_blank">中国政府网：“国务院大事我知道”网上答题</a>
								<span><a href="../../n1146290/n1146392/c5711525/content.html" target="_blank">2017-07-03</a></span>
								</li>
								
                                <li>
								<a href="../../n1146290/n1146392/c5710829/content.html" target="_blank">国务院办公厅关于印发全国深化简政放权放管结合优化服务改革电视电话会议重...</a>
								<span><a href="../../n1146290/n1146392/c5710829/content.html" target="_blank">2017-07-03</a></span>
								</li>
								
								<li>
								<a href="../../n1146290/n1146392/c5710861/content.html" target="_blank">马凯出席2017制造强国建设专家论坛并致辞</a>
								<span><a href="../../n1146290/n1146392/c5710861/content.html" target="_blank">2017-07-03</a></span>
								</li>
                       		</ul>
                       		<ul> 
								<li>
								<a href="../../n1146290/n1146392/c5711525/content.html" target="_blank">中国政府网：“国务院大事我知道”网上答题</a>
								<span><a href="../../n1146290/n1146392/c5711525/content.html" target="_blank">2017-07-03</a></span>
								</li>
								
                                <li>
								<a href="../../n1146290/n1146392/c5710829/content.html" target="_blank">国务院办公厅关于印发全国深化简政放权放管结合优化服务改革电视电话会议重...</a>
								<span><a href="../../n1146290/n1146392/c5710829/content.html" target="_blank">2017-07-03</a></span>
								</li>
								
								<li>
								<a href="../../n1146290/n1146392/c5710861/content.html" target="_blank">马凯出席2017制造强国建设专家论坛并致辞</a>
								<span><a href="../../n1146290/n1146392/c5710861/content.html" target="_blank">2017-07-03</a></span>
								</li>
                       		</ul>
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
		
		$page.find(".header").html($(".template.Top").doT());
		$page.find(".footer").append($(".template.Footer").doT());
		
		$page.find(".ctree").removeClass("ctree_curr");
		$page.find("[type='"+ type +"']").addClass("ctree_curr");
		switch (type) {
		case '1':
			$page.find(".clist_r_title").html("图片新闻");
			break;
		case '2':
			$page.find(".clist_r_title").html("公示公告");
			break;
		case '3':
			$page.find(".clist_r_title").html("政策法规");
			break;
		case '4':
			$page.find(".clist_r_title").html("工业信息");
			break;
		}
		
		$page.find('#pageTool').Paging({
			pagesize: 10, 
			count: 100, 
			callback: function(page, size, count) {
				
			}
		});
		
		$.ajax({
			url: "${ctx}/api/article/get",
			data: {articleId: 1},
			success: function(ret) {
				if (ret.code == 0) {
					var len = ret.data.length >= 5 ? 5 : ret.data.length;
					for (var i = 0; i < len; i++){
						var val = ret.data[i];
						var ht = '<li style="width: 655px;height: 295px;">'+
									'<a href="" title="'+ val.title +'" target="_blank">'+
										'<img src="${ctx}'+ val.imagePath +'">'+
									'</a>'+
								'</li>';
						$(ht).appendTo($page.find(".slideBox .items"));
					}
				}
			},
			error: function(err) {}
		});
		
	})();
	
	</script>
</body>
</html>