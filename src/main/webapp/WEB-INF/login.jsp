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
	                    <img class="brand-img" src="/public/images/logo-white.svg" height="50" alt="Admui">
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
	                    <form action="/system/loginValidate" class="login-form" method="post" id="loginForm">
	                        <div class="form-group">
	                            <label class="sr-only" for="username">用户名</label>
	                            <input type="text" class="form-control" id="username" name="loginName" placeholder="请输入用户名">
	                        </div>
	                        <div class="form-group">
	                            <label class="sr-only" for="password">密码</label>
	                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
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
                                    <div class="icheckbox_square-green" style="position: relative;"><input type="checkbox" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins><iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></div><i></i> 自动登录</label>
	                            <a class="pull-right collapsed" data-toggle="collapse" href="#forgetPassword" aria-expanded="false" aria-controls="forgetPassword">
	                                忘记密码了？
	                            </a>
	                        </div>
	                        <div class="form-group row" style="margin: 0 auto;">
	                        	<div class="col-sm-7">
	                        		<button type="submit" class="btn btn-primary btn-block margin-top-10">登 录</button>
	                        	</div>
	                        	<div class="col-sm-5">
	                        		<a class="btn btn-outline btn-success btn-block margin-top-10" href="" target="_blank">注册账号</a>
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	            <footer class="page-copyright">
	                <p>&copy; 2017
	                    <a href="http://www.admui.com" target="_blank">南城县工业园区综合信息服务平台</a>
	                </p>
	            </footer>
	        </div>
	    </div>
	</div>
	
	<!-- JS -->
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>


	<script>
		var $kaptcha_img = $("#kaptcha-img");
		var $kaptcha = $("#kaptcha");
		
		$kaptcha_img.click(function() {
			$(this).attr("src","kaptcha.jpg?t=" + Math.random()); 
		});
		
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
    </script>
</body>
</html>