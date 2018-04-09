<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>课程分类</title>
		
		<%@ include file="common/res.jsp" %>
	</head>

	<body>
		<!-- 头部 -->
		<%@ include file="common/header.jsp" %>
		
		<div class="f-main clearfix">
			<!-- 一级分类-start -->
			<div class="course-nav-row clearfix">
				<span class="hd">方向：</span>
				<ul class="course-nav">
					<li class="course-nav-item <c:if test="${not empty curCode && curCode == '-1'}">cur-course-nav</c:if>">
						<a href="javascript:void(0)" onclick="_queryPage(1, '-1')">全部</a>
					</li>
					<c:if test="${not empty classifys}">
					<c:forEach items="${classifys}" var="classify" varStatus="status">
						<li class="course-nav-item <c:if test="${not empty curCode && curCode == classify.code}">cur-course-nav</c:if>">
							<a href="javascript:void(0)" onclick="_queryPage(1, '${classify.code}')"> ${classify.name} </a>
						</li>
					</c:forEach>
					</c:if>
				</ul>
			</div>
			<!-- 一级分类-end -->
			
			<!-- 二级分类-start -->
			<div class="course-nav-row clearfix">
				<span class="hd">分类：</span>
				<ul class="course-nav">
					<li class="course-nav-item <c:if test="${not empty curSubCode && curSubCode == '-2'}">cur-course-nav</c:if>">
						<a href="javascript:void(0)" onclick="_queryPage(1,'-2')">全部</a>
					</li>
					<c:if test="${not empty subClassifys}">
					<c:forEach items="${subClassifys}" var="subClassify" varStatus="status">
						<li class="course-nav-item <c:if test="${not empty curSubCode && curSubCode == subClassify.code}">cur-course-nav</c:if>">
							<a href="javascript:void(0)" onclick="_queryPage(1, '${subClassify.code}')"> ${subClassify.name} </a>
						</li>
					</c:forEach>
					</c:if>
				</ul>
			</div>
			<!-- 二级分类-end -->
			
			<!-- 课程列表-start -->
			<div class="types-block clearfix" style="padding:0px;">
				<h3 style="margin-bottom: 20px;">	
					<span class="types-title" style="margin-right:40px;">课程列表</span>
					<a href="javascript:void(0)" style="display: inline-block;margin-right:20px;" onclick="_queryPage(1,undefined,'last')">
						<span <c:if test="${not empty sort && sort == 'last'}">class="color-oc"</c:if> >最新</span>
					</a>
					<a href="javascript:void(0)" style="display: inline-block;" onclick="_queryPage(1,undefined,'pop')">
						<span <c:if test="${not empty sort && sort == 'pop'}">class="color-oc"</c:if> >最热</span>
					</a>
				</h3>
				<div class="types-content clearfix" style="margin-bottom: 20px;">
				
					<c:if test="${not empty page.items}">
					<div>
						<c:forEach items="${page.items}" var="item" varStatus="status">
						<c:set var="n" value="${status.index + 1}"></c:set>
						<a href="<%=path %>/course/learn/${item.id}">
							<div class="course-card-container" <c:if test="${n % 5 == 0}">style="margin-right: 0px;"</c:if> >
								<c:choose>
									<c:when test="${n %5 == 0}">
										<div class="course-card-top green-bg">
									</c:when>
									<c:when test="${n %4 == 0}">
										<div class="course-card-top pink-bg">
									</c:when>
									<c:when test="${n %3 == 0}">
										<div class="course-card-top purple-bg">
									</c:when>
									<c:when test="${n %2 == 0}">
										<div class="course-card-top gray-bg">
									</c:when>
									<c:otherwise>
										<div class="course-card-top brown-bg">
									</c:otherwise>
								</c:choose>
									<span> ${item.subClassifyName} </span>
								</div>
								
								<div class="course-card-content">
									<h3 class="course-card-name" title="${item.name}"> ${item.name} </h3>
									<p title="${item.brief}"> ${item.brief} </p>
									<div class="clearfix course-card-bottom">
										<div class="course-card-info">
											<c:choose>
												<c:when test="${item.level == 1}">
													初级
												</c:when>
												<c:when test="${item.level == 2}">
													中级
												</c:when>
												<c:otherwise>
													高级
												</c:otherwise>
											</c:choose>
											<span>·</span>${item.studyCount}人在学
										</div>
									</div>
								</div>
							</div>
						</a>
						</c:forEach>
					</div>
					
					<%@ include file="common/tailPage.jsp" %>
					</c:if>
					
				</div>
			</div>
			<!-- 课程列表-end -->
		</div>
				
		<!-- 页脚-start -->
		<%@ include file="common/footer.jsp" %>
		<!-- 页脚-end-->


	<script>
	
	// 获取初始值 
	var _curCode = '${curCode}';      
	var _curSubCode = '${curSubCode}';  
	var _sort = '${sort}';
	
	/**
	 * 获取分页数、分类码以及排序方式
	 * 以刷新的方式提交到后台
	 * @param  {String} pageNum [分页数]
	 * @param  {String} code    [分类码]
	 * @param  {String} sort    [排序方式：last-最新，pop-最热]
	 */
	function _queryPage(pageNum,code,sort) {
		var params = '?pageNum=' + pageNum;
		//分类，参数没有就用页面缓存 
		if(code == undefined){//来自于分页按钮
			code = _curCode;
			if(_curSubCode != '-2'){
				code = _curSubCode; //优先使用 _curSubCode 
			}
		}
		if (code == '-2') {  // 点击二级分类的全部
			code = _curCode;
		} 
		if (code != '') {
			params += '&c=' + code;
		}
		//排序，函数参数没有就用页面缓存 
		if(sort == undefined && _sort != ''){
			sort = _sort;
		}
		if(sort != undefined){
			params += '&sort='+sort;
		}
		window.location.href = '<%=path%>/course/list' + params;
	}
	</script>
</body>
</html>
