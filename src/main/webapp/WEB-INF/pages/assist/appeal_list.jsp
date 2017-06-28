<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>诉求中心（企业）</title>
	
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
			<div class="ibox-title">
				<h5>诉求中心</h5>
			</div>
			
			<div class="ibox-content">
				<div class="btn-group hidden-xs" id="appeal-list-table-toolbar" role="group">
                    <button type="button" class="btn btn-white btn-enterprise-add">
                        <i class="fa fa-plus fa-fw"></i>新增
                    </button>
                </div>
                <table id="appeal-list-table" class="table-hm" data-mobile-responsive="true"> </table>
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
		
		var $page = $('.body-enterprise-list');
		
		var $table = $k.util.bsTable($page.find('#appeal-list-table'), {
			url: '${ctx}/api/enterprise/listBase',
			toolbar: '#enterprise-list-table-toolbar',
			idField: 'id',
			showExport: true, 
			responseHandler: function(res) {
                return res.data;
            },
            columns: [{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'avatar',
            	title: '企业图标',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return '<img src="${ctx}/api/avatar/' + value + '" style="width: 32px; height: 32px;">';
            	}
            }, {
            	field: 'name',
            	title: '企业名称',
            	align: 'center',
            }, {
            	field: 'area.name',
            	title: '所属园区',
            	align: 'center'
            }, {
            	field: 'industry.name',
            	title: '行业类别',
            	align: 'center'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		return '<a class="btn-enterprise-detail a-operate">查看</a><a class="btn-enterprise-edit a-operate">编辑</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-enterprise-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './enterpriseGet?enterpriseId=' + row.id;
            		},
            		'click .btn-enterprise-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			window.location.href= './enterpriseAdd?method=edit&enterpriseId=' + row.id;
            		},
            		'click .btn-enterprise-delete': function(e, value, row, index) {
            			e.stopPropagation();
            		}
            	}
            }]
		});
		
		$table.on('all.bs.table', function(e, row) {
            var selNum = $table.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-enterprise-delete-batch').removeAttr('disabled') : $page.find('.btn-enterprise-delete-batch').attr('disabled', 'disabled');
        });
		
		$page
		.on('click', '.btn-enterprise-add', function() {
			window.location.href = './enterpriseAdd?method=add';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>