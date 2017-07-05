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

	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/animate/animate.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">

	<style type="text/css">
	.page-login {
	    height: 100%;
	    min-height: 600px;
	    padding-top: 0;
	    overflow: hidden;
	}
	.page-dark.layout-full {
	    color: #fff;
	}
	.page-dark.layout-full:before {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: -1;
	    width: 100%;
	    height: 100%;
	    content: "";
	    background-position: center top;
	    -webkit-background-size: cover;
	    background-size: cover;
	}
	.page-login:before {
	    background-image: url(./img/login.jpg);
	}
	.page-login.page-dark.layout-full:after {
	    background-color: rgba(38,50,56,.6);
	}
	.page-dark.layout-full:after {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: -1;
	    width: 100%;
	    height: 100%;
	    content: "";
	    background-color: rgba(38,50,56,.6);
	}
	.page-login-main {
	    position: absolute;
	    top: 0;
	    right: 0;
	    height: 100%;
	    min-height: 600px;
	    padding: 150px 60px 180px;
	    padding: 0 60px;
	    color: #76838f;
	    background: #fff;
	    width: 470px;
	}
	.page-login-main .vertical-align {
	    height: 100%;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    padding-bottom: 65px;
	}
	@media (min-width: 992px){
		.page-login .page-content {
	    	padding-right: 500px;
		}
	}
	.page-login .page-brand-info {
	    height: 100%;
	}
	.page-login .page-brand-info .page-brand {
	    padding: 0 60px 60px;
	}
	.page-dark.layout-full .brand {
	    margin-bottom: 22px;
	}
	.page-login .page-brand-info .page-brand h3 {
	    max-width: 650px;
	    color: #fff;
	}
	.page-login .page-brand-info .page-brand .list-icons {
	    padding-left: 0;
	    margin: 30px 0;
	}
	.list-icons {
	    padding-left: 10px;
	    margin-left: 0;
	    list-style: none;
	}
	.page-login-main .form-group {
		width: 100%;
	}
	.page-login .login-form .form-control {
	    height: 42px;
	}
	@media (max-width: 767px){
		.page-login-main {
	   		width: auto;
		}
	}
	.page-login .page-copyright {
	    position: absolute;
	    right: 0;
	    bottom: 15px;
	    left: 0;
	    text-align: center;
	    margin-top: 60px;
	    font-size: 12px;
	    color: #37474f;
	    letter-spacing: 1px;
	}
	.page-login .msg-wrap {
		min-height: 30px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    width: 100%;
	    height: auto;
	}
	.page-login .msg-error {
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

<body class="page-login layout-full page-dark">
	<div class="page height-full">
	    <div class="page-content height-full">
	        <div class="page-brand-info vertical-align animated slideInLeft hidden-xs">
	            <div class="page-brand vertical-align-middle">
	                <h3>南城县工业园区综合信息服务平台</h3>
	                <ul class="list-icons">
	                    <li>
	                        <i class="wb-check" aria-hidden="true"></i> 该平台是主要是为帮助政府建设园区内企业经济数据信息化系统，便于监测分析企业各经济指标，并作出相应决策；
	                    </li>
	                    <li>
	                    	<i class="wb-check" aria-hidden="true"></i> 另外，通过线上平台整合线下资源以便充分了解企业资料和产品情况，有效解决企业在经营上的困难，做到企业与政府的有效沟通和合作，进而促进经济发展。
	                    </li>
	                </ul>
	                <div>
	                    <a href="index" class="btn btn-primary btn-outline">返回官网</a>
	                </div>
	            </div>
	        </div>
	        <div class="page-login-main animated fadeIn">
	            <div class="vertical-align">
	                <div class="vertical-align-middle">
	                    <h3 style="font-size: 20px;">南城县工业园区综合信息服务平台</h3>
	                    
	                    <form class="login-form" role="form" autocomplete="off" style="padding: 20px 0;">
	                    	<div class="msg-wrap">
	                    		<div class="msg-error hide"></div>
	                    	</div>
	                    
	                        <div class="form-group">
	                            <label class="sr-only" for="username">用户名</label>
	                            <input type="text" class="form-control" name="username" placeholder="请输入用户名">
	                        </div>
	                        <div class="form-group">
	                            <label class="sr-only" for="password">密码</label>
	                            <input type="password" class="form-control" name="password" placeholder="请输入密码">
	                        </div>
	                        <div class="form-group">
	                            <label class="sr-only" for="password">验证码</label>
	                        	<div class="input-group" style="display: table;">
	                                <input type="text" class="form-control" name="kaptcha" placeholder="请输入验证码" data-fv-field="validCode">
	                                <a class="input-group-addon padding-0 reload-vify" href="javascript:;">
	                                    <img id="kaptcha-img" src="${ctx}/api/kaptcha/captcha.jpg"  height="40" title="点击更换"/>
	                                </a>
                            	</div>
	                        </div>
	                        <div class="form-group clearfix">
	                        	<a class="pull-right collapsed" data-toggle="collapse" href="forgetPassword" aria-expanded="false">忘记密码</a>
	                        </div>
	                        <div class="form-group row" style="margin: 0 auto;">
	                        	<div class="col-sm-6">
	                        		<button type="submit" class="btn btn-primary btn-block">登 录</button>
	                        	</div>
	                        	<div class="col-sm-6">
	                        		<a class="btn btn-outline btn-success btn-block" href="register">注册</a>
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	            <footer class="page-copyright">
	                <p>&copy; 2017南城县工业园区综合信息服务平台</p>
	            </footer>
	        </div>
	    </div>
	</div>
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script>

	<script type="text/javascript">
	;(function( $ ) {
	
		var $page = $('.page');
		var $form = $page.find('.login-form');
		var $kaptcha_img = $page.find('#kaptcha-img');
		var $kaptcha = $page.find('input[name="kaptcha"]');
	
		//点击更换图形验证码
		$kaptcha_img.click(function() {
			$(this).attr("src", "${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
		});
		
		$form.submit(function(e) {
			var $message = $form.find('.message');
			var username = $form.find('input[name="username"]').val();
			var password = $form.find('input[name="password"]').val();
			var captcha = $kaptcha.val();
			
			if (username == '' && password == '') {
				$form.find('.msg-error').removeClass('hide').text('请输入用户名和密码');
				return false;
			}
			if (username == '') {
				$form.find('.msg-error').removeClass('hide').text('请输入用户名');
				return false;
			}
			if (password == '') {
				$form.find('.msg-error').removeClass('hide').text('请输入密码');
				return false;
			}
			if (captcha == '') {
				$form.find('.msg-error').removeClass('hide').text('请输入验证码');
				return false;
			}
			
			$.ajax({
				url: "${ctx}/api/kaptcha/check",
				type: "POST",
				data: {
					kaptcha: $kaptcha.val()
				},
				success: function(data) {
					if (data.code == 0) {
						$.ajax({
							url: '${ctx}/api/user/login',
							type: 'POST',
							data: {
								username: username,
								password: password
							},
							success: function(ret) {
								if (ret.code == 0) {
									window.location.href = "./home";
								} else {
									$form.find('.msg-error').removeClass('hide').text(ret.msg);
									$kaptcha_img.attr("src","${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
									$kaptcha.val("");
								}
							},
							error: function(err) {}
						});
					} else {
						$kaptcha_img.attr("src","${ctx}/api/kaptcha/captcha.jpg?t=" + Math.random()); 
						$kaptcha.val("");
					}
				},
				error: function(err) {}
			});
			
			return false;
		});
		
	})( jQuery );
	</script>
	
</body>
</html>