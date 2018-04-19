<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>用户注册</title>

	<%@ include file="../common/res.jsp" %>
</head>

<body>
<!-- 头部 -->
<%@ include file="../common/header2.jsp" %>

<div class="f-main">
	<div class="types-block clearfix" style="text-align: center;">
		<h3 class="types-title">注册</h3>
		<form id="registerForm" method="post" action="<%=path %>/auth/doRegister" class="oc-form"
					style="text-align: center;border: 1px solid #CCC;width: 600px;margin:0 auto;padding:20px;">
			<li>
				<label>用户名</label>
				<input onfocus="handleInput('username');" maxlength="20" id="username" name="username" type="text" class="input-text"
							 placeholder="请输入用户名（仅限于英文和数字）">
			</li>
			<li>
				<label>密码</label>
				<input onfocus="handleInput('password');" maxlength="20" id="password" name="password" type="password" class="input-text" placeholder="请输入密码"
							 autocomplete="off"/>
			</li>
			<li>
				<label>验证码</label>
				<input onfocus="handleInput('identiryCode');" id="identiryCode" name="identiryCode" maxlength="6" class="input-text" type="text" style="width: 150px;"
							 placeholder="请输入验证码"/>
				<a class="vali-base"><img onclick="reloadIndityImg('indeityImgRegister');" id="indeityImgRegister"
																	src="<%=path %>/identiry/code"
																	style="width:80px;height:40px;float:left;margin-left:10px;"/></a>
			</li>

			<%--提示信息--%>
			<li id="errorMsg" class="clearfix" style="display: none;color:red;">用户名密码不能为空</li>

			<li class="clearfix">
				<input type="button" value="注册保存" class="btn" onclick="doSubmit();">
			</li>
			<li>
				<a style="float: left;" href="<%=path %>/auth/login">已有账号，去登录</a>
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
    var $errorMsg = $('#errorMsg');

    //验证用户名
    if (!oc.enNumValid(username)) {
      $errorMsg.fadeIn().html("用户名只能为英文或数字");
      myErrCode = 1;
      return;
    }

    //验证密码
    if (oc.isEmpty(password) || password.length < 6) {
      $errorMsg.fadeIn().html("密码至少6位");
      myErrCode = 2;
      return;
    }

    //验证码不能为空
    var code = $('#identiryCode').val();
    if (oc.isEmpty(code)) {
      $errorMsg.fadeIn().html("请输入验证码");
      myErrCode = 3;
      return;
    }

    //提交注册
    $('#registerForm').ajaxSubmit({
      datatype: 'json',
      success: function (respText) {
        var resp = $.parseJSON(respText);
        if (resp.errcode === 0) {
          $errorMsg.fadeIn().html("注册成功！2s后跳转到登陆页！");
          setTimeout(function () {
            location.href = "<%=path %>/auth/login";
          }, 2000)
        } else if (resp.errcode === 1) {
          $errorMsg.fadeIn().html("用户名已被注册，请更换！");
          reloadIndityImg('indeityImgRegister');
          $('#identiryCode').val('')
          myErrCode = 0;
        } else if (resp.errcode === 2) {
          $errorMsg.fadeIn().html("验证码输入错误！");
          myErrCode = 0;
          reloadIndityImg('indeityImgRegister');
          $('#identiryCode').val('')
        }
      },
      error: function (xhr) {

      }
    });

  }
</script>
</body>
</html>
