<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-appeal-list">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs nav-tabs-line">
						<li class="active">
							<a data-toggle="tab" href="#appeal-tab-list" aria-expanded="true"><i class="fa fa-list"></i>诉求列表</a>
						</li>
						<li>
							<a data-toggle="tab" href="#appeal-tab-type" aria-expanded="true"><i class="fa fa-bar-chart"></i>诉求分类</a>
						</li>
						<li>
							<a data-toggle="tab" href="#appeal-tab-warning" aria-expanded="true"><i class="fa fa-warning"></i>诉求预警</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="appeal-tab-list" class="tab-pane active">
							<table id="appeal-list-table" class="table-hm" data-mobile-responsive="true"> </table>
						</div>
						
						<div id="appeal-tab-type" class="tab-pane">
	                    	<div class="type-chart-container" style="height: 400px;margin-top: 40px;display:inline-block;"></div>
							<div class="status-chart-container" style="height: 400px;display:inline-block;"></div>
						</div>
						
						<div id="appeal-tab-warning" class="tab-pane">
							<div class="warning-chart-container" style="height: 400px;margin-top: 40px;"></div>
						</div>
					</div>
				</div>
			
               
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-appeal-list');
		
		var $table = $k.util.bsTable($page.find('#appeal-list-table'), {
			url: '${ctx}/api/appeal/list',
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'title',
            	title: '诉求标题',
            	align: 'center'
            }, {
            	field: 'appealType.name',
            	title: '诉求类型',
            	align: 'center'
            }, {
            	field: 'enterprise.name',
            	title: '企业名称',
            	align: 'center'
            }, {
            	field: 'status',
            	title: '状态',
            	align: 'center',
                formatter: function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '<span class="label label-warning">待发送</span>';
                    case 1:
                        return '<span class="label label-warning">待派发</span>';
                    case 2:
                        return '<span class="label label-warning">待受理</span>';
                    case 3:
                        return '<span class="label label-primary">处理中</span>';
                    case 4:
                        return '<span class="label label-info">待确认</span>';
                    case 5:
                        return '<span class="label label-success">已确认</span>';
                    case 6:
                        return '<span class="label label-danger">已驳回</span>';
                    }
                }
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
                    var $detail = '<a class="btn-appeal-detail a-operate">详情</a>';
                    return $detail;
                },
                events: window.operateEvents = {
                	'click .btn-appeal-detail': function(e, value, row, index) {
                		e.stopPropagation();
                        window.location.href= './appealGet?appealId=' + row.id;
                	}
                }
            }]
		});
		
		$page.on('click', '.nav-tabs li', function() {
			var tab = $(this).find("a").attr("href");
			var $tab = $(tab);
			if (tab == '#appeal-tab-type') {
				apTypeChart();
				apStatusChart();
			} else {
				apWarnChart();
			}
		});
		$page.find('.warning-chart-container').css( 'width', $("#appeal-tab-list").width());
		$page.find('.type-chart-container').css( 'width', $("#appeal-tab-list").width()/2 - 10);
		$page.find('.status-chart-container').css( 'width', $("#appeal-tab-list").width()/2 - 10 );
		
		function apTypeChart() {
			var myChart = echarts.init($page.find('.type-chart-container')[0]); 
			
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
							    title : {
							        text: '诉求分类分布图',
							        x: 'center'
							    },
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
		
		function apStatusChart() {
			var myChart = echarts.init($page.find('.status-chart-container')[0]); 
			
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
							    title : {
							        text: '诉求分类状态统计图',
							        x: 'center'
							    },
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
		
		function apWarnChart() {
			var myChart = echarts.init($page.find('.warning-chart-container')[0]); 
			
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
							    title : {
							        text: '诉求预警提醒'
							    },
							    tooltip : {
							        trigger: 'axis'
							    },
							    legend: {
							        data:['超过受理天数','超过处理天数']
							    },
							    toolbox: {
							        show : false
							    },
							    calculable : true,
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
		
	})( jQuery );
	</script>
	
</body>

</html>