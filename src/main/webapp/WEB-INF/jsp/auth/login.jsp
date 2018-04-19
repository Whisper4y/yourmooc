<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
		<form method="post" action="<%=path %>/auth/doLogin" class="oc-form" id="infoForm"
					style="text-align: center;border: 1px solid #CCC;width: 600px;margin:0 auto;padding:20px;">
			<li>
				<label>用户名</label>
				<input onfocus="handleInput('username');" id="username" name="username" type="text" class="input-text" placeholder="请输入用户名">
			</li>
			<li>
				<label>密码</label>
				<input onfocus="handleInput('password');" id="password" name="password" type="password" class="input-text" placeholder="请输入密码" autocomplete="off"/>
			</li>
			<li>
				<label>验证码</label>
				<input onfocus="handleInput('identiryCode');" id="identiryCode" name="identiryCode" maxlength="6" class="input-text" type="text" style="width: 150px;"
							 placeholder="请输入验证码"/>
					<a class="vali-base">
						<img onclick="reloadIndityImg('indeityImgLogin');" id="indeityImgLogin"
								 src="<%=path %>/identiry/code"
								 style="width:80px;height:40px;float:left;margin-left:10px;"/>
				</a>
			</li>

			<%--提示信息--%>
			<li id="errorMsg" class="clearfix" style="display: none;color:red;"></li>

			<li class="clearfix" style="margin-top: 20px;">
				<input type="button" value="登录" class="btn" style="margin-right:20px;" onclick="doSubmit();">
				<div class="btn" onclick="window.location.href='<%=path %>/auth/register'">注册</div>
			</li>
		</form>
	</div>
</div>


<!-- 页脚-start -->
<%@ include file="../common/footer.jsp" %>
<!-- 页脚-end-->


<script>
  var myErrCode = -1;

  function handleInput(field) {
    var $errorMsg = $('#errorMsg');
    if (field==='username' && myErrCode === 1) {
      $errorMsg.fadeOut()
    } else if (field==='password' && myErrCode === 2) {
      $errorMsg.fadeOut()
    } else if (field==='identiryCode' && myErrCode === 3) {
      $errorMsg.fadeOut()
    } else if (myErrCode === 0) {
      $errorMsg.fadeOut()
    }
  }

  /**
   * 验证
   */
  function doSubmit() {
    var username = $('#username').val();
    var password = $('#password').val();
    var $identiryCode = $('#identiryCode');
    var code = $identiryCode.val();
    var $errorMsg = $('#errorMsg');

    //验证用户名
    if (oc.isEmpty(username)) {
      $errorMsg.fadeIn().html("用户名不能为空");
      myErrCode = 1;
      return;
    }

    //验证密码
    if (oc.isEmpty(password)) {
      $errorMsg.fadeIn().html("密码不能为空");
      myErrCode = 2;
      return;
    }

    //验证码不能为空
    if (oc.isEmpty(code)) {
      $errorMsg.fadeIn().html("验证码不能为空");
      myErrCode = 3;
      return;
    }

    $('#infoForm').ajaxSubmit({
      datatype: 'json',
      success: function (respText) {
        var resp = $.parseJSON(respText);
        if (resp.errcode === 0) {
					window.location.href = "<%=path %>/";
        } else if (resp.errcode === 1) {
          $errorMsg.fadeIn().html("验证码错误");
          reloadIndityImg('indeityImgLogin');
          myErrCode = 0;
          $identiryCode.val('')
        } else if (resp.errcode === 2) {
          $errorMsg.fadeIn().html("用户不存在");
          reloadIndityImg('indeityImgLogin');
          myErrCode = 0;
          $identiryCode.val('')
        } else if (resp.errcode === 3) {
          $errorMsg.fadeIn().html("密码错误");
          reloadIndityImg('indeityImgLogin');
          myErrCode = 0;
          $identiryCode.val('')
				}
      },
      error: function (xhr) {

      }
    });
  }

</script>
</body>
</html>
