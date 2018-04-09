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

<div class="f-main">
	<!-- 轮播 分类-start -->
	<div class="clearfix">
		<div class="main-category">
			<div class="main-bg">
				<!-- 轮播图 -->
				<c:if test="${not empty carouselList && fn:length(carouselList) > 0}">
					<c:forEach items="${carouselList}" var="carousel" varStatus="status">
						<a href="${carousel.url}">
							<div class="main-bg-item"
									 style="background-image: url('<%=basePath %>resources/images/${carousel.picture}'); ">
							</div>
						</a>
					</c:forEach>
				</c:if>
			</div>

			<div class="f-nav-box">
				<div class="bg-nav">
					<!-- 轮播图指示器 -->
					<c:if test="${not empty carouselList && fn:length(carouselList) > 0}">
						<c:forEach items="${carouselList}" var="carousel" varStatus="status">
							<c:choose>
								<c:when test="${status.index == 0}">
									<a class="cur"></a>
								</c:when>
								<c:otherwise>
									<a></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="main-category-menu">
				<!-- 一级分类 -->
				<c:if test="${not empty classifys}">
					<c:forEach items="${classifys}" var="classify" varStatus="status">
						<c:if test="${status.index < 6}">
							<div class="category" c-id="classify_${classify.id}">
								<a href="<%=path%>/course/list?c=${classify.code}">
									<div class="group"> ${classify.name} </div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<!-- 二级分类以及课程推荐 -->
			<c:if test="${not empty classifys}">
				<c:forEach items="${classifys}" var="classify" varStatus="status">
					<c:if test="${status.index < 6}">
						<div class="main-category-submenu-content" id="classify_${classify.id}">
							<div class="clearfix">
								<div class="submenu-title clearfix">分类目录</div>
								<c:if test="${not empty classify.subClassifyList}">
									<c:forEach items="${classify.subClassifyList}" var="subClassify" varStatus="subStatus">
										<a class="submenu-item" href="<%=path%>/course/list?c=${subClassify.code}"> ${subClassify.name} </a>
										<c:if test="${subStatus.index < fn:length(subClassifyList) - 1}">
											<a class="submenu-item">/</a>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<div class="clearfix">
								<div class="submenu-title" style="margin-top: 30px;">课程推荐</div>
								<div>
									<c:if test="${not empty classify.recomdCourseList && fn:length(classify.recomdCourseList) > 0}">
										<c:forEach items="${classify.recomdCourseList}" var="recomdCourse" varStatus="status">
											<a href="<%=path %>/course/learn/${recomdCourse.id}" class="mt-10" title="${recomdCourse.name}">
												<li class="ellipsis oc-color-hover">➤ ${recomdCourse.name}</li>
											</a>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>

	<!-- 轮播 分类-end -->

	<!-- 免费好课-start -->
	<div class="types-block clearfix">
		<h3 class="types-title">好课推荐</h3>
		<div class="types-content">
			<c:if test="${not empty goodCourseList && fn:length(goodCourseList) > 0}">
				<c:forEach items="${goodCourseList}" var="goodCourse" varStatus="status">
					<c:set var="n" value="${status.index + 1}"></c:set>
					<a href="<%=path%>/course/learn/${goodCourse.id}">
						<div class="course-card-container"
								 <c:if test="${n % 5 == 0}">style="margin-right: 0;"</c:if> >
							<c:choose>
							<c:when test="${n % 5 == 0}">
							<div class="course-card-top green-bg">
								</c:when>
								<c:when test="${n % 4 == 0}">
								<div class="course-card-top pink-bg">
									</c:when>
									<c:when test="${n % 3 == 0}">
									<div class="course-card-top purple-bg">
										</c:when>
										<c:when test="${n % 2 == 0}">
										<div class="course-card-top gray-bg">
											</c:when>
											<c:otherwise>
											<div class="course-card-top brown-bg">
												</c:otherwise>
												</c:choose>
												<span> ${goodCourse.subClassifyName} </span>
											</div>

											<div class="course-card-content">
												<h3 class="course-card-name" title="${goodCourse.name}"> ${goodCourse.name} </h3>
												<p title="${goodCourse.brief}"> ${goodCourse.brief} </p>
												<div class="course-card-bottom">
													<div class="course-card-info">
														<c:choose>
															<c:when test="${goodCourse.level == 1}">
																初级
															</c:when>
															<c:when test="${goodCourse.level == 2}">
																中级
															</c:when>
															<c:otherwise>
																高级
															</c:otherwise>
														</c:choose>
														<span>·</span>${goodCourse.studyCount}人在学
													</div>
												</div>
											</div>
										</div>
					</a>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!-- 免费好课-end -->

	<!-- java课程-start -->
	<div class="types-block clearfix">
		<h3 class="types-title">Java开发工程师</h3>
		<c:if test="${not empty javaCourseList && fn:length(javaCourseList) > 0}">
			<c:forEach items="${javaCourseList}" var="javaCourse" varStatus="status">
				<c:if test="${status.index == 0}">
					<a href="<%=path%>/course/learn/${javaCourse.id}">
						<div class="types-content-left "
								 style="background-image: url(<%=basePath %>resources/images/58ac18fd00012a4202240348.jpg);">
							<div class="course-card-container-fix">
								<div class="course-card-content">
									<h3 class="course-card-name" title="${javaCourse.name}"> ${javaCourse.name} </h3>
									<p class="color-fff" title="${javaCourse.brief}"> ${javaCourse.brief} </p>
									<div class="course-card-bottom" style="margin-top: 50px;">
										<div class="course-card-info color-fff">了解详情 →</div>
									</div>
								</div>
							</div>
						</div>
					</a>
				</c:if>
			</c:forEach>

			<c:if test="${fn:length(javaCourseList) > 2}">
				<div class="types-content-right ">
					<div class="types-content-banner ">
						<c:forEach items="${javaCourseList}" var="javaCourse" varStatus="status">
							<c:if test="${status.index > 0 && status.index < 3}">
								<a href="<%=path%>/course/learn/${javaCourse.id}" title="${javaCourse.name}">
									<c:if test="${status.index == 1}">
									<div class="types-content-banner-block green-bg" style="margin-right:20px;">
										</c:if>
										<c:if test="${status.index == 2}">
										<div class="types-content-banner-block gray-bg">
											</c:if>
												${javaCourse.name}
										</div>
								</a>
							</c:if>
						</c:forEach>
					</div>

					<div class="clearfix">
						<c:forEach items="${javaCourseList}" var="javaCourse" varStatus="status">
							<c:if test="${status.index > 2}">
								<a href="<%=path%>/course/learn/${javaCourse.id}" target="_black">
									<div class="course-card-container"
											 <c:if test="${status.index == 6}">style="margin-right: 0px;"</c:if> >
										<div class="course-card-top green-bg">
											<span> ${javaCourse.subClassifyName} </span>
										</div>

										<div class="course-card-content">
											<h3 class="course-card-name" title="${javaCourse.name}"> ${javaCourse.name} </h3>
											<p title="${javaCourse.brief}"> ${javaCourse.brief} </p>
											<div class="course-card-bottom">
												<div class="course-card-info">
													<c:choose>
														<c:when test="${javaCourse.level == 1}">
															初级
														</c:when>
														<c:when test="${javaCourse.level == 2}">
															中级
														</c:when>
														<c:otherwise>
															高级
														</c:otherwise>
													</c:choose>
													<span>·</span>${javaCourse.studyCount}人在学
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</c:if>
	</div>
	<!-- java课程-end -->

	<!--名校讲师-start -->
	<div class="types-block clearfix">
		<h3 class="types-title">名校讲师</h3>

		<c:if test="${not empty recomdTeacherList && fn:length(recomdTeacherList) > 0}">
			<c:forEach items="${recomdTeacherList}" var="teacher" varStatus="status">
				<div class="lecturer-card-container"
						 <c:if test="${status.index == 4}">style="margin-right: 0px;"</c:if> >
					<div class="lecturer-item">
						<img class="lecturer-uimg" src="<%=basePath%>resources/images/${teacher.header}">
						<span class="lecturer-name"> ${teacher.username} </span>
						<span class="lecturer-title"> ${teacher.collegeName}</span>
						<span class="lecturer-p"> ${teacher.title},${teacher.sign} </span>
					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>
	<!--名校讲师-end -->
