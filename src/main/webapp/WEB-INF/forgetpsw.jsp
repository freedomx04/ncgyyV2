<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>
<%@ include file="/WEB-INF/include/avatar.jsp"%>
<%@ include file="/WEB-INF/include/password.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>南城工业 | 忘记密码</title>
	<meta name="keywords" content="">
    <meta name="description" content="">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/pearls.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	
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
	.tips {
	    background-color: f0f7fd;
	    font-size: 16px;
	    font-weight: bold;
	    text-align: center;
	}
	</style>
</head>
<body class="gray-bg body-register">
	<div class="row border-bottom white-bg">
         <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
             <div class="navbar-header">
                 <a href="index" style="font-size: 20px; line-height: 75px; margin-left: 30px;">南城县工业园区综合信息服务平台</a>
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
            
	<div class="animated fadeInRight" style="padding: 60px;">
	    <div class="container" style="width: 650px;">
	        <div class="pearls row">
	            <div class="pearl current col-xs-3" pearl="pearl-1">
	                <span class="pearl-number">1</span> <span class="pearl-title">输入用户名</span>
	            </div>
	            <div class="pearl col-xs-3" pearl="pearl-2">
	                <span class="pearl-number">2</span> <span class="pearl-title">验证身份</span>
	            </div>
	            <div class="pearl col-xs-3" pearl="pearl-3">
	                <span class="pearl-number">3</span> <span class="pearl-title">重置密码</span>
	            </div>
	            <div class="pearl col-xs-3" pearl="pearl-4">
	                <span class="pearl-number">4</span> <span class="pearl-title">修改成功</span>
	            </div>
	        </div>
	        
	        <div class="ibox float-e-margins pearl-pane" id="pearl-1">
	            <div class="ibox-content">
	                <form class="form-horizontal" role="form" id="form-username" autocomplete="off" onsubmit="return false;">
	                	<div class="msg-wrap">
                    		<div class="msg-error hide"></div>
                    	</div>
	                    	
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label"><i class="form-required">*</i>用户名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="username" required>
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
		        	<div class="tips">
		        		您好：<span class="username"></span>, 请输入您绑定的手机号码！
		        	</div> 
	            	<form class="form-horizontal" role="form" id="form-tel" autocomplete="off" onsubmit="return false;">
						<div class="msg-wrap">
                    		<div class="msg-error hide"></div>
                    	</div>            	
	            	
	            		<div class="form-group">
                            <label for="mobile" class="col-sm-3 control-label"><i class="form-required">*</i>手机号码</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="mobile" required>
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
	        	<div class="ibox-content">
	        		<div class="tips" style="margin-bottom: 25px;">
		        		您需要找回密码的用户名是：<span class="username"></span>
		        	</div> 
		        	<form class="form-horizontal" role="form" id="form-psw" autocomplete="off" onsubmit="return false;">
		        		<div class="form-group">
		                    <label for="password" class="col-sm-3 control-label"><i class="form-required">*</i>重置密码</label>
		                    <div class="col-sm-7">
		                        <input type="password" id="password" class="form-control" name="password" placeholder="6-16个字符,请使用字母加数字或者符号" required>
		                    </div>
	                    </div>
	                    <div class="form-group">
						<label for="" class="col-sm-3 control-label" style="font-weight: normal; color: #999;">密码强度</label>
						<div class="col-sm-7">
							<div id="level" class="pw-strength">
								<div class="pw-bar"></div>
								<div class="pw-bar-on"></div>
								<div class="pw-txt">
									<span>弱</span><span>中</span><span>强</span>
								</div>
							</div>
						</div>
						</div>
		                <div class="form-group">
		                    <label for="confirm-password" class="col-sm-3 control-label"><i class="form-required">*</i>确认密码</label>
		                    <div class="col-sm-7">
		                        <input type="password" class="form-control" name="confirmPassword" required>
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
	        
	        <div class="ibox float-e-margins pearl-pane hide" id="pearl-4"> 
	        	<div class="ibox-content text-center">
		        	<div style="font-size: 4em; color: #1ab394">
				      <i class="fa fa-check-circle-o fa-fw"></i>
				    </div>
				    <h2></h2>
				    <p style="display: block;">修改成功</p>
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
	
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.body-register');
		var $formName = $page.find('#form-username');
		var $formTel = $page.find('#form-tel');
		var $formPsw = $page.find('#form-psw');
		
		var user;
		// password
		strength($page.find('#password'), $page.find('#level'));
	
		$k.util.bsValidator($formPsw, {
			fields: {
  	             password: {
  	                 validators: {
  	                     identical: {
  	                         field: 'confirmPassword',
  	                         message: '两次输入密码不一致'
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
  	                    	field: 'password',
  	                        message: '两次输入密码不一致'
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
		
		$k.util.bsValidator($formPsw);
		
		$page
		.on('click', '.btn-next-step', function() {
			var $pearl = $(this).closest(".pearl-pane");
			
			if ($pearl.attr('id') == 'pearl-1') {
				
				$.ajax({
					url :'${ctx}/api/user/exist',
					type: 'POST',
					data: {
						username: $formName.find('input[name = "username"]').val()
					},
					success: function(ret) {
						if (ret.code == 0) {
							user = ret.data;
							pearl($pearl);
							$page.find(".tips .username").text(user.name);
                    	} else {
                    		$formName.find('.msg-error').removeClass('hide').text(ret.msg);
                    	}
					},
					error: function(err) {}
				});
			} else if($pearl.attr('id') == "pearl-2") {
				$.ajax({
					url :'${ctx}/api/user/validateMobile',
					data: {
						mobile: $formTel.find('input[name = "mobile"]').val(),
						userId: user.id
					},
					type: 'POST',
					success: function(ret) {
						if (ret.code == 0) {
							pearl($pearl);
                    	} else {
                    		$formTel.find('.msg-error').removeClass('hide').text(ret.msg);
                    		return;
                    	}
					},
					error: function(err) {}
				});
			}  else if($pearl.attr('id') == "pearl-3") {
				var validator = $formPsw.data('bootstrapValidator');
				validator.validate();
				
				if (validator.isValid()) {
					$.ajax({
						url :'${ctx}/api/user/password2',
						type: 'POST',
						data: {
							password: $formName.find('input[name = "password"]').val(),
							userId: user.id
						},
						success: function(ret) {
							if (ret.code == 0) {
								pearl($pearl);
	                    	} else {
	                    		$formPsw.find('.msg-error').removeClass('hide').text(ret.msg);
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
		
		function pearl($pearl) {
			var $nextP = $page.find("[pearl='"+ $pearl.attr("id") +"']");
			$page.find('.pearl-pane').addClass('hide');
			$pearl.next().removeClass("hide");
			
			$page.find('.pearl').removeClass('current');
			$nextP.addClass('done');
			$nextP.next().addClass('current');
			if ($pearl.attr("id") == "pearl-3") {
				setTimeout(function() {
					window.location.href = "${ctx}/login";
				}, "1000");
			}
		}
		
	})( jQuery );
	</script>
	
</body>
</html>