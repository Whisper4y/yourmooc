<div class="f-header">
	<div class="f-header-box clearfix">
		<a href="/yourmooc/"  class="logo" title="在线教育平台--yourmooc"></a>
		<nav class="header-nav">
			<a href="/yourmooc/" class="header-nav-item">首 页</a>
			<a href="/yourmooc/course/list" class="header-nav-item">分类</a>
			<a href="/yourmooc/user/course" class="header-nav-item">我的</a>
		</nav>
		
		<!-- 获取session中的username熟悉，判断用户是否登录 -->
		<c:set var="username" value="${sessionScope.username}"/>  
		<c:choose>
			<c:when test="${not empty username}">
				<nav class="header-nav" style="float:right">
					<a href="javascript:void(0)" class="header-nav-item" style="margin-right:0px;font-size:14px;"> ${username} </a>
					<a href="http://localhost:8080/yourmooc/auth/logout" class="header-nav-item"   style="margin-left:0px;font-size:14px;"> 退出 </a>
				</nav>
			</c:when>
			<c:otherwise>
				<nav class="header-nav" style="float:right">
					<a href="http://localhost:8080/yourmooc/auth/login" class="header-nav-item" style="margin-right:0px;font-size:14px;">登录</a>
					<a href="http://localhost:8080/yourmooc/auth/register" class="header-nav-item"   style="margin-left:0px;font-size:14px;">注册</a>
				</nav>
			</c:otherwise>
		</c:choose>

	</div>
</div>
