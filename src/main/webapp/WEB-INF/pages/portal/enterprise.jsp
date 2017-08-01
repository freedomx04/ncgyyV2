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
	
	<style type="text/css">
	.epList li {
	    height: 160px;
	    padding: 15px 350px 20px 20px;
	    background-color: #fff;
	    margin-bottom: 15px;
	    -webkit-transition: all .3s ease-in;
	    -moz-transition: all .3s ease-in;
	    -ms-transition: all .3s ease-in;
	    -o-transition: all .3s ease-in;
	    transition: all .3s ease-in;
	    position: relative;
	}
	.epName {
	    font-size: 16px;
	    color: #333;
	}
	.product {
	    height: 20px;
	    overflow: hidden;
	    padding-top: 12px;
	}
	.product span {
	    padding: 0px 6px;
	    height: 20px;
	    background-color: #f6f6f6;
	    float: left;
	    font-size: 12px;
	    line-height: 20px;
	    color: #999;
	    border-radius: 4px;
	    margin-right: 10px;
	    text-align: center;
	    overflow: hidden;
	}
	.epInfos {
	    line-height: 25px;
	    color: #999;
	    margin: 12px 0px 0px 0px;
	    max-height: 50px;
	    overflow: hidden;
	}
	.epInfos i, .epContact i {
	    color: #333;
	}
	.epContact {
	    line-height: 25px;
	    color: #999;
	    margin: 0px 0px 10px 0px;
	}
	.epInfos i, .epContact i {
	    color: #333;
	    font-style: normal;
	}
	.listImg {
	    position: absolute;
	    top: 25px;
	    right: 20px;
	}
	.listImg img {
	    float: right;
	    width: 130px;
	    height: 130px;
	    margin-left: 10px;
	    padding: 5px;
	    border: #e4e4e4 solid 1px;
	}
	
	.search-wrapper {
	    height: 70px;
	    padding-left: 20px;
	    overflow: hidden;
	    background-color: #fff;
	    position: relative;
	}
	.search-wrapper input[type="text"] {
	    width: 250px;
	    height: 35px;
	    border: #e4e4e4 1px solid;
	    border-right: none;
	    padding: 0px 5px;
	    outline: none;
	    float: left;
	    margin-top: 17px;
	    margin-bottom: 10px;
	}
	.search-wrapper input[type="button"] {
	    width: 50px;
	    height: 37px;
	    background-color: #e4e4e4;
	    border: none;
	    position: absolute;
	    top: 17px;
	    color: #666;
	    cursor: pointer;
	    float: left;
	}
	</style>
</head>

<body class="body-enterprise">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav">
			<span>
				<a href="index">首页</a>&nbsp;&gt;&nbsp;
				<a href="enterpriselist">企业宣传</a>
		    </span>
		</div>
		
		
		<div style="background-color: #f2f2f2;">
			<div class="clist_r_title" style="background-color: #ffffff;margin: 0; padding-left: 20px; padding-top: 20px;">
				<span>企业宣传</span>
			</div>
			<div class="search-wrapper">
			    <input type="text" name="keywords" id="keywords" value="" placeholder="企业名称">
			    <input type="button" id="search-btn" value="搜索">
			</div>
			
			<div style="height: 20px;background-color: #F2F2F2;"></div>
			<div style="min-height: 450px;">
				<ul class="epList">
				</ul>
			</div>
			
			<div style="clear:both;"></div>
			<div id="pageTool" style="padding: 15px;"></div>
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
		var pageSize = 20;
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_enterprise").addClass("nav_curr");
		
		$page.find('#pageTool').Paging({
			pagesize: pageSize, 
			count: '${count}', 
			callback: function(page, size, count) {
				getData("${ctx}/api/enterprise/listPaging", {page: page-1, size: size});
			}
		});
		
		getData("${ctx}/api/enterprise/listPaging", { page: 0, size: pageSize });
		
		$page.on("click", "#search-btn", function() {
			getData("${ctx}/api/enterprise/search", {input: $page.find("#keywords").val()});
		});
		
		function getData(url, data) {
			$.ajax({
				url: url,
				data: data,
				success: function(ret) {
					if (ret.code == 0) {
						$page.find(".epList").html("");
						var data;
						if (url.indexOf("search") > 0) {
							data = ret.data;
						} else {
							data = ret.data.content;
						}
						$.each(data, function(key, val) {
							var name = val.name.length > 80 ? (val.name.substr(0, 80) + "...") : val.name;
							
							var ht = '<li id='+ val.id +'>'+
										'<a class="epName" href="${ctx}/enterprise?enterpriseId=' + val.id + '" title="" target="_blank">'+ name +'</a>'+
				                        '<p class="product">'+
				                            '<span>'+ (val.mainProduct || "暂无信息") +'</span>'+
				                        '</p>'+
				                        '<p class="epInfos">'+
				                            '<i>公司介绍：</i>'+ (val.introduction || "暂无信息") +'</p>'+
				                        '<p class="epContact">'+
				                            '<i>地址：</i>'+ (val.address || "暂无信息") +'</p>' + 
			                            '<p class="listImg">'+
				                        '</p>'
									'</li>';
							$(ht).appendTo($page.find(".epList"));
							
							if (val.productList.length != 0) {
			            		for (var i = 0; i < 2 && i < val.productList.length; i++) {
			            			var vl = val.productList[i];
			            			var proName = vl.name.length > 20 ? (vl.name.substr(0, 10) + "...") : vl.name;
					            	$('<a href="${ctx}/product?productId='+ vl.id +'" title="'+ proName +'" target="_blank"><img data-original="" width="130" height="130" alt="" title="'+ proName +'" src="${ctx}'+ vl.imagePath +'" style="display: block;"></a>').appendTo($("#" + val.id).find(".listImg"));
			            		}
							}
							
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