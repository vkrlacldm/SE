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

main {
	font-family: 'Noto Sans KR', sans-serif;
}

.feed * { box-sizing: border-box; padding: 0; margin: 0; }
.feed { width: 600px; margin: 0 auto; }
.feed img { width: 100%; }
.feed .img-area { width: 100%; }
.feed .img-area p { font-size: 18px; border: 1px solid #fff; border-bottom: none; padding: 10px; }
.feed .float { float: left; margin-top: 10px;}


.feed .text-area { width: 100%; }
.feed .text-area > a { font-size: 24px; font-weight: 700; display: block; }
.feed .text-area > a:hover { color: #000; text-decoration: none; }
.feed .text-area .likes { display: inline-block; }
.feed .text-area .likes button { width: 35px; border: none; background: #fff; }
.feed .text-area .likes span {  }

</style>

<div class="feed">
	<div class="img-area">
		<img class = "float" src="https://blog.kakaocdn.net/dn/wn8ds/btq5u4RsTuG/7KMKUbqv3CLSbdigBxxnJ0/img.png" style="width: 30px">
		<p> 쉐프이름 </p>
		<div class="img-box">
			<img src="https://recipe1.ezmember.co.kr/cache/recipe/2022/05/07/fac4d9cab60cf725c4b95b7dbee30c541.jpg">
		</div>
	</div>
	
	<div class="text-area">
		<!-- <i style="color: #5D5D5D; font-size: 1.5rem;" class="bi bi-heart"></i>  -->
		<i style="color: red; font-size: 1.4rem;" class="bi bi-heart-fill"></i>
			<span>좋아요 11,435개</span>
		<a href="#">맛있는 참치마요덥밥 만들기</a>
		<div class="likes">
			<button type="button" onclick="">
				
			</button>
			
		</div>
	</div>
</div>

<div class="feed">
	<div class="img-area">
		<img class = "float" src="https://blog.kakaocdn.net/dn/wn8ds/btq5u4RsTuG/7KMKUbqv3CLSbdigBxxnJ0/img.png" style="width: 30px">
		<p> 쉐프이름 </p>
		<div class="img-box">
			<img src="https://recipe1.ezmember.co.kr/cache/recipe/2022/05/07/fac4d9cab60cf725c4b95b7dbee30c541.jpg">
		</div>
	</div>
	
	<div class="text-area">
		<!-- <i style="color: #5D5D5D; font-size: 1.5rem;" class="bi bi-heart"></i>  -->
		<i style="color: red; font-size: 1.4rem;" class="bi bi-heart-fill"></i>
			<span>좋아요 11,435개</span>
		<a href="#">맛있는 참치마요덥밥 만들기</a>
		<div class="likes">
			<button type="button" onclick="">
				
			</button>
			
		</div>
	</div>
</div>