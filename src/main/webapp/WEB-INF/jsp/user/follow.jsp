<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的关注</title>
    
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
				<div><span class="f-16">我的关注</span></div>
				<div class="split-line" style="margin: 20px 0px;"></div>
				
				<form id="queryPageForm" action="">
					<c:if test="${not empty page.items}">
					<c:forEach var="item" items="${page.items}">
						<div class="comment clearfix">
							<div class="comment-main" style="width: 100%">
								<a href="<%=path %>/course/learn/${item.followId}" class="user-name link-a" style="font-size:20px;">
								${item.followId}
								</a>
								<div class="comment-content">
									<span>关注时间：2018-1-1
									</span>
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
