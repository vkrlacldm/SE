<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function NotifyOkAnswer() {
	alert("신고가 완료되었습니다.");
}


</script>


<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='row reply-writer'>
					<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
					<div class='col ms-2 align-self-center'>
						<div class='name'>${vo.nickName}</div>
						<div class='date'>${vo.commentReg_date}</div>
					</div>
				</div>
			</div>
			<div class='col align-self-center text-end'>
				<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
				<div class='reply-menu'>
					<c:choose>
						<c:when test="${sessionScope.member.userId==vo.userId}">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.recipeCommentNum}' data-answer='${vo.parentCommentNum}'>삭제</div>
							<div class='hideReplyAnswer reply-menu-item'>숨김</div>
						</c:when>
						<c:when test="${sessionScope.member.role==0 }">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.recipeCommentNum}' data-answer='${vo.parentCommentNum}'>삭제</div>
							<div class='hideReply reply-menu-item'>숨김</div>
						</c:when>
						<c:otherwise>
							<div class='notifyReplyAnswer reply-menu-item' data-bs-toggle="modal" data-bs-target="#exampleModal2">신고</div>
							<div class='hideReply reply-menu-item'>숨김</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class='p-2'>
			${vo.commentContent}
		</div>
	</div>
	
	 <!-- Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	      
       <h5 class="modal-title" id="exampleModalLabel">대댓글 신고</h5>
       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form name="recipeReplyAnswerNotify">
		      <div class="modal-body">
		        <p> 닉네임 : ${vo.nickName} </p>
		        <p> 댓글 내용 : ${vo.commentContent} </p>
		        <p> 신고사유 </p>
		        <textarea rows="7" cols="63" name ="reason"></textarea>
		        <input type="hidden" name="recipeNum" value="">
				<input type="hidden" name="recipeCommentNum" value="">
		      </div>
	      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="NotifyOkAnswer();">신고</button>
		      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
</c:forEach>
