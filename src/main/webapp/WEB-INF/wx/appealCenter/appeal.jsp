<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>诉求中心</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	
</head>

<body class="wx-appealCenter-info">
	<div class="weui_tab appealCenter-tab">
		<div class="weui_tab_nav" style="padding: 10px 20px;">
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="0">诉求列表</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="1">诉求分类</a>
			<a href="javascript:;" class="weui_navbar_item weui_nav_green" data-index="2">诉求预警</a>
		</div>
		
		<div>
			<div class="weui_tab_bd_item">
				<div class="weui_cells weui_cells_access" style="margin-top: 0;">
					<c:if test="${empty appealList}">
						<div class="weui-footer" style="padding: 10px;"><p>暂无数据</p></div>
					</c:if>
					<c:forEach var="appeal" items="${appealList}">
						<c:if test="${appeal.status != 0}">
						<a class="weui_cell appeal-info" href="javascript:;" data-appeal-id="${appeal.id}">
			                <div class="weui_cell_hd">
			                	<p style="font-size: 16px; margin-bottom: 8px;">
									<c:if test="${fn:length(appeal.title) > 30}">
										${fn:substring(appeal.title, 0, 30)}...
									</c:if>
									<c:if test="${fn:length(appeal.title) <= 30}">
										${appeal.title}
									</c:if>
								</p>
								<p style="font-size: 13px; color: #999"><fmt:formatDate value="${appeal.createTime}" pattern="yyyy-MM-dd HH:mm"/></p>
			                </div>
			                <div class="weui_cell_bd weui_cell_primary"><p></p></div>
			                <div style="color: #999;">
			                	<c:if test="${fn:length(appeal.appealType.name) > 8}">
									${fn:substring(appeal.appealType.name, 0, 8)}...
								</c:if>
								<c:if test="${fn:length(appeal.appealType.name) <= 8}">
									${appeal.appealType.name}
								</c:if>
			                	<span class="weui-badge" style="margin-left: 5px; background-color: #04be02;" data-status="${appeal.status}"></span>
			                </div>
            			</a>
            			</c:if>
					</c:forEach>
				</div>
			</div>
			
			<div class="weui_tab_bd_item" style="width:100%;">
				<div class="weui_cells_title">诉求分类分布图</div>
				<div id="appealType-chart-container" style="margin-top: 10px; width: 100%; height: 300px;"></div>
				
				<div class="weui_cells_title" >诉求分类状态统计图</div>
				<div id="appealStatus-chart-container" style="margin-top: 10px; width: 100%; height:450px;"></div>
			</div>
			
			<div class="weui_tab_bd_item">
				<div class="weui_cells_title">诉求预警提醒</div>
				<div id="appeal-warning-chart-container" style="margin-top: 10px; width: 100%; height: 300px;"></div>
			</div>
			
		</div>
		
	</div>

	<script type="text/javascript">
	$(function() {
		var $page = $('.wx-appealCenter-info');
		var userId = Url.queryString("userId");
		var defaultIndex = Url.queryString("index");
		if (!defaultIndex) {
			defaultIndex = 0;
		}
		$page.find('.appealCenter-tab').tab({
			defaultIndex: defaultIndex,
			activeClass: 'bg_green'
		});
		
		$.each($page.find(".weui-badge"), function(k, y) {
			var status = $page.find(".weui-badge").eq(k).data('status');
			$page.find(".weui-badge").eq(k).text($k.util.getAppealStatus(status));
		});
		
		$page.find('#appealType-chart-container').css( 'width', $(".weui_tab").width());
		$page.find('#appealStatus-chart-container').css( 'width', $(".weui_tab").width());
		$page.find('#appeal-warning-chart-container').css( 'width', $(".weui_tab").width());
		
		if (defaultIndex == 1) {
			getAppealTypeChart($page.find("#appealType-chart-container"));
			getAppealStatusChart($page.find("#appealStatus-chart-container"));
		} else {
			getWarnigChart($page.find("#appeal-warning-chart-container"));
		}
		
		
		$page
		.on('click', '.appeal-info', function() {
			var appealId = $(this).data('appealId');
			window.location = '${ctx}/wx/appealCenter/appealinfo?appealId=' + appealId + "&role=read&userId=" + userId;
		})
		.on('click', '.weui_navbar_item', function() {
			var index = $(this).data('index');
			Url.updateSearchParam("index", index);
			if (index == 1) {
				getAppealTypeChart($page.find("#appealType-chart-container"));
				getAppealStatusChart($page.find("#appealStatus-chart-container"));
			} else {
				getWarnigChart($page.find("#appeal-warning-chart-container"));
			}
		});
		
		
		function getAppealTypeChart($chartContainer) {
			var myChart = echarts.init($chartContainer[0]);
			$.ajax({
				url: "${ctx}/api/appeal/getAppealCountByType",
				type: "POST",
				success: function(ret) {
					if (ret.code == 0) {
						var seriesData = [];
						var legendData = [];
						
						$.each(ret.data, function(key, val) {
							seriesData.push({name: val.appealTypeName, type: 'pie', value: val.count});
							legendData.push(val.appealTypeName);
			            });
						
						var option = {
							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },
							    legend: {
							        orient : 'vertical',
							        x : 'left',
							        data: legendData
							    },
							    toolbox: {
							        show : false
							    },
							    calculable : true,
							    series : [
					               {
					                   name:'诉求分类',
					                   type:'pie',
					                   radius : '55%',
					                   center: ['50%', '60%'],
					                   data: seriesData
					               }
					           ]
							};
						myChart.setOption(option);
					}
				},
				error: function(err) {}
			});
		}
		
		function getAppealStatusChart($chartContainer){
			var myChart = echarts.init($chartContainer[0]);
			$.ajax({
				url: "${ctx}/api/appeal/appealStatusCount",
				type: "POST",
				success: function(ret) {
					if (ret.code == 0) {
						var seriesData = [];
						var legendData = [];
						
						$.each(ret.data, function(key, val) {
							var statusData = [];
							$.each(val, function(ky, vl) {
								//去掉新增的状态
								if(ky != 0) {
									statusData.push(vl.length);
								}
							})
							seriesData.push({name: key, type: 'bar', stack: '诉求', data: statusData});
							legendData.push(key);
			            });
						
						var option = {
							    tooltip : {
							        trigger: 'axis'
							    },
							    legend: {
							    	orient : 'vertical',
							    	x : 'right',
							        data: legendData
							    },
							    toolbox: {
							        show : false
							    },
							    calculable : true,
							    grid: {y: 70, y2:30, x2:20},
							    xAxis : [
							        {
							            type : 'category',
							            data : ['待派发', '待处理', '处理中', '待确认', '办结', '驳回']
							        },
							        {
							            type : 'category',
							            axisLine: {show:false},
							            axisTick: {show:false},
							            axisLabel: {show:false},
							            splitArea: {show:false},
							            splitLine: {show:false},
							            data : ['待派发', '待处理', '处理中', '待确认', '办结', '驳回']
							        }
							    ],
							    yAxis : [
							        {
							            type : 'value',
							            axisLabel:{formatter:'{value} 条'}
							        }
							    ],
							    series : seriesData
							};
						myChart.setOption(option);
					}
				},
				error: function(err) {}
			});
		}
		
		function getWarnigChart($chartContainer) {
			var myChart = echarts.init($chartContainer[0]);
			
			$.ajax({
				url: "${ctx}/api/appeal/overAppealDays",
				type: "POST",
				success: function(ret) {
					if (ret.code == 0) {
						
						var appealTypeName = [];
						var acceptDays = [];
						var handleDays = [];
						
						$.each(ret.data, function(key, val) {
							appealTypeName.push(val.appealTypeName);
							acceptDays.push(val.acceptDays.length);
							handleDays.push(val.handleDays.length);
			            });
						
						var option = {
							    tooltip : {
							        trigger: 'axis'
							    },
							    legend: {
							        data:['超过受理天数','超过处理天数']
							    },
							    toolbox: {
							        show : false
							    },
							    calculable : false,
							    xAxis : [
							        {
							            type : 'category',
							            data : appealTypeName
							        }
							    ],
							    yAxis : [
							        {
							            type : 'value'
							        }
							    ],
							    series : [
							        {
							            name: '超过受理天数',
							            type: 'bar',
							            data: acceptDays
							        },
							        {
							            name: '超过处理天数',
							            type: 'bar',
							            data: handleDays
							        }
							    ]
							};
						myChart.setOption(option);
					}
				},
				error: function(err) {}
			});
		}
	});
	</script>

</body>

</html>