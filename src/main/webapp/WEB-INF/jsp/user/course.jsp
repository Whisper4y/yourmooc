<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>最近学习</title>
    
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
				<div><span class="f-16">最近学习</span></div>
				<div class="split-line" style="margin: 20px 0px;"></div>
				
				<form id="queryPageForm" action="">
				<c:if test="${not empty page.items}">
				<c:forEach var="item" items="${page.items}">
				<div class="comment clearfix">
					<div class="comment-main" style="width: 100%">
						<a href="<%=path %>/course/learn/${item.courseId}" class="user-name link-a" style="font-size:20px;">${item.courseName}</a>
						<div class="comment-content">
							<span>
							<a href="<%=path %>/course/video/${item.sectionId}">
							${item.sectionName}
							</a>
							</span>
						</div>
						<div class="comment-footer">
							<span>时间：
							<c:if test="${not empty page.items}">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${item.createTime}" />
							</c:if>
							</span>
							<a href="<%=path %>/course/video/${item.sectionId}">
							<span class="continue-btn" style="margin-left: 50px;">继续学习</span>
							</a>
						</div>
					</div>
				</div>		
				</c:forEach>
				
				<%@ include file="common/tailPage2.jsp"%>
				</c:if>
				</form>
				
			</div>
			
		</div>
    
    <!-- 页脚-start -->
    <%@ include file="../common/footer.jsp" %>
    <!-- 页脚-end-->


<script type="text/javascript">

</script>		
</body>
</html>
