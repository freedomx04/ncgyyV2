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
							aa
						</div>
						
						<div id="appeal-tab-warning" class="tab-pane">
							bb
						</div>
					</div>
				</div>
			
               
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
                    var $detail = '<a class="btn-appeal-detail a-operate">查看</a>';
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
		
		
	})( jQuery );
	</script>
	
</body>

</html>