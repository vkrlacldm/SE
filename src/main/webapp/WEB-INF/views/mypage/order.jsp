<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #fff; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; }
.mypage { background: #fff; width: 1000px; margin: 0 auto; }

.nav-mypage { display: flex; padding: 15px 25px; border-bottom: 2px solid #383d4a; }
.mypage-subject { width: 100%; text-align: center; padding-right: 42px; font-size: 20px; line-height: 38px; }

.order-list { margin: 0 0 30px 0; padding: 0; list-style: none; }
.order { padding-bottom: 14px; position: relative; border-bottom: 1px solid #f2f2f2; }
.order:last-child { border-bottom: 1px solid #dbdbdb; }
.box { display: table; width: 100%; table-layout: fixed; padding: 24px 0 10px; }
.order-img { display: table-cell; width: 110px; vertical-align: top; }
.order-img a { display: block; position: relative; }
.order-img img { vertical-align: top; width: 110px; height: 110px; }
.order-info { display: table-cell; padding: 7px 40px 0 16px; vertical-align: top; width: 756px; }
.order-info p { font-size: 13px; line-height: 17px; color: #959595; margin: 0; padding: 0; }
.order-info a { overflow: hidden; text-overflow: ellipsis; line-height: 17px; white-space: nowrap; display: block; margin-top: 9px; font-size: 14px; color: #666; }
.order-info a:hover, .order-info a:active { text-decoration: none; color: #0095f6 }
.order-btn { display: table-cell; vertical-align: middle; width: 134px; padding-right: 15px; }
.order-btn button { display: block; width: 100%; border: 1px solid #0095f6; font-size: 12px; line-height: 24px; color: #0095f6; background-color: #fff; text-align: center; }
.order-btn button:first-child { margin-bottom: 4px; }
.order-btn .btn-reviewed { border: 1px solid #aaa; color: #aaa; }

.page-item.active .page-link { background-color: #0095f6; border-color: #0095f6; }
.page-link, .page-link:hover, .page-link:active { color: #0095f6; }

.offcanvas-title { cursor: pointer; }
.offcanvas-title:hover, .offcanvas-title:active { color: #0d6efd; }
.offcanvas-start { width: 300px; border-right: none; }
.offcanvas-backdrop.show { opacity: .1; }

.accordion-button { padding: 10px 15px; font-size: 14px; }
.accordion-button:not(.collapsed) { color: #212529; }
.accordion-button:focus { box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%); }
.accordion-body { display: grid; padding: 10px 20px; }
.accordion-body > a { padding: 5px 0; text-decoration: none; font-size: 13px; }
.accordion-body > a:hover, a:active { color: #0d6efd; }
.btn-primary { padding: 3px 10px; font-size: 20px; background-color: #0095f6; border-color: #0095f6; }
.btn-primary:focus, .btn-primary:hover { background-color: #0095f6; border-color: #0095f6; box-shadow: 0 0 0 0; }
.modal-footer > .btn-primary { font-size: 1rem; padding: .375rem .75rem; }

.star-rating { 
	display: flex; flex-direction: row-reverse; font-size: 2.25rem; line-height: 2.5rem; 
	justify-content: space-around; padding: 0 0.2em; text-align: center; width: 5em; margin-left: 143px;
}
.star-rating input {
  display: none;
}
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>

<script type="text/javascript">
function reviewOk() {
	const f = document.reviewForm;
	
   	f.action = "${pageContext.request.contextPath}/mypage/review";
    f.submit();
}

function mark(star) {
	f.star.value = star;
}

$(function(){
	$("body").on("click", ".btn-review", function(){
		let classCode = $(this).attr("data-class");
		let orderCode = $(this).attr("data-order");

		$('#classCode').val(classCode);
		$('#orderCode').val(orderCode);
	});
});
</script>

<div class="mypage">
	<div class="nav-mypage">
		<div class="btn-menu">
			<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">
				<i class="bi bi-list"></i>
			</button>
		</div>
		<div class="mypage-subject">
			주문 내역
		</div>
	</div>

	<ul class="order-list">
		<c:choose>
			<c:when test="${list.size() != 0}">
				<c:forEach var="dto" items="${list}">
					<li class="order">
						<div class="box">
							<div class="order-img">
								<a href="${articleUrl}&classCode=${dto.classCode}">
									<c:choose>
										<c:when test="${dto.classPhotoName ne NULL}">
											<img src="${pageContext.request.contextPath}/uploads/class/${dto.classPhotoName}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/rank1.jpg">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="order-info">
								<p>구매일자 : ${dto.orderRegDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제금액 : ${dto.price}원</p>
								<a href="${articleUrl}&classCode=${dto.classCode}">${dto.classSubject}</a>
							</div>
							<div class="order-btn">
								<c:choose>
									<c:when test="${dto.reviewed == 1}">
										<button type="button" class="btn-reviewed" disabled="disabled">리뷰완료</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn-review" data-bs-toggle="modal" data-bs-target="#exampleModal" data-order="${dto.orderCode}" data-class="${dto.classCode}">리뷰쓰기</button>
									</c:otherwise>
								</c:choose>
								<button type="button">환불하기</button>
							</div>
						</div>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div style="padding: 50px 0; text-align: center;">주문한 클래스가 없습니다.</div>
			</c:otherwise>
		</c:choose>
	</ul>
	
	<div class="page-box">
		${paging}
	</div>
	
	<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel"  onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${sessionScope.member.userId}'">마이페이지</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		
		<div class="offcanvas-body">
	    	<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				      		내 정보
				    	</button>
				  	</h2>
				  	<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				    	<div class="accordion-body">
				      		<a href="${pageContext.request.contextPath}/member/pwd">회원정보수정</a>
				      		<a href="${pageContext.request.contextPath}/member/pwd?dropout">회원탈퇴</a>
				    	</div>
				  	</div>
				</div>
				<div class="accordion-item">
				  	<h2 class="accordion-header" id="headingTwo">
				    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				      		내 관심사
				    	</button>
				  	</h2>
				  	<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				    	<div class="accordion-body">
				      		<a href="${pageContext.request.contextPath}/mypage/like">내가 좋아요한 레시피</a>
				      		<a href="${pageContext.request.contextPath}/mypage/wish">내가 찜한 클래스</a>
				      		<a href="${pageContext.request.contextPath}/mypage/favorite">내가 관심 등록한 축제</a>
				      	</div>
				  	</div>
				</div>
				<div class="accordion-item">
				  	<h2 class="accordion-header" id="headingThree">
				    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				      		클래스
				    	</button>
				  	</h2>
				  	<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				    	<div class="accordion-body">
				    		<a href="${pageContext.request.contextPath}/mypage/order">주문 내역</a>
				    		<a href="${pageContext.request.contextPath}/mypage/refund">환불 내역</a>
				      		
				      		<a href="${pageContext.request.contextPath}/mypage/sell">판매 내역</a>
				      		
				      	</div>
				    </div>
				</div>
				<div class="accordion-item">
				  	<h2 class="accordion-header" id="headingFour">
				    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
				      		이벤트
				    	</button>
				  	</h2>
				  	<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				    	<div class="accordion-body">
				      		<a href="${pageContext.request.contextPath}/mypage/contest">내가 참여한 공모전</a>
				      		<a href="${pageContext.request.contextPath}/mypage/coupon">쿠폰함 </a>
				      	</div>
				    </div>
				</div>
				<div class="accordion-item">
				  	<h2 class="accordion-header" id="headingFive">
				    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				      		문의 내역
				    	</button>
				  	</h2>
				  	<div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				    	<div class="accordion-body">
				      		<a href="${pageContext.request.contextPath}/mypage/qna">1:1 문의</a>
				      	</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">클래스 리뷰</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
	        		<form name="reviewForm" method="post">
	        			<div class="star-rating mb-3">
            				<input type="radio" id="5-stars" name="reviewStar" value="5" onclick="mark(5)"/>
							<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="reviewStar" value="4" onclick="mark(4)"/>
							<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="reviewStar" value="3" onclick="mark(3)"/>
							<label for="3-stars" class="star">★</label>
							<input type="radio" id="2-stars" name="reviewStar" value="2" onclick="mark(2)"/>
							<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star" name="reviewStar" value="1" onclick="mark(1)"/>
							<label for="1-star" class="star">★</label>
          				</div>
          				<input type="hidden" name="star"/>
          				<input type="hidden" name="orderCode" id="orderCode"/>
          				<input type="hidden" name="classCode" id="classCode"/>
          				
						<div class="mb-3">
							<label for="reviewContent" class="col-form-label">리뷰 내용</label>
							<textarea class="form-control" id="reviewContent" name="reviewContent"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="reviewOk();">작성 완료</button>
				</div>
			</div>
		</div>
	</div>
</div>