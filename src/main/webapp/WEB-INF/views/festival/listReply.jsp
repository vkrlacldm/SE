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
.reply-writer .col-1 { padding: 0; width: 47px; height: 47px; }
.reply-writer .col-1 img { width: 100%; height: 100%; border-radius: 9999px; border: 1px solid #ededed; }
.nickName { width: auto; line-height: 43px; font-size: 15px; font-weight: 500; cursor: pointer; }
.regDate { width: auto; line-height: 43px; font-size: 15px; color: #aaa; font-weight: 300; }
.replyContent { padding-bottom: 17px!important; }
.reply-delete { margin: 0 10px; color: #aaa; cursor: pointer; }

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
								<td width='50%'>
									<div class='row reply-writer'>
										<div class='col-1'>
											<c:choose>
												<c:when test="${vo.userImageName ne NULL}">
													<img src="${pageContext.request.contextPath}/uploads/photo/${vo.userImageName}">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/images/profileImage.png">
												</c:otherwise>
											</c:choose>
										</div>
										<div class='nickName' onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${vo.userId}'">${vo.nickName}</div>
										<div class='regDate'>${vo.reg_date}</div>
									</div>
								</td>
								<td width='50%' align='right' class='align-middle'>
									<c:if test="${sessionScope.member.userId == vo.userId || sessionScope.member.role == 0}">
										<span class='reply-delete' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'><i class="bi bi-trash-fill"></i></span>
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="replyContent" colspan='2' valign='top'>${vo.content}</td>
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
