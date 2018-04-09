<c:if test="${not empty page.pageTotalCount && page.pageTotalCount > 1}">
	<div class="page-box clearfix">
		<div class="page clearfix">
			<div style="float:left;">
				<!-- <input type="hidden" id="_id_pageNum" name="pageNum" value="${page.pageNum}"/> -->
				<c:if test="${!page.firstPage}">
					<a class="page-next" href="javascript:void(0);" onclick="_queryPage(1)">首页</a>
					<a class="page-next" href="javascript:void(0);" onclick="_queryPage(${page.pageNum-1})">上一页</a>
				</c:if>
				
				<c:forEach items="${page.showNums}" var="n" varStatus="status">
					<c:if test="${not empty page.showDot && status.index == 6}">
						<span class="page-omit">...</span>
					</c:if>
					
					<c:choose>
						<c:when test="${page.pageNum == n}">
							<a class="page-cur" href="javascript:void(0);" >${n}</a>
						</c:when>
						<c:otherwise>
							<a class="page-num" href="javascript:void(0);" onclick="_queryPage(${n});">${n}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${!page.lastPage}">
				<a class="page-next" href="javascript:void(0);"  onclick="_queryPage(${page.pageNum+1})">下一页</a> 
				<a class="page-next" href="javascript:void(0);"  onclick="_queryPage(${page.pageTotalCount})">尾页</a> 
				</c:if>
			</div>
		</div>
	</div>
</c:if>

<script type="text/javascript">
	function _queryPage(page) {
		if(page == undefined){
			page = 1;
		}
		$('#_id_pageNum').val(page);
		
		var query = $('#queryPageForm').attr('queryPage');
		if(query && Number(query) == 1) {
			queryPage(page);
		}else{
			$('#queryPageForm').submit();
		}
	}
</script>