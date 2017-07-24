<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>主要指标</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">

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
		<div id="container" style="margin-top: 10px; width: 100%;"></div>
		
		<div class="weui_cells_title table-title"></div>
		<table class="weui-table weui-border-tb monitor-table" style="margin-bottom: 30px; width: 100%;">
        </table>
        
        <div class="nationalTax-table" style="display: none;">
	        <div class="weui_cells_title table-title"></div>
			<table class="weui-table weui-border-tb nationalTax-sale-table" style="margin-bottom: 30px; width: 100%;">
	        </table>
        </div>
	</div>
	
	
	<script class="template EconomicTarget" type="text/x-jquery-tmpl">
	<thead>
		<tr><th>月份</th>
		<th>本月止{{=it.title}}
			{{? it.subItem == '2'}}(万度)
			{{??}}(万元)
			{{?}}
		</th><th>同比增长%</th><th>环比增长%</th></tr>
	</thead>
	<tbody>
		{{~ it.data : data : index}}
		<tr class="table-tr">
			<td style="min-width: 60px;">{{=data.monthly || ""}}</td>
			{{? it.subItem == '1'}}
				<td>{{=data.target_current !=null ? data.target_current.mainBusiness : "-"}}</td>
				<td>{{=data.mainBusiness_yearGrowth !=null ? (data.mainBusiness_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.mainBusiness_monthGrowth !=null ? (data.mainBusiness_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '2'}}
				<td>{{=data.target_current !=null ? data.target_current.electricity : "-"}}</td>
				<td>{{=data.electricity_yearGrowth !=null ? (data.electricity_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.electricity_monthGrowth !=null ? (data.electricity_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '3'}}
				<td>{{=data.target_current !=null ? data.target_current.profit : "-"}}</td>
				<td>{{=data.profit_yearGrowth !=null ? (data.profit_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.profit_monthGrowth !=null ? (data.profit_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?? it.subItem == '4'}}
				<td>{{=data.target_current !=null ? data.target_current.tax : "-"}}</td>
				<td>{{=data.tax_yearGrowth !=null ? (data.tax_yearGrowth*100).toFixed(2) : "-"}}</td>
				<td>{{=data.tax_monthGrowth !=null ? (data.tax_monthGrowth*100).toFixed(2) : "-"}}</td>
			{{?}}
		</tr>
		{{~}}
	</tbody>
	</script>
	
	<script type="text/javascript" src="${ctx}/js/jquery/1.10.1/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/base.js"></script>
	<script type="text/javascript" src="${ctx}/js/base/utils.js"></script>
	<script type="text/javascript" src="${ctx}/js/doT/1.0.1/doT.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery/jquery-doT.js"></script>
	<script src="${ctx}/plugins/wx/picker.js"></script>
	<script type="text/javascript" src="${ctx}/js/highcharts/4.2.5/highcharts.js"></script>
	
	<script type="text/javascript">
	var type = $k.util.getRequestParam("type");
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
			var productTypeData = {
				productTypeId: id,
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
					url = '${ctx}/target/listRange';
					break;
				case '3':
					url = '${ctx}/target/listPointEnterpriseRange';
					break;
				}
			}
			else 
			{
				switch (item) {
				case '0':case '3':
					data = enterpriseData;
					url = '${ctx}/target/listByEnterpriseIdRange';
					break;
				case '1':
					url = '${ctx}/target/listByProductTypeIdRange';
					data = productTypeData;
					break;
				case '2':
					url = '${ctx}/target/listByAreaIdRange';
					data = areaData;
					break;
				}
			}
			
			$.ajax({
				url: url,
				type: 'POST',
				data: data,
				success: function(data) {
					$page.find(".monitor-table").html(
						$(".template.EconomicTarget").doT({
							title: getItemTitle(type),
							subItem: subItem,
							data: data.data, 
						})
					);
					getChart(data.data, $page.find("#container"));
				},
				error: function(err) {}
			});
			
		}
	});
	function getChart(data, $obj) {
		$obj.html("");
		var xAxisArr = [];
		var arr1 = [];
		var arr2 = [];
		var arr3 = [];
		var text1 = "";
		var unit = "";
		$.each(data, function(key, val) {
			xAxisArr.push(val.monthly);
			if(subItem == "1") {
				text1 = "本月止主营业务收入";
				unit = "万元";
				var mainBusiness = val.target_current != null ? val.target_current.mainBusiness : 0;
				var mainBusiness_yearGrowth = val.mainBusiness_yearGrowth != null && val.mainBusiness_yearGrowth != "" ? (parseFloat(val.mainBusiness_yearGrowth)*100).toFixed(2) : 0;
				var mainBusiness_monthGrowth = val.mainBusiness_monthGrowth != null && val.mainBusiness_monthGrowth != "" ? (parseFloat(val.mainBusiness_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: mainBusiness, extra: val.target_current==null ? "-" : mainBusiness + "万元"});
				arr2.push({y: parseFloat(mainBusiness_yearGrowth), extra: val.mainBusiness_yearGrowth==null ? "-" : mainBusiness_yearGrowth});
				arr3.push({y: parseFloat(mainBusiness_monthGrowth), extra: val.mainBusiness_monthGrowth==null ? "-" : mainBusiness_monthGrowth});
			} else if(subItem == "2") {
				text1 = "本月止用电量";
				unit = "万度";
				var electricity = val.target_current != null ? val.target_current.electricity : 0;
				var electricity_yearGrowth = val.electricity_yearGrowth != null && val.electricity_yearGrowth != "" ? (parseFloat(val.electricity_yearGrowth)*100).toFixed(2) : 0;
				var electricity_monthGrowth = val.electricity_monthGrowth != null && val.electricity_monthGrowth != "" ? (parseFloat(val.electricity_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: electricity, extra: val.target_current==null ? "-" : electricity + "万度"});
				arr2.push({y: parseFloat(electricity_yearGrowth), extra: val.electricity_yearGrowth==null ? "-" : electricity_yearGrowth});
				arr3.push({y: parseFloat(electricity_monthGrowth), extra: val.electricity_monthGrowth==null ? "-" : electricity_monthGrowth});
			} else if(subItem == "3") {
				text1 = "本月止利润总额";
				unit = "万元";
				var profit = val.target_current != null ? val.target_current.profit : 0;
				var profit_yearGrowth = val.profit_yearGrowth != null && val.profit_yearGrowth != "" ? (parseFloat(val.profit_yearGrowth)*100).toFixed(2) : 0;
				var profit_monthGrowth = val.profit_monthGrowth != null && val.profit_monthGrowth != "" ? (parseFloat(val.profit_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: profit, extra: val.target_current==null ? "-" : profit + "万元"});
				arr2.push({y: parseFloat(profit_yearGrowth), extra: val.profit_yearGrowth==null ? "-" : profit_yearGrowth});
				arr3.push({y: parseFloat(profit_monthGrowth), extra: val.profit_monthGrowth==null ? "-" : profit_monthGrowth});
			} else if(subItem == "4") {
				text1 = "本月止实现税金总额";
				unit = "万元";
				var tax = val.target_current != null ? val.target_current.tax : 0;
				var tax_yearGrowth = val.tax_yearGrowth != null && val.tax_yearGrowth != "" ? (parseFloat(val.tax_yearGrowth)*100).toFixed(2) : 0;
				var tax_monthGrowth = val.tax_monthGrowth != null && val.tax_monthGrowth != "" ? (parseFloat(val.tax_monthGrowth)*100).toFixed(2) : 0;
				arr1.push({y: tax, extra: val.target_current==null ? "-" : tax + "万元"});
				arr2.push({y: parseFloat(tax_yearGrowth), extra: val.tax_yearGrowth==null ? "-" : tax_yearGrowth});
				arr3.push({y: parseFloat(tax_monthGrowth), extra: val.tax_monthGrowth==null ? "-" : tax_monthGrowth});
			}
        });
		$obj.highcharts({
			chart: { zoomType: 'x' }, 
			credits: { enabled: false }, 
			title: { text: '' },
			xAxis: [{ 
				categories: xAxisArr
			}], 
			yAxis: [{ // Primary yAxis
	            labels: {
	                formatter: function() {
	                    return this.value +'%';
	                },
	            },
	            title: {
	                text: '',
	            },
	            opposite: true

	        },{ 
	            title: {
	                text: unit,
	            },
	            labels: {
	                formatter: function() {
	                    return this.value;
	                },
	            }

	        }], 
			tooltip: { shared: true }, 
			series: [{ 
				name: text1, 
				color: '#4572A7', 
				type: 'column', 
				data: arr1,
				yAxis: 1,
				tooltip: { 
					valueSuffix: ' '+unit,
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				}
			},
			{ 
				name: "同比增长%", 
				color: '#3bb4f2', 
				type: 'spline', 
				data: arr2,
				tooltip: { 
					valueSuffix: ' %',
					pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
				} 
			},
			{ 
			    name: '环比增长%', 
			    color: '#F7A35C', 
			    type: 'spline', 
			    data: arr3, 
			    tooltip: { 
			    	valueSuffix: '%', 
			    	pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
		            '<td style="text-align: right"><b>{point.extra}</b></td></tr><br/>',
			    } 
			}] 
		});
	}
	
	</script>

</body>

</html>