</div>


<!-- 页脚-start -->
<%@ include file="common/footer.jsp" %>
<!-- 页脚-end-->


<script>

    // 课程分类展示
    $(".category").popover({
        trigger: 'manual',
        placement: 'right',
        html: 'true',
        content: '',
        animation: false
    }).on("mouseenter", function () {
        var cid = $(this).attr('c-id');
        $('#' + cid).show();
        $('#' + cid).hover(function () {
            $('#' + cid).show();
        }, function () {
            $('#' + cid).hide();
        });
    }).on("mouseleave", function () {
        var cid = $(this).attr('c-id');
        $('#' + cid).hide();
    });


    /**
     * 轮播图
     */
    $(function () {
        var index = 0;
        var n = $('.main-bg-item').length;
        // 初始化
        $('.main-bg-item').hide();
        $('.main-bg-item:eq(0)').show().css('z-index', '2');

        /**
         * 图片切换
         * @param  {int} i 下一张要显示的图片
         */
        var rollBg = function (i) {
            $('.main-bg-item').fadeOut(1000);
            $($('.main-bg-item')[i]).fadeIn(1000);
            $('.bg-nav a').removeClass('cur');
            $($('.bg-nav a')[i]).addClass('cur');
        }

        $('.bg-nav a').click(function () {
            index = $('.bg-nav a').index($(this));
            rollBg(index);
        });

        setInterval(function () {
            index += 1;
            index = index % n;
            rollBg(index);
        }, 4000);

    });
</script>
</body>
</html>
