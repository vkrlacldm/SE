<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; padding: 60px 0; }

.e-container { background: #fff; border-radius: 24px; padding: 35px 0; width: 1450px; margin: 0 auto; }

.event-title { width: 100%; font-size: 30px; font-weight: 700; margin-bottom: 35px; list-style: none; display: flex; justify-content: center; }
.event-title .end-li { padding-left: 50px;}

.event-container { width: 95%; margin: 0 auto; }
.event-list { list-style: none; display: flex; padding-left: 0; }
.event-list li:nth-child(1) { margin-left: 0; }
.event-list > li { margin: auto; width: calc(25% - 18px); }

.event-box { border: 1px solid #dadada; width: 400px; text-align: center; margin-top: 20px; }
.event-img { margin-bottom: 20px; width: 400px; height: 300px; overflow: hidden; }
.event-img > a > img { max-width: 100%; min-height: 100%; }
.event-info { letter-spacing: 0; margin: 0 10px; }
.event-title { font-size: 20px; font-weight: 500; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
.event-title > a { text-decoration: none; color: #000; }
.event-desc { font-size: 16px; font-weight: 300; }

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

<div class="e-container">
	
	<ul class="event-title">
		<li class="ing-li"><a href="${pageContext.request.contextPath}/event/list?menu=ing"><span>진행중인 이벤트</span></a></li>
		<li class="end-li"><a href="${pageContext.request.contextPath}/event/list?menu=end"><span>종료된 이벤트</span></a></li>
	</ul>
	
	<div class="event-container">
		<c:forEach var="dto" items="${list}" varStatus="status" step="3">
			<ul class="event-list">
				<c:forEach var="dto" items="${list}" begin="${status.index}" end="${status.index+2}">
					<li>
						<div class="event-box">
							<div class="event-img">
								<a href="${articleUrl}&eventNum=${dto.eventNum}">
									<c:choose>
										<c:when test="${dto.eventName != null}">
											<img src="${pageContext.request.contextPath}/uploads/event/${dto.eventName}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="event-info">
								<p class="event-title"><a href="${articleUrl}&eventNum=${dto.eventNum}">${dto.subject}</a></p>
								<p class="event-desc">${dto.startTime} ~ ${dto.expireTime}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:forEach>
	</div>
	
	<div class="btn-container">
		<c:if test="${sessionScope.member.role == 0}">
			<button type="button" class="btn btn-write" onclick="location.href='${pageContext.request.contextPath}/event/write';">
				<i class="icofont-plus-square"></i>
			</button>
		</c:if>
	</div>
	
	<div class="page-box">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
</div>
