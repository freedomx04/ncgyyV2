<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/avatar.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>南城工业 | 注册</title>
	<meta name="keywords" content="">
    <meta name="description" content="">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/cropper/cropper.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/sitelogo/sitelogo.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/pearls.css">
	
	<style type="text/css">
	.body-register .msg-wrap {
		min-height: 30px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    width: 100%;
	    height: auto;
	}
	.body-register .msg-error {
		position: relative;
   	 	background: #ffebeb;
    	color: #e4393c;
    	border: 1px solid #faccc6;
    	padding: 6px 10px 6px 12px;
    	line-height: 15px;
    	width: 100%;
    	height: auto;
	}
	</style>
</head>
<body class="gray-bg body-register">
	<div class="row border-bottom white-bg">
         <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
             <div class="navbar-header">
                 <a href="#" style="font-size: 20px; line-height: 75px; margin-left: 30px;">南城县工业园区综合信息服务平台</a>
             </div>
             <div class="navbar-collapse collapse" id="navbar">
                 <ul class="nav navbar-top-links navbar-right">
                     <li>
                         <a href="${ctx}/login">
                             <button class="btn btn-primary">登录</button>
                         </a>
                     </li>
                 </ul>
             </div>
         </nav>
     </div>
            
	<div class="wrapper wrapper-content animated fadeInRight">
	    <div class="container" style="width: 650px;">
	        <div class="pearls row">
	            <div class="pearl current col-xs-4" pearl="pearl-1">
	                <span class="pearl-number">1</span> <span class="pearl-title">基本信息</span>
	            </div>
	            <div class="pearl col-xs-4" pearl="pearl-2">
	                <span class="pearl-number">2</span> <span class="pearl-title">完善信息</span>
	            </div>
	            <div class="pearl col-xs-4" pearl="pearl-3">
	                <span class="pearl-number">3</span> <span class="pearl-title">注册成功</span>
	            </div>
	        </div>
	        
	        <div class="ibox float-e-margins pearl-pane" id="pearl-1">
	            <div class="ibox-content">
	                <form class="form-horizontal" role="form" id="form-basic" autocomplete="off">
	                	<div class="msg-wrap">
                    		<div class="msg-error hide"></div>
                    	</div>
	                    	
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label"><i class="form-required">*</i>用户名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="username" placeholder="用户名: 只能包含英文、数字、下划线等字符" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mobile" class="col-sm-3 control-label"><i class="form-required">*</i>手机号码</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="mobile" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label"><i class="form-required">*</i>密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password" placeholder="密码: 6到12位" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password" class="col-sm-3 control-label"><i class="form-required">*</i>确认密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="confirm-password" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-7 col-sm-offset-3">
                                <button type="button" class="btn btn-primary btn-next-step">下一步</button>
                            </div>
                        </div>
                    </form>
                    
	            </div>
	        </div>
	        
	        <div class="ibox float-e-margins pearl-pane hide" id="pearl-2">   
	            <div class="ibox-content">
	            	<form class="form-horizontal" role="form" id="form-info" autocomplete="off">
	            		<div class="form-group">
                            <label for="password" class="col-sm-3 control-label">头像</label>
                            <div id="crop-avatar" class="col-sm-7">
								<div class="avatar-view" title="点击修改头像" style="width: 160px; height: 160px;">
									<img src="${ctx}/api/avatar/default_user" alt="头像">
							    </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-7">
                                <select class="form-control" name="gender">
									<option value="0">请选择性别</option>
									<option value="1">男</option>
									<option value="2">女</option>
								</select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="email">
                            </div>
                        </div>
                        <div class="form-group">
							<label for="introduction" class="col-sm-3 control-label">个人描述</label>
	                        <div class="col-sm-7">
	                            <textarea class="form-control" name="introduction" style="resize:none; height: 150px;"></textarea>
	                        </div>
						</div>
                        <div class="form-group">
                            <div class="col-sm-7 col-sm-offset-3">
                                <button type="button" class="btn btn-primary btn-next-step">下一步</button>
                            </div>
                        </div>
                    </form>
	            </div>
	        </div>
	        
	        <div class="ibox float-e-margins pearl-pane hide" id="pearl-3"> 
	        	<div class="ibox-content text-center">
		        	<div style="font-size: 4em; color: #1ab394">
				      <i class="fa fa-check-circle-o fa-fw"></i>
				    </div>
				    <h2></h2>
				    <p style="display: block;">注册成功</p>
				    <button type="button" id="btn-login" class="btn btn-primary">直接登录</button>
				</div>
	        </div>
	        
 		</div>	
    </div>
	
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/cropper/cropper.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/sitelogo/sitelogo.js"></script>
	
	<script type="text/javascript">
	;(function( $ ) {
		var $page = $('.body-register');
		var $formBasic = $page.find('#form-basic');
		var $formInfo = $page.find('#form-info');
		
		var userId;
	
		$k.util.bsValidator($formBasic, {
			fields: {
				mobile: {
	                 validators: {
	                     regexp: {
	                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
	                         message: '请输入正确的手机号码'
	                     }
	                 }
	             },
	             username: {
	            	 validators: {
	           	 		regexp: {
	           	 			regexp: /^[a-zA-Z0-9_\.]+$/,
	     	                    	message: '用户名只能包含英文、数字、下划线等字符'
   	                    },
   	                    different: {
  	                    	field: 'password',
  	                        message: '用户名不能与密码相同'
   	                    }
   	                 }
   	             },
  	             password: {
  	                 validators: {
  	                     identical: {
  	                         field: 'confirmPassword',
  	                         message: '两次输入密码不一致'
  	                     },
  	                 	 stringLength: {
  	                         min: 6,
  	                         max: 12,
  	                         message: '密码为6到12位'
  	                     },
  	                     different: {
  	                        field: 'username',
  	                        message: '密码不能与用户名相同'
  	                     }
  	                 }
  	             },
  	             confirmPassword: {
  	             	validators: {
  	                	identical: {
  	                    	field: 'password',
  	                        message: '两次输入密码不一致'
  	                    },
  	                    different: {
  	                        field: 'username',
  	                        message: '密码不能与用户名相同'
  	                    }
  	                }
  	             }
			}
		});
		
		$k.util.bsValidator($formInfo, {
			fields: {
				email: {
	                 validators: {
	                	 emailAddress: {
	                         message: '请输入正确邮箱地址'
	                     }
	                 }
	             }
			}
		});
		
		$page
		.on('click', '.btn-next-step', function() {
			var $pearl = $(this).closest(".pearl-pane");
			
			if ($pearl.attr('id') == 'pearl-1') {
				var validator = $formBasic.data('bootstrapValidator');
				validator.validate();
				
				if (validator.isValid()) {
					$.ajax({
						url :'${ctx}/api/user/register',
						type: 'POST',
						data: {
							username: $formBasic.find('input[name = "username"]').val(),
							mobile: $formBasic.find('input[name = "mobile"]').val(),
							password: $formBasic.find('input[name = "password"]').val()
						},
						success: function(ret) {
							if (ret.code == 0) {
								userId = ret.data;
								pearl($pearl);
	                    	} else {
	                    		$formBasic.find('.msg-error').removeClass('hide').text(ret.msg);
	                    	}
						},
						error: function(err) {}
					});
				} else {
					return;
				}
			} else if($pearl.attr('id') == "pearl-2") {
				var validator = $formInfo.data('bootstrapValidator');
				validator.validate();
				
				if (validator.isValid()) {
					if ($formInfo.find('input[name = "name"]').val() == "") {
						$formInfo.find('input[name = "name"]').val($formBasic.find('input[name = "username"]').val());
					}
					
					var formData = new FormData($formInfo[0]);
					formData.append('avatar', $k.util.getAvatar($page.find('.avatar-view > img')));
					formData.append('userId', userId);
					
					$.ajax({
						url :'${ctx}/api/user/info',
						type: 'POST',
						data: formData,
						processData: false,
						contentType: false,
						cache: false,
						success: function(ret) {
							if (ret.code == 0) {
								pearl($pearl);
	                    	} else {
	                    		$formInfo.find('.msg-error').removeClass('hide').text(ret.msg);
	                    		return;
	                    	}
						},
						error: function(err) {}
					});
				} else {
					return;
				}
			} else {
				pearl($pearl);
			}
			
		})
		.on("click", "#btn-login", function() {
			$.ajax({
				url: '${ctx}/api/user/login',
				type: 'POST',
				data: {
					username: $formBasic.find('input[name = "username"]').val(),
					password: $formBasic.find('input[name = "password"]').val()
				},
				success: function(ret) {
					if (ret.code == 0) {
						window.location.href = "./home";
					}
				},
				error: function(err) {}
			});
		});
		
		function pearl($pearl) {
			var $nextP = $page.find("[pearl='"+ $pearl.attr("id") +"']");
			$page.find('.pearl-pane').addClass('hide');
			$pearl.next().removeClass("hide");
			
			$page.find('.pearl').removeClass('current');
			$nextP.addClass('done');
			$nextP.next().addClass('current');
		}
	})( jQuery );
	</script>
	
</body>
</html>