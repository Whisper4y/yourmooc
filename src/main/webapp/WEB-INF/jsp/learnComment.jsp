<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>课程评论</title>

	<%@ include file="common/res.jsp" %>
</head>

<body>
<!-- 头部 -->
<%@ include file="common/header.jsp" %>

<c:set var="session_username" value="${sessionScope.username}"></c:set>

<div class="f-main clearfix">
	<!-- 基本信息 -->
	<div class="main-course-left">
		<div class="course-info">
			<div class="course-title"> ${course.name} </div>

			<div class="course-meta">
				<a href="#" class="learn-btn">继续学习</a>

				<!-- 当前课程章节 -->
				<div class="static-item">
					<div class="meta">上次学到</div>
					<div class="meta-value">1-1 感受神秘的涟漪效果之美感受神秘的涟漪效果之美</div>
				</div>

				<div class="static-item">
					<div class="meta">学习人数</div>
					<div class="meta-value"> ${course.studyCount} </div>
				</div>
				<div class="static-item">
					<div class="meta">难度级别</div>
					<div class="meta-value">
						<c:if test="${not empty course && not empty course.level}">
							<c:choose>
								<c:when test="${course.level == 1}">
									初级
								</c:when>
								<c:when test="${course.level == 2}">
									中级
								</c:when>
								<c:otherwise>
									高级
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
				</div>
				<div class="static-item" style="border:none;">
					<div class="meta">课程时长</div>
					<div class="meta-value"> ${course.time} </div>
				</div>
				<a id="collectionSpan" onclick="doCollect(${course.id})" href="javascript:void(0)" class="following"
					 style="float: right;margin-top:5px;" title="收藏">
				</a>
			</div>

			<div class="course-brief">
				${course.brief}
			</div>

			<div class="course-menu">
				<a href="<%=path %>/course/learn/${course.id}"><span
						class="menu-item <c:if test="${isComment == 'no'}">cur</c:if>">章节</span></a>
				<a href="<%=path %>/courseComment/segment?courseId=${courseId}&pageNum=1"><span
						class="menu-item <c:if test="${isComment == 'yes'}">cur</c:if>">评论</span></a>
			</div>
		</div>
		<!-- 基本信息-end -->

		<!-- 评论区 start -->
		<c:if test="${not empty page.items}">
			<c:forEach items="${page.items}" var="item" varStatus="status">
				<div class="comment clearfix">
					<div class="comment-header">
						<img class="lecturer-uimg" src="<%=basePath %>resources/images/header.jpg">
					</div>
					<div class="comment-main">
						<div class="user-name">${item.username} 评论道：</div>
						<div class="comment-content">${item.content}</div>
						<div class="comment-footer">
							<c:if test="${not empty item.createTime}">
								<span>时间：<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/> </span>
							</c:if>
							<a href="#/${item.id}">${item.sectionTitle}</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</c:if>
		<!-- 评论区 end -->
	</div>

	<!-- 教师信息&推荐课程 - start -->
	<div class="main-course-right">
		<c:if test="${not empty courseTeacher}">
			<div class="lecturer-item" style="width: 100%;">
				<img class="lecturer-uimg" src="<%=basePath %>/resources/images/header.jpg">
				<span class="lecturer-name"> ${courseTeacher.username} </span>
				<span class="lecturer-title"> ${courseTeacher.collegeName} </span>
				<span class="lecturer-p"> ${courseTeacher.title}，${courseTeacher.sign} </span>
				<a href="javascript:void(0)" onclick="doFollow('${courseTeacher.id}');"><span class="follow-btn"
																																											id="followSpan">关注+</span></a>
			</div>
		</c:if>

		<h4 class="mt-50">推荐课程</h4>
		<c:if test="${not empty recomdCourseList && fn:length(recomdCourseList) > 0}">
			<c:forEach items="${recomdCourseList}" var="recomdCourse" varStatus="status">
				<a href="#/${recomdCourse.id}" class="mb-5">
					<li class="ellipsis oc-color-hover" title="${recomdCourse.name}"> ${recomdCourse.name} </li>
				</a>
			</c:forEach>
		</c:if>
	</div>
	<!-- 教师信息&推荐课程 - end -->

</div>


<!-- 页脚 -->
<%@ include file="common/footer.jsp" %>

<script>
    $(function () {
        /**
         * 回显操作：判断是否收藏或者关注
         */
        var session_username = '${session_username}';
        var courseId = '${course.id}';
        var followId = '${courseTeacher.id}';
        if (session_username) {
            if (courseId) {
                var url = '<%=path %>/collections/isCollection';
                doCollect(courseId, url);
            }
            if (followId) {
                var url_2 = '<%=path %>/follow/isFollow';
                doFollow(followId, url_2);
            }
        }
    });


    /*
		* 收藏
		*/
    function doCollect(courseId, url) {
        var session_username = '${session_username}';
        if (!session_username) {
            window.alert('请先登录');
            return;
        }
        if (url == undefined) {
            url = '<%=path %>/collections/doCollection';
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: {
                "courseId": courseId
            },
            success: function (resp) {
                if (resp.errcode == 1) { //已收藏
                    $('#collectionSpan').attr('class', 'followed');
                } else if (resp.errcode == 0) { //取消收藏
                    $('#collectionSpan').attr('class', 'following');
                }
            }
        });
    }


    //关注
    function doFollow(followId, url) {
        var session_username = '${session_username}';
        if (!session_username) {
            window.alert('请先登录');
            return;
        }
        if (url == undefined) {
            url = '<%=path %>/follow/doFollow';
        }
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: {"followId": followId},
            success: function (resp) {
                if (resp.errcode == 1) {
                    $('#followSpan').html('已关注');
                } else if (resp.errcode == 0) {
                    $('#followSpan').html('+关注');
                }
            }
        });
    }

</script>
</body>
</html>
