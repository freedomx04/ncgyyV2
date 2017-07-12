<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>企业主要指标</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-target">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
		            <ul class="nav nav-tabs">
		                <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 主营业务收入</a>
		                </li>
		                <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">用电量</a>
		                </li>
		                <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">利润总额</a>
		                </li>
		                <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">实现税金总额</a>
		                </li>
		            </ul>
            		<div class="tab-content">
		                <div id="tab-1" class="tab-pane active">
		                    <div class="panel-body">
								<form role="form" class="form-inline row">
				                    <div class="form-group col-sm-8">
										<div class="input-daterange input-group">
			                                <input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="btn btn-primary search" style="cursor: pointer; display: table-cell;">查询</span>
			                            </div>
					                </div>
				                </form>
				                
				                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				                <div class="chart-container" style="height: 400px; margin-top: 40px;"></div>
				                
				                <table id="target-list-table" class="table-hm" data-mobile-responsive="true"> </table>
		                    </div>
		                </div>
                
		                <div id="tab-2" class="tab-pane">
		                    <div class="panel-body">
								<form role="form" class="form-inline row">
				                    <div class="form-group col-sm-8">
										<div class="input-daterange input-group">
			                                <input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="btn btn-primary search" style="cursor: pointer; display: table-cell;">查询</span>
			                            </div>
					                </div>
				                </form>
				                
				                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
				                <div class="chart-container" style="height: 400px; margin-top: 40px;"></div>
				                
				                <table id="target-list-table" class="table-hm" data-mobile-responsive="true"> </table>
		                    </div>
		                </div>
		                
		                <div id="tab-3" class="tab-pane">
		                    <div class="panel-body">
		                    	<form role="form" class="form-inline row">
				                    <div class="form-group col-sm-8">
										<div class="input-daterange input-group">
			                                <input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="btn btn-primary search" style="cursor: pointer; display: table-cell;">查询</span>
			                            </div>
					                </div>
				                </form>
				                
				                <div class="chart-container" style="height: 400px; margin-top: 40px;"></div>
				                
				                <table id="target-list-table" class="table-hm" data-mobile-responsive="true"> </table>
		                    </div>
		                </div>
                
		                <div id="tab-4" class="tab-pane">
		                    <div class="panel-body">
		                    	<form role="form" class="form-inline row">
				                    <div class="form-group col-sm-8">
										<div class="input-daterange input-group">
			                                <input type="text" class="form-control" name="monthlyStart" id="monthlyStart"/>
			                                <span class="input-group-addon">到</span>
			                                <input type="text" class="form-control" name="monthlyEnd" id="monthlyEnd"/>
		                                    <span class="btn btn-primary search" style="cursor: pointer; display: table-cell;">查询</span>
			                            </div>
					                </div>
				                </form>
				                
				                <div class="chart-container" style="height: 400px; margin-top: 40px;"></div>
				                
				                <table id="target-list-table" class="table-hm" data-mobile-responsive="true"> </table>
		                    </div>
		                </div>
		            </div>
		        </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-target');
		var tab = "#tab-1";
		var $tab = $("#tab-1");
		
		//日期选择器，只选月份
		$page.find(".input-daterange").datepicker({
			format: 'yyyy-mm',
			minViewMode: 1,
			keyboardNavigation: !1,
			forceParse: !1,
			autoclose: !0,
			todayHighlight: !0
		});
		initDate();
		
		getData();
		
		$page
		.on("click", ".nav-tabs li", function() {
			tab = $(this).find("a").attr("href");
			$tab = $(tab);
			initDate(getData);
		})
		.on("click", ".search", function() {
			getData();
		});
		
		function getData() {
			var enterpriseId = '${user.enterprise.id}';
			var monthlyStart = $tab.find("#monthlyStart").val();
			var monthlyEnd = $tab.find("#monthlyEnd").val();
			
			
			//先销毁表格  
	        $tab.find('#target-list-table').bootstrapTable('destroy');

			var $table = $k.util.bsTable($tab.find('#target-list-table'), {
				url: '${ctx}/api/target/listByEnterpriseIdRange',
				method: "post",
				contentType : "application/x-www-form-urlencoded",
				idField: 'id',
				queryParams: {
					enterpriseId: enterpriseId,
					monthlyStart: monthlyStart,
					monthlyEnd: monthlyEnd
				},
				responseHandler: function(res) {
					getChart(res.data);
	                return res.data;
	            },
	            columns: getColumns()
			});
			
		}
		
		
		function getChart(data) {
			// 基于准备好的dom，初始化echarts图表
	        var myChart = echarts.init($tab.find('.chart-container')[0]); 
	        var xAxisArr = [];
			var arr1 = [];
			var arr2 = [];
			var arr3 = [];
			
			var legendName = "";
			var unit = "";
			
			$.each(data, function(key, val) {
				xAxisArr.push(val.monthly);
				switch ($tab.attr("id")) {
				case 'tab-1':
					legendName = '主营业务收入'; 
					unit = "万元";	
					
					var mainBusiness = val.target_current != null ? val.target_current.mainBusiness : '-';
					var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : "-";
					var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : "-";
					arr1.push(mainBusiness);
					arr2.push(mainBusiness_yearGrowth);
					arr3.push(mainBusiness_monthGrowth);
					
					break;
				case 'tab-2':	
					legendName = '用电量'; 
					unit = "万度";		
					
					var electricity = val.target_current != null ? val.target_current.electricity : "-";
					var electricity_yearGrowth = val.electricity_yearGrowth != null && val.electricity_yearGrowth != "" ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : "-";
					var electricity_monthGrowth = val.electricity_monthGrowth != null && val.electricity_monthGrowth != "" ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : "-";
					arr1.push(electricity);
					arr2.push(parseFloat(electricity_yearGrowth));
					arr3.push(parseFloat(electricity_monthGrowth));
					
					break;
				case 'tab-3':	
					legendName = '利润总额'; 
					unit = "万元";		
					
					var profit = val.target_current != null ? val.target_current.profit : "-";
					var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : "-";
					var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : "-";
					arr1.push(profit);
					arr2.push(parseFloat(profit_yearGrowth));
					arr3.push(parseFloat(profit_monthGrowth));
					
					break;
				case 'tab-4':	
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
				        show : false,
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
				    xAxis : [
				        {
				            type : 'category',
				            data : xAxisArr
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            name : legendName,
				            axisLabel : {
				                formatter: '{value} ' + unit
				            }
				        },
				        {
				            type : 'value',
				            name : '增幅',
				            axisLabel : {
				                formatter: '{value} %'
				            }
				        }
				    ],
				    series : [

				        {
				            name: '本月止' + legendName,  //这里的name要和legend里的data一致
				            type: 'bar',
				            data: arr1
				        },
				        {
				            name: '同比增幅',
				            type: 'line',
				            yAxisIndex: 1,
				            data: arr2
				        },
				        {
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
    	
    	
    	function initDate(fn) {
    		var now = new Date();
			// start time
			now.setYear(now.getFullYear() - 1);
    		var month = now.getMonth();
			$tab.find("#monthlyStart").val(now.getFullYear() + "-" + (month < 10 ? "0" + month : month));
			// end time 
			now.setDate(1);
			now.setMonth(now.getMonth());
			now.setYear(now.getFullYear() + 1);
			month = now.getMonth();
			$tab.find("#monthlyEnd").val(now.getFullYear() + "-" + (month < 10 ? "0" + month : month));

			if (typeof fn === 'function') {
				fn();
			}
    	}
    	
    	
    	function getColumns() {
    		var columns = [{field: 'monthly',
            	title: '月份',
            	align: 'center'}];
    		
    		switch ($tab.attr("id")) {
				case 'tab-1': 
					columns.push({
		            	field: 'target_current',
		            	title: '主营业务收入(万元)',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? value.mainBusiness : "-";
	                    }
		            }, {
		            	field: 'mainBusiness_yearGrowth',
		            	title: '同比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            }, {
		            	field: 'mainBusiness_monthGrowth',
		            	title: '环比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            });
					break;
				case 'tab-2':
					columns.push({
		            	field: 'target_current',
		            	title: '用电量(万度)',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? value.electricity : "-";
	                    }
		            }, {
		            	field: 'electricity_yearGrowth',
		            	title: '同比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            }, {
		            	field: 'electricity_monthGrowth',
		            	title: '环比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            });
					break;
				case 'tab-3':
					columns.push({
		            	field: 'target_current',
		            	title: '利润总额(万元)',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? value.profit : "-";
	                    }
		            }, {
		            	field: 'profit_yearGrowth',
		            	title: '同比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            }, {
		            	field: 'profit_monthGrowth',
		            	title: '环比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            });
					break;
				case 'tab-4':
					columns.push({
		            	field: 'target_current',
		            	title: '实现税金总额(万元)',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? value.tax : "-";
	                    }
		            }, {
		            	field: 'tax_yearGrowth',
		            	title: '同比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            }, {
		            	field: 'tax_monthGrowth',
		            	title: '环比增幅%',
		            	align: 'center',
		            	formatter: function (value, row, index) {
	                         return value != null ? (value*100).toFixed(2) : "-";
	                    }
		            });
					break;
			}
    		return columns;
    	}
	})( jQuery );
	
	</script>
</body>

</html>