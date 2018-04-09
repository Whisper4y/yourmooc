<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人信息</title>
    
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
					<span class="f-16">个人信息</span>
				</div>
				<div class="split-line" style="margin: 20px 0px;"></div>
				
				<div>
					<form class="oc-form" id="infoForm" method="post" action="<%=path %>/user/saveInfo" enctype="multipart/form-data">
						<div style="margin-left: 300px;">
							<input type="file" id="pictureImg" name="file" style="display: none;" onchange="photoImgChange();">
							<c:choose>
							  <c:when test="${not empty user.header && user.header != ''}">
							    <img id="user_header" src="<%=basePath %>resources/images/${user.header}" style="height:96px;">
							  </c:when>
							  <c:otherwise>
							    <img id="user_header" src="<%=basePath %>resources/images/header.jpg" style="height:96px;">
							  </c:otherwise>
							</c:choose>
							<div style="margin:15px 0px;" class="clearfix">
								<a href="javascript:void(0);" onclick="doUpload()" style="float:left; margin-left: 10px;" class="btn">更换头像</a>
								<span id="imgErrSpan" style="color:red;font-weight:normal;float:left;margin-left:10px;margin-top:5px;"></span>
							</div>
						</div>
						
						<li style="display:none;"><label>id</label> 
							<input name="id"  value="${user.id}" type="text"  class="input-text2">
						</li>
						<li><label>姓名</label> 
							<input name="username"  value="${user.username}" type="text"  class="input-text2">
						</li>
						<li><label>性别</label> 
							<select class="input-select" name="gender">
								<option value="1" <c:if test="${not empty user.gender && user.gender == 1}"> selected="selected"</c:if> >男</option>
								<option value="0" <c:if test="${not empty user.gender && user.gender == 0}"> selected="selected"</c:if>  >女</option>
							</select>
						</li>
						<li><label>学校</label> 
							<input name="collegeName"  value="${user.collegeName}" type="text"  class="input-text2">
						</li>
						<li><label>学历</label> 
							<select class="input-select" name="education">
								<option value="本科" <c:if test="${not empty user.education && user.education == '本科'}"> selected="selected"</c:if> > 本科 </option>
								<option value="硕士" <c:if test="${not empty user.education && user.education == '硕士'}"> selected="selected"</c:if> > 硕士 </option>
								<option value="博士" <c:if test="${not empty user.education && user.education == '博士'}"> selected="selected"</c:if> > 博士 </option>
								<option value="博士后" <c:if test="${not empty user.education && user.education == '博士后'}"> selected="selected"</c:if> > 博士后 </option>
								<option value="大专" <c:if test="${not empty user.education && user.education == '大专'}"> selected="selected"</c:if> > 大专 </option>
							</select>
						</li>
						<li><label>个性签名</label>
							<input name="sign"  value="${user.sign}"  type="text"  class="input-text2">
						</li>
						
						<li class="clearfix" style="margin-top: 50px;padding-left: 170px; margin-left: 140px;">
							<div class="btn" onclick="infoSubmit()">保存</div>
						</li>
						
						<li>
							<div id="myAlert" class="alert alert-success" style="display: none;">
								<span id="myAlert_msg" class="color-oc f-16">保存成功！</span>
							</div>
						</li>
					</form>
				</div>
			</div>
		</div>
        
    <!-- 页脚-start -->
    <%@ include file="../common/footer.jsp" %>
    <!-- 页脚-end-->


<script type="text/javascript">
	function doUpload() {
	  $('#pictureImg').click();
	}

	function photoImgChange() {
	  var img = $('#pictureImg').val();
	  if (oc.photoValid(img)) {
	    oc.previewUploadImg('pictureImg', 'user_header');
	    $('#user_header').show();
	    $('#imgErrSpan').html('');
	    return;
	  } else {
	    $('#imgErrSpan').html('&nbsp;请选择png,jpeg,jpg格式图片');
	    $('#pictureImg').val('');
	  }
	}

	function infoSubmit() {
		$('#infoForm').ajaxSubmit({
			datatype : 'json',
			success : function(resp) {
				var resp = $.parseJSON(resp);
				 if (resp.errcode == 0) {
				   $("#myAlert").show().fadeOut(2500); //显示模态框
				 } else {
				   $("#myAlert").show().fadeOut(2500); //显示模态框
				 }
			},
			error : function(xhr) {
				alert('error!');
			}
		});
	}
</script>		
</body>
</html>
