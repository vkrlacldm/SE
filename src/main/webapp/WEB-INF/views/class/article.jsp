<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.clearFix:after { content: ''; display: block; clear: both; }
.lec-detail { position: relative; background: #f1f1f2; padding: 20px 0; }
.lec-detail a { text-decoration: none; }
.lec-detail * {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 0; margin: 0; box-sizing: border-box;
}
.lec-detail .full { width: 1320px; background: #fff; border: 1px solid #e6e7e8; padding: 0 30px 20px; margin: 15px auto 0; }
.lec-detail .full > h3 { font-weight: 700; margin: 20px 0; }

.lec-detail .classIntro { text-align: center; }
.lec-detail .classIntro .img-area { margin-top: 60px; }
.lec-detail .classIntro .user-info { position: relative; padding-bottom: 1px; }
.lec-detail .classIntro .user-info a { display: block; width: 120px; height: 120px; border-radius: 50%; padding: 5px; margin: -60px auto 5px; border: 5px solid rgba(255,255,255,0.7); }
.lec-detail .classIntro .user-info a img { width: 110px; height: 110px; border-radius: 50%; margin: -5px;}
.lec-detail .classIntro .user-info span { font-size: 15px; }
.lec-detail .classIntro .text-area .classTitle { font-size: 34px; margin: 20px 0; }
.lec-detail .classIntro .text-area .classPrice { font-size: 34px; border-bottom: 1px solid #e3e3e3; padding-bottom: 20px; }
.lec-detail .classIntro .text-area .classPrice span { font-size: 17px; }
.lec-detail .classIntro .text-area .info { text-align: right; margin: 8px 0 20px; }
.lec-detail .classIntro .text-area .info span { font-size: 16px; color: #AAA; margin-left: 25px; }
.lec-detail .classIntro .text-area .classSummary span { font-size: 20px; margin: 0 50px; }
.lec-detail .classIntro .text-area .classPayment { margin-top: 35px; }
.lec-detail .classIntro .text-area .classPayment .payBtn { display: inline-block; width: 550px; height: 60px; font-size: 24px; font-weight: 700; line-height: 58px; background: #77b347; color: #fff; }
.lec-detail .classIntro .text-area .classPayment .classLike { display: inline-block; width: 55px; vertical-align: top; margin-left: 50px; }
.lec-detail .classIntro .text-area .classPayment .classLike img { width: 100%; }

.lec-detail .classDetail figure.image { width: 900px; margin: 0 auto; }
.lec-detail .classDetail figure.image img { width: 100%; }

.lec-detail .curriculum .video-title { display: inline-block; width: 600px; font-size: 17px; border-top: 1px solid #ddd; border-left: 1px solid #ddd; border-bottom: 1px solid #ddd; border-radius: 8px; padding: 20px 0 20px 16px; margin-bottom: 15px; }
.lec-detail .curriculum .video-list:last-child .video-title { margin-bottom: 0; }
.lec-detail .curriculum .video-title span { font-size: 14px; color: #999; }
.lec-detail .curriculum .video-btn { position: relative; display: inline-block; width: 200px; font-size: 17px; text-align: center; border: 1px solid #ddd; border-radius: 8px; padding: 20px 0; margin-left: -3px; }
.lec-detail .curriculum .video-btn button { border: none; background: transparent; }
.lec-detail .curriculum .video-btn button i { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 35px; color: #73b142;}

.lec-detail .review form * { display: inline-block; }
.lec-detail .review .addPhoto { cursor: pointer; vertical-align: top; }
.lec-detail .review textarea { resize: none; width: 700px; height: 140px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; padding: 10px 12px; margin-left: 10px; }
.lec-detail .review button { width: 140px; height: 140px; font-size: 20px; vertical-align: top; border: 1px solid #ccc; border-left: none; border-radius: 4px; background: transparent; margin-left: -3px; }
.lec-detail .reviewBody { width: 1000px; margin: 30px auto; }
.lec-detail .reviewInfo * { font-size: 20px; border: 1px solid #ccc; border-radius: 4px; border-bottom: none; padding: 6px 50px; }
.lec-detail .reviewInfo span:first-child { border-right: none; }
.lec-detail .reviewInfo span:last-child { display: inline-block; width: 140px; text-align: center; color: #cead00; padding: 6px 10px; }
.lec-detail .reviewDetail { margin-bottom: 20px; }
.lec-detail .reviewDetail p { font-size: 16px; border: 1px solid #ccc; border-radius: 4px; padding: 10px 14px; }

.lec-detail .classQna form * { display: inline-block; }
.lec-detail .classQna form input { width: 620px; font-size: 16px; border: 1px solid #ccc; border-bottom: none; border-radius: 4px; padding: 10px 12px; margin: 0 0 -1px 131px; }
.lec-detail .classQna form .radio-area { border: 1px solid #ccc; border-radius: 4px; border-left: none; border-bottom: none; padding: 13px 11px 8px 6px; margin: 0px 0 0 -4px; }
.lec-detail .classQna form .radio-area * { width: 52px; vertical-align: middle; margin: 0; }
.lec-detail .classQna form textarea { resize: none; width: 854px; height: 140px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; padding: 10px 12px; margin-left: 131px; }
.lec-detail .classQna form button { width: 140px; height: 185px; font-size: 20px; vertical-align: top; border: 1px solid #ccc; border-left: none; border-radius: 4px; background: transparent; margin: -44px 0 0 -3px; }
.lec-detail .qnaBoard { width: 1000px; margin: 30px auto 15px; }
.lec-detail .qnaBoard .qnaList { width: 100%; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; }
.lec-detail .qnaBoard .qnaList span:nth-child(2) { width: 600px; }
.lec-detail .qnaBoard .qnaList span:nth-child(3),
.lec-detail .qnaBoard .qnaList span:last-child { width: 120px; }
.lec-detail .qnaBoard .qnaInfo span:nth-child(2) { width: 600px; }
.lec-detail .qnaBoard .qnaInfo span:nth-child(3),
.lec-detail .qnaBoard .qnaInfo span:last-child { width: 120px; }
.lec-detail .qnaBoard .qnaList span,
.lec-detail .qnaBoard .qnaBody span { display: inline-block; text-align: center; padding: 12px 15px; }
.lec-detail .qnaBoard .showMore { cursor: pointer; }
.lec-detail .qnaBoard .showMore:hover { color: #f44502; }
.lec-detail .qnaBoard .question { display: none; border-top: 1px dashed #ccc; }
.lec-detail .qnaBoard .question.active { display: block; }
.lec-detail .qnaBoard .answer { display: none; border-bottom: 2px dashed #ccc; }
.lec-detail .qnaBoard .answer.active { display: block; }
.lec-detail .qnaBoard .question span { border-bottom: 1px dashed #ccc; }
.lec-detail .qnaBoard .question span:first-child,
.lec-detail .qnaBoard .answer span:first-child { width: 150px; border-right: 1px dashed #ccc; }
.lec-detail .qnaBoard .deleteQ { cursor: pointer; }
.lec-detail .qnaBoard form[name="qnaAnswer"] { display: inline-block; }
.lec-detail .qnaBoard form[name="qnaAnswer"] textarea { width: 695px; vertical-align: bottom; margin: 14px 0 0 10px; }
.lec-detail .qnaBoard form[name="qnaAnswer"] button { height: 140px; vertical-align: bottom; }

#popup-preview, #popup-video { display: none; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); z-index: 2; }
#popup-preview > div , #popup-video > div { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 1000px; height: 500px; }
#popup-preview video, #popup-video video { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 900px; height: 500px; }
#popup-preview #closeBtn, #popup-video #closeBtn { position: absolute; top: -15px; right: 0; font-size: 40px; color: #fff; border: none; background: transparent; }

.lec-detail .review-page-box { text-align: center; margin: 30px 0; }
.lec-detail .page-box { margin: 30px 0; }
.lec-detail .page-link { padding: 0.375rem 0.75rem; }
.page-item.active .page-link { background-color: #f44502; border-color: #f44502; }
.page-link, .page-link:hover, .page-link:active { color: #f44502; }
</style>

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

$(function() {
	$(".classLike").click(function(){
		let userClassLike = "${userClassLike}";
		
		let url = "${pageContext.request.contextPath}/class/insertClassLike";
		let classCode = "${dto.classCode}";
		let query = "classCode=" + classCode + "&userClassLike=" + userClassLike;
		
		const fn = function(data) {
			let state = data.state;
			if(state === "true") {
				location.href="${pageContext.request.contextPath}/class/article?${query}&classCode=${dto.classCode}";
			} else if(state === "false") {
				alert("찜하기 실패");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	reviewPage(1);
});

function reviewPage(page) {
	let url = "${pageContext.request.contextPath}/class/reviewList";
	let query = "pageNo=" + page + "&classCode=${dto.classCode}";
	
	const fn = function(data) {
		printReview(data);
	};
	ajaxFun(url, "get", query, "json", fn);
}

function printReview(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let paging = data.paging;
	
	console.log(data.list);
	console.log(dataCount);
	
	let out = "";
	for(let idx = 0; idx < data.list.length; idx++) {
		let userId = data.list[idx].userId;
		let nickname = data.list[idx].nickname;
		let content = data.list[idx].reviewContent;
		let stars = data.list[idx].reviewStar;
		
		out += "<div class='reviewInfo'>";
		out += "	<span>"+ nickname + "</span>";
		if(stars == "5") {
			out += "<span>★★★★★</span>";	
		} else if(stars == "4") {
			out += "<span>★★★★</span>";
		} else if(stars == "3") {
			out += "<span>★★★</span>";
		} else if(stars == "2") {
			out += "<span>★★</span>";
		} else {
			out += "<span>★</span>";
		}
		out += "</div>";
		out += "<div class='reviewDetail'>";
		out += "	<p>" + content + "</p>";
		out += "</div>";
	}
	$(".reviewBody").html(out);
	
	out = dataCount == 0 ? '등록된 리뷰가 없습니다.' : paging;
	$(".review-page-box").html(out);
}

$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/class/qnaList";
	let query = "pageNo=" + page + "&classCode=${dto.classCode}";
	
	const fn = function(data) {
		printQna(data);
	};
	ajaxFun(url, "get", query, "json", fn);
}

function printQna(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let paging = data.paging;
	
	let out = "";
	for(let idx = 0; idx < data.list.length; idx++) {
		let classQNum = data.list[idx].classQNum;
		let userId = data.list[idx].userId;
		let privacy = data.list[idx].privacy;
		let nickname = data.list[idx].nickname;
		let subject = data.list[idx].subject;
		let regDate = data.list[idx].regDate;
		let answerDate = data.list[idx].answerDate;
		let content = data.list[idx].classQContent;
		let answer = data.list[idx].answer;
		
		out += "<div class='qnaInfo'>";
		if(privacy === 1) {
			if('${sessionScope.member.userId}' == userId || '${sessionScope.member.userId}' == '${dto.userId}') {
				out += "	<span style='width:150px;'>" + nickname + "</span>";
				out += "	<span class='showMore'>" + subject + "</span>";
				out += "	<span>" + regDate + "</span>";		
				if(! answerDate) {
					out += "<span>답변대기</span>";
				} else {
					out += "<span>" + answerDate + "</span>";
				}
				out += "</div>";
				out += "<div class='question'>";
				out += "	<span style='width:150px;'>질문내용</span>";
				if('${sessionScope.member.userId}' == userId) {
					out += "	<span style='width:799px;'>" + content + "</span>";
					out += "	<span class='deleteQ'><i class='bi bi-trash'></i></span>";
				} else {
					out += "	<span style='width:840px;'>" + content + "</span>";
				}
				out += "</div>";
				out += "<div class='answer' data-num='" + classQNum + "'>";
				if(! answer) {
					if('${sessionScope.member.userId}' == '${dto.userId}') {
						out += "<span style='width:150px; height:168px; vertical-align:top;'>답변내용</span>";
						out += "<form name='qnaAnswer' method='post'>";
						out += "	<textarea name='answer' id='answer' placeholder='답변을 입력해주세요.'></textarea>";
						out += "	<button type='button' class='answerSend'>등록</button>";
						out += "</form>";
					} else {
						out += "	<span style='width:150px;'>답변내용</span>";
						out += "<span style='width:840px;'>답변대기</span>";
					}
				} else {
					out += "	<span style='width:150px;'>답변내용</span>";
					out += "	<span style='width:840px;'>" + answer + "</span>";
				}
				out += "</div>";				
			} else {
				out += "<div class='qnaInfo'>"
				out += "<span style='width:150px;'>" + nickname + "</span>";
				out += "<span style='width:840px;'>비공개 질문입니다.</span>";
				out += "</div>";
			}
		} else {
			out += "	<span style='width:150px;'>" + nickname + "</span>";
			out += "	<span class='showMore'>" + subject + "</span>";
			out += "	<span>" + regDate + "</span>";
			if(! answerDate) {
				out += "<span>답변대기</span>";
			} else {
				out += "<span>" + answerDate + "</span>";
			}
			out += "</div>";
			out += "<div class='question'>";
			out += "	<span style='width:150px;'>질문내용</span>";
			if('${sessionScope.member.userId}' == userId) {
				out += "	<span style='width:799px;'>" + content + "</span>";
				out += "	<span class='deleteQ'><i class='bi bi-trash'></i></span>";
			} else {
				out += "	<span style='width:840px;'>" + content + "</span>";
			}
			out += "</div>";
			out += "<div class='answer' data-num='" + classQNum + "'>";
			if(! answer) {
				if('${sessionScope.member.userId}' == '${dto.userId}') {
					out += "<span style='width:150px; height:168px; vertical-align:top;'>답변내용</span>";
					out += "<form name='qnaAnswer' method='post'>";
					out += "	<textarea name='answer' id='answer' placeholder='답변을 입력해주세요.'></textarea>";
					out += "	<button type='button' class='answerSend'>등록</button>";
					out += "</form>";
				} else {
					out += "<span style='width:150px;'>답변내용</span>";
					out += "<span style='width:840px;'>답변대기</span>";
				}
			} else {
				out += "<span style='width:150px;'>답변내용</span>";
				out += "	<span style='width:840px;'>" + answer + "</span>";
			}
			out += "</div>";
		}
	}
	
	$(".qnaBody").html(out);
	
	out = dataCount == 0 ? '등록된 Q&A 가 없습니다.' : paging;
	$(".page-box").html(out);
}

$(function(){
	$(".qnaSend").click(function(){
		let subject = $("#classQSubject").val().trim();
		let content = $("#classQContent").val().trim();
		let privacy = $("input[name='privacy']:checked").val();
		if(! subject) {
			$("#classQSubject").focus();
			return false;
		}
		if(! content) {
			$("#classQContent").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/class/qnaInsert";
		let query = "classCode=${dto.classCode}&privacy=" + privacy + "&subject=" + encodeURIComponent(subject) + "&classQContent=" + encodeURIComponent(content);
		const fn = function(data) {
			$("#classQSubject").val("");
			$("#classQContent").val("");
			$(".qnaBody").empty();
			listPage(1);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	$(document).on("click", ".answerSend", function(){
		let answer = $("#answer").val().trim();
		let qNum = $(this).parent().parent().attr('data-num');
		let pageNo = $(".active .page-link").text();

		if(! answer) {
			$("#answer").focus();
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/class/insertAnswer";
		let query = "classCode=${dto.classCode}&classQNum=" + qNum + "&answer=" + encodeURIComponent(answer);
		const fn = function(data) {
			$("#answer").val("");
			$(".qnaBody").empty();
			listPage(pageNo);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	$(document).on("click", ".deleteQ", function(){
		if(! confirm("질문을 삭제하시겠습니까 ? ")) {
			return false;
		}
		
		let classQNum = $(this).parent().next().attr('data-num');
		let pageNo = $(".active .page-link").text();
		
		let url = "${pageContext.request.contextPath}/class/deleteQuestion";
		let query = "classQNum=" + classQNum;
		
		const fn = function(data) {
			listPage(pageNo);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

</script>

<div class="lec-detail">
	<div class="full classIntro">
		<div class="img-area">
			<img src="${pageContext.request.contextPath}/uploads/class/${dto.imageFileName}">
			<div class="user-info">
				<a href="${pageContext.request.contextPath}/mypage/main?userId=${dto.userId}">
					<img src="${pageContext.request.contextPath}/resources/images/class-profile-dummy.png">
				</a>
				<span>${dto.nickname}</span>
			</div>
		</div>
		<div class="text-area">
			<p class="classTitle">${dto.classSubject}</p>
			<p class="classPrice">
				<fmt:formatNumber value="${dto.price}" groupingUsed="true"/><span>원</span>
			</p>
			<div class="info">
				<span>조회수 ${dto.classHitcount}</span>
				<span>작성일 ${dto.classReg_date}</span>
			</div>
			<div class="classSummary">
				<span>${dto.serving}인분</span>
				<span>강의시간 ${dto.videoTime}분</span>
			</div>
			<div class="classPayment">
				<a href="${pageContext.request.contextPath}/payment/pay?classCode=${dto.classCode}" class="payBtn">결제</a>
				<a href="#" class="classLike">
					<c:choose>
						<c:when test="${userClassLike == false}">
							<img src="${pageContext.request.contextPath}/resources/images/heart1.png">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/images/heart2.png">
						</c:otherwise>
					</c:choose>
				</a>
			</div>
		</div>
	</div>
	 
	<div class="full classDetail">
		<h3>클래스 상세정보</h3>
		${dto.classContent}
	</div>
	
	<div class="full curriculum">
		<h3>커리큘럼</h3>
		<div class="video-list">
			<div class="video-title">미리보기 영상 <span>/ 01분</span></div>
			<div class="video-btn">
				<button type="button" id="showPreview">무료보기</button>
			</div>
		</div>
		<div class="video-list">
			<div class="video-title">${dto.classSubject} <span>/ ${dto.videoTime}분</span></div>
			<div class="video-btn">
				<button type="button" id="showClass"><i class="bi bi-play-fill"></i></button>
			</div>
		</div>
	</div>
	
	<div class="full review">
		<h3>클래스 리뷰</h3>
		<div class="reviewBody">
		</div>
		<div class="review-page-box">
		</div>
	</div>
	
	<div class="full classQna">
		<h3>클래스 QnA</h3>
		<form name="qnaForm" method="post">
			<input type="text" name="classQSubject" placeholder="제목" id="classQSubject">
			<div class="radio-area">
				<input type="radio" name="privacy" id="privacy1" value="0" checked="checked">
				<label for="privacy1">공개</label>
				<input type="radio" name="privacy" id="privacy2" value="1">
				<label for="privacy1">비공개</label>
			</div>
			<textarea placeholder="클래스에 관한 질문을 남겨주세요." name="classQContent" id="classQContent"></textarea>
			<button type="button" class="qnaSend">등록</button>
		</form>
		<div class="qnaBoard">
			<div class="qnaList">
				<span style="width: 150px;">작성자</span>
				<span>클래스 QnA 제목</span>
				<span>질문일자</span>
				<span>답변일자</span>
			</div>
	
			<div class="qnaBody">
			</div>
	
			<div class="page-box">
			</div>
		</div>
	</div>
	
	<div id="popup-preview">
		<div>
			<video controls id="pop-video" src="${pageContext.request.contextPath}/uploads/class/${dto.previewFileName}"></video>
			<button type="button" id="closeBtn"><i class="bi bi-x-lg"></i></button>
		</div>
	</div>
	<div id="popup-video">
		<div>
			<video controls id="pop-video" src="${pageContext.request.contextPath}/uploads/class/${dto.videoFileName}"></video>
			<button type="button" id="closeBtn"><i class="bi bi-x-lg"></i></button>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#showPreview').click(function(){
		$('#popup-preview').css('display','block');
	});
	$('#popup-preview #closeBtn').click(function(){
		$('#popup-preview').find('video').get(0).pause();
		$('#popup-preview').css('display','none');	
	});
	
	$('#showClass').click(function(){
		$("#popup-video").css('display','block');
	});
	$('#popup-video #closeBtn').click(function(){
		$('#popup-video').find('video').get(0).pause();
		$('#popup-video').css('display','none');	
	});
	
	$(document).on("click", ".showMore", function(){
		$(this).parent().next().toggleClass('active');
		$(this).parent().next().next().toggleClass('active');
	});
});
</script>
