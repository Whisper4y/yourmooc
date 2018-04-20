<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>yourmooc</title>

	<%@ include file="common/res.jsp" %>
</head>

<body>
<!-- 头部 -->
<%@ include file="common/header.jsp" %>


<div class="f-main clearfix">
	<div class="main-course-left">
		<div class="course-info">
			<div class="course-title" style="font-size: 24px;"> ${courseSection.name} </div>

			<div class="course-video">
				<video src="<%=basePath %>resources/${courseSection.videoUrl}" width="100%" height="100%" controls
							 preload></video>
			</div>

			<div class="course-menu">
				<a href="javascript:void(0)">
					<span onclick="_queryPage(1)" class="menu-item  cur">评论</span>
				</a>
			</div>
		</div>

		<!-- 评论-start  -->
		<div>
			<c:if test="${not empty comments}">
				<c:forEach items="${comments}" var="item" varStatus="status">
					<div class="comment clearfix">
						<div class="comment-header">
							<img class="lecturer-uimg"
									 src="<%=basePath%>resources/images/header.jpg">
						</div>
						<div class="comment-main">
							<div class="user-name">${item.username }</div>
							<div class="comment-content">${item.content }</div>
							<div class="comment-footer">
								<span>时间：<fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </span> <a
									href="">${item.sectionTitle }</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>

		<!-- 发布评论-start -->
		<div style="margin-top: 20px;">
			<div>
				<span id="commentTitle">发布评论：</span>
				<span id="commentTip" style="margin-left: 10px; color: #777;">长度小于200</span>
				<span id="errorMsg" style="margin-left: 10px; color: red;display: none;"></span>
			</div>
			<form id="commentForm" action="<%=path%>/courseComment/doComment" method="post" style="margin: 5px 0px;">
				<input type="hidden" id="commentType" name="type" value="0"/>
				<input type="hidden" name="sectionId" value="${courseSection.id}"/>
				<input type="hidden" name="courseId" value="${courseSection.courseId}"/>
				<input type="hidden" name="sectionTitle" value="${courseSection.name}"/>
				<input type="hidden" name="username" value=""/>
				<input type="hidden" name="toUsername" value=""/>
				<textarea id="content" name="content" rows="5" cols="100" onclick="handleInput();"></textarea>
				<div class="clearfix">
					<input type="button" value="发布" class="btn" onclick="handleComment();">
				</div>
			</form>
		</div>

		<!-- 评论-end -->
	</div>

	<!-- 章节-start -->
	<div class="main-course-right">
		<h4 class="mt-50">所有章节</h4>
		<div class="video-course-fix-parent">
			<div class="video-course-fix">
				<c:if test="${not empty chaptSections}">
					<c:forEach items="${chaptSections}" var="chaptSection" varStatus="status">
						<div class="chapter" style="padding: 0px ;border: none;">
							<a href="javascript:void(0);" class="js-open">
								<h3>
									<strong> ${chaptSection.name} </strong>
									<span class="drop-down">▼</span>
								</h3>
							</a>
							<ul class="chapter-sub" style="padding-left:10px;">
								<c:if test="${not empty chaptSection.sections}">
									<c:forEach items="${chaptSection.sections}" var="section" varStatus="status">
										<a href="<%=path%>/course/video/${section.id}">
											<li class="ellipsis  video-li"><i class="icon-video">▶</i> ${section.name} (${section.time})</li>
										</a>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 章节-end -->
</div>


<!-- 页脚-start -->
<%@ include file="common/footer.jsp" %>
<!-- 页脚-end-->

<script>
  function handleInput() {
    $('#errorMsg').hide();
    $('#commentTip').show();
	}

	/**
	 * 验证
	 **/
  function handleComment() {
    var content = $('#content').val();
    var $errorMsg = $('#errorMsg');
    var $commentTip = $('#commentTip');

    if (oc.isEmpty(content)) {
      $commentTip.hide();
      $errorMsg.show().html("评论不能为空");
      return;
    }

		if (getLength(content) > 200) {
      $commentTip.hide();
      $errorMsg.show().html("评论长度不能超过200");
      return;
		}

		$('#commentForm').submit();
	}

  /**
	 * 计算字符串的长度
   */
	function getLength(str) {
		return str.replace(/[^\x00-\xff]/g, 'xx').length;
  }
</script>
</body>
</html>
