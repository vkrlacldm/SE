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

<div class="container">
	<div class="body-container">	
		<div class="body-main">
			<p> 게시글 상세 </p>
			<div class="reply">
				<div class='reply-info'>
				<span class='reply-count'>댓글 0개</span>
				<span>[목록, 0/0 페이지]</span>
			</div>
			
			<table class='table table-borderless'>
				
					<tr class='border bg-light'>
						<td width='50%'>
							<div class='row reply-writer'>
								<div class='col-1'><i class='bi bi-person-circle text-muted icon'></i></div>
								<div class='col-auto align-self-center'>
									<div class='name'>user</div>
									<div class='date'>2022-06-05</div>
								</div>
							</div>
						</td>
						<td width='50%' align='right' class='align-middle'>
							<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
							<div class="reply-menu">
								
									
								
							</div>
						</td>
					</tr>
					<tr>
						<td colspan='2' valign='top'>요리조리</td>
					</tr>
			
					<tr>
						<td>
							<button type='button' class='btn btn-light btnReplyAnswerLayout' data-replyNum=''>답글 <span id="answerCount"></span></button>
						</td>
						<td align='right'>
							<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='' data-replyLike='1' title="좋아요"><i class="bi bi-hand-thumbs-up"></i> <span></span></button>
							<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='' data-replyLike='0' title="싫어요"><i class="bi bi-hand-thumbs-down"></i> <span></span></button>	        
						</td>
					</tr>
				
				    <tr class='reply-answer'>
				        <td colspan='2'>
				        	<div class='border rounded'>
					            <div id='listReplyAnswer' class='answer-list'></div>
					            <div>
					                <textarea class="form-control m-2"></textarea>
					            </div>
								<div class='text-end pe-2 pb-1'>
									<button type='button' class='btn btn-light btnSendReplyAnswer' data-replyNum=''>답글 등록</button>
					            </div>
				            </div>
						</td>
				    </tr>
				    
			</table>
			
			
			<div class="page-box">
				0 1 2
			</div>
			</div>
		</div>
	</div>
</div>		
