<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>物流平台</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/toastr/toastr.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/city-picker/css/city-picker.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
</head>

<body class="gray-bg body-platform-logistics">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margin">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#tab-supplier" aria-expanded="true">供应商信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-line" aria-expanded="false">线路管理</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-network" aria-expanded="false">网点管理</a>
						</li>
						<li>
							<a data-toggle="tab" href="#tab-supply" aria-expanded="false">货源管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-supplier" class="tab-pane active">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是物流服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-logistics-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<div class="panel-body">
									<dl class="dl-horizontal" style="padding-right: 60px;">
										<dt>供应商类型</dt><dd>物流服务供应商</dd>
										<dt>审核状态</dt>
										<dd>
										<c:choose>
											<c:when test="${supplier.status == 1}">
												<span class="label label-warning">审核中</span>
											</c:when>
											<c:when test="${supplier.status == 2}">
												<span class="label label-success">已认证</span>
											</c:when>
											<c:when test="${supplier.status == 3}">
												<span class="label label-danger">已驳回</span>
											</c:when>
										</c:choose>
										</dd>
										<dt>供应商名称</dt><dd>${supplier.name}</dd>
										<dt>供应商图片</dt><dd><img src="${ctx}/api/avatar/${supplier.imagePath}" style="max-width: 200px; max-height: 200px;"></dd>
										<dt>行业类别</dt><dd>${supplier.profession}</dd>
										<dt>企业性质</dt><dd>${supplier.property}</dd>
										<dt>企业规模</dt><dd>${supplier.scale}</dd>
										<dt>地址</dt><dd>${supplier.address}</dd>
										<dt>联系人</dt><dd>${supplier.contactUser}</dd>
										<dt>联系电话</dt><dd>${supplier.contact}</dd>
										<dt>座机</dt><dd>${supplier.phone}</dd>
										<dt>传真</dt><dd>${supplier.fax}</dd>
										<dt>简介</dt><dd>${supplier.introduction}</dd>
										<dt>营业执照</dt><dd>${supplier.license}</dd>
										<dt>营业执照图片</dt><dd><img src="${ctx}${supplier.licensePath}" class="img-responsive"></dd>
									</dl>
								</div>
							</c:if>
						</div>
						
						<div id="tab-line" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是物流服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-logistics-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<c:if test="${supplier.status != 2}">
									<div class="panel-body text-center">
										<img src="${ctx}/img/operate-success.png" style="max-width: 100px;">
										<h3 style="padding: 5px;">申请提交完成，正在为你审核...</h3>
										<p>我们会在3个工作日内完成供应商信息的审核工作，审核通过后，你可以使用供应商所提供的平台服务。</p>
									</div>
								</c:if>
								<c:if test="${supplier.status == 2}">
									<div class="panel-body">
										<div class="btn-group" id="line-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-line-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-line-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="line-list-table" class="table-hm" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
						
						<div id="tab-network" class="tab-pane">
							<c:if test="${empty supplier}">
								<div class="panel-body text-center">
									<p><i class="fa fa-lock" style="font-size: 100px; color: #999;"></i></p>
									<p>您还不是物流服务供应商</p>
									<p><button type="button" class="btn btn-primary btn-outline btn-logistics-supplier">申请成为供应商</button></p>
								</div>
							</c:if>
							<c:if test="${not empty supplier}">
								<c:if test="${supplier.status != 2}">
									<div class="panel-body text-center">
										<img src="${ctx}/img/operate-success.png" style="max-width: 100px;">
										<h3 style="padding: 5px;">申请提交完成，正在为你审核...</h3>
										<p>我们会在3个工作日内完成供应商信息的审核工作，审核通过后，你可以使用供应商所提供的平台服务。</p>
									</div>
								</c:if>
								<c:if test="${supplier.status == 2}">
									<div class="panel-body">
										<div class="btn-group" id="network-list-table-toolbar" role="group">
											<button type="button" class="btn btn-white btn-network-add">
		                       					<i class="fa fa-plus fa-fw"></i>新增
		                    				</button>
						                    <button type="button" class="btn btn-danger btn-network-delete-batch" disabled='disabled'>
						                        <i class="fa fa-trash-o fa-fw"></i>删除
						                    </button>
						                </div>
						                <table id="network-list-table" class="table-hm table-fixed" data-mobile-responsive="true"></table>
					                </div>
								</c:if>
							</c:if>
						</div>
						
						<div id="tab-supply" class="tab-pane">
							<div class="panel-body">
								<div class="btn-group" id="supply-list-table-toolbar" role="group">
									<button type="button" class="btn btn-white btn-supply-add">
                       					<i class="fa fa-plus fa-fw"></i>新增
                    				</button>
				                    <button type="button" class="btn btn-danger btn-supply-delete-batch" disabled='disabled'>
				                        <i class="fa fa-trash-o fa-fw"></i>删除
				                    </button>
				                </div>
				                <table id="supply-list-table" class="table-hm" data-mobile-responsive="true"></table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 线路 -->
	<div class="modal" id="modal-line-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">线路信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-line" autocomplete="off">
                    	<div class="form-group">
                            <label for="origin" class="col-sm-3 control-label"><i class="form-required">*</i>发货地</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control citypicker" name="origin">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="destination" class="col-sm-3 control-label"><i class="form-required">*</i>收货地</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control citypicker" name="destination">
                            </div>
                        </div>
                    
                    	<div class="form-group">
                            <label for="transportMode" class="col-sm-3 control-label"><i class="form-required">*</i>运输方式</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="transportMode" required>
                               		<option value="">请选择运输方式</option>
									<c:forEach var="transportMode" items="${transportModes}">
										<option value="${transportMode}">${transportMode}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label for="aging" class="col-sm-3 control-label"><i class="form-required">*</i>参考时效</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="aging" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="heavyPrice" class="col-sm-3 control-label"><i class="form-required">*</i>重货单价</label>
                            <div class="col-sm-7">
                            	<div class="input-group">
                            		<input type="text" class="form-control" name="heavyPrice" required data-bv-numeric="true">
                                	<div class="input-group-addon">元/公斤</div>
                            	</div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="lightPrice" class="col-sm-3 control-label"><i class="form-required">*</i>轻货单价</label>
                            <div class="col-sm-7">
                            	<div class="input-group">
                            		<input type="text" class="form-control" name="lightPrice" required data-bv-numeric="true">
                            		<div class="input-group-addon">元/立方</div>
                            	</div>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label for="lowest" class="col-sm-3 control-label"><i class="form-required">*</i>最低一票</label>
                            <div class="col-sm-7">
                            	<div class="input-group">
                            		<input type="text" class="form-control" name="lowest" required data-bv-numeric="true">
                            		<div class="input-group-addon">元</div>
                            	</div>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="contactUser" class="col-sm-3 control-label"><i class="form-required">*</i>联系人</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contactUser" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contact" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal" id="modal-line-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">线路信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>发货地</dt><dd data-name="origin"></dd>
                		<dt>收货地</dt><dd data-name="destination"></dd>
                		<dt>运输方式</dt><dd data-name="transportMode"></dd>
                		<dt>参考时效</dt><dd data-name="aging"></dd>
                		<dt>重货单价</dt><dd data-name="heavyPrice"></dd>
                		<dt>轻货单价</dt><dd data-name="lightPrice"></dd>
                		<dt>最低一票</dt><dd data-name="lowest"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
	
	<!-- 网点 -->
	<div class="modal" id="modal-network-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">网点信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-network" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>网点名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>网点地址</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="address" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contact" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="business" class="col-sm-3 control-label"><i class="form-required">*</i>业务内容</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="business" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
    
     <div class="modal" id="modal-network-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">网点信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>网点名称</dt><dd data-name="name"></dd>
                		<dt>网点地址</dt><dd data-name="address"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                		<dt>业务内容</dt><dd data-name="business"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
	
	<!-- 货源 -->
	<div class="modal" id="modal-supply-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-center">
            <div class="modal-content animated fadeInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">网点信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="form-supply" autocomplete="off">
                       <div class="form-group">
                            <label for="origin" class="col-sm-3 control-label"><i class="form-required">*</i>发货地</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control citypicker" name="origin">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="destination" class="col-sm-3 control-label"><i class="form-required">*</i>收货地</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control citypicker" name="destination">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="supplyType" class="col-sm-3 control-label"><i class="form-required">*</i>货源类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="supplyType" required>
                               		<option value="">请选择货源类型</option>
									<option value="重货">重货</option>
									<option value="轻货">轻货</option>
								</select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="description" class="col-sm-3 control-label"><i class="form-required">*</i>货源描述</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="description" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="form-group">
                        	<label for="remark" class="col-sm-3 control-label"><i class="form-required">*</i>备注</label>
                        	<div class="col-sm-7">
                                <textarea class="form-control" name="remark" style="resize:none; height: 150px;" required></textarea>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label for="contactUser" class="col-sm-3 control-label"><i class="form-required">*</i>联系人</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contactUser" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="contact" class="col-sm-3 control-label"><i class="form-required">*</i>联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="contact" required>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="address" class="col-sm-3 control-label"><i class="form-required">*</i>具体地点</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="address" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white btn-fw" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary btn-fw btn-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>
    
     <div class="modal" id="modal-supply-detail-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog modal-center">
			<div class="modal-content animated fadeInDown">
				<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">货源信息</h4>
                </div>
                <div class="modal-body">
                	<dl class="dl-horizontal dl-detail">
                		<dt>发货地</dt><dd data-name="origin"></dd>
                		<dt>收货地</dt><dd data-name="destination"></dd>
                		<dt>货源类型</dt><dd data-name="supplyType"></dd>
                		<dt>货源描述</dt><dd data-name="description"></dd>
                		<dt>备注</dt><dd data-name="remark"></dd>
                		<dt>联系人</dt><dd data-name="contactUser"></dd>
                		<dt>联系电话</dt><dd data-name="contact"></dd>
                		<dt>具体地点</dt><dd data-name="address"></dd>
                	</dl>
                </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/toastr/toastr.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/city-picker/js/city-picker.data.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/city-picker/js/city-picker.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {	
		
		var $page = $('.body-platform-logistics');
		var supplierId = '${supplier.id}';
		var userId = '${userId}';
		
		// 线路
		var $lineTable = $('#network-list-table');
		if ($lineTable) {
			var $lineDialog = $('#modal-line-dialog');
			var $lineDetailDialog = $('#modal-line-detail-dialog');
			var $lineForm = $('#form-line');
			$k.util.bsValidator($lineForm);
			
			$lineTable = $k.util.bsTable($page.find('#line-list-table'), {
				url: '${ctx}/api/service/logistics/line/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#line-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns:[{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'origin',
	            	title: '发货地',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-line-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	               		'click .btn-line-detail': function(e, value, row, index) {
	               			e.stopPropagation();
	               			$.each(row, function(key, val) {
	               				if (key == 'heavyPrice') {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val + ' 元/公斤');
	               				} else if (key == 'lightPrice') {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val + ' 元/立方');
	               				} else if (key == 'lowest') {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val + ' 元');
	               				} else {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	               				}
	               			});
	               			$lineDetailDialog.modal('show');
	               		}
	               	}
	            }, {
	            	field: 'destination',
	            	title: '收货地',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-line-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	               		'click .btn-line-detail': function(e, value, row, index) {
	               			e.stopPropagation();
	               			$.each(row, function(key, val) {
	               				if (key == 'heavyPrice') {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val + ' 元/公斤');
	               				} else if (key == 'lightPrice') {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val + ' 元/立方');
	               				} else if (key == 'lowest') {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val + ' 元');
	               				} else {
	               					$lineDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	               				}
	               			});
	               			$lineDetailDialog.modal('show');
	               		}
	               	}
	            }, {
	            	field: 'transportMode',
	            	title: '运输方式',
	            }, {
	            	field: 'aging',
	            	title: '参考时效'
	            }, {
	            	field: 'heavyPrice',
	            	title: '重货单价',
	            	formatter: function(value, row, index) {
	            		return value + ' 元/公斤';
	            	}
	            }, {
	            	field: 'lightPrice',
	            	title: '轻货单价',
	            	formatter: function(value, row, index) {
	            		return value + ' 元/立方';
	            	}
	            }, {
	            	field: 'lowest',
	            	title: '最低一票',
	            	formatter: function(value, row, index) {
	            		return value + ' 元';
	            	}
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-line-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-line-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-line-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				if (key == 'origin') {
	            					initCityPicker($lineForm.find('input[name="origin"]'), val);
	            				} else if (key == 'destination') {
	            					initCityPicker($lineForm.find('input[name="destination"]'), val);
	            				} else {
	            					$lineForm.find('input[name="' + key + '"]').val(val);
		            				$lineForm.find('select[name="' + key + '"]').val(val);
	            				}
	            			});
	            			$lineDialog.data('method', 'edit');
            				$lineDialog.data('lineId', row.id);
	            			$lineDialog.modal('show');
	            		},
	            		'click .btn-line-delete': function(e, value, row, index) {
	            			e.stopPropagation();
	            			swal({
	            				title: '',
	            				text: '确定删除选中记录?',
	            				type: 'warning',
	            				showCancelButton: true,
	                            cancelButtonText: '取消',
	                            confirmButtonColor: '#DD6B55',
	                            confirmButtonText: '确定',
	            			}, function() {
	            				$.ajax({
	            					url: '${ctx}/api/service/logistics/line/delete',
	            					data: {
	            						lineId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$lineTable.bootstrapTable('refresh'); 
            							} else {
            								toastr['error'](ret.msg);
            	                        }
	            					},
	            					error: function(err) {}
	            				});
	            			});
	            		}
	            	}
	            }]
			});
			$lineTable.on('all.bs.table', function(e, row) {
	            var selNum = $lineTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-line-delete-batch').removeAttr('disabled') : $page.find('.btn-line-delete-batch').attr('disabled', 'disabled');
	        });
			
			$lineDialog.on('click', '.btn-confirm', function() {
				var origin = $lineForm.find('input[name="origin"]').citypicker().val();
				if (!origin) {
					toastr['error']('请选择发货地!');
					return;
				}
				var destination = $lineForm.find('input[name="destination"]').citypicker().val();
				if (!destination) {
					toastr['error']('请选择收货地!');
					return;
				}
				
				var validator = $lineForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($lineForm[0]); 
            		var method = $lineDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			$.ajax({
    					    url: '${ctx}/api/service/logistics/line/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$lineDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$lineTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('lineId', $lineDialog.data('lineId'));
            			$.ajax({
    					    url: '${ctx}/api/service/logistics/line/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$lineDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$lineTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		}
	            }
			});
		}
		
		// 网点
		var $networkTable = $('#network-list-table');
		if ($networkTable) {
			var $networkDialog = $('#modal-network-dialog');
			var $networkDetailDialog = $('#modal-network-detail-dialog');
			var $networkForm = $('#form-network');
			$k.util.bsValidator($networkForm);
			
			$networkTable = $k.util.bsTable($page.find('#network-list-table'), {
				url: '${ctx}/api/service/logistics/network/listBySupplierId?supplierId=' + supplierId,
				toolbar: '#network-list-table-toolbar',
				idField: 'id',
				responseHandler: function(res) {
	                return res.data;
	            },
	            columns:[{
	            	field: 'state',
	            	checkbox: true
	            }, {
	            	field: 'name',
	            	title: '网点名称',
	            	formatter: function(value, row, index) {
	            		return '<a class="btn-network-detail">' + value + '</a>';
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-network-detail': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$networkDetailDialog.find('dd[data-name="' + key + '"]').text(val);
	            			});
	            			$networkDetailDialog.modal('show');
	            		}
	            	}
	            }, {
	            	field: 'address',
	            	title: '网点地址',
	            }, {
	            	field: 'contact',
	            	title: '联系电话',
	            }, {
	            	field: 'business',
	            	title: '业务内容'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	formatter: function(value, row, index) {
	            		var $edit = '<a class="btn-network-edit a-operate">编辑</a>';
	            		var $delete = '<a class="btn-network-delete a-operate">删除</a>';
	            		return $edit + $delete;
	            	},
	            	events: window.operateEvents = {
	            		'click .btn-network-edit': function(e, value, row, index) {
	            			e.stopPropagation();
	            			$.each(row, function(key, val) {
	            				$networkForm.find('input[name="' + key + '"]').val(val);
	            			});
	            			$networkDialog.data('method', 'edit');
            				$networkDialog.data('networkId', row.id);
	            			$networkDialog.modal('show');
	            		},
	            		'click .btn-network-delete': function(e, value, row, index) {
	            			e.stopPropagation();
	            			swal({
	            				title: '',
	            				text: '确定删除选中记录?',
	            				type: 'warning',
	            				showCancelButton: true,
	                            cancelButtonText: '取消',
	                            confirmButtonColor: '#DD6B55',
	                            confirmButtonText: '确定',
	            			}, function() {
	            				$.ajax({
	            					url: '${ctx}/api/service/logistics/network/delete',
	            					data: {
	            						networkId: row.id
	            					},
	            					success: function(ret) {
	            						 if (ret.code == 0) {
            	                        	toastr['success'](ret.msg);
            		                		$networkTable.bootstrapTable('refresh'); 
            							} else {
            								toastr['error'](ret.msg);
            	                        }
	            					},
	            					error: function(err) {}
	            				});
	            			});
	            		}
	            	}
	            }]
			});
			$networkTable.on('all.bs.table', function(e, row) {
	            var selNum = $networkTable.bootstrapTable('getSelections').length;
	            selNum > 0 ? $page.find('.btn-network-delete-batch').removeAttr('disabled') : $page.find('.btn-network-delete-batch').attr('disabled', 'disabled');
	        });
			
			$networkDialog.on('click', '.btn-confirm', function() {
				var validator = $networkForm.data('bootstrapValidator');
	            validator.validate();
	            
	            if (validator.isValid()) {
	            	var formData = new FormData($networkForm[0]); 
            		var method = $networkDialog.data('method');
            		if (method == 'add') {
            			formData.append('supplierId', supplierId);
            			$.ajax({
    					    url: '${ctx}/api/service/logistics/network/create',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$networkDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$networkTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		} else {
            			formData.append('networkId', $networkDialog.data('networkId'));
            			$.ajax({
    					    url: '${ctx}/api/service/logistics/network/update',
    		            	type: 'post',
    		            	data: formData,
    		        		processData: false,
    		                contentType: false,
    		                cache: false, 
    		                success: function(ret) {
    		                	if (ret.code == 0) {
    		                		$networkDialog.modal('hide');
    		                		toastr['success'](ret.msg);
    		                		$networkTable.bootstrapTable('refresh'); 
    		                	} else {
    		                		toastr['error'](ret.msg);
    		                	}
    		                },
    		                error: function(err) {}
    		            });
            		}
	            }
			});
		}
		
		// 货源
		var $supplyTable = $('#supply-list-table');
		var $supplyDialog = $('#modal-supply-dialog');
		var $supplyDetailDialog = $('#modal-supply-detail-dialog');
		var $supplyForm = $('#form-supply');
		$k.util.bsValidator($supplyForm);
			
		var $supplyTable = $k.util.bsTable($page.find('#supply-list-table'), {
			url: '${ctx}/api/service/logistics/supply/listByUserId?userId=' + userId,
			toolbar: '#supply-list-table-toolbar',
			idField: 'id',
			responseHandler: function(res) {
                return res.data;
            },
            columns:[{
            	field: 'state',
            	checkbox: true
            }, {
            	field: 'origin',
            	title: '发货地',
            	formatter: function(value, row, index) {
            		return '<a class="btn-supply-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
               		'click .btn-supply-detail': function(e, value, row, index) {
               			e.stopPropagation();
               			$.each(row, function(key, val) {
               				$supplyDetailDialog.find('dd[data-name="' + key + '"]').text(val);
               			});
               			$supplyDetailDialog.modal('show');
               		}
               	}
            }, {
            	field: 'destination',
            	title: '收货地',
            	formatter: function(value, row, index) {
            		return '<a class="btn-supply-detail">' + value + '</a>';
            	},
            	events: window.operateEvents = {
            		'click .btn-supply-detail': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				$supplyDetailDialog.find('dd[data-name="' + key + '"]').text(val);
            			});
            			$supplyDetailDialog.modal('show');
            		}
            	}
            }, {
            	field: 'supplyType',
            	title: '货源类型',
            	align: 'center'
            }, {
            	field: 'contactUser',
            	title: '联系人'
            }, {
            	field: 'contact',
            	title: '联系电话'
            }, {
            	title: '操作',
            	align: 'center',
            	formatter: function(value, row, index) {
            		var $edit = '<a class="btn-supply-edit a-operate">编辑</a>';
            		var $delete = '<a class="btn-supply-delete a-operate">删除</a>';
            		return $edit + $delete;
            	},
            	events: window.operateEvents = {
            		'click .btn-supply-edit': function(e, value, row, index) {
            			e.stopPropagation();
            			$.each(row, function(key, val) {
            				if (key == 'origin') {
            					initCityPicker($supplyForm.find('input[name="origin"]'), val);
            				} else if (key == 'destination') {
            					initCityPicker($supplyForm.find('input[name="destination"]'), val);
            				} else {
            					$supplyForm.find('input[name="' + key + '"]').val(val);
	            				$supplyForm.find('select[name="' + key + '"]').val(val);
	            				$supplyForm.find('textarea[name="' + key + '"]').val(val);
            				}
            			});
            			$supplyDialog.data('method', 'edit');
           				$supplyDialog.data('supplyId', row.id);
            			$supplyDialog.modal('show');
            		},
            		'click .btn-supply-delete': function(e, value, row, index) {
            			e.stopPropagation();
            			swal({
            				title: '',
            				text: '确定删除选中记录?',
            				type: 'warning',
            				showCancelButton: true,
                            cancelButtonText: '取消',
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确定',
            			}, function() {
            				$.ajax({
            					url: '${ctx}/api/service/logistics/supply/delete',
            					data: {
            						supplyId: row.id
            					},
            					success: function(ret) {
            						 if (ret.code == 0) {
           	                        	toastr['success'](ret.msg);
           		                		$supplyTable.bootstrapTable('refresh'); 
           							} else {
           								toastr['error'](ret.msg);
           	                        }
            					},
            					error: function(err) {}
            				});
            			});
            		}
            	}
            }]
		});
		$supplyTable.on('all.bs.table', function(e, row) {
            var selNum = $supplyTable.bootstrapTable('getSelections').length;
            selNum > 0 ? $page.find('.btn-supply-delete-batch').removeAttr('disabled') : $page.find('.btn-supply-delete-batch').attr('disabled', 'disabled');
        });
			
		$supplyDialog.on('click', '.btn-confirm', function() {
			var origin = $supplyForm.find('input[name="origin"]').citypicker().val();
			if (!origin) {
				toastr['error']('请选择发货地!');
				return;
			}
			var destination = $supplyForm.find('input[name="destination"]').citypicker().val();
			if (!destination) {
				toastr['error']('请选择收货地!');
				return;
			}
			
			var validator = $supplyForm.data('bootstrapValidator');
            validator.validate();
            
            if (validator.isValid()) {
            	var formData = new FormData($supplyForm[0]); 
           		var method = $supplyDialog.data('method');
           		if (method == 'add') {
           			formData.append('userId', userId);
           			$.ajax({
   					    url: '${ctx}/api/service/logistics/supply/create',
   		            	type: 'post',
   		            	data: formData,
   		        		processData: false,
   		                contentType: false,
   		                cache: false, 
   		                success: function(ret) {
   		                	if (ret.code == 0) {
   		                		$supplyDialog.modal('hide');
   		                		toastr['success'](ret.msg);
   		                		$supplyTable.bootstrapTable('refresh'); 
   		                	} else {
   		                		toastr['error'](ret.msg);
   		                	}
   		                },
   		                error: function(err) {}
   		            });
           		} else {
           			formData.append('supplyId', $supplyDialog.data('supplyId'));
           			$.ajax({
   					    url: '${ctx}/api/service/logistics/supply/update',
   		            	type: 'post',
   		            	data: formData,
   		        		processData: false,
   		                contentType: false,
   		                cache: false, 
   		                success: function(ret) {
   		                	if (ret.code == 0) {
   		                		$supplyDialog.modal('hide');
   		                		toastr['success'](ret.msg);
   		                		$supplyTable.bootstrapTable('refresh'); 
   		                	} else {
   		                		toastr['error'](ret.msg);
   		                	}
   		                },
   		                error: function(err) {}
   		            });
           		}
            }
		});
		
		$page
		.on('click', '.btn-logistics-supplier', function() {
			window.location.href = '${ctx}/supplierApply?type=4';
		})
		// 线路
		.on('click', '.btn-line-add', function() {
			$lineDialog.data('method', 'add');
			$lineDialog.find('.citypicker').citypicker();
			$lineDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-line-dialog', function() {
            $lineForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $lineDialog.find('.citypicker').citypicker('reset');
        })
        .on('click', '.btn-line-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $lineTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/logistics/line/deleteBatch',
                    data: { 
                    	lineIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$lineTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        })
		// 网点
		.on('click', '.btn-network-add', function() {
			$networkDialog.data('method', 'add');
			$networkDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-network-dialog', function() {
            $networkForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
        })
        .on('click', '.btn-network-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $networkTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/logistics/network/deleteBatch',
                    data: { 
                    	networkIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$networkTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        })
        // 货源
        .on('click', '.btn-supply-add', function() {
			$supplyDialog.data('method', 'add');
			$supplyDialog.find('.citypicker').citypicker();
			$supplyDialog.modal('show');
		})
		.on('hidden.bs.modal', '#modal-supply-dialog', function() {
            $supplyForm.bootstrapValidator('resetForm', true);
            $(this).removeData('bs.modal');
            $supplyDialog.find('.citypicker').citypicker('reset');
        })
        .on('click', '.btn-supply-delete-batch', function() {
            swal({
                title: '',
                text: '确定批量删除选中记录',
                type: 'warning',
                showCancelButton: true,
                cancelButtonText: '取消',
                confirmButtonColor: '#DD6B55',
                confirmButtonText: '确定',
            }, function() {
                var rows = $supplyTable.bootstrapTable('getSelections');
                $.ajax({
                    url: '${ctx}/api/service/logistics/supply/deleteBatch',
                    data: { 
                    	supplyIdList: $k.util.getIdList(rows) 
                    },
                    success: function(ret) {
                        if (ret.code == 0) {
                        	toastr['success'](ret.msg);
	                		$supplyTable.bootstrapTable('refresh'); 
						} else {
							toastr['error'](ret.msg);
                        }
                    },
                    error: function(err) {}
                });
            });
        });
		
		function initCityPicker($input, data) {
			$input.citypicker('reset');
			$input.citypicker('destroy');
			
			var arr = data.split('/');
			switch(arr.length) {
			case 1:	$input.citypicker({	province: arr[0] });	break;
			case 2: $input.citypicker({ province: arr[0],  city: arr[1]} );		break;
			case 3: $input.citypicker({ province: arr[0],  city: arr[1],  district: arr[2] });	break;
			}
		}
		
	})( jQuery );
	</script>
</body>
</html>