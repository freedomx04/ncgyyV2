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
<body class="body-article">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav" style="border-bottom:1px #ccc solid;">
			<span>
				<a href="index">首页</a>&nbsp;&gt;&nbsp;
				<a href="newslist?type=1">新闻动态</a>
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
										<dt><a href="newslist?type=1" type="1">图片新闻</a></dt>
										<dt><a href="newslist?type=2" type="2">公示公告</a></dt>
										<dt><a href="newslist?type=3" type="3">政策法规</a></dt>
										<dt><a href="newslist?type=4" type="4">工业信息</a></dt>
									</dl>
								<div style="height:30px;">&nbsp;</div>
							</div>
						</td>
						<td width="40">&nbsp;</td>
						<td valign="top">
							<div class="clist_r_title">
								<span></span>
							</div>
							<div class="clist_con" style="min-height: 450px;">
								<ul></ul>
		                      	<div class="pnews_con"></div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="pageTool" style="margin: 20px; clear:both;"></div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/paging/paging.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.lazyload.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	
	<script>
	var $page = $(".body-article");
	;(function() {
		
		var type = Url.queryString("type");
		var pagesize = 20;
		
		$page.find(".ctree").removeClass("ctree_curr");
		$page.find(".ctree").find("[type='"+ type +"']").addClass("ctree_curr");
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu").find("a[type='"+ type +"']").addClass("nav_curr");
		
		var typeName = getTypeName(type);
		$page.find(".clist_r_title span").html(typeName);
		$page.find(".mnav span").append('<a href="newslist?type=1">'+ typeName +'</a>');
		
		
		$page.find('#pageTool').Paging({
			pagesize: pagesize, 
			count: '${count}', 
			callback: function(page, size, count) {
				getData(type, page-1, size);
			}
		});
		getData(type, 0, pagesize);
		
		function getData(type, page, size) {
			$.ajax({
				url: "${ctx}/api/article/listPaging",
				data: {
					type: type,
					page: page,
					size: size
				},
				success: function(ret) {
					if (ret.code == 0 && ret.data.length != 0) {
						$page.find(".clist_con ul").html("");
						$.each(ret.data.content, function(key, val) {
							var title = val.title.length > 40 ? (val.title.substr(0, 40) + "...") : val.title;
							var ht = '<li>'+
								'<a href="news/'+ val.path +'" target="_blank" style="width: 600px;">'+ title +'</a>'+
								'<span><a href="news/'+ val.path +'" target="_blank">'+ new Date(val.createTime).Format("yyyy-MM-dd") +'</a></span>'+
								'</li>';
								
							var $obj = $page.find(".clist_con ul");
							if (type == 1) {
								ht = '<div class="pnews">'+
										'<div class="pnews_ul">'+ 
										'<a href="news/'+ val.path +'" target="_blank">'+
										'<img border="0" data-original="${ctx}'+ (val.imagePath || "") +'" width="180" height="122">'+
										'</a>'+
										'</div>'+
										'<div class="pnews_wz"> <a href="news/'+ val.path +'" target="_blank"> '+ val.title +'</a></div>'+
									'</div>';
								$obj.hide();
								$obj = $page.find(".clist_con .pnews_con");
							}
							
							$(ht).appendTo($obj);
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
		
		function getTypeName(type) {
			var typeName = '';
			switch (type) {
			case '1':
				typeName = '图片新闻';
				break;
			case '2':
				typeName = '公示公告';
				break;
			case '3':
				typeName = '政策法规';
				break;
			case '4':
				typeName = '工业信息';
				break;
			}
			return typeName;
		}
	})();
	
	</script>
</body>
</html>