<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/password.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>个人资料</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap-table/bootstrap-table.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
	<style type="text/css">
	.body-personal-info dt,
	.body-personal-info dd {
		line-height: 2;
	}
	</style>
	
</head>

<body class="gray-bg body-personal-info">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="tabs-container">
					<ul class="nav nav-tabs nav-tabs-line">
						<li class="active">
							<a data-toggle="tab" href="#personal-tab-info" aria-expanded="true"><i class="fa fa-info-circle"></i>基本信息</a>
						</li>
						<li>
							<a data-toggle="tab" href="#personal-tab-password" aria-expanded="true"><i class="fa fa-key"></i>修改密码</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="personal-tab-info" class="tab-pane active">
							<div class="panel-body">
								<form class="form-horizontal" role="form" autocomplete="off" id="form-info" onsubmit="return false;">
									<div class="form-group">
										<label for="username" class="col-sm-3 control-label">用户名</label>
										<div class="col-sm-5">
											<input type="text" class="form-control" name="username" value="${user.username}" required disabled>
										</div>								
									</div>

									<div class="form-group">
										<label for="name" class="col-sm-3 control-label">姓名</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="name" value="${user.name}" required disabled>
				                        </div>
									</div>
									
									<div class="form-group">
				                        <label for="mobile" class="col-sm-3 control-label">手机号</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control" name="mobile" value="${user.mobile}" required disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="role" class="col-sm-3 control-label">角色</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control" name="role" value="${user.role.name}" required disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="name" class="col-sm-3 control-label">性别</label>
				                        <div class="col-sm-5">
				                            <select class="form-control editable" name="gender" disabled>
				                                <option value="0">请选择性别</option>
				                                <option value="1">男</option>
				                                <option value="2">女</option>
				                            </select>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="email" class="col-sm-3 control-label">邮箱</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control editable" name="email" value="${user.email}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="enterpriseId" class="col-sm-3 control-label">所属企业</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control" name="email" value="${user.enterprise.name}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="departmentId" class="col-sm-3 control-label">所属部门</label>
				                        <div class="col-sm-5">
				                            <input type="text" class="form-control" name="email" value="${user.department.name}" disabled>
				                        </div>
				                    </div>
				                    
				                    <div class="form-group">
				                        <label for="introduction" class="col-sm-3 control-label">个人描述</label>
				                        <div class="col-sm-5">
				                            <textarea class="form-control editable" name="introduction" style="resize:none; height: 150px;" disabled>${user.introduction}</textarea>
				                        </div>
				                    </div>
				                    
				                    <div class="hr-line-dashed"></div>
                    
				                    <div class="form-group">
				                        <div class="col-sm-4 col-sm-offset-3">
				                        	<button type="button" class="btn btn-primary btn-info-edit">
				                                <i class="fa fa-edit fa-fw"></i>编辑
				                            </button>
				                            <button type="button" class="btn btn-primary btn-info-save hide">
				                                <i class="fa fa-save fa-fw"></i>保存
				                            </button>
				                            <button type="button" class="btn btn-white btn-info-cancel hide">
				                                <i class="fa fa-close fa-fw"></i>取消
				                            </button>
				                        
				                        </div>
				                    </div>
								</form>
							</div>
						</div>
						
						<div id="personal-tab-password" class="tab-pane">
							<form class="form-horizontal" role="form" autocomplete="off" id="form-password" onkeydown="if(event.keyCode==13){return false;}">
								<div class="panel-body">
									<div class="form-group">
										<label for="oldPassword" class="col-sm-3 control-label"><i class="form-required">*</i>原密码</label>
										<div class="col-sm-5">
											<input type="password" class="form-control" name="oldPassword" required data-bv-notempty-message="请输入原密码">
										</div>
									</div>
									
									<div class="form-group">
										<label for="newPassword" class="col-sm-3 control-label"><i class="form-required">*</i>新密码</label>
										<div class="col-sm-5">
											<input type="password" class="form-control" name="newPassword" id="newPassword" required data-bv-notempty-message="请输入新密码">
										</div>
									</div>
									
									<div class="form-group">
										<label for="" class="col-sm-3 control-label" style="font-weight: normal; color: #999;">密码强度</label>
										<div class="col-sm-5">
											<div id="level" class="pw-strength">
												<div class="pw-bar"></div>
												<div class="pw-bar-on"></div>
												<div class="pw-txt">
													<span>弱</span><span>中</span><span>强</span>
												</div>
												<div style="color: #999; padding: 4px 10px;">6-16个字符,请使用字母加数字或者符号的组合密码</div>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="confirmPassword" class="col-sm-3 control-label"><i class="form-required">*</i>确认密码</label>
										<div class="col-sm-5">
											<input type="password" class="form-control" name="confirmPassword" required data-bv-notempty-message="请输入确认密码">
										</div>
									</div>
									
									<div class="form-group">
				                        <div class="col-sm-4 col-sm-offset-3">
				                            <button type="button" class="btn btn-primary btn-password">
				                                <i class="fa fa-check fa-fw"></i>确定
				                            </button>
				                        </div>
				                    </div>							
								</div>
							</form>
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
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-personal-info');
		var $formInfo = $page.find('#form-info');
		
		var userId = ${user.id};
		
		// info
		$formInfo.find('select[name="gender"]').val(${user.gender});
		
		$formInfo
		.on('click', '.btn-info-edit', function() {
			$formInfo.find('.editable').removeAttr('disabled');
			
			$formInfo.find('.btn-info-edit').addClass('hide');
			$formInfo.find('.btn-info-save, .btn-info-cancel').removeClass('hide');
		})
		.on('click', '.btn-info-save', function() {
			
		})
		.on('click', '.btn-info-cancel', function() {
			$formInfo.find('.editable').attr('disabled', 'disabled');
			$formInfo.find('.btn-info-save, .btn-info-cancel').addClass('hide');
			$formInfo.find('.btn-info-edit').removeClass('hide');
		});
		
		// password
		strength($page.find('#newPassword'), $page.find('#level'));
		
		var $formPassword = $page.find('#form-password');
		$k.util.bsValidator($formPassword, {
			fields: {
				newPassword: {
					validators: {
						identical: {
							field: 'confirmPassword',
							message: '输入的两次密码不一致'
						}, 
						stringLength: {
							min: 6,
							max: 16,
							message: '密码长度必须在6到16之间'
						}
					}
				},
				confirmPassword: {
					validators: {
						identical: {
							field: 'newPassword',
							message: '输入的两次密码不一致'
						}, 
						stringLength: {
							min: 6,
							max: 16,
							message: '密码长度必须在6到16之间'
						}
					}
				}
			}
		});
		
		$formPassword.on('click', '.btn-password', function() {
			var validator = $formPassword.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				$.ajax({
					url: '${ctx}/api/user/password',
					type: 'post',
					data: {
						userId: userId,
						oldPassword: $formPassword.find('input[name="oldPassword"]').val(),
						newPassword: $formPassword.find('input[name="newPassword"]').val()
					},
					success: function(ret) {
						if (ret.code == 0) {
                    		swal({
                                title: '',
                                text: '密码修改成功',
                                type: 'success'
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
					},
					error: function(err) {}
				});
			}
			return false;
		});
	
		
	})( jQuery );
	</script>
	
</body>

</html>