<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.clearFix:after { content: ''; display: block; clear: both; }
.lecture { background: #f1f1f2; padding: 20px 0; }
.lecture * {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 0; margin: 0; box-sizing: border-box;
}
.lecture img { width: 100%; }

.lecture .full { width: 1320px; background: #fff; border: 1px solid #e6e7e8; padding: 0 30px; margin: 0 auto; }

.lecture .video-area { position: relative; width: 1250px; margin: 25px auto; }
.lecture .video-area div { position: absolute; top: 0; left: 8px; width: 1235px; height: 650px; background: rgba(0,0,0,0.5); }
.lecture .video-area div h3 { position: absolute; top: 150px; left: 50%; transform: translateX(-50%); font-size: 75px; font-weight: 700; letter-spacing: 20px; color: #fff; text-shadow: 1px 1px 12px #000; z-index: 1; }
.lecture .video-area .introVideo { width: 100%; height: 650px; }

.lecture .lec-category { display: table; border-bottom: 1px solid #ddd; padding: 14px 0; margin-bottom: 0; }
.lecture .lec-category a { position: relative; display: table-cell; width: 1%; font-size: 18px; padding: 6px 0 0 52px; height: 40px; text-align: center; }
.lecture .lec-category a:hover { text-decoration: none; }
.lecture .lec-category a:after { position: absolute; top: 50%; right: 0; transform: translateY(-50%); display: block; content: ''; width: 1px; height: 25px; background: #ddd; }
.lecture .lec-category a:last-child:after { display: none; }
.lecture .lec-category .lec-cate-0 { background: url(${pageContext.request.contextPath}/resources/images/class-cate0.png) 60px center no-repeat; background-size: 46px; }
.lecture .lec-category .lec-cate-1 { background: url(${pageContext.request.contextPath}/resources/images/class-cate1.png) 60px center no-repeat; background-size: 46px; }
.lecture .lec-category .lec-cate-2 { background: url(${pageContext.request.contextPath}/resources/images/class-cate2.png) 60px center no-repeat; background-size: 46px; }
.lecture .lec-category .lec-cate-3 { background: url(${pageContext.request.contextPath}/resources/images/class-cate3.png) 60px center no-repeat; background-size: 46px; }
.lecture .lec-category .lec-cate-4 { background: url(${pageContext.request.contextPath}/resources/images/class-cate4.png) 60px center no-repeat; background-size: 46px; }
.lecture .lec-category .lec-cate-5 { background: url(${pageContext.request.contextPath}/resources/images/class-cate5.png) 60px center no-repeat; background-size: 46px; }

.lecture .lec-list { margin-top: 20px; }
.lecture .lec-list .insertClass { display: block; width: 200px; height: 50px; line-height: 48px; font-size: 20px; font-weight: 700; text-align: center; color: #fff; background: #77b347; margin: 0 22px 35px auto; }
.lecture .lec-list .insertClass:hover { text-decoration: none; }
.lecture .lec-list ul li { float: left; list-style: none; }
.lecture .lec-list ul li > div { width: 274px; margin: 0 20px 50px; }

.lecture .lec-list .img-area img { height: 154.13px; }

.lecture .lec-list .text-area { position: relative; width: 100%; font-size: 15px; padding: 10px 2px; }
.lecture .lec-list .text-area p:first-child { min-height: 70px; }
.lecture .lec-list .text-area p:nth-child(2) { font-size: 12px; color: #a2a2a2; border-bottom: 1px solid #f8f8f8; padding: 6px 0; margin-bottom: 10px; }
.lecture .lec-list .text-area p:last-child { font-size: 15px; font-weight: 700; color: #000; }
.lecture .lec-list .text-area .classLike { position: absolute; bottom: 8px; left: 70px; width: 28px; }

.lecture .page-box { margin-bottom: 30px; }
.lecture .page-link { padding: 0.375rem 0.75rem; }
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
		
		let classCode = $(this).attr("data-classCode");
		let userClassLike = $(this).attr("data-userClassLike");
		let isClassLike;
		
		if(userClassLike > 0) {
			isClassLike = true;
		} else {
			isClassLike = false;
		}
		
		let url = "${pageContext.request.contextPath}/class/insertClassLike";
		let query = "classCode=" + classCode + "&userClassLike=" + isClassLike;
		
		const fn = function(data) {
			let state = data.state;
			if(state === "true") {
				location.href="${pageContext.request.contextPath}/class/list";
			} else if(state === "false") {
				alert("찜하기 실패");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});
</script>

<div class="lecture">
	<div class="full">
		<div class="video-area">
			<div>
				<h3>클래스</h3>
			</div>
			<video autoplay="autoplay" muted="muted" class="introVideo">
				<source src="${pageContext.request.contextPath}/resources/media/class-intro.webm" type="video/webm">
				<source src="${pageContext.request.contextPath}/resources/media/class-intro.mp4" type="video/mp4">
			</video>
		</div>
		
		<div class="lec-category">
			<a href="${pageContext.request.contextPath}/class/list?category=0&page=1" class="lec-cate-0">전체</a>
			<a href="${pageContext.request.contextPath}/class/list?category=1&page=1" class="lec-cate-1">한식</a>
			<a href="${pageContext.request.contextPath}/class/list?category=2&page=1" class="lec-cate-2">중식</a>
			<a href="${pageContext.request.contextPath}/class/list?category=3&page=1" class="lec-cate-3">일식</a>
			<a href="${pageContext.request.contextPath}/class/list?category=4&page=1" class="lec-cate-4">베이킹</a>
			<a href="${pageContext.request.contextPath}/class/list?category=5&page=1" class="lec-cate-5">기타</a>
		</div>
		
		<div class="lec-list">
			<c:if test="${sessionScope.member.role == 0 || sessionScope.member.role == 2}">
				<a href="${pageContext.request.contextPath}/class/write" class="insertClass">클래스 등록</a>
			</c:if>
			<ul class="clearFix">
				<c:forEach var="dto" items="${list}">
					<li>
						<div>
							<div class="img-area">
								<a href="${articleUrl}&classCode=${dto.classCode}">
									<img src="${pageContext.request.contextPath}/uploads/class/${dto.imageFileName}">
								</a>						
							</div>
							<div class="text-area">
								<p>${dto.classSubject}</p>
								<p>${dto.nickname} - 팔로워 (${dto.followCount})</p>
								<p><fmt:formatNumber value="${dto.price}" groupingUsed="true"/>원</p>
								<div>
									<c:choose>
										<c:when test="${dto.userClassLike == 0}">
											<div class="classLike" data-classCode="${dto.classCode}" data-userClassLike="${dto.userClassLike}">
												<img src="${pageContext.request.contextPath}/resources/images/heart1.png">
											</div>
										</c:when>
										<c:otherwise>
										<div class="classLike" data-classCode="${dto.classCode}" data-userClassLike="${dto.userClassLike}">
											<img src="${pageContext.request.contextPath}/resources/images/heart2.png">
										</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="page-box">
			${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
		</div>
		
	</div>
</div>
