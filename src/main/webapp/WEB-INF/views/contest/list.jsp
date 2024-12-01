<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; padding: 60px 0; }

.c-container { background: #fff; border-radius: 24px; padding: 35px 0; width: 1450px; margin: 0 auto; }

.contest-title { width: 100%; font-size: 30px; font-weight: 700; margin-bottom: 35px; list-style: none; display: flex; justify-content: center; }
.contest-title .end-li { padding-left: 50px;}

.contest-container { width: 95%; margin: 0 auto; }
.contest-list { list-style: none; display: flex; padding-left: 0; }
.contest-list li:nth-child(1) { margin-left: 0; }
.contest-list > li { margin: auto; width: calc(25% - 18px); }

.contest-box { border: 1px solid #dadada; width: 400px; text-align: center; margin-top: 20px; }
.contest-img { margin-bottom: 20px; width: 400px; height: 300px; overflow: hidden; }
.contest-img > a > img { max-width: 100%; min-height: 100%; }
.contest-info { letter-spacing: 0; margin: 0 10px; }
.contest-title { font-size: 20px; font-weight: 500; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
.contest-title > a { text-decoration: none; color: #000; }
.contest-desc { font-size: 16px; font-weight: 300; }

.btn-container { width: 95%; margin-top: 50px; text-align: right; }
.btn-write { color: #ffffff; background-color: #f44502; font-size: 25px; border-radius: 300px; padding: 10px 20px; }

.page-item.active .page-link { background-color: #f44502; border-color: #f44502; }
.page-link, .page-link:hover, .page-link:active { color: #f44502; }
</style>

<script type="text/javascript">

$(function(){
	if('${menu}' == 'ing') {
		$(".ing-li").css("border-bottom","2px solid #f44502");
	} else if('${menu}' == 'end') {
		$(".end-li").css("border-bottom","2px solid #f44502");
});

</script>

<div class="c-container">
	
	<ul class="contest-title">
		<li class="ing-li"><a href="${pageContext.request.contextPath}/contest/list?menu=ing"><span>공모전</span></a></li>
		<li class="end-li"><a href="${pageContext.request.contextPath}/contest/list?menu=end"><span>공모전 발표</span></a></li>
	</ul>
	
	<div class="contest-container">
		<c:forEach var="dto" items="${list}" varStatus="status" step="3">
			<ul class="contest-list">
				<c:forEach var="dto" items="${list}" begin="${status.index}" end="${status.index+2}">
					<li>
						<div class="contest-box">
							<div class="contest-img">
								<a href="${articleUrl}&contestNum=${dto.contestNum}">
									<c:choose>
										<c:when test="${dto.fileName != null}">
											<img src="${pageContext.request.contextPath}/uploads/contest/${dto.fileName}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="contest-info">
								<p class="contest-title"><a href="${articleUrl}&contestNum=${dto.contestNum}">${dto.subject}</a></p>
								<p class="contest-desc">${dto.start_date} ~ ${dto.end_date}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:forEach>
	</div>
	
	<div class="btn-container">
		<c:if test="${sessionScope.member.role == 0}">
			<button type="button" class="btn btn-write" onclick="location.href='${pageContext.request.contextPath}/contest/write';">
				<i class="icofont-plus-square"></i>
			</button>
		</c:if>
	</div>
	
	<div class="page-box">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
</div>
