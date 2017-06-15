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
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/datepicker/datepicker3.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/chosen/chosen.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style>
		.chosen-container {
			width: 100%!important;
		}	
	</style>
</head>


<body class="gray-bg body-target">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 主营业务收入及增幅</a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">用电量及增幅</a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">利润总额及增幅</a>
                </li>
                <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">实现税金总额及增幅</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
						<form role="form" class="form-inline row">
							<div class="form-group col-sm-4">
								<div class="input-group" style="width: 100%;">
			                        <select data-placeholder="选择企业" class="chosen-select">
			                        	<option value="0">企业总览</option>
			                        </select>
								</div>
							</div>
		                    <div class="form-group col-sm-3">
		                        <div class="input-group date">
		                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		                            <input type="text" id="monthlyStart" class="form-control">
		                        </div>
		                    </div>
		                    <div class="form-group col-sm-3">
		                        <div class="input-group date">
		                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		                            <input type="text" id="monthlyEnd" class="form-control">
		                        </div>
		                    </div>
		                    <div class="form-group col-sm-2">
			                    <button class="btn btn-sm btn-primary">
			                    	<strong>查询</strong>
			                   	</button>
			                </div>
		                </form>
		                
		                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		                <div id="chart-container" style="height: 400px; margin-top: 40px;"></div>
		                
		                <table id="target-list-table" data-mobile-responsive="true"> </table>
                    </div>
                </div>
                
                <div id="tab-2" class="tab-pane">
                    <div class="panel-body">
                    </div>
                </div>
                
                <div id="tab-3" class="tab-pane">
                    <div class="panel-body">
                    </div>
                </div>
                
                <div id="tab-4" class="tab-pane">
                    <div class="panel-body">
                    </div>
                </div>
            </div>

        </div>
                
	</div>
	
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/chosen/chosen.jquery.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-target');
		
		//日期选择器，只选月份
		$page.find(".input-group.date").datepicker({
			format: 'yyyy-mm',
			minViewMode: 1,
			keyboardNavigation: !1,
			forceParse: !1,
			autoclose: !0,
			todayHighlight: !0
		});
		initDate();
		
		//下拉选框数据获取
		$.ajax({
			type: "POST",
			url: '${ctx}/api/enterprise/listBase',
			success: function(data) {
				if (data.code == 0) {
					$.each(data.data, function(key, val) {
						$('<option value="'+ val.id +'">'+ val.name +'</option>').appendTo($page.find(".chosen-select"));
					});
					$k.util.chosen();
				}
			},
			error: function(err) {}
		});
		
		getData();
		
		function getData(year, month) {
			var $tab = $page.find(".tab-pane.active");
			var id = $page.find(".chosen-select").val();
			var monthlyStart = $tab.find("#monthlyStart").val();
			var monthlyEnd = $tab.find("#monthlyEnd").val();
			
			var url, data;
			var columns = [{field: 'monthly',
            	title: '月份',
            	align: 'center'}];
			
			var overViewData = {
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var enterpriseData = {
				enterpriseId: id,
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			
			if (id == '0') // 总览
			{
				data = overViewData;
				url = '${ctx}/api/target/listRange';
				switch ($tab.attr("id")) {
					case 'tab-1': 
						columns.push({
			            	field: 'target_current.mainBusiness',
			            	title: '主营业务收入(万元)',
			            	align: 'center'
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
			            	field: 'target_current.electricity',
			            	title: '用电量(万度)',
			            	align: 'center'
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
			            	field: 'target_current.profit',
			            	title: '利润总额(万元)',
			            	align: 'center'
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
			            	field: 'target_current.tax',
			            	title: '实现税金总额(万元)',
			            	align: 'center'
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
			} else {
				data = enterpriseData;
				url = '${ctx}/api/target/listByEnterpriseIdRange';
			}
			
			var $table = $k.util.bsTable($page.find('#target-list-table'), {
				url: url,
				method: "post",
				contentType : "application/x-www-form-urlencoded",
				idField: 'id',
				queryParams: data,
				responseHandler: function(res) {
					getChart(res.data);
	                return res.data;
	            },
	            columns: columns
			});
			
			$table.on('all.bs.table', function(e, row) {
	            var selNum = $table.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-industry-delete-batch').removeAttr('disabled') : $page.find('.btn-industry-delete-batch').attr('disabled', 'disabled');
	        });
			
		}
		
		
		function getChart(data) {
			
			// 基于准备好的dom，初始化echarts图表
	        var myChart = echarts.init(document.getElementById('chart-container')); 
	        var $tab = $page.find(".tab-pane.active");
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
					
					var mainBusiness = val.target_current != null ? val.target_current.mainBusiness : 0;
					var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : 0;
					var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : 0;
					arr1.push({y: mainBusiness, extra: val.target_current==null ? "-" : mainBusiness + unit});
					arr2.push({y: parseFloat(mainBusiness_yearGrowth), extra: val.mainBusiness_yearGrowth==null ? "-" : mainBusiness_yearGrowth});
					arr3.push({y: parseFloat(mainBusiness_monthGrowth), extra: val.mainBusiness_monthGrowth==null ? "-" : mainBusiness_monthGrowth});
					
					break;
				case 'tab-2':	
					legendName = '用电量'; 
					unit = "万度";		
					
					var electricity = val.target_current != null ? val.target_current.electricity : 0;
					var electricity_yearGrowth = val.electricity_yearGrowth != null && val.electricity_yearGrowth != "" ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : 0;
					var electricity_monthGrowth = val.electricity_monthGrowth != null && val.electricity_monthGrowth != "" ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : 0;
					arr1.push({y: electricity, extra: val.target_current==null ? "-" : electricity + unit});
					arr2.push({y: parseFloat(electricity_yearGrowth), extra: val.electricity_yearGrowth==null ? "-" : electricity_yearGrowth});
					arr3.push({y: parseFloat(electricity_monthGrowth), extra: val.electricity_monthGrowth==null ? "-" : electricity_monthGrowth});
					
					break;
				case 'tab-3':	
					legendName = '利润总额'; 
					unit = "万元";		
					
					var profit = val.target_current != null ? val.target_current.profit : 0;
					var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : 0;
					var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : 0;
					arr1.push({y: profit, extra: val.target_current==null ? "-" : profit + unit});
					arr2.push({y: parseFloat(profit_yearGrowth), extra: val.profit_yearGrowth==null ? "-" : profit_yearGrowth});
					arr3.push({y: parseFloat(profit_monthGrowth), extra: val.profit_monthGrowth==null ? "-" : profit_monthGrowth});
					
					break;
				case 'tab-4':	
					legendName = '实现税金总额'; 
					unit = "万元";	
					
					var tax = val.target_current != null ? val.target_current.tax : 0;
					var tax_yearGrowth = val.tax_yearGrowth != null && val.tax_yearGrowth != "" ? (parseFloat(val.tax_yearGrowth)*100).toFixed(2) : 0;
					var tax_monthGrowth = val.tax_monthGrowth != null && val.tax_monthGrowth != "" ? (parseFloat(val.tax_monthGrowth)*100).toFixed(2) : 0;
					arr1.push({y: tax, extra: val.target_current==null ? "-" : tax + unit});
					arr2.push({y: parseFloat(tax_yearGrowth), extra: val.tax_yearGrowth==null ? "-" : tax_yearGrowth});
					arr3.push({y: parseFloat(tax_monthGrowth), extra: val.tax_monthGrowth==null ? "-" : tax_monthGrowth});
					
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
				        data:[legendName, '同比增长', '环比增长']
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
				            name: '本月止' + legendName,
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
    	
    	
    	function initDate() {
    		var now = new Date();
			// start time
			now.setYear(now.getFullYear() - 1);
    		var month = now.getMonth();
			$page.find("#monthlyStart").val(now.getFullYear() + "-" + (month < 10 ? "0" + month : month));
			// end time 
			now.setDate(1);
			now.setMonth(now.getMonth() - 1);
			now.setYear(now.getFullYear() + 1);
			month = now.getMonth();
			$page.find("#monthlyEnd").val(now.getFullYear() + "-" + (month < 10 ? "0" + month : month));
    	}
    	
	})( jQuery );
	
	</script>
</body>

</html>