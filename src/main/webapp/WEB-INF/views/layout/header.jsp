<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

@font-face {
	font-family: 'GmarketSansBold';
	src: url('${pageContext.request.contextPath}/resources/fonts/GmarketSansTTFBold.woff') format('woff');
}
@font-face {
	font-family: 'GmarketSansMedium';
	src: url('${pageContext.request.contextPath}/resources/fonts/GmarketSansTTFMedium.woff') format('woff');
}
@font-face {
	font-family: 'GmarketSansLight';
	src: url('${pageContext.request.contextPath}/resources/fonts/GmarketSansTTFLight.woff') format('woff');
}

.yorizori-nav * { font-family: 'GmarketSansBold', sans-serif; box-sizing: border-box; padding: 0; margin: 0; }
.clearFix:after { content: ''; display: block; clear: both; }
.left-menu { float: left; }
.right-menu { float: right; }

.yorizori-nav { width: 100%; height: 90px; background: #fff; }
.yorizori-nav a:hover { color: #f44502; text-decoration: none; }
.yorizori-nav .nav-inner { position: relative; width: 1440px; padding: 0 20px; margin: 0 auto; }
.yorizori-nav .nav-inner .logo { position: absolute; top: 14px; left: 28px; font-size: 40px; color: #000; }
.yorizori-nav .nav-inner .logo:hover { color: #000; }

.yorizori-nav .menus .left-menu { padding-left: 100px; }
.yorizori-nav .menus .left-menu a { font-size: 22px; line-height: 90px; margin-right: 30px; }

.yorizori-nav .menus .right-menu a { font-family: 'GmarketSansMedium'; font-size: 16px; line-height: 90px; color: #777777; margin-right: 15px; }
.yorizori-nav .menus .right-menu .down-menu { display: inline-block; margin-right: 15px; }
.yorizori-nav .menus .right-menu .down-menu ul { position: absolute; top: 85px; left: 0; width: 100%; background: rgba(0,0,0,0.5); }
.yorizori-nav .menus .right-menu .down-menu ul li { list-style: none; }
.yorizori-nav .menus .right-menu .nav-event ul, 
.yorizori-nav .menus .right-menu .nav-service ul { display: none; z-index: 2; }
.yorizori-nav .menus .right-menu .nav-event:hover ul,
.yorizori-nav .menus .right-menu .nav-service:hover ul { display: block; }
.yorizori-nav .menus .right-menu .nav-event li { margin-left: 915px; }
.yorizori-nav .menus .right-menu .nav-service li { margin-left: 1140px; }
.yorizori-nav .menus .right-menu .nav-event li.nonMember { margin-left: 968px; }
.yorizori-nav .menus .right-menu .nav-service li.nonMember { margin-left: 1193px; }
.yorizori-nav .menus .right-menu .down-menu ul li a { color: #fff; line-height: 50px; }
.yorizori-nav .menus .right-menu .down-menu > a { margin-right: 0; }
.yorizori-nav .menus .right-menu .btnArea { display: inline-block; }
.yorizori-nav .menus .right-menu .btnArea a:last-child { width: 70px; padding: 10px; border-radius: 12px; background: #f44502; line-height: 1em; color: #fff; text-align: center; margin-right: 0; }


</style>

<script type="text/javascript">

</script>

<nav>
	<div class="yorizori-nav">
		<div class="nav-inner clearFix">
			<a href="${pageContext.request.contextPath}/" class="logo">
				<img alt="요리조리" src="${pageContext.request.contextPath}/resources/images/logo.png" style="width: 70px;">
			</a>
			<div class="menus">
				<div class="left-menu">
					<a href="${pageContext.request.contextPath}/recipe/feed">레시피</a>   
					<a href="${pageContext.request.contextPath}/class/list">클래스</a>
					<a href="${pageContext.request.contextPath}/category/list">분류</a>
					<a href="${pageContext.request.contextPath}/rank/recipe">랭킹</a>
					<a href="${pageContext.request.contextPath}/frige/main">냉장고파먹기</a>
				</div>
				<div class="right-menu">
					<div class="down-menu nav-event">
						<a>
					    	이벤트
					  	</a>
					  	<ul class="">
					  		<c:choose>
						  		<c:when test="${empty sessionScope.member}">
						    		<li class="nonMember"><a class="" href="${pageContext.request.contextPath}/event/list">쿠폰</a></li>
						    		<li class="nonMember"><a class="" href="${pageContext.request.contextPath}/contest/list">공모전</a></li>
						    	</c:when>
						    	<c:otherwise>
							    	<li><a class="" href="${pageContext.request.contextPath}/event/list">쿠폰</a></li>
							    	<li><a class="" href="${pageContext.request.contextPath}/contest/list">공모전</a></li>
						    	</c:otherwise>
					    	</c:choose>
					  	</ul>
					</div>
					<a href="${pageContext.request.contextPath}/festival/list">지역축제</a>
					<a href="${pageContext.request.contextPath}/daily/list">데일리쿡</a>
					<div class="down-menu nav-service">
						<a>
					    	고객센터
					  	</a>
					  	<ul class="">
					  		<c:choose>
					  			<c:when test="${empty sessionScope.member}">
							    	<li class="nonMember"><a class="" href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
							    	<li class="nonMember"><a class="" href="${pageContext.request.contextPath}/faq/main">FAQ</a></li>
							    	<li class="nonMember"><a class="" href="${pageContext.request.contextPath}/qna/list">1:1 문의</a></li>
							    	<li class="nonMember"><a class="" href="${pageContext.request.contextPath}/addchef/write">쉐프신청</a></li>
							    </c:when>
							    <c:otherwise>
							    	<li><a class="" href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
							    	<li><a class="" href="${pageContext.request.contextPath}/faq/main">FAQ</a></li>
							    	<li><a class="" href="${pageContext.request.contextPath}/qna/list">1:1 문의</a></li>
							    	<li><a class="" href="${pageContext.request.contextPath}/addchef/write">쉐프신청</a></li>
							    </c:otherwise>
					    	</c:choose>
					  	</ul>
					</div>
					<div class="btnArea">
						<div>
							<c:choose>
							<c:when test="${empty sessionScope.member}">
								<a href="${pageContext.request.contextPath}/member/member">회원가입</a>
								<a href="${pageContext.request.contextPath}/member/login">로그인</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/recipe/write" title="레시피등록">
									<img src="${pageContext.request.contextPath}/resources/images/nav-recipe.png" style="width: 40px;">
								</a>
								<c:if test="${sessionScope.member.role == 1 || sessionScope.member.role == 2}">
									<a href="${pageContext.request.contextPath}/mypage/main?userId=${sessionScope.member.userId}" title="마이페이지">
										<img src="${pageContext.request.contextPath}/resources/images/nav-mypage2.png" style="width: 40px;">
									</a>
								</c:if>
								<c:if test="${sessionScope.member.role == 0}">
									<a href="${pageContext.request.contextPath}/admin" title="관리자">
										<img src="${pageContext.request.contextPath}/resources/images/nav-admin.png" style="width: 40px;">
									</a>			
								</c:if>
								<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃">로그아웃</a>
							</c:otherwise>
							</c:choose>
									
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>
