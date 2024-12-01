<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
.btn {
    padding: 10px; border-radius: 12px;
    background: #FFFFCC;
    line-height: 1em;
    color: #808080;
    text-align: center;
    margin-right: 0;
    border: none;	
}

main {
    background-color: #f7f8fb;
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
}

.form-control-plaintext {
    display: block;
    width: 100%;
    padding: 0.375rem 0;
    margin-bottom: 0;
    line-height: 1.5;
    color: #212529;
    background-color: transparent;
    border: solid transparent;
    border-radius: 30px 10px;
    border-width: 1px 0;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.role == 0}">
	function deleteOk(num, mode) {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
	    	let query = "num="+num+"&mode="+mode+"&${query}";
		    let url = "${pageContext.request.contextPath}/qna/delete?" + query;
	    	location.href = url;
	    }
	}
</c:if>
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><img src="${pageContext.request.contextPath}/resources/images/question3.png"> 질문과 답변 </h3>
		</div>
		
		<div class="body-main">

			<table class="table mb-0">
				<tbody>
					<tr>
						<td colspan="2" align="center" class="px-0 pb-0">
							<div class="row gx-0">
								<div class="col-sm-1 bg-primary me-1">
									<p class="form-control-plaintext text-white">Q.</p>
								</div>
								<div class="col bg-primary">
									<p class="form-control-plaintext text-white">[${questionDto.category}] ${questionDto.subject}</p>
								</div>
							</div>
						</td>
					</tr>
				
					<tr>
						<td width="50%">
							작성자 : ${questionDto.userName}					
						</td>
						<td align="right">
							문의일자 : ${questionDto.reg_date}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" valign="top" height="150">
							${questionDto.content}
						</td>
					</tr>
				</tbody>
			</table>
			
			<c:if test="${not empty answerDto}">
				<table class="table mb-0">
					<tbody>
						<tr>
							<td colspan="2" align="center" class="p-0">
								<div class="row gx-0">
									<div class="col-sm-1 bg-success me-1">
										<p class="form-control-plaintext text-white">A.</p>
									</div>
									<div class="col bg-success">
										<p class="form-control-plaintext text-white">[RE] ${answerDto.subject}</p>
									</div>
								</div>
							</td>
						</tr>
					
						<tr>
							<td width="50%">
								담당자 : ${answerDto.userName}				
							</td>
							<td align="right">
								답변일자 :  ${answerDto.reg_date}
							</td>
						</tr>
						
						<tr>
							<td colspan="2" valign="top" height="150">
								${answerDto.content}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			
			<table class="table mb-2">
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty preReadDto}">
								<c:choose>
									<c:when test="${preReadDto.questionPrivate==1}">
										<i class="bi bi-key"></i>
										<c:if test="${sessionScope.member.userId==preReadDto.userId || sessionScope.member.role == 0}">
											<a href="${pageContext.request.contextPath}/qna/article?num=${preReadDto.num}&${query}">${preReadDto.subject}</a>
										</c:if>
										<c:if test="${sessionScope.member.userId!=preReadDto.userId && sessionScope.member.role > 0}">
											비밀글 입니다.
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/qna/article?num=${preReadDto.num}&${query}">${preReadDto.subject}</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextReadDto}">
								<c:choose>
									<c:when test="${nextReadDto.questionPrivate==1}">
										<i class="bi bi-key"></i>
										<c:if test="${sessionScope.member.userId==nextReadDto.userId || sessionScope.member.role == 0}">
											<a href="${pageContext.request.contextPath}/qna/article?num=${nextReadDto.num}&${query}">${nextReadDto.subject}</a>
										</c:if>
										<c:if test="${sessionScope.member.userId!=nextReadDto.userId && sessionScope.member.role > 0}">
											비밀글 입니다.
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/qna/article?num=${nextReadDto.num}&${query}">${nextReadDto.subject}</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless">
				<tr>
					<td width="50%">
						<c:if test="${sessionScope.member.userId==questionDto.userId && empty answerDto}">
							<button type="button" class="btn btn-light" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/update?num=${questionDto.num}&page=${page}';">질문수정</button>
						</c:if>
						<c:if test="${sessionScope.member.userId==questionDto.userId || sessionScope.member.role == 0}">
							<button type="button" class="btn btn-light" onclick="deleteOk('${questionDto.num}','question');">질문삭제</button>
						</c:if>
						<c:if test="${sessionScope.member.role == 0 && empty answerDto}">
							<button type="button" class="btn btn-light" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/answer?num=${questionDto.num}&page=${page}';">답변</button>
						</c:if>
						<c:if test="${not empty answerDto and sessionScope.member.userId==answerDto.userId}">
							<button type="button" class="btn btn-light" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/update?num=${answerDto.num}&page=${page}';">답변수정</button>
						</c:if>
						<c:if test="${not empty answerDto && sessionScope.member.role == 0}">
							<button type="button" class="btn btn-light" onclick="deleteOk('${answerDto.num}','answer');">답변삭제</button>
						</c:if>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/qna/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>

		</div>
	</div>
</div>