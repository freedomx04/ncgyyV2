<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>南城县工业园区综合信息服务平台</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/portal.css">
	
	<style>
	.ctree dl dt a {
		font-weight: normal;
	}
	</style>
	
</head>
<body class="body-article">
	<%@ include file="/WEB-INF/template/top.jsp"%>
	
	<div class="main">
		<div class="mnav">
			<span>
				<a href="index">首页</a>&nbsp;&gt;&nbsp;
				<a href="monitorlist?item=mainBusiness">监测平台</a>
				&nbsp;&gt;&nbsp;
		    </span>
		</div>
		
		<div class="clist">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td width="217" valign="top">
							<div class="ctree">
								<div class="ctree_title"><h1>监测平台</h1></div>
									<dl>
										<dt><a href="monitorlist?item=mainBusiness" item="mainBusiness">主营业务收入</a></dt>
										<dt><a href="monitorlist?item=electricity" item="electricity">用电量</a></dt>
										<dt><a href="monitorlist?item=profit" item="profit">利润总额</a></dt>
										<dt><a href="monitorlist?item=tax" item="tax">实现税金总额</a></dt>
									</dl>
								<div style="height:30px;">&nbsp;</div>
		
							</div>
						</td>
						<td width="40">&nbsp;</td>
						<td valign="top">
							<div class="clist_r_title">
								<span></span>
							</div>
							<div class="clist_con" style="min-height: 600px; margin: 30px 0;">
								<div class="chart-container" style="height: 400px;"></div>
								<table id="target-list-table" class="table-hm" data-mobile-responsive="true"> </table>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/url.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	
	<script>
	var $page = $(".body-article");
	;(function() {
		
		var item = Url.queryString("item");
		var pagesize = 20;
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu .m_monitor").addClass("nav_curr");
		
		$page.find(".ctree").removeClass("ctree_curr");
		$page.find(".ctree").find("[item='"+ item +"']").addClass("ctree_curr");
		
		$page.find(".menu a").removeClass("nav_curr");
		$page.find(".menu").find("a[item='"+ item +"']").addClass("nav_curr");
		
		var itemName = getItemName(item);
		$page.find(".clist_r_title span").html(itemName);
		$page.find(".mnav span").append('<a href="">'+ itemName +'</a>');
		
		getData();
		
		function getData() {
			var now = new Date();
			now.setYear(now.getFullYear() - 1);
			var month = now.getMonth();
			var monthlyStart = now.getFullYear() + '-' + (month < 10 ? "0" + month : month);
			now.setDate(1);
			now.setMonth(now.getMonth());
			now.setYear(now.getFullYear() + 1);
			month = now.getMonth();
			var monthlyEnd = now.getFullYear() + '-' + (month < 10 ? "0" + month : month);
			
			//先销毁表格  
	        $page.find('#target-list-table').bootstrapTable('destroy');

			var $table = $k.util.bsTable($page.find('#target-list-table'), {
				url: '${ctx}/api/target/listRange',
				method: "post",
				contentType : "application/x-www-form-urlencoded",
				idField: 'id',
				queryParams: {
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
	        var myChart = echarts.init($page.find('.chart-container')[0]); 
	        var xAxisArr = [];
			var arr1 = [];
			var arr2 = [];
			var arr3 = [];
			
			var legendName = "";
			var unit = "";
			
			$.each(data, function(key, val) {
				xAxisArr.push(val.monthly);
				switch (item) {
				case 'mainBusiness':
					legendName = '主营业务收入'; 
					unit = "万元";	
					
					var mainBusiness = val.target_current != null ? val.target_current.mainBusiness : '-';
					var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : '-';
					var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : '-';
					arr1.push(mainBusiness);
					arr2.push(mainBusiness_yearGrowth);
					arr3.push(mainBusiness_monthGrowth);
					
					break;
				case 'electricity':	
					legendName = '用电量'; 
					unit = "万度";		
					
					var electricity = val.target_current != null ? val.target_current.electricity : '-';
					var electricity_yearGrowth = val.electricity_yearGrowth != null && val.electricity_yearGrowth != "" ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : '-';
					var electricity_monthGrowth = val.electricity_monthGrowth != null && val.electricity_monthGrowth != "" ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : '-';
					arr1.push(electricity);
					arr2.push(electricity_yearGrowth);
					arr3.push(electricity_monthGrowth);
					
					break;
				case 'profit':	
					legendName = '利润总额'; 
					unit = "万元";		
					
					var profit = val.target_current != null ? val.target_current.profit : '-';
					var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : '-';
					var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : '-';
					arr1.push(profit);
					arr2.push(profit_yearGrowth);
					arr3.push(profit_monthGrowth);
					
					break;
				case 'tax':	
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
	    	
	        window.addEventListener("resize",function(){
	            myChart.resize();
	        });
		}
		
		function getItemName(item) {
			var itemName = '';
			switch (item) {
			case 'mainBusiness':
				itemName = '主营业务收入';
				break;
			case 'electricity':
				itemName = '用电量';
				break;
			case 'profit':
				itemName = '利润总额';
				break;
			case 'tax':
				itemName = '实现税金总额';
				break;
			}
			return itemName;
		}
		
		function getColumns() {
    		var columns = [{field: 'monthly',
            	title: '月份',
            	align: 'center'}];
    		
    		switch (item) {
				case 'mainBusiness': 
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
				case 'electricity':
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
				case 'profit':
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
				case 'tax':
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
	})();
	
	</script>
</body>
</html>