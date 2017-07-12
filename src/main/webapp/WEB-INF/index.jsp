<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
	<meta name="keywords" content="">
    <meta name="description" content="">
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/slideBox/jquery.slideBox.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
	
</head>

<body class="body-portal">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="con_one">
			<div class="slideBox news">
				<ul class="items">
					<c:forEach var="photonews" items="${photonewsList}">
						<li style="width: 655px; height: 295px;">
							<a href="${ctx}/news/${photonews.path}" title="${photonews.title}" target="_blank">
								<img src="${ctx}${photonews.imagePath}" style="width: 100%; height: 100%:">
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			
			<div class="announce">
				<a href="${ctx}/newslist?type=2" target="_blank"><img src="img/announce.jpg" width="96" height="39"></a>
				<div class="article_con" id="con_xw" style="overflow: hidden; display: block;">
					<ul>
						<c:forEach var="announce" items="${announceList}">
							<li>
								<a href="${ctx}/news/${announce.path}" target="_blank">
								<c:if test="${fn:length(announce.title) > 32}">
										${fn:substring(announce.title, 0, 32)}...
									</c:if>
									<c:if test="${fn:length(announce.title) <= 32}">
										${announce.title}
									</c:if>
								</a>
								[<fmt:formatDate value="${announce.updateTime}" pattern="MM-dd"/>]
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		<div class="con_two">
			<div class="con_two_left">
				<div class="policy border_top">
					<a href="${ctx}/newslist?type=3" target="_blank"><img src="img/policy.jpg" width="96" height="39"></a>
					<div class="article_con" style="overflow: hidden; display: block;">
						<ul>
							<c:forEach var="policy" items="${policyList}">
								<li>
									<a href="${ctx}/news/${policy.path}" target="_blank">
										<c:if test="${fn:length(policy.title) > 38}">
											${fn:substring(policy.title, 0, 38)}...
										</c:if>
										<c:if test="${fn:length(policy.title) <= 38}">
											${policy.title}
										</c:if>
									</a>
									<span>[<fmt:formatDate value="${policy.updateTime}" pattern="MM-dd"/>]</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="industry border_top" style="margin-top: 30px;">
					<a href="${ctx}/newslist?type=4" target="_blank"><img src="img/industry.jpg" width="96" height="39"></a>
					<div class="article_con" style="overflow: hidden; display: block;">
						<ul>
							<c:forEach var="overview" items="${overviewList}">
								<li>
									<a href="${ctx}/news/${overview.path}" target="_blank">
										<c:if test="${fn:length(overview.title) > 38}">
											${fn:substring(overview.title, 0, 38)}...
										</c:if>
										<c:if test="${fn:length(overview.title) <= 38}">
											${overview.title}
										</c:if>
									</a>
									<span>[<fmt:formatDate value="${overview.updateTime}" pattern="MM-dd"/>]</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="con_two_right">
				<div class="common_title">
                    <dl>
                        <dt><a href="index_enterprise" target="_blank" class="ct_curr">企业宣传</a></dt>
                        <dd><a href="index_enterprise" target="_blank">更多&gt;&gt;</a></dd>
                    </dl>
                </div>
				<div class="enterprise">
					<ul id="list">
						<c:forEach var="enterprise" items="${enterpriseList}">
						<li>
							<button type="button" class="btn btn-outline btn-default" style="width: 100%;">
								<div style="display: table-cell; vertical-align: middle;">
									<img src="${ctx}/api/avatar/${enterprise.avatar}" alt="" width="48" height="48">
								</div>
								<div style="display: table-cell; vertical-align: middle; padding-left: 15px; text-align: left;">
									<div>
										<c:if test="${fn:length(enterprise.name) > 11}">
											${fn:substring(enterprise.name, 0, 11)}...
										</c:if>
										<c:if test="${fn:length(enterprise.name) <= 11}">
											${enterprise.name}
										</c:if>
									</div>
									<div style="font-size: 12px;">${enterprise.industry.name}</div>
								</div>
							</button>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		
		<div class="con_three">
			<div class="con_three_left">
				<div class="monitor">
					<dl>
	                 	<dt>
	                 		<a href="javascript: void(0)" target="_blank">
	                 			<img src="img/monitor.jpg" width="96" height="39">
	                 		</a>
	                 	</dt>
	                    <dd>
							<a target="_blank" href="javascript: void(0);" id="target-4" onmouseover="getChart('target-4')" class="">实现税金总额</a>
							<a target="_blank" href="javascript: void(0);" id="target-3" onmouseover="getChart('target-3')" class="">利润总额</a>
							<a target="_blank" href="javascript: void(0);" id="target-2" onmouseover="getChart('target-2')" class="">用电量</a>
							<a target="_blank" href="javascript: void(0);" id="target-1" onmouseover="getChart('target-1')" class="curr">主营业务收入</a>
	                    </dd>
		                <div style="clear: both;"></div>
	                </dl>
	                <div class="monitor_target" style="display: block;width: 655px; height: 400px;">
						
					</div>
				</div>
				
				<div class="assist border_top">
					<a href="#" target="_blank"><img src="img/assist.jpg" width="96" height="39"></a>
					<div class="article_con" style="overflow: hidden; display: block;">
						<ul style="padding-top:5px;">
						</ul>
					</div>
				</div>
			</div>
			
			<div class="con_three_right">
				<div class="common_title">
                    <dl>
                        <dt><a href="index_product" target="_blank" class="ct_curr">产品宣传</a></dt>
                        <dd><a href="index_product" target="_blank">更多&gt;&gt;</a></dd>
                    </dl>
                </div>
				<div class="product" style="height: 600px;">
					<ul id="list">
						<c:forEach var="product" items="${productList}">
							<li>
								<a href="" target="_blank">
									<img src="${ctx}${product.imagePath}" style="width: 100%; height: 200px;">
									<div style="background-color: #e8e8e8; height: 28px; padding: 5px;">${product.name}</div>
								</a>
								
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery-doT.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/slideBox/jquery.slideBox.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript">
	var $page = $(".body-portal");
	;(function() {
		
		// 图片新闻
		$page.find(".slideBox").slideBox({
			duration: 1,		//滚动持续时间，单位：秒
			easing: 'linear',	//swing,linear滚动特效
			delay: 3,			//滚动延迟时间，单位：秒
			clickBarRadius: 1
		});
		
		//帮扶平台
		$.ajax({
			url: "${ctx}/api/appeal/list",
			success: function(ret) {
				if (ret.code == 0 && ret.data != null) {
					var len = ret.data.length >= 5 ? 5 : ret.data.length;
					for (var i = 0; i < len; i++){
						var val = ret.data[i];
						var ht = '<li style="position:static;"><a href="${ctx}/'+ val.path +'" target="_blank">'+ val.title +'</a>['+ new Date(val.createTime).Format("yyyy-MM-dd") +'] </li>';
						$(ht).appendTo($page.find('.assist ul'));
					}
				}
			},
			error: function(err) {}
		});
		
		//监测平台
		getChart('target-1');
		
	})();
	
	function getChart(target) {
		$("#" + target).closest("dd").find("a").removeClass("curr");
		$("#" + target).addClass("curr");
		
		var now = new Date();
		now.setYear(now.getFullYear() - 1);
		var month = now.getMonth();
		var monthlyStart = now.getFullYear() + "-" + (month < 10 ? "0" + month : month);
		now.setDate(1);
		now.setMonth(now.getMonth());
		now.setYear(now.getFullYear() + 1);
		month = now.getMonth();
		var monthlyEnd = now.getFullYear() + "-" + (month < 10 ? "0" + month : month);
		
		$.ajax({
			url: "${ctx}/api/target/listRange",
			data: {monthlyStart: monthlyStart, monthlyEnd: monthlyEnd},
			success: function(ret) {
				if (ret.code == 0 && ret.data != null) {
					// 基于准备好的dom，初始化echarts图表
			        var myChart = echarts.init($page.find('.monitor_target')[0]); 
			        var xAxisArr = [];
					var arr1 = [];
					var arr2 = [];
					var arr3 = [];
					
					var legendName = "";
					var unit = "";
					
					$.each(ret.data, function(key, val) {
						xAxisArr.push(val.monthly);
						switch (target) {
						case 'target-1':
							legendName = '主营业务收入'; 
							unit = "万元";	
							
							var mainBusiness = val.target_current != null ? val.target_current.mainBusiness : '-';
							var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : "-";
							var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : "-";
							arr1.push(mainBusiness);
							arr2.push(mainBusiness_yearGrowth);
							arr3.push(mainBusiness_monthGrowth);
							
							break;
						case 'target-2':	
							legendName = '用电量'; 
							unit = "万度";		
							
							var electricity = val.target_current != null ? val.target_current.electricity : "-";
							var electricity_yearGrowth = val.electricity_yearGrowth != null && val.electricity_yearGrowth != "" ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : "-";
							var electricity_monthGrowth = val.electricity_monthGrowth != null && val.electricity_monthGrowth != "" ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : "-";
							arr1.push(electricity);
							arr2.push(parseFloat(electricity_yearGrowth));
							arr3.push(parseFloat(electricity_monthGrowth));
							
							break;
						case 'target-3':	
							legendName = '利润总额'; 
							unit = "万元";		
							
							var profit = val.target_current != null ? val.target_current.profit : "-";
							var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : "-";
							var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : "-";
							arr1.push(profit);
							arr2.push(parseFloat(profit_yearGrowth));
							arr3.push(parseFloat(profit_monthGrowth));
							
							break;
						case 'target-4':	
							legendName = '实现税金总额'; 
							unit = "万元";	
							
							var tax = val.target_current != null ? val.target_current.tax : "-";
							var tax_yearGrowth = val.tax_yearGrowth != null && val.tax_yearGrowth != "" ? (parseFloat(val.tax_yearGrowth)*100).toFixed(2) : "-";
							var tax_monthGrowth = val.tax_monthGrowth != null && val.tax_monthGrowth != "" ? (parseFloat(val.tax_monthGrowth)*100).toFixed(2) : "-";
							arr1.push(tax);
							arr2.push(parseFloat(tax_yearGrowth));
							arr3.push(parseFloat(tax_monthGrowth));
							
							break;
						}
					});
					
					
					var option = {
						    tooltip : {
						        trigger: 'axis'
						    },
						    toolbox: {
						        show : true,
						        feature : {
						            mark : {show: true},
						            dataView : {show: true, readOnly: false},
						            magicType: {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    calculable : true,
						    legend: {
						        data: ['本月止' +　legendName, '同比增幅', '环比增幅']
						    },
						    xAxis : [{
						            type : 'category',
						            data : xAxisArr
						        }
						    ],
						    yAxis : [{
						            type : 'value',
						            name : legendName,
						            axisLabel : {
						                formatter: '{value} ' + unit
						            }
						        }, {
						            type : 'value',
						            name : '增幅',
						            axisLabel : {
						                formatter: '{value} %'
						            }
						        }
						    ],
						    series : [{
						            name: '本月止' + legendName,  //这里的name要和legend里的data一致
						            type: 'bar',
						            data: arr1
						        }, {
						            name: '同比增幅',
						            type: 'line',
						            yAxisIndex: 1,
						            data: arr2
						        }, {
						            name: '环比增幅',
						            type: 'line',
						            yAxisIndex: 1,
						            data: arr3
						        }
						    ]
						};
			    	// 为echarts对象加载数据 
			        myChart.setOption(option);
				}
			},
			error: function(err) {}
		});
	}
	</script>
	
</body>
</html>