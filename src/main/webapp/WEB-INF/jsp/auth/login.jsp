<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>用户登录</title>
		
		<%@ include file="../common/res.jsp" %>
	</head>

	<body>
		<!-- 头部 -->
		<%@ include file="../common/header2.jsp" %>
		

			<div class="f-main">
			<div class="types-block clearfix" style="text-align: center;">
				<h3 class="types-title">登录</h3>
				<form method="post" action="<%=path %>/auth/doLogin" class="oc-form" id="infoForm" style="text-align: center;border: 1px solid #CCC;width: 600px;margin:0 auto;padding:20px;" >
					<li><label>用户名</label> 
						<input name="username"  value="" type="text"  class="input-text"  placeholder="请输入用户名" >
					</li>
					<li><label>密码</label> 
						<input id="password" name="password" type="password" class="input-text" placeholder="请输入密码" autocomplete="off" />
					</li>
					<li><label>验证码</label> 
					<input id="identiryCode" name="identiryCode" maxlength="6" class="input-text" type="text" style="width: 150px;" placeholder="请输入验证码"/>
					<a class="vali-base"><img  onclick="reloadIndityImg('indeityImgLogin');" id="indeityImgLogin"  src="<%=path %>/identiry/code" style="width:80px;height:40px;float:left;margin-left:10px;"/></a>
					</li>
					<li>
						<label style="background-color:#FFF;"></label> 
                       	<input type="checkbox" value="1" id="checkbox1" name="rememberMe" style="float: left;">
                       	<span class="text"  style="float: left;margin-left:2px;">下次自动登录</span>
                  	</li>
                  	<li id="errorMsg" class="clearfix" style="display: none;color:red;">用户名密码不能为空</li>
					<li class="clearfix" style="margin-top: 20px;">
						<input type="submit" value="登录" class="btn"style="margin-right:20px;">
						<div class="btn" onclick="window.location.href='<%=path %>/auth/register'">注册</div>
					</li>
				</form>
			</div>
		</div>
		
		
		
		<!-- 页脚-start -->
		<%@ include file="../common/footer.jsp" %>
		<!-- 页脚-end-->
	

	<script>
	
	</script>
</body>
</html>
