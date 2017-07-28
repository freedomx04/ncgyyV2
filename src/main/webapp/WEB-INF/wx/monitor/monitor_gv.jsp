<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>主要指标</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">

	<style>
	.weui-picker-modal .title {
		margin: 0px; 
	}
	.weui-picker-modal .toolbar {
		height: 35px;
	}
	</style>

</head>

<body class="wx-monitor" style="background-color: #f8f8f8; width: 100%;">
	<div style="width: 100%;">
		<div class="search-wrap" style="width: 100%;">
			<div class="weui_cell">
				<div class="weui_cell_hd"><label for="" class="weui_label select-label"></label></div>
	            <div class="weui_cell_bd weui_cell_primary">
	                <select class="weui_select" id="selectList" style="padding-left: 0;">
	                   	<option selected="" value="0">总览</option>
	                	<c:forEach var="data" items="${selectList}">
	                		<option value="${data.id}">${data.name}</option>
	                    </c:forEach>
	                </select>
	            </div>
	        </div>
	        
	        <div class="weui_cell">
	            <div class="weui_cell_hd"><label for="" class="weui_label">年份:</label></div>
	            <div class="weui_cell_bd weui_cell_primary">
	                <input class="weui_input" type="text" id='monthly'/>
	            </div>
	        </div> 
	    </div>
	    
	    <div class="weui_cells_title chart-title"></div>
		<div id="container" style="margin-top: 10px; width: 100%; height: 300px;"></div>
		
		<div class="weui_cells_title table-title"></div>
		<table class="weui-table weui-border-tb monitor-table" style="margin-bottom: 30px; width: 100%;">
        </table>
	</div>
	
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/picker.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	
	<script type="text/javascript">
	var type = Url.queryString("type");
	var item = type.split('-')[0];
	var subItem = type.split('-')[1];
	var $page = $(".wx-monitor");
	$(function( $ ) {
		
		var date = new Date;
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        month = (month < 10 ? "0" + month:month);
        
		var searchTitle = "";
		
		document.title = getTargetTitle(type) + "-" + getItemTitle(type);
		$page.find(".chart-title").text(getItemTitle(type) + "图表分析");
		$page.find(".table-title").text(getItemTitle(type) + "数据详情");
		
		switch (item) {
		case '0':	searchTitle = '企业 ';	break;
		case '1':	searchTitle = '行业';		break;
		case '2':	searchTitle = '区域';		break;
		case '3': 	searchTitle = '重点企业';	break;			
		}
		$page.find(".select-label").text(searchTitle);
		
		getData(year, month);
		
        $page.find("#monthly").val(year.toString() + "- " + month.toString());
		$("#monthly").picker({
			title:"选择年份",
			cols: [
	          {
	            textAlign: 'center',
	            values: (function () {
	                var arr = [];
	                for (var i = 1980; i <= year + 20; i++) { arr.push(i + "-"); }
	                return arr;
	            })(),
	            displayValues: (function () {
	                var arr = [];
	                for (var i = 1980; i <= year + 20; i++) { arr.push(i); }
	                return arr;
	            })()
	            
	          },
	          {
	            textAlign: 'center',
	            values:  (function () {
	                var arr = [];
	                for (var i = 1; i <= 12; i++) { arr.push(i < 10 ? '0' + i : i); }
	                return arr;
	            })(),
	          }
	        ],
	        onClose: function(result) {
	        	getData(result.displayValue[0], result.displayValue[1]);
	        }
		});
		
		
		$page.on("change", "#selectList",function() {
			var monthly = $page.find("#monthly").val().replace(" ", "");
			getData(monthly.split("-")[0], monthly.split("-")[1]);
		});
		
		function getItemTitle(type) {
			var title;
			switch (type.split('-')[1]) {
			case '1':	title = subItemTitle = '主营业务收入';		break;
			case '2':	title = subItemTitle = '用电量';		break;
			case '3':	title = subItemTitle = '利润总额';			break;
			case '4':	title = subItemTitle = '实现税金总额';			break;
			}
			return title;
		}
		
		function getTargetTitle(type) {
			var title;
			switch (type.split('-')[0]) {
			case '0':	 title = '企业主要指标 ';		break;
			case '1':		 title = '行业主要指标';		break;
			case '2':			 title = '区域主要指标';		break;
			case '3':title = '重点企业主要指标';	break;			
			}
			return title;
		}
		
		function getData(year, month) {
			var id = $page.find("#selectList").val();
			var end_month = parseInt(month) + 1;
			var monthlyStart = (parseInt(year) - 1) + "-" + (end_month < 10 ? "0" + end_month : end_month);
			var monthlyEnd = year + "-" + month;
			var url, data, $template;
			
			var overViewData = {
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var enterpriseData = {
				enterpriseId: id,
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var industryData = {
				industryId: id,
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			var areaData = {
				areaId: id,
				monthlyStart: monthlyStart,
				monthlyEnd: monthlyEnd
			};
			
			if (id == '0') // 总览
			{
				data = overViewData;
				switch (item) {
				case '0':case '1':case '2':
					url = '${ctx}/api/target/listRange';
					break;
				case '3':
					url = '${ctx}/api/target/listPointEnterpriseRange';
					break;
				}
			}
			else 
			{
				switch (item) {
				case '0':case '3':
					data = enterpriseData;
					url = '${ctx}/api/target/listByEnterpriseIdRange';
					break;
				case '1':
					url = '${ctx}/api/target/listByIndustryIdRange';
					data = industryData;
					break;
				case '2':
					url = '${ctx}/api/target/listByAreaIdRange';
					data = areaData;
					break;
				}
			}
			
			//先销毁表格  
	        $page.find('.monitor-table').bootstrapTable('destroy');

			var $table = $k.util.bsTable($page.find('.monitor-table'), {
				url: url,
				method: "post",
				contentType : "application/x-www-form-urlencoded",
				idField: 'id',
				queryParams: data,
				responseHandler: function(res) {
					getChart(res.data, $page.find("#container"));
	                return res.data;
	            },
	            columns: getColumns()
			});
			
		}
	});
	function getChart(data, $obj) {
		var myChart = echarts.init($obj[0]);
		var xAxisArr = [];
		var arr1 = [];
		var arr2 = [];
		var arr3 = [];
		var legendName = "";
		var unit = "";
		
		$.each(data, function(key, val) {
			xAxisArr.push(val.monthly);
			switch (subItem) {
			case '1':
				legendName = '主营业务收入'; 
				unit = "万元";	
				
				var mainBusiness = val.target_current != null ? val.target_current.mainBusiness : '-';
				var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : '-';
				var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : '-';
				arr1.push(mainBusiness);
				arr2.push(mainBusiness_yearGrowth);
				arr3.push(mainBusiness_monthGrowth);
				
				break;
			case '2':	
				legendName = '用电量'; 
				unit = "万度";		
				
				var electricity = val.target_current != null ? val.target_current.electricity : '-';
				var electricity_yearGrowth = val.electricity_yearGrowth != null && val.electricity_yearGrowth != "" ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : '-';
				var electricity_monthGrowth = val.electricity_monthGrowth != null && val.electricity_monthGrowth != "" ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : '-';
				arr1.push(electricity);
				arr2.push(electricity_yearGrowth);
				arr3.push(electricity_monthGrowth);
				
				break;
			case '3':	
				legendName = '利润总额'; 
				unit = "万元";		
				
				var profit = val.target_current != null ? val.target_current.profit : '-';
				var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : '-';
				var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : '-';
				arr1.push(profit);
				arr2.push(profit_yearGrowth);
				arr3.push(profit_monthGrowth);
				
				break;
			case '4':	
				legendName = '实现税金总额'; 
				unit = "万元";	
				
				var tax = val.target_current != null ? val.target_current.tax : '-';
				var tax_yearGrowth = val.tax_yearGrowth != null && val.tax_yearGrowth != "" ? (parseFloat(val.tax_yearGrowth)*100).toFixed(2) : '-';
				var tax_monthGrowth = val.tax_monthGrowth != null && val.tax_monthGrowth != "" ? (parseFloat(val.tax_monthGrowth)*100).toFixed(2) : '-';
				arr1.push(tax);
				arr2.push(tax_yearGrowth);
				arr3.push(tax_monthGrowth);
				
				break;
			}
		});
		
		var option = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    toolbox: {
			        show : false
			    },
			    calculable : false,
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
			            data: arr1,
			            itemStyle : { normal: {label : {show: true}}}
			        },
			        {
			            name: '同比增幅',
			            type: 'line',
			            yAxisIndex: 1,
			            data: arr2,
			            itemStyle : { normal: {label : {show: true}}}
			        },
			        {
			            name: '环比增幅',
			            type: 'line',
			            yAxisIndex: 1,
			            data: arr3,
			            itemStyle : { normal: {label : {show: true}}}
			        }
			    ]
			};
    	// 为echarts对象加载数据 
        myChart.setOption(option);
	}
	
	function getColumns() {
		var columns = [{field: 'monthly',
        	title: '月份',
        	align: 'center'}];
		
		switch (subItem) {
			case '1': 
				columns.push({
	            	field: 'target_current',
	            	title: '主营业务收入(万元)',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? value.mainBusiness : '-';
                    }
	            }, {
	            	field: 'mainBusiness_yearGrowth',
	            	title: '同比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            }, {
	            	field: 'mainBusiness_monthGrowth',
	            	title: '环比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            });
				break;
			case '2':
				columns.push({
	            	field: 'target_current',
	            	title: '用电量(万度)',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? value.electricity : '-';
                    }
	            }, {
	            	field: 'electricity_yearGrowth',
	            	title: '同比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            }, {
	            	field: 'electricity_monthGrowth',
	            	title: '环比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            });
				break;
			case '3':
				columns.push({
	            	field: 'target_current',
	            	title: '利润总额(万元)',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? value.profit : '-';
                    }
	            }, {
	            	field: 'profit_yearGrowth',
	            	title: '同比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            }, {
	            	field: 'profit_monthGrowth',
	            	title: '环比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            });
				break;
			case '4':
				columns.push({
	            	field: 'target_current',
	            	title: '实现税金总额(万元)',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? value.tax : '-';
                    }
	            }, {
	            	field: 'tax_yearGrowth',
	            	title: '同比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            }, {
	            	field: 'tax_monthGrowth',
	            	title: '环比增幅%',
	            	align: 'center',
	            	formatter: function (value, row, index) {
                         return value != null ? (value*100).toFixed(2) : '-';
                    }
	            });
				break;
		}
		return columns;
	}
	
	</script>

</body>

</html>