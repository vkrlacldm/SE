<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.footer { width: 1440px; padding: 40px 0; margin: 0 auto; }
.footer a:hover { color: #999; text-decoration: none; }
.footer .logo-area, .text-area { display: inline-block; vertical-align: top; }
.footer .logo-area { width: 400px; }
.footer .logo-area > div { width: 100px; margin: 0 auto; }
.footer .logo-area img { width: 100%; }
.footer .logo-area span { display: block; text-align: center; font-size: 32px; font-weight: 700; margin-top: 15px; }

.footer .text-box { display: inline-block; }
.footer .text-area { margin-top: 20px; }
.footer .text-area ul { display: inline-block; vertical-align: top; padding: 0; margin: 0; }
.footer .text-area:last-child ul { border-left: 1px solid #999; padding-left: 20px; margin-left: 20px; }
.footer .text-area ul li { list-style: none; font-size: 14px; color: #999; margin-bottom: 5px; }
.footer .text-area ul li a { color: #999; }
 
.tossing{
	animation-name: tossing;
	-webkit-animation-name: tossing;	

	animation-duration: 2s;	
	-webkit-animation-duration: 2s;

	animation-iteration-count: infinite;
	-webkit-animation-iteration-count: infinite;
}
@keyframes tossing {
	0% { transform: rotate(-4deg); }
	50% { transform: rotate(4deg); }
	100% { transform: rotate(-4deg); }						
}
@-webkit-keyframes tossing {
	0% { -webkit-transform: rotate(-4deg); }
	50% { -webkit-transform: rotate(4deg); }
	100% { -webkit-transform: rotate(-4deg); }				
}
</style>

<div class="footer">
	<div class="logo-area">
		<div class="tossing">
			<img src="${pageContext.request.contextPath}/resources/images/cooking.png">
		</div>
		<span>요리조리</span>
	</div>
	<div class="text-box">
		<div class="text-area">
			<ul>
				<li><span>대표 : 요리조리 / EMAIL: yorizori@corp.com / TEL: 02)390-5252</span></li>
				<li><span>서울 마포구 월드컵북로 21 2층 풍성빌딩</span></li>
				<li><span>문의전화(운영시간 평일 10:00~18:00)</span></li>
				<li><span>서비스 이용문의 : 070-390-5252</span></li>
			</ul>
		</div>
		<div class="text-area">
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">개인정보취급방침</a></li>
				<li><a href="#">문의</a></li>
				<li><span><b>Copyright ©요리조리 Inc. All Rights Reserved</b></span></li>
			</ul>
		</div>
	</div>
</div>
