<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>南城县工业园区综合信息服务平台</title>
	<meta name="keywords" content="">
    <meta name="description" content="�">

	<!-- <link rel="shortcut icon" href="favicon.ico"> -->
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/iCheck/custom.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/login.css">

</head>

<body class="page-login layout-full page-dark">

	<div class="page height-full">
	    <div class="page-content height-full">
	        <div class="page-brand-info vertical-align animated slideInLeft hidden-xs">
	            <div class="page-brand vertical-align-middle">
	                <div class="brand">
	                    <img class="brand-img" src="" height="50" alt="Admui">
	                </div>
	                <h3>南城县工业园区综合信息服务平台</h3>
	                <ul class="list-icons">
	                    <li>
	                        <i class="wb-check" aria-hidden="true"></i> Admui 是一个基于最新 Web
	                        技术的企业级通用管理系统快速开发框架，可以帮助企业极大的提高工作效率，节省开发成本，提升品牌形象。
	                    </li>
	                    <li><i class="wb-check" aria-hidden="true"></i> 您可以 Admui 为基础，快速开发各种MIS系统，如CMS、OA、CRM、ERP、POS等。</li>
	                    <li><i class="wb-check" aria-hidden="true"></i> Admui 紧贴业务特性，涵盖了大量的常用组件和基础功能，最大程度上帮助企业节省时间成本和费用开支。
	                    </li>
	                </ul>
	                <div>
	                    <a href="http://admui.com" class="btn btn-primary btn-outline"><i class="icon wb-home"></i> 返回官网</a>
	                    <a href="" class="btn btn-primary btn-outline margin-left-5">联系客服</a>
	                </div>
	            </div>
	        </div>
	        <div class="page-login-main animated fadeIn">
	        	
	            <div class="vertical-align">
	                <div class="vertical-align-middle">
	                    <div class="brand visible-xs text-center">
	                        <img class="brand-img" src="/public/images/logo.svg" height="50" alt="Admui">
	                    </div>
	                    <h3 class="hidden-xs">登录 南城县工业园区综合信息服务平台</h3>
	                    <p class="hidden-xs">南城县工业园区综合信息服务平台 在线系统</p>
	                    <form class="login-form" id="loginForm">
	                        <div class="form-group">
	                            <label class="sr-only" for="username">用户名</label>
	                            <input type="text" class="form-control" id="username" name="loginName" placeholder="请输入用户名" required data-bv-notempty-message="用户名不能为空">
	                        </div>
	                        <div class="form-group">
	                            <label class="sr-only" for="password">密码</label>
	                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required data-bv-notempty-message="密码不能为空">
	                        </div>
	                        <div class="form-group">
	                            <label class="sr-only" for="password">验证码</label>
	                        	<div class="input-group" style="display: table;">
	                                <input type="text" class="form-control" name="kaptcha" id="kaptcha" placeholder="请输入验证码" data-fv-field="validCode">
	                                <a class="input-group-addon padding-0 reload-vify" href="javascript:;">
	                                    <img id="kaptcha-img" src="kaptcha.jpg"  height="40" title="点击更换"/>
	                                </a>
                            	</div>
	                        </div>
	                        <div class="form-group clearfix">
	                        	<label class="i-checks">
                                    <div class="icheckbox_square-green" style="position: relative;">
                                    	<input type="checkbox" id="rememberPassword" style="position: absolute; opacity: 0;">
                                    	<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
                                    </div>
                                    <i></i> 
                                             记住密码
                                    </label>
	                            <a class="pull-right collapsed" data-toggle="collapse" href="#forgetPassword" aria-expanded="false" aria-controls="forgetPassword">
	                                忘记密码了？
	                            </a>
	                        </div>
	                        <div class="form-group row" style="margin: 0 auto;">
	                        	<div class="col-sm-7">
	                        		<button id="login-btn" class="btn btn-primary btn-block">登 录</button>
	                        	</div>
	                        	<div class="col-sm-5">
	                        		<a class="btn btn-outline btn-success btn-block" href="" target="_blank">注册账号</a>
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	            <footer class="page-copyright">
	                <p>&copy; 2017
	                    <a href="" target="_blank">南城县工业园区综合信息服务平台</a>
	                </p>
	            </footer>
	        </div>
	    </div>
	</div>
	
	<!-- JS -->
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/iCheck/icheck.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>


	<script>
		var $page = $(".page");
		var $kaptcha_img = $page.find("#kaptcha-img");
		var $kaptcha = $page.find("#kaptcha");
		var $form = $page.find(".login-form");
		var $username = $form .find("#username");
		var $password = $form .find("#password");
		var $rememberPassword = $form .find("#rememberPassword");

		//点击更换图形验证码
		$kaptcha_img.click(function() {
			$(this).attr("src", "kaptcha.jpg?t=" + Math.random()); 
		});
		
		//单选框插件
		$page.find(".i-checks").iCheck({
			checkboxClass: "icheckbox_square-green",
			radioClass: "iradio_square-green"
		});
		
		document.onkeydown = function(e){
			var ev = document.all ? window.event : e;
			if(ev.keyCode==13) {
				$form.find("#login_btn").trigger("click");
			}
		}
		
		//是否为记住密码登录
		if ($k.util.getRequestParam('username') != "") {
			//从注册转到登录页面自动填写用户名
			$username.val($k.util.getRequestParam('username'));
		} else {
			$rememberPassword.prop("checked", getCookie("rememberPassword") == "" ? false : true);
			if (getCookie("rememberPassword") != "") {
				$username.val(getCookie("username"));
				$password.val(getCookie("password"));
			} else {
				$username.val("");
				$password.val("");
			}
		}

		//勾选记住密码
		$rememberPassword.click(function() {
			var checked = $(this).prop('checked');
			if (checked) {
				setCookie("username", $password.val(), "d7");
				setCookie("rememberLoginName", checked, "d7");
				setCookie("password", $password.val(), "d7");
				setCookie("rememberPassword", checked, "d7");
			} else {
				setCookie("username", "", "d7");
				setCookie("rememberLoginName", "", "d7");
				setCookie("password", "", "d7");
				setCookie("rememberPassword", "", "d7");
			}
		});
		
		
		$page
		.on("click", "#login-btn", function() {
			var redirect = $k.util.getRequestParam("redirect");
			if ($rememberPassword.prop("checked")) {
				setCookie("username", $username.val(), "d7")
				setCookie("password", $password.val(), "d7")
			}
			
			var validator = $form.data('bootstrapValidator');
			validator.validate();
			if (validator.isValid()) {
				$.ajax({
					type: "POST",
					url: "${ctx}/api/user/login",
					data: {
						username: $form.find("#username").val(),
						//password: 
					},
					success: function(data) {},
					error: function(error) {}
				});
			}
		})
		
		$("#check").click(function() {
			$.ajax({
				url: "${ctx}/check",
				type: "POST",
				data: {
					kaptcha: $kaptcha.val()
				},
				success: function(data) {
					if (data.code == 0) {
						swal('', '验证成功!', 'success');
					} else {
						$kaptcha_img.attr("src","kaptcha.jpg?t=" + Math.random()); 
						$kaptcha.val("");
					}
				},
				error: function(err) {}
			});
		});
		
		// 添加验证器
		$k.util.bsValidator($form);
    </script>
</body>
</html>