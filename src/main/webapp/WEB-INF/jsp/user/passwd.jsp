<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>密码修改</title>
    
    <%@ include file="../common/res.jsp" %>
  </head>

  <body>
    <!-- 头部 -->
    <%@ include file="../common/header.jsp" %>
    
    	<div class="f-main clearfix">
			<div class="setting-left">
					<%@ include file="common/nav.jsp"%>
			</div>
			
			
			<div class="setting-right"  >
				<div>
					<span class="f-16">修改密码</span>
				</div>
				<div class="split-line" style="margin: 20px 0px;"></div>
				
				<form class="oc-form" id="passwdForm" method="post" action="<%=path %>/user/savePasswd">
					<li><label>旧密码</label> <input id="oldPassword" name="oldPassword" type="password" class="input-text" placeholder="请输入旧密码" autocomplete="off" /></li>
					<li><label>新密码</label> <input name="password" type="password" class="input-text"  placeholder="请输入新密码" autocomplete="off" /></li>
					<li><label>确认密码</label> <input name="rePassword" type="password" class="input-text"  placeholder="请输入确认密码" autocomplete="off" /></li>
					<li class="clearfix" style="margin-top: 50px;padding-left: 170px;">
						<div class="btn" onclick="passwdSubmit()">保存</div>
					</li>
					
					<li>
						<div id="infoAlert" class="alert alert-success" style="display: none;">
							<span id="infoAlert_msg" class="color-oc f-16"></span>
						</div>
					</li>
				</form>
			</div>
		</div>
    
    <!-- 页脚-start -->
    <%@ include file="../common/footer.jsp" %>
    <!-- 页脚-end-->


<script type="text/javascript">
function passwdSubmit() {
	$('#passwdForm').ajaxSubmit({
		datatype : 'json',
		success : function(resp) {
			var resp = $.parseJSON(resp);
			if (resp.errcode == 0) {
				$('#infoAlert_msg').html('修改密码成功！');
			} else {
				$('#infoAlert_msg').html(resp.message);
			}
			$("#infoAlert").show().fadeOut(2500);//显示模态框
		},
		error : function(xhr) {
			alert('error!');
		}
	});
}
</script>		
</body>
</html>