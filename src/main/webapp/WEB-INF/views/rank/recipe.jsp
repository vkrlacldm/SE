<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

* {
	font-family: 'Noto Sans KR', sans-serif;
}
.clearFix:after { content: ''; display: block; clear: both; }
li { list-style: none; }
.ranking * { box-sizing: border-box; padding: 0; margin: 0; }
.ranking { background: #f1f1f2; padding: 20px 0; }
.ranking .full { width: 1320px; background: #fff; border: 1px solid #e6e7e8; padding: 0 30px; margin: 0 auto; }
.ranking .full h3 { font-size: 30px; font-family: 'GmarketSansBold', sans-serif; margin: 30px 0 20px; }
.ranking .full .choice { border-bottom: 1px solid #ccc; }
.ranking .full .choice li { float: left; }
.ranking .full .choice li a { display: block; font-size: 17px; padding: 14px 38px; }
.ranking .full .choice li.active a { border: 1px solid #ccc; border-bottom: 1px solid #fff; font-weight: 500; margin-bottom: -1px; }
.ranking .full .choice li a:hover { color: #333; text-decoration: none; }

.ranking .full .rank-list { margin: 40px 0px 20px 35px; }
.ranking .full .rank-list li { position: relative; float: left; width: 282px; margin: 0 20px 40px 0; }
.ranking .full .rank-box {
	position: absolute; top: -8px; left: -8px;
	background: #fff; border: 1px solid #bbb; 
	-webkit-box-shadow: 3px 3px 0 rgb(0 0 0 / 8%); box-shadow: 3px 3px 0 rgb(0 0 0 / 8%);
	min-width: 36px;
	text-align: center;
	border-radius: 4px;
	line-height: 1;
	padding: 10px 7px 10px;
	letter-spacing: -0.03em;
	vertical-align: unset;
}
.ranking .full .rank-list li a img { width: 100%; height: 282px; }
.ranking .full .rank-list p { font-size: 15px; margin: 14px 0px 8px 2px; }
.ranking .full .rank-list .profile > div { display: inline-block; }
.ranking .full .rank-list .profile > div > img { display: inline-block; width: 26px; height: 26px; border-radius: 50%; border: 0.1px solid #ededed; background: #f1f1f2; margin-right: 6px; }
.ranking .full .rank-list .profile span { cursor: pointer; font-size: 14px; vertical-align: top; display: inline-block; height: 25px; line-height: 24px; }
.ranking .full .rank-list .info { margin-top: 3px; }
.ranking .full .rank-list .info img { width: 25px; margin-right: 6px; }
.ranking .full .rank-list .info span { font-size: 13px; color: #999; vertical-align: middle; }
</style>

<script type="text/javascript">

</script>

<div class="ranking">
	<div class="full">
		<h3>랭킹</h3>
		<ul class="choice clearFix">
			<li class="active"><a href="${pageContext.request.contextPath}/rank/recipe">레시피</a></li>
			<li><a href="${pageContext.request.contextPath}/rank/chef">쉐프</a></li>
		</ul>
		<ul class="rank-list clearFix">
			<c:forEach var="dto" items="${list}">
				<li>
					<span class="rank-box">${dto.rnum}</span>
					<div>
						<a href="${pageContext.request.contextPath}/recipe/article?page=1&recipeNum=${dto.num}">
							<c:choose>
								<c:when test="${dto.recipePhotoName ne NULL}">
									<img src="${pageContext.request.contextPath}/uploads/recipe/${dto.recipePhotoName}">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/images/rank1.jpg">
								</c:otherwise>
							</c:choose>
						</a>
						<p>${dto.subject}</p>
						<div class="profile">
							<div>
								<c:choose>
									<c:when test="${dto.userImageName ne NULL}">
										<img src="${pageContext.request.contextPath}/uploads/photo/${dto.userImageName}">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/resources/images/profileImage.png">
									</c:otherwise>
								</c:choose>
							</div>
							<span onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${dto.userId}'">${dto.nickName}</span>
						</div>
						<div class="info">
							<img src="${pageContext.request.contextPath}/resources/images/heart2.png">
							<span>좋아요 (${dto.likeCount})</span>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>