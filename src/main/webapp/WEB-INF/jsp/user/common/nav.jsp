<img id="userNavHeader" class="setting-header" src="http://localhost:8080/yourmooc/resources/images/header.jpg"></img>
	<div> ${user.username} </div>
<div class="split-line" style="margin-bottom: 20px;"></div>

<ul class="user-menu-nav-block">
	
	<a href="http://localhost:8080/yourmooc/user/course">
		<li 
			<c:choose>
			  <c:when test="${not empty curNav && curNav == 'course'}">
			    class="user-menu-nav-cur"
			  </c:when>
			  <c:otherwise>
			    class="user-menu-nav"
			  </c:otherwise>
			</c:choose>
		>最近学习 <span>&gt;</span></li>
	</a>
	
	<a href="http://localhost:8080/yourmooc/user/collect">
		<li 
			<c:choose>
			  <c:when test="${not empty curNav && curNav == 'collect'}">
			    class="user-menu-nav-cur"
			  </c:when>
			  <c:otherwise>
			    class="user-menu-nav"
			  </c:otherwise>
			</c:choose>
		>我的收藏 <span>&gt;</span></li>
	</a>
	
	<a href="http://localhost:8080/yourmooc/user/follow">
		<li 
			<c:choose>
			  <c:when test="${not empty curNav && curNav == 'follow'}">
			    class="user-menu-nav-cur"
			  </c:when>
			  <c:otherwise>
			    class="user-menu-nav"
			  </c:otherwise>
			</c:choose>
		> 我的关注  <span>&gt;</span></li>
	</a>
	
	<a href="http://localhost:8080/yourmooc/user/info">
		<li 
			<c:choose>
			  <c:when test="${not empty curNav && curNav == 'info'}">
			    class="user-menu-nav-cur"
			  </c:when>
			  <c:otherwise>
			    class="user-menu-nav"
			  </c:otherwise>
			</c:choose>
		>个人信息<span>&gt;</span></li>
	</a>
	
	<a href="http://localhost:8080/yourmooc/user/passwd">
		<li 
			<c:choose>
			  <c:when test="${not empty curNav && curNav == 'passwd'}">
			    class="user-menu-nav-cur"
			  </c:when>
			  <c:otherwise>
			    class="user-menu-nav"
			  </c:otherwise>
			</c:choose>
		>修改密码<span>&gt;</span></li>
	</a>
	
</ul>

<script type="text/javascript">
	$(function(){
		$('.user-menu-nav').hover(function(){
			$(this).find('span').css('color','#0089D2');
		},function(){
			$(this).find('span').css('color','#777');
		});
	});	
</script>