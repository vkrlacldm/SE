<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<style type="text/css">
main {
	background-color: #f7f8fb;
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000; letter-spacing: -0.03em;
}

.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">


<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>
	
	<table class='table table-borderless'>
		<c:forEach var="vo" items="${listReply}">
			<tr class='border bg-light'>
				<td width='50%'>
					<div class='row reply-writer'>
						<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
						<div class='col-auto align-self-center'>
							<div class='name'>${vo.nickName}</div>
							<div class='date'>${vo.commentReg_date}</div>
						</div>
					</div>
				</td>
				<td width='50%' align='right' class='align-middle'>
					<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
					<div class="reply-menu">
						<c:choose>
							<c:when test="${sessionScope.member.userId==vo.userId}">
								<div class='deleteReply reply-menu-item' data-replyNum='${vo.recipeCommentNum}' data-pageNo='${pageNo}'>삭제</div>
								<div class='hideReply reply-menu-item'>숨김</div>
							</c:when>
							<c:when test="${sessionScope.member.role == 0}">
								<div class='deleteReply reply-menu-item' data-replyNum='${vo.recipeCommentNum}' data-pageNo='${pageNo}'>삭제</div>
								<div class='hideReply reply-menu-item'>숨김</div>
							</c:when>
							<c:otherwise>
								
								<div class='notifyReplyAnswer reply-menu-item' data-bs-toggle="modal" data-bs-target="#exampleModal1">신고</div>
								<div class='hideReply reply-menu-item'>숨김</div>
							</c:otherwise>
						</c:choose>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan='2' valign='top'>${vo.commentContent}</td>
			</tr>
	
			<tr>
				<td>
					<button type='button' class='btn btn-light btnReplyAnswerLayout' data-replyNum='${vo.recipeCommentNum}'>답글 <span id="answerCount${vo.recipeCommentNum}">${vo.answerCount}</span></button>
				</td>
				
			</tr>
		
		    <tr class='reply-answer'>
		        <td colspan='2'>
		        	<div class='border rounded'>
			            <div id='listReplyAnswer${vo.recipeCommentNum}' class='answer-list'></div>
			            <div>
			                <textarea class="form-control m-2"></textarea>
			            </div>
						<div class='text-end pe-2 pb-1'>
							<button type='button' class='btn btn-light btnSendReplyAnswer' data-replyNum='${vo.recipeCommentNum}'>답글 등록</button>
			            </div>
		            </div>
				</td>
		    </tr>
		    
		    <!-- Modal -->
			<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			       <h5 class="modal-title" id="exampleModalLabel">댓글 신고</h5>
			       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form name="recipeReplyNotify" id ="recipeReplyNotify">
				      <div class="modal-body">
				        <p> 닉네임 : ${vo.nickName} </p>
				        <p> 댓글 내용 : ${vo.commentContent} </p>
				        <p> 신고사유 </p>
				        <textarea rows="7" cols="63" name ="replyreason"></textarea>
				        <input type="hidden" name="recipeNum" value="${vo.recipeNum}">
				        <input type="hidden" name="recipeCommentNum" value="${vo.recipeCommentNum}">
				      </div>
			      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary" data-recipeNum="${vo.recipeNum}" data-recipeCommentNum="${vo.recipeCommentNum}">신고</button>
				      </div>
				     </form>
				    </div>
				  </div>
				</div>
    
		    
		 </c:forEach>
		 
	</table>






<div class="page-box">
	${paging}
</div>


<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

// 댓글신고
$(function() {
	$(".btn-primary").click(function() {
		let recipeNum = $(this).attr("data-recipeNum");
		let recipeCommentNum = $(this).attr("data-recipeCommentNum");
		let replyreason = $("textarea[name=replyreason]").val();
		
		let url = "${pageContext.request.contextPath}/recipe/replynotify";
		let query = "recipeNum=" + recipeNum + "&recipeCommentNum=" + recipeCommentNum + "&replyreason=" + replyreason;
		
		const fn = function(data) {
			let state = data.state;
			if(state === "true"){
				location.href="${pageContext.request.contextPath}/recipe/article?page=1&recipeNum" + recipeNum;
			} else if(state === "false") {
				alert("신고 실패");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});

</script>

