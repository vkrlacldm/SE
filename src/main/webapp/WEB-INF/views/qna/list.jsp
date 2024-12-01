<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
.btn {
    padding: 12px;
    border-radius: 12px;
    background: #FFFFCC;
    line-height: 1em;
    color: #808080;
    text-align: center;
    margin-right: 0;	
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><img src="${pageContext.request.contextPath}/resources/images/qna1.png"></i> 1:1 문의 </h3>
		</div>
		
		<div class="body-main">

	        <div class="row board-list-header">
	            <div class="col-auto me-auto">
	            	${dataCount}개(${page}/${total_page} 페이지)
	            </div>
	            <div class="col-auto">&nbsp;</div>
	        </div>				
			
			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th class="bw-60" style="background: #FFFFCC;">번호</th>
						<th class="bw-100" style="background: #FFFFCC;">유형</th>
						<th style="background: #FFFFCC;">제목</th>
						<th class="bw-100" style="background: #FFFFCC;">작성자</th>
						<th class="bw-90" style="background: #FFFFCC;">문의일자</th>
						<th class="bw-80" style="background: #FFFFCC;">처리결과</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.listNum}</td>
							<td>${dto.category}</td>
							<td class="left">
								<c:choose>
									<c:when test="${dto.questionPrivate==1}">
										<i class="bi bi-key"></i>
										<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.role == 0}">
											<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
										</c:if>
										<c:if test="${sessionScope.member.userId!=dto.userId && sessionScope.member.role > 0}">
											비밀글 입니다.
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.isAnswer==1?"답변완료":"답변대기"}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-box">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/qna/list';">새로고침</button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/qna/list" method="post">
						<div class="col-auto p-1">
							<select name="condition" class="form-select">
								<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
								<option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
								<option value="reg_date" ${condition=="reg_date"?"selected='selected'":""}>등록일</option>
								<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="keyword" value="${keyword}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/qna/write';">글올리기</button>
				</div>
			</div>

		</div>
	</div>
</div>