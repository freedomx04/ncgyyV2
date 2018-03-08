<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>经济数据上报</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.datepicker.dropdown-menu {
		z-index: 999999!important;
	}
	.filter-economic {
		padding: 10px 0 30px 30px;
	}
	.filter-economic .input-daterange .form-control {
		width: 120px;
	}
	</style>
</head>

<body class="gray-bg body-economic">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#economic-country" data-tab="country" aria-expanded="true">全国主要指标</a>
						</li>
						<li>
							<a data-toggle="tab" href="#economic-province" data-tab="province" aria-expanded="false">全省主要指标</a>
						</li>
						<li>
							<a data-toggle="tab" href="#economic-city" data-tab="city" aria-expanded="false">全市主要指标</a>
						</li>
						<li>
							<a data-toggle="tab" href="#economic-county" data-tab="county" aria-expanded="false">全县主要指标</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="economic-country" class="tab-pane active">
							<div class="panel-body">
								<div role="form" class="form-inline filter-economic">
									<div class="form-group">
										<label class="font-noraml">时间范围选择</label>
										<div class="input-daterange input-group">
											<input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="input-group-btn">
		                                    	<button type="button" class="btn btn-primary btn-fw btn-search">查询</button>
		                                    </span>
										</div>
									</div>
								</div>
									
								<div class="chart-country" style="height: 400px;"></div>
								<table class="table-country table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="economic-province" class="tab-pane">
							<div class="panel-body">
								<div role="form" class="form-inline filter-economic">
									<div class="form-group">
										<label class="font-noraml">时间范围选择</label>
										<div class="input-daterange input-group">
											<input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="input-group-btn">
		                                    	<button type="button" class="btn btn-primary btn-fw btn-search">查询</button>
		                                    </span>
										</div>
									</div>
								</div>
								
								<div class="chart-province" style="height: 400px;"></div>
								<table class="table-province table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="economic-city" class="tab-pane">
							<div class="panel-body">
								<div role="form" class="form-inline filter-economic">
									<div class="form-group">
										<label class="font-noraml">时间范围选择</label>
										<div class="input-daterange input-group">
											<input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="input-group-btn">
		                                    	<button type="button" class="btn btn-primary btn-fw btn-search">查询</button>
		                                    </span>
										</div>
									</div>
								</div>
								
								<div class="chart-city" style="height: 400px;"></div>
								<table class="table-city table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
						
						<div id="economic-county" class="tab-pane">
							<div class="panel-body">
								<div role="form" class="form-inline filter-economic">
									<div class="form-group">
										<label class="font-noraml">时间范围选择</label>
										<div class="input-daterange input-group">
											<input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="input-group-btn">
		                                    	<button type="button" class="btn btn-primary btn-fw btn-search">查询</button>
		                                    </span>
										</div>
									</div>
								</div>
								
								<div class="chart-county" style="height: 400px;"></div>
								<table class="table-county table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/echarts/4.0.4/echarts.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
   
    <script type="text/javascript">
	;(function( $ ) {
	
		var $page = $('.body-economic');
		var $tab, $chart, $table, type, $bsTable;
		
		var tab = 'country';
		var $tab = $('#economic-' + tab);
		initDate();
		init();
		
		$page
		.on('click', 'a[data-toggle="tab"]', function() {
			tab = $(this).data('tab');
			$tab = $('#economic-' + tab);
			initDate();
			init();
		})
		.on('click', '.btn-search', function() {
			init();
		});
		
		function initDate() {
			//日期选择器，只选月份
			$page.find(".input-daterange").datepicker({
				format: 'yyyy-mm',
				minViewMode: 1,
				keyboardNavigation: !1,
				forceParse: !1,
				autoclose: !0,
				todayHighlight: !0
			});
			
			var now = new Date();
			var monthly;
			// start time
			var month = now.getMonth();
			if (month == 0) {
				monthly = (now.getFullYear() - 2) + '-12';
			} else {
				monthly = (now.getFullYear() - 1) + '-' + (month < 10 ? '0' + month : month);
			}
			$tab.find('#monthlyStart').val(monthly);
			
			// end time
			if (month == 0) {
				monthly = (now.getFullYear() - 1) + '-12';
			} else {
				monthly = now.getFullYear() + '-' + (month < 10 ? "0" + month : month);
			}
			$tab.find("#monthlyEnd").val(monthly);
		}
		
		function init() {
			switch (tab) {
			case 'country':
				type = 0;
				$chart = $page.find('.chart-country');
				$table = $page.find('.table-country');
				break;
			case 'province':
				type = 1;
				$chart = $page.find('.chart-province');
				$table = $page.find('.table-province');
				break;
			case 'city':
				type = 2;
				$chart = $page.find('.chart-city');
				$table = $page.find('.table-city');
				break;
			case 'county':
				type = 3;
				$chart = $page.find('.chart-county');
				$table = $page.find('.table-county');
				break;
			}
			
			$.ajax({
				url: '${ctx}/api/monitor/economic/listByMonthlyRange',
				data: {
					type: type,
					monthlyStart: $tab.find("#monthlyStart").val(),
					monthlyEnd: $tab.find("#monthlyEnd").val()
				},
				success: function(ret) {
					if (ret.code == 0) {
						// init table
						$table.bootstrapTable('destroy');
						var $bsTable = $k.util.bsTable($table, {
							data: ret.data,
							search: false,
							responseHandler: function(res) {
								return res;
							},
							columns: [{
								field: 'monthly',
								title: '月份',
								align: 'center'
							}, {
								field: 'business',
								title: '主营业务收入(万元)',
								align: 'center'
							}, {
								field: 'electricity',
								title: '用电量(万度) ',
								align: 'center'
							}, {
								field: 'profit',
								title: '利润总额(万元)',
								align: 'center'
							}, {
								field: 'tax',
								title: '实现税金总额(万元) ',
								align: 'center'
							}]
						});
						
						// init chart
						var myChart = echarts.init($chart[0]);
						myChart.clear();
						
						var xAxisData = [], businessData = [], electricityData = [], profitData = [], taxData = [];
						$.each(ret.data, function(key, val) {
							xAxisData.push(val.monthly);
							businessData.push(val.business);
							electricityData.push(val.electricity);
							profitData.push(val.profit);
							taxData.push(val.tax);
						});
						
						var option = {
							color: ['#7373B9', '#A8FF24', '#0080FF', '#FF5809'],
							tooltip: {
						        trigger: 'axis',
						        axisPointer: {
						            type: 'shadow'
						        }
						    },
						    legend: {
						        data: ['主营业务收入', '用电量', '利润总额', '实现税金总额']
						    },
						    toolbox: {
						    	show : false
						    },
						    calculable: true,
						    xAxis: [{
					            type: 'category',
					            axisTick: {show: false},
					            data: xAxisData
					        }],
						    yAxis: [{
						    	type: 'value'
						    }],
						    series: [{
					            name: '主营业务收入',
					            type: 'bar',
					            barGap: 0,
					            data: businessData
					        }, {
					            name: '用电量',
					            type: 'bar',
					            data: electricityData
					        }, {
					            name: '利润总额',
					            type: 'bar',
					            data: profitData
					        }, {
					            name: '实现税金总额',
					            type: 'bar',
					            data: taxData
					        }]
						}
						myChart.setOption(option);
						
						window.addEventListener("resize",function(){
							myChart.resize();
						});
					}
				}
			});
		}
		
	}) ( jQuery );
	</script>
		
</body>
</html>