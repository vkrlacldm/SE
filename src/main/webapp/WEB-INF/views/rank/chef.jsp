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

.ranking .full .chef-list { padding: 40px 0px 20px 128px; }
.ranking .full .chef-list li { position: relative; float: left; margin: 2px 45px 24px; }
.ranking .full .chef-list li div { width: 108px; height: 108px; cursor: pointer; }
.ranking .full .chef-list li div img { width: 100%; height: 100%; border-radius: 50%; border: 1px solid #ededed; }
.ranking .full .chef-list li div a { display: block; font-size: 16px; text-align: center; padding: 8px 0; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
.ranking .full .chef-list li div a:hover { text-decoration: none; color: #f44502; }

</style>

<div class="ranking">
	<div class="full">
		<h3>랭킹</h3>
		<ul class="choice clearFix">
			<li><a href="${pageContext.request.contextPath}/rank/recipe">레시피</a></li>
			<li class="active"><a href="${pageContext.request.contextPath}/rank/chef">쉐프</a></li>
		</ul>
		
		<ul class="chef-list clearFix">
			<c:forEach var="dto" items="${list}">
				<li>
					<span class="rank-box">${dto.rnum}</span>
					<div onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${dto.userId}'">
						<c:choose>
							<c:when test="${dto.userImageName ne NULL}">
								<img src="${pageContext.request.contextPath}/uploads/photo/${dto.userImageName}">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/images/profileImage.png">
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/mypage/main?userId=${dto.userId}">${dto.nickName}</a>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>