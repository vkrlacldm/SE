<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; }

.reply-container { width: 100%; padding-top: 0; }
.replyList { width: 100%; margin: 0 auto; }
.reply-info { border-bottom: 1px solid #dee2e6; }
.tbodyReply > tr:nth-child(2n) {
	border-bottom: 1px solid #dee2e6;
}
.nickName { width: 100px; line-height: 38px; font-size: 15px; font-weight: 500; }
.regDate { width: auto; line-height: 38px; font-size: 15px; color: #aaa; font-weight: 300; }
.replyContent { padding-bottom: 17px!important; }
.deleteReply { margin-left: -60px; color: #aaa; cursor: pointer; }

.page-item.active .page-link { background-color: #f44502; border-color: #f44502; }
.page-link, .page-link:hover, .page-link:active { color: #f44502; }

</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div class="reply-container">	
	<div class="body-main">
		<div class="replyList">
			<c:if test="${replyCount != 0}">
				<div class='reply-info'>
					<span class='reply-count'>댓글 ${replyCount}개</span>
					<span>(${pageNo}/${total_page} 페이지)</span>
				</div>
		
				<table class='table table-borderless'>
					<tbody class="tbodyReply">
						<c:forEach var="vo" items="${listReply}">
							<tr>
								<td width='40%'>
									<div class='row reply-writer'>
										<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
										<div class='nickName'>${vo.userName}</div>
										<div class='regDate'>${vo.reg_date}</div>
									</div>
								</td>
								<td width='40%' align='left' class='align-middle'>
									<c:if test="${sessionScope.member.userId == vo.userId || sessionScope.member.role == 0}">
										<span class='deleteReply' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'><i class="bi bi-trash-fill"></i></span>
									</c:if>
								</td>
								<td width='20%' align='right'>
									<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요" ><i class="bi bi-hand-thumbs-up"></i> <span>${vo.likeCount}</span></button>
									<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="bi bi-hand-thumbs-down"></i> <span>${vo.disLikeCount}</span></button>	        
								</td>
							</tr>
							
							<tr>
								<td class="replyContent" colspan='3' valign='top'>${vo.replyContent}</td>
							</tr>
							
			
							
						</c:forEach>
					</tbody>
				</table>
				
				<div class="page-box">
					${paging}
				</div>
			</c:if>
		</div>
	</div>
</div>		
