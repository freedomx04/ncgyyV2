<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	
	<title>个人中心</title>

	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/weui2.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/plugins/wx/example.css">
	
	<script type="text/javascript" src="${ctx}/plugins/wx/zepto.min.js"></script>
	<script type="text/javascript" src="${ctx}/plugins/wx/lazyimg.js"></script>
	<script type="text/javascript" src="${ctx}/local/common.js"></script> 
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script> 
	
</head>

<body class="wx-personal">
	<div class="weui_cells">
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>头像</p>
			</div>
			<div class="weui_cell_ft weui-updown" style="height: 60px;">
				<img src="${icon}" data-src="${ctx}/api/avatar/${user.avatar}" style="width: 60px; height: 60px;">
			</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>用户名</p>
			</div>
			<div class="weui_cell_ft">${user.username}</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>姓名</p>
			</div>
			<div class="weui_cell_ft">${user.name}</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>性别</p>
			</div>
			<div class="weui_cell_ft">
				<c:if test="${user.gender == 0}">未填写</c:if>
				<c:if test="${user.gender == 1}">男</c:if>
				<c:if test="${user.gender == 2}">女</c:if>				
			</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>角色</p>
			</div>
			<div class="weui_cell_ft">${user.role.name}</div>
		</div>
		
	</div>
	
	<c:if test="${!empty user.enterprise}">
	<div class="weui_cells weui_cells_access">
		<a href="javascript:;" class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>所属企业</p>
			</div>
			<div class="weui_cell_ft enterprise-info" data-enterprise-id="${user.enterprise.id}">${user.enterprise.name}</div>
		</a>
	</div>
	</c:if>
	
	<c:if test="${!empty user.department}">
	<div class="weui_cells">
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>所属部门</p>
			</div>
			<div class="weui_cell_ft">${user.department.name}</div>
		</div>
	</div>
	</c:if>
	
	<div class="weui_cells">
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>手机</p>
			</div>
			<div class="weui_cell_ft">
				<c:if test="${empty user.mobile}">未填写</c:if>
				${user.mobile}
			</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>邮箱</p>
			</div>
			<div class="weui_cell_ft">
				<c:if test="${empty user.email}">未填写</c:if>
				${user.email}
			</div>
		</div>	
	</div>
	
	<div class="weui_cells">
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<p>个人描述</p>
				<p style="color: #888;">
					<c:if test="${empty user.introduction}">未填写</c:if>
					${user.introduction}
				</p>
			</div>		
		</div>
	</div>
	
	<div class="weui_btn_area">
        <a id="remove" href="javascript:;" class="weui_btn weui_btn_warn">解除绑定</a>
    </div>
	
	<script type="text/javascript">
	$(function() {
		
		$k.util.lazyLoadImg('.weui-updown [data-src]');
		
		var $page = $('.wx-personal');
		var userId = ${user.id};
		
		wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appId}', // 必填，企业微信的cropID
		    timestamp: ${timestamp}, // 必填，生成签名的时间戳
		    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
		    signature: '${signature}',// 必填，签名，见附录1
		    jsApiList: ['closeWindow'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		
		$page
		.on('click', '.enterprise-info', function() {
			var enterpriseId = $(this).data('enterpriseId');
			window.location = '${ctx}/wx/enterprise/get?enterpriseId=' + enterpriseId;
		})
		.on('click', '#remove', function() {
			$.confirm("您确定要解除平台账号绑定吗?", "解除绑定", function() {
				$.ajax({
					url: '${ctx}/api/user/removeBind',
					data: {
						userId: userId
					},
					success: function(ret) {
						$.toast('操作成功!');
						
						setTimeout(function() {
							wx.closeWindow();
        				}, 1000);
					},
					error: function(err){
						$.toast('操作失败!', 'cancel');
					}
				});
			}, function() {
				//取消操作
			}); 
		});
		
	});
	</script>
    
</body>
</html>