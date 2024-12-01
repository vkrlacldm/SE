<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #fff; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; }

.clearFix:after { content: ''; display: block; clear: both; }
li { list-style: none; }

.mypage { background: #fff; width: 1000px; margin: 0 auto; }

.nav-mypage { display: flex; padding: 15px 25px; }
.myNickname { width: 100%; text-align: center; padding-right: 42px; font-size: 20px; line-height: 38px; }

.myProfile { height: 250px; }
.profile-detail { display: flex; height: 250px; padding-right: 25px; }
.myImage { width: 250px; height: 250px; padding: 25px; margin-right: 100px; }
.myImage > img { width: 200px; height: 200px; border-radius: 9999px; }
.myInfo { width: 209px; height: 100px; margin: auto 0; text-align: center; }
.myInfo .count { margin-top: 10px; margin-bottom: 0; font-size: 25px; font-weight: 700; }
.myInfo .name { margin-bottom: 0; font-size: 16px; }
.profile-follow { height:50px; text-align: center; padding: 5px; }
.btn-follow { width: 260px; height: 40px; border: 1px solid #0095f6; border-radius: 8px; background-color: #0095f6; color: #fff; font-size: 16px; letter-spacing: 0.03em; }
.btn-following { width: 260px; height: 40px; border: 1px solid #0095f6; border-radius: 8px; background-color: #fff; color: #0095f6; font-size: 16px; letter-spacing: 0.03em; }

.feed-subject { width: 950px; height: 80px; margin: auto; border-bottom: 1px solid #d2d2d2; }
.feed-subject > p { cursor: default; margin: 0; color:#333; font-size: 17px; font-weight: 300; text-align: center; height: 80px; line-height: 110px; }

.mypage .myFeed { margin: 4px 25px 50px 25px; }
.mypage .feed-list { padding: 0; margin: 0; border-bottom: 1px solid #d2d2d2; }
.mypage .feed-list li { float: left; width: 314px; height: 314px; margin: 0 4px 4px 0; overflow: hidden; }
.mypage .feed-list li:nth-child(3n) { margin: 0 0 4px 0; }
.mypage .feed-list li img { width: 100%; }
.mypage .feed-list li .box:hover img { filter: brightness(70%); }

.box { position: relative; cursor: pointer; width: 100%; height: 100%; }
.text { position: absolute; visibility: hidden; left: 0; top: 145px; width: 100%; text-align: center; color: #fff; font-size: 18px; }
.box:hover .text { visibility: visible; }

.modal-body ul { margin: 0; padding: 0; }
.modal-body ul li { display: flex; padding: 10px 0; line-height: 35px; }
.modal-body ul li div img { width: 35px; height: 35px; border-radius: 9999px; border: 0.1px solid #ededed; margin-right: 10px; }
.btn-sm-follow { width: 80px; height: 30px; border: 1px solid #0095f6; border-radius: 8px; background-color: #0095f6; color: #fff; font-size: 14px; letter-spacing: 0.03em; margin-left: auto; margin-top: 4px; line-height: 28px; }
.btn-sm-following { width: 80px; height: 30px; border: 1px solid #0095f6; border-radius: 8px; background-color: #fff; color: #0095f6; font-size: 14px; letter-spacing: 0.03em; margin-left: auto; margin-top: 4px; line-height: 28px; }

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
</style>

<div class="mypage">
	<div class="nav-mypage">
		<div class="btn-menu">
			<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">
				<i class="bi bi-list"></i>
			</button>
		</div>
		<div class="myNickname">
			${dto.nickName}
		</div>
	</div>
	<div class="myProfile">
		<div class="profile-detail">
			<div class="myImage">
				<c:choose>
					<c:when test="${dto.memberImageName ne NULL}">
						<img src="${pageContext.request.contextPath}/uploads/photo/${dto.memberImageName}">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/images/profileImage.png">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="myInfo">
				<p class="count">${dto.recipeCount}</p>
				<p class="name">레시피</p>
			</div>
			<div class="myInfo" data-bs-toggle="modal" data-bs-target="#exampleModal1" style="cursor: pointer;">
				<p class="count">${dto.followerCount}</p>
				<p class="name">팔로워</p>
			</div>
			<div class="myInfo" data-bs-toggle="modal" data-bs-target="#exampleModal2" style="cursor: pointer;">
				<p class="count">${dto.followingCount}</p>
				<p class="name">팔로잉</p>
			</div>
		</div>
	</div>
	
	<div class="feed-subject">
		<p>관심 등록한 축제</p>
	</div>
	
	<div class="myFeed">
		<ul class="feed-list clearFix">
			<c:choose>
				<c:when test="${list.size() != 0}">
					<c:forEach var="vo" items="${list}">
						<li>
							<div class="box" onclick="location.href='${articleUrl}&num=${vo.festivalNum}'">
								<c:choose>
									<c:when test="${vo.festivalPhotoName ne NULL}">
										<img src="${pageContext.request.contextPath}/uploads/festival/${vo.festivalPhotoName}">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/resources/images/festival_poster.jpg">
									</c:otherwise>
								</c:choose>
								<div class="text">${vo.festivalName}</div>
							</div>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div style="padding: 50px 0; text-align: center;">관심 등록된 축제가 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	
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
	
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel1">팔로워</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<ul>
						<c:forEach var="vo" items="${listFollower}">
							<li onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${vo.followId}'">
								<div>
									<c:choose>
										<c:when test="${vo.followImageName ne NULL}">
											<img src="${pageContext.request.contextPath}/uploads/photo/${vo.followImageName}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/profileImage.png">
										</c:otherwise>
									</c:choose>
								</div>
								${vo.followNickName}
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">팔로잉</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<ul>
						<c:forEach var="vo" items="${listFollowing}">
							<li onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${vo.followId}'">
								<div>
									<c:choose>
										<c:when test="${vo.followImageName ne NULL}">
											<img src="${pageContext.request.contextPath}/uploads/photo/${vo.followImageName}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/profileImage.png">
										</c:otherwise>
									</c:choose>
								</div>
								${vo.followNickName}
								<button class="btn-sm-following" type="button">팔로잉</button>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>