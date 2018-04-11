<div class="f-header">
	<div class="f-header-box clearfix">
		<a href="/yourmooc/"  class="logo" title="在线教育平台--yourmooc"></a>
		<nav class="header-nav">
			<a href="/yourmooc/" class="header-nav-item">首 页</a>
			<a href="/yourmooc/course/list" class="header-nav-item">分类</a>
			<a href="/yourmooc/user/course" class="header-nav-item">我的</a>
		</nav>
	</div>
</div>

<script>

/**
 * 验证码刷新
 */
function reloadIndityImg(eleId){
	document.getElementById(eleId).src = "http://localhost:8080/yourmooc/identiry/code?ticket=" + Math.random();
}
</script>
