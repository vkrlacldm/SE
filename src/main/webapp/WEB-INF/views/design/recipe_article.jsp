<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main {
	background-color: #f7f8fb;
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000; letter-spacing: -0.03em;
}

.container { padding: 60px 0; }

.recipe-title { 
	position: relative; width: 100%; margin-bottom: 30px;
	text-align: center; font-size: 40px; font-weight: 700;
}

.recipe-container { 
	background-color: #fff; border-radius: 24px; position: relative;
	width: 95%; padding: 50px 20px; box-sizing: border-box; margin: 0 auto 20px auto;
}

.info {
	display: flex; justify-content: center; padding: 0; margin: 0 auto 20px auto;
    position: relative; width: 100%; font-size: 16px; color: #666;
}

.info li { list-style: none; position: relative; margin-right: 20px; padding-right: 20px; }
.info li:last-child { margin-right: 0; padding-right: 0; }

.icon-container { display: flex; }

.ai {
	display: block; position: relative; width: 48px; height: 48px;
    border-radius: 9999px; border: 1px solid #dddddd;
}
.ai:hover, .ai:active { text-decoration: none; color: #333; }

.ai-like { font-size: 27px; padding: 12px 11px 9px 9px; margin: 20px 20px 0 auto; }
.ai-link { font-size: 35px; padding: 6px; margin: 20px auto 0 20px;}

a > i { display: flex; }

.finished { margin-top: 40px; margin-bottom: 100px; }
.finishedImage { width: 100% }

.recipe-icon { color: #666; text-align: center; display: flex; }
.recipe-info { color: #666; text-align: center; display: flex; padding-top: 5px; }
.recipe-icon i { font-size: 35px; margin: 0 auto; }
.recipe-info span { font-size: 20px; margin: 0 auto; display: inline-block; width: 32%; }

.recipe-ingredient { display: flex; font-size: 20px; margin-top: 70px; margin-bottom: 70px; }
.recipe-ingredient > div { width: 49%; color: #333; font-weight: 500; }
.recipe-ingredient > div > span { padding-left: 40px; }
.recipe-ingredient > div > span > i { color: #f44502; }
.recipe-ingredient > div > ul { list-style: none; color: #666; font-weight: 300; }
.recipe-ingredient > div > ul > li { border-bottom: 1px solid #ececec; padding: 10px 6px; margin: 0 35px; }

.recipe-detail > span { font-size: 37px; font-weight: 700; }
.recipe-detail > span > i { color: #f44502; }

.writer-container {
	display: flex; width: 95%; margin: 0 auto 60px auto; background-color: #fff;
	padding: 25px; border-radius: 24px; height: 170px;
}
.writer-image { width: 120px; margin-left: 20px; }
.profileImage { width: 100%; border-radius: 9999px; }
.writer-nickName { line-height: 120px; margin-left: 50px; font-size: 25px; font-weight: 600; }
.writer:hover, .writer:active { text-decoration: none; color: #f44502 }

.prev-next { display: flex; width: 95%; margin: 0 auto; }
.prev, .list, .next { width: 33.3%; }
.prev, .next { display: flex; line-height: 49px; }
.prev > .prev-subject, .next > .next-subject { padding: 0 20px; font-size: 15px; font-weight: 300; }
.prev > .prev-subject:hover, .next > .next-subject:hover { text-decoration: none; color: #333; }
.next > .next-subject { width: 100%; text-align: right; }
.list { text-align: center; display: flex; justify-content: center; }

.ai-left, .ai-right { font-size: 20px; padding: 13px; }

.btn-list {
	color: #ffffff; background-color: #f44502; font-size: 14px;
	border-radius: 9999px; padding: 13px 40px; margin: 0 10px;
}
.btn-white {
	color: #f44502; background-color: #ffffff; font-size: 14px;
	border-radius: 9999px; padding: 13px 30px; border: 1px solid #f44502;
}

.reply { width: 85%; margin: 100px auto; }
.reply-form .form-control { height: 100px; }
.reply-desc { font-size: 13px; color: #666666; }

.reply-form .btnReply { border-color: #333; padding: 6px 12px; font-weight: 500; border-radius: 0; }
.reply-form .btnReply:hover, .reply-form .btnReply:active  { background-color: #333; color: #fff; }

.editor { color: #333; font-size: 20px; font-weight: 300; width: 90%; margin: 50px auto 0 auto; }
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) { border: none; }

</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">

</script>

<div class="container">
	<div class="recipe-title">
		연어 샐러드
	</div>
	<div class="recipe-container">
		<ul class="info">
			<li>작성자&nbsp;&nbsp;&nbsp;&nbsp;김쉐프</li>
			<li>등록일&nbsp;&nbsp;&nbsp;&nbsp;2000.10.10</li>
			<li>조회수&nbsp;&nbsp;&nbsp;&nbsp;100</li>
		</ul>
		<div class="icon-container">
			<a class="ai ai-like"><i class="bi bi-heart"></i></a>
			<a class="ai ai-link"><i class="bi bi-link-45deg"></i></a>
		</div>
		
		<div class="finished">
			<img class="finishedImage" src="${pageContext.request.contextPath}/resources/images/salad.jpg">
		</div>
		
		<div class="recipe-icon">
			<i class="bi bi-people-fill"></i>
			<i class="bi bi-clock-fill"></i>
			<i class="bi bi-bar-chart-fill"></i>
		</div>
		<div class="recipe-info">
			<span>1인분</span>
			<span>30분</span>
			<span>난이도 상</span>
		</div>
		
		<div class="recipe-ingredient">
			<div>
				<span><i class="bi bi-record"></i>&nbsp;&nbsp;재료</span>
				<ul>
					<li>연어</li>
					<li>오이</li>
					<li>토마토</li>
				</ul>
			</div>
			<div>
				<span><i class="bi bi-record"></i>&nbsp;&nbsp;양념</span>
				<ul>
					<li>소금</li>
					<li>후추</li>
				</ul>
			</div>
		</div>
		
		<div class="recipe-detail">
			<span><i class="bi bi-circle-fill"></i>&nbsp;&nbsp;조리법</span>
			<div class="editor">
				${dto.content}
			</div>
		</div>
	</div>
	
	<div class="writer-container">
		<div class="writer-image">
			<img class="profileImage" src="${pageContext.request.contextPath}/resources/images/profileImage.png">
		</div>
		<div class="writer-nickName">
			<a class="writer">김쉐프</a>
		</div>
	</div>
	
	<div class="prev-next">
		<div class="prev">
			<a class="ai ai-left"><i class="bi bi-chevron-left"></i></a>
			<a class="prev-subject">딸기롤케이크</a>
		</div>
		<div class="list">
			<button class="btn btn-white" type="button">수정</button>
			<button class="btn btn-list" type="button">목록</button>
			<button class="btn btn-white" type="button">삭제</button>
		</div>
		<div class="next">
			<a class="next-subject">수박계란말이</a>
			<a class="ai ai-right"><i class="bi bi-chevron-right"></i></a>
		</div>
	</div>
		    
			
	<div class="reply">
		<form name="replyForm" method="post">	
			<table class="table table-borderless reply-form">
				<tr>
					<td colspan="2">
						<textarea class='form-control' name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<p class="reply-desc">* 욕설, 상업적인 내용, 특정인이나 특정 종교 및 특정사안을 비방하는 내용 등은 예고 없이 삭제될 수 있습니다.</p>
					</td>
					<td align='right'>
						<button type='button' class='btn btnReply'>댓글 달기</button>
					</td>
				</tr>
			</table>
		</form>
				
		<div id="listReply"></div>
	</div>
</div>