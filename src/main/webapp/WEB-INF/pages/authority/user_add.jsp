<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/avatar.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${title}</title>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sweetalert/sweetalert.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/cropper/cropper.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sitelogo/sitelogo.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
</head>

<body class="gray-bg body-user-add">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>${title}</h5>
			</div>
			
			<div class="ibox-content">
				<form class="form-horizontal" role="form" autocomplete="off" id="form-user">
					<div class="form-group">
						<label for="avatar" class="col-sm-3 control-label">头像</label>
						<div id="crop-avatar" class="col-md-5">
							<div class="avatar-view" title="点击修改头像" style="width: 160px; height: 160px;">
								<c:if test="${method=='add'}">
									<img src="${ctx}/api/avatar/default_user" alt="头像">
								</c:if>
								<c:if test="${method=='edit' || method=='detail'}">
									<img src="${ctx}/api/avatar/${user.avatar}" alt="头像">
								</c:if>
						    </div>
						</div>
					</div>
				
					<div class="form-group">
						<label for="username" class="col-sm-3 control-label"><i class="form-required">*</i>用户名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="username" value="${user.username}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>姓名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="name" value="${user.name}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="mobile" class="col-sm-3 control-label"><i class="form-required">*</i>手机号</label>
						<div class="col-sm-5">
                            <input type="text" class="form-control" name="mobile" value="${user.mobile}" required>
                        </div>
					</div>
					
					<div class="form-group">
						<label for="role" class="col-sm-3 control-label"><i class="form-required">*</i>角色</label>
						<div class="col-sm-5">
							<select class="form-control" name="roleId" required>
								<option value="">请选择角色</option>
								<c:forEach var="role" items="${roleList}">
									<option value="${role.id}">${role.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">性别</label>
						<div class="col-sm-5">
							<select class="form-control" name="gender">
								<option value="0">请选择性别</option>
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">邮箱</label>
						<div class="col-sm-5">
                            <input type="text" class="form-control" name="email" value="${user.email}">
                        </div>
					</div>
					
					<div class="form-group">
						<label for="enterpriseId" class="col-sm-3 control-label">所属企业</label>
						<div class="col-sm-5">
							<select class="form-control" name="enterpriseId">
								<option value="">请选择企业</option>
								<c:forEach var="enterprise" items="${enterpriseList}">
									<option value="${enterprise.id}">${enterprise.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="departmentId" class="col-sm-3 control-label">所属部门</label>
						<div class="col-sm-5">
							<select class="form-control" name="departmentId">
								<option value="">请选择部门</option>
								<c:forEach var="department" items="${departmentList}">
									<option value="${department.id}">${department.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="introduction" class="col-sm-3 control-label">个人描述</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" name="introduction" style="resize:none; height: 150px;">${user.introduction}</textarea>
                        </div>
					</div>
					
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
                        <div class="col-sm-4 col-sm-offset-3">
                            <c:if test="${method == 'add'}">
                            <button type="button" class="btn btn-primary btn-user-add">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <c:if test="${method == 'edit'}">
                            <button type="button" class="btn btn-primary btn-user-edit">
                                <i class="fa fa-check fa-fw"></i>确定
                            </button>
                            </c:if>
                            <button type="button" class="btn btn-white btn-user-cancel">
                                <i class="fa fa-close fa-fw"></i>取消
                            </button>
                        </div>
                    </div>
				
				</form>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/cropper/cropper.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sitelogo/sitelogo.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-user-add');
		var $form = $page.find('#form-user');
		var method = '${method}';
		
		$k.util.bsValidator($form, {
			fields: {
				mobile: {
	                 validators: {
	                     regexp: {
	                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
	                         message: '请输入正确的手机号码'
	                     }
	                 }
	             },
			}
		});
		
		if (method == 'detail') {
			$page.find('.form-required').remove();
			$page.find('select[name="roleId"]').val(${user.role.id});
			$page.find('select[name="gender"]').val(${user.gender});
			$page.find('select[name="enterpriseId"]').val(${user.enterprise.id});
			$page.find('select[name="departmentId"]').val(${user.department.id});
			$page.find('select').addClass('disabled');
			$page.find('input, select, textarea').addClass('disabled');
			$page.find('.avatar-view').addClass('disabled').attr('disabled', 'disabled');
		} else if (method == 'edit') {
			$page.find('input[name="username"]').attr('disabled', 'disabled');
			$page.find('select[name="roleId"]').val(${user.role.id});
			$page.find('select[name="gender"]').val(${user.gender});
			$page.find('select[name="enterpriseId"]').val(${user.enterprise.id});
			$page.find('select[name="departmentId"]').val(${user.department.id});
		}
		
		$page
		.on('click', '.btn-user-add', function() {
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			
			if (validator.isValid()) {
				var formData = new FormData($form[0]);
				formData.append('avatar', $k.util.getAvatar($page.find('.avatar-view > img')));
				
				$.ajax({
					url :'${ctx}/api/user/create',
					type: 'POST',
					data: formData,
					processData: false,
					contentType: false,
					cache: false,
					success: function(ret) {
						if (ret.code == 0) {
                    		swal({
                                title: '',
                                text: '操作成功',
                                type: 'success'
                            }, function() {
                                window.location.href = './userList';
                            });
                    	} else {
                    		swal('', ret.msg, 'error');
                    	}
					},
					error: function(err) {}
				});
			}
		})
		.on('click', '.btn-user-edit', function() {
			var formData = new FormData($form[0]);
			formData.append('avatar', $k.util.getAvatar($page.find('.avatar-view > img')));
			formData.append('userId', '${user.id}');
			
			$.ajax({
				url :'${ctx}/api/user/update',
				type: 'POST',
				data: formData,
				processData: false,
				contentType: false,
				cache: false,
				success: function(ret) {
					if (ret.code == 0) {
                		swal({
                            title: '',
                            text: '操作成功',
                            type: 'success'
                        }, function() {
                            window.location.href = './userList';
                        });
                	} else {
                		swal('', ret.msg, 'error');
                	}
				},
				error: function(err) {}
			});
			
		})
		.on('click', '.btn-user-cancel', function() {
			window.location.href = './userList';
		});
		
	})( jQuery );
	</script>
	
</body>

</html>