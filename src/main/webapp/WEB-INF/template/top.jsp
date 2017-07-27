<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<body>
	<div class="header">
		<div class="header_item">
			<div class="header_item_fr" style="font-size: 14px;">
				<a href="${ctx}/login">登录</a>
				<a href="${ctx}/register" style="padding-left: 5px;">注册</a>
			</div>
			<a href="${ctx}/index" class="logo">工信部</a>
			<div class="menu">
				<a href="${ctx}/newslist?type=1" type="1">图片新闻</a>
				<a href="${ctx}/newslist?type=2" type="2">公示公告</a>
				<a href="${ctx}/newslist?type=3" type="3">政策法规</a>
				<a href="${ctx}/newslist?type=4" type="4">工业信息</a>
				<a href="${ctx}/enterpriselist" class="m_enterprise">企业宣传</a>
				<a href="${ctx}/productlist" class="m_product">产品宣传</a>
				<a href="${ctx}/monitorlist?item=mainBusiness" class="m_monitor">监测平台</a>
				<a href="${ctx}/assistlist" class="m_assist">帮扶平台</a>
			</div>
		</div>
	</div>
</body>
