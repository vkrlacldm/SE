<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; padding: 60px 0; }

.f-container { background: #fff; border-radius: 24px; padding: 35px 0; width: 1320px; margin: 0 auto; }

.menu-title { width: 100%; text-align: center; font-size: 30px; font-weight: 700; margin-bottom: 35px; }

.menu-list { list-style: none; display: flex; width: 95%; margin: 0 auto 50px auto; padding-left: 0; }
.menu-list > li { font-size: 16px; width: 33.3%; text-align: center; border-bottom: 1px solid #dadada; border-top: 1px solid #dadada; }
.menu-list > li > a { display: block; height: 64px; }
.menu-list > li > a:hover, .menu-list > li > a:active { text-decoration: none; color: #f44502; }
.menu-list > li > a > span { line-height: 60px; }

.festival-container { width: 95%; margin: 0 auto; }
.festival-list { list-style: none; display: flex; padding-left: 0; }
.festival-list li:nth-child(1) { margin-left: 0; }
.festival-list > li { margin: 0 0 20px 24px; width: calc(25% - 18px); }

.festival-box { border: 1px solid #dadada; text-align: center; }
.festival-img { margin-bottom: 20px; width: 294px; height: 300px; overflow: hidden;}
.festival-img > a > img { width: 100%; min-height: 100%; }
.festival-info { letter-spacing: 0; margin: 0 10px; }
.festival-title { font-size: 20px; font-weight: 500; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
.festival-title > a { text-decoration: none; color: #000; }
.festival-desc { font-size: 16px; font-weight: 300; }

.btn-container { width: 95%; margin-top: 50px; text-align: right; }
.btn-write { color: #ffffff; background-color: #f44502; font-size: 18px; border-radius: 9999px; padding: 10px 20px; margin: 0 10px; }

.page-item.active .page-link { background-color: #f44502; border-color: #f44502; }
.page-link, .page-link:hover, .page-link:active { color: #f44502; }
</style>

<script type="text/javascript">

$(function(){
	if('${menu}' == 'after') {
		$(".after-li").css("border-bottom","2px solid #f44502");
	} else if('${menu}' == 'before') {
		$(".before-li").css("border-bottom","2px solid #f44502");
	} else if ('${menu}' == 'ing') {
		$(".ing-li").css("border-bottom","2px solid #f44502");
	}
});

</script>

<div class="f-container">
	<div class="menu-title">
		<p>${menu=='ing'?"진행 중인 축제":menu=='before'?"예정된 축제":"종료된 축제"}</p>
	</div>
	
	<ul class="menu-list">
		<li class="before-li"><a href="${pageContext.request.contextPath}/festival/list?menu=before"><span>예정된 축제</span></a></li>
		<li class="ing-li"><a href="${pageContext.request.contextPath}/festival/list?menu=ing"><span>진행 중인 축제</span></a></li>
		<li class="after-li"><a href="${pageContext.request.contextPath}/festival/list?menu=after"><span>종료된 축제</span></a></li>
	</ul>
	
	<div class="festival-container">
		<c:forEach var="dto" items="${list}" varStatus="status" step="4">
			<ul class="festival-list">
				<c:forEach var="dto" items="${list}" begin="${status.index}" end="${status.index+3}">
					<li>
						<div class="festival-box">
							<div class="festival-img">
								<a href="${articleUrl}&num=${dto.num}">
									<c:choose>
										<c:when test="${dto.fileName ne NULL}">
											<img src="${pageContext.request.contextPath}/uploads/festival/${dto.fileName}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/festival_poster.jpg">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="festival-info">
								<p class="festival-title"><a href="${articleUrl}&num=${dto.num}">${dto.name}</a></p>
								<p class="festival-desc">${dto.start_date} ~ ${dto.end_date}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:forEach>
	</div>
	
	<c:if test="${sessionScope.member.role == 0}">
		<div class="btn-container">
			<button type="button" class="btn btn-write" onclick="location.href='${pageContext.request.contextPath}/festival/write';">
				<i class="bi bi-plus-lg"></i>
			</button>
		</div>
	</c:if>
	
	<div class="page-box">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
</div>