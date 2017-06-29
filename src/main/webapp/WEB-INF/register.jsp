<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>南城工业 | 注册</title>
	<meta name="keywords" content="">
    <meta name="description" content="">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/bootstrapValidator/css/bootstrapValidator.min.css">
	
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/hplus/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/common.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/local/pearls.css">
</head>
<body class="gray-bg body-register">
	<div class="row border-bottom white-bg">
         <nav class="navbar navbar-static-top" role="navigation">
             <div class="navbar-header">
                 <a href="#" class="navbar-brand">南城县工业园区综合信息服务平台</a>
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
	            <div class="pearl current col-xs-4">
	                <span class="pearl-number">1</span> <span class="pearl-title">基本信息</span>
	            </div>
	            <div class="pearl col-xs-4">
	                <span class="pearl-number">2</span> <span class="pearl-title">完善信息</span>
	            </div>
	            <div class="pearl col-xs-4">
	                <span class="pearl-number">3</span> <span class="pearl-title">注册成功</span>
	            </div>
	        </div>
	        
	        <div class="ibox float-e-margins">
	            <div class="ibox-content">
	                <form class="form-horizontal" role="form" id="form-step-01" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label"><i class="form-required">*</i>用户名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-sm-3 control-label"><i class="form-required">*</i>手机号码</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="telephone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label"><i class="form-required">*</i>密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password" class="col-sm-3 control-label"><i class="form-required">*</i>确认密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="confirm-password">
                            </div>
                        </div>
                    </form>
                    
                    <form class="form-horizontal" role="form" id="form-step-02" autocomplete="off">
                        <div class="form-group">
                            <label for="name" class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="name" required>
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
                                <input type="text" class="form-control" name="password">
                            </div>
                        </div>
                    </form>
                    
	            </div>
	        </div>
 		</div>	
    </div>
	
	
	<script type="text/javascript" src="${ctx}/plugins/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/hplus/content.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/bootstrapValidator/js/language/zh_CN.js"></script>
	
	<script type="text/javascript">
	
	</script>
	
</body>
</html>