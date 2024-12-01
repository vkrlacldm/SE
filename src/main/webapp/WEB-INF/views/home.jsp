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

.floating{
	animation-name: floating;
	-webkit-animation-name: floating;

	animation-duration: 1.5s;	
	-webkit-animation-duration: 1.5s;

	animation-iteration-count: infinite;
	-webkit-animation-iteration-count: infinite;
}

@keyframes floating {
	0% {
		transform: translateY(0%);	
	}
	50% {
		transform: translateY(8%);	
	}	
	100% {
		transform: translateY(0%);
	}			
}

@-webkit-keyframes floating {
	0% {
		-webkit-transform: translateY(0%);	
	}
	50% {
		-webkit-transform: translateY(8%);	
	}	
	100% {
		-webkit-transform: translateY(0%);
	}			
}

.main-page * { font-family: 'GmarketSansMedium', sans-serif; box-sizing: border-box; padding: 0; margin: 0; }
a:hover { color: #fff; text-decoration: none; }
li { list-style-type: none; }
.clearFix:after { content: ''; display: block; clear: both; }
.feature { min-width: 1440px; text-align: center; margin: 0 auto; }
.color-point { color: #f44502; }
.featureBtn { display: block; width: 195px; border-radius: 50vh; font-size: 18px; line-height: 1em; color: #fff; background: #002e73; padding: 22px 20px; margin: 30px auto 0; }

.f01 { height: 600px; background: url('${pageContext.request.contextPath}/resources/images/main_bg.png') bottom center no-repeat; }
.f01 h4 { font-size: 24px; padding-top: 40px; }
.f01 h2, .f01 h2 span { font-family: 'GmarketSansBold'; font-size: 54px; margin-top: 10px; }
.f01 .items { margin-top: 40px; }
.f01 .items .item { display: inline-block; width: 120px; height: 120px; background: #fff; border-radius: 100%; margin: 0 8px; }
.f01 .items .item img { width: 100%; height: 100%; border-radius: 100%; }

.f02 { background: #f7f8fb; padding-bottom: 60px; }
.f02 h2, .f02 h2 span { font-family: 'GmarketSansBold'; font-size: 54px; padding-top: 85px; }
.f02 h4 { font-size: 24px; margin-top: 30px; }

.f03 h2 { font-family: 'GmarketSansBold'; font-size: 54px; padding-top: 85px; }
.f03 h4 { font-size: 24px; margin-top: 30px; }

.f04 { width: 1440px; text-align: left; margin-top: 80px; }
.f04 .left { float: left; margin-left: 100px; }
.f04 .right { float: right; margin-right: 100px; }
.f04 h3 { font-size: 36px; margin-top: 14px; }
.f04 .featureBtn { width: 172px; margin: 30px 0 0; z-index: 2; }
.f04 > div { position: relative; overflow: hidden; width: 600px; height: 600px; background-color: #ffeee4; border-radius: 48px; padding: 50px 50px 0; margin-bottom: 65px; box-shadow: 0px 17px 32px 0px rgb(244 69 2 / 7%); }
.f04 > div:nth-child(2) { margin-top: 150px; }
.f04 > div:first-child:after { content: ''; display: block; position: absolute; top: 300px; left: 0; width: 100%; height: 400px; opacity: 0.6; background: url('${pageContext.request.contextPath}/resources/images/main_f04_1.jpg') top center no-repeat; }
.f04 > div:nth-child(2):after { content: ''; display: block; position: absolute; top: 345px; left: 0; width: 100%; height: 300px; opacity: 0.6; background-image: url('${pageContext.request.contextPath}/resources/images/main_f04_2.png'), url('${pageContext.request.contextPath}/resources/images/main_f04_3.png'); background-size: 265px, 200px; background-position: 45px 0px, 356px 0px; background-repeat: no-repeat; }
.f04 > div:nth-child(3):after { content: ''; display: block; position: absolute; top: 300px; left: 0; width: 100%; height: 400px; opacity: 0.6; background: url('${pageContext.request.contextPath}/resources/images/main_f04_4.jpg') top center no-repeat; }
.f04 > div:last-child:after { content: ''; display: block; position: absolute; top: 300px; left: 0; width: 100%; height: 400px; opacity: 0.6; background: url('${pageContext.request.contextPath}/resources/images/main_f04_5.jpg') top center no-repeat; }

.f05 { text-align: center; background: #ffeee4; }
.f05 .txt { display: inline-block; width: 520px; text-align: left; padding-left: 40px; }
.f05 .txt h3 { font-family: 'GmarketSansBold'; font-size: 36px; padding-top: 50px; }
.f05 .txt h4 { margin-top: 20px; }
.f05 .txt .featureBtn { display: inline-block; width: 130px; text-align: center; margin: 30px 20px 50px; }


#slideShow {
  /*전체 컨테이너*/
  width: 1300px;
  height: 390px;
  position: relative;
  margin: 50px auto 30px;
  overflow: hidden; /*리스트 형식으로 이미지를 일렬로 정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은 hidden으로 숨겨줘야됨*/
}
.slides {
  /*이미지들이 담겨있는 슬라이드 컨테이너*/
  position: absolute;
  left: 0;
  top: 0;
  width: 2400px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: 0.5s ease-out; /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
} /* 첫 번째 슬라이드 가운데에 정렬하기위해 첫번째 슬라이드만 margin-left조정 */
.slides li:first-child {
  margin-left: 100px;
} /* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child) {
  float: left;
  margin-right: 100px;
}
.slides li img { width: 300px; }
.slides li .txt { position: relative; top: -25px; padding-top: 60px; }
.slides li .txt > span { display: block; position: absolute; top: 0; left: 50%; transform: translateX(-50%); width: 100px; height: 50px; background: #003567; border-radius: 50vh; font-size: 18px; line-height: 50px; color: #fff; text-align: center; }
.slides li:last-child .txt > span { display: none; }
.slides li .txt p { font-size: 20px; }
.controller span {
  font-size: 32px;
  cursor: pointer;
  background-color: transparent;
  color: black;
  text-align: center;
  border-radius: 50%;
  padding: 10px 20px;
  margin: 0 5px;
} /* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
</style>

<script type="text/javascript">
$(document).ready(function(){
	let slides = document.querySelector('.slides');
	let slideImg = document.querySelectorAll('.slides li');
	currentIdx = 0;
	slideCount = slideImg.length;
	prev = document.querySelector('.prev'); //이전 버튼
	next = document.querySelector('.next'); //다음 버튼
	slideWidth = 300; //슬라이드이미지 넓이
	slideMargin = 100; //슬라이드 끼리의 마진값
	makeClone(); // 처음이미지와 마지막 이미지 복사 함수
	initfunction(); //슬라이드 넓이와 위치값 초기화 함수
	function makeClone() {
	  let cloneSlide_first = slideImg[0].cloneNode(true);
	  let cloneSlide_last = slides.lastElementChild.cloneNode(true);
	  slides.append(cloneSlide_first);
	  slides.insertBefore(cloneSlide_last, slides.firstElementChild);
	}
	function initfunction() {
	  slides.style.width = (slideWidth + slideMargin) * (slideCount + 2) + 'px';
	  slides.style.left = -(slideWidth + slideMargin) + 'px';
	}
	next.addEventListener('click', function () {
	  //다음 버튼 눌렀을때
	  $(".controller .prev").css('visibility','visible');
	  if (currentIdx <= slideCount - 2) {
	    //슬라이드이동
	    slides.style.left = -(currentIdx + 2) * (slideWidth + slideMargin) + 'px';
	    slides.style.transition = `${0.5}s ease-out`; //이동 속도
	  }
	  if (currentIdx === slideCount - 4) {
	    //마지막 슬라이드 일때
	    $(".controller .next").css('visibility','hidden');
	  }
	  currentIdx += 1;
	});
	prev.addEventListener('click', function () {
	  //이전 버튼 눌렀을때
	  $(".controller .next").css('visibility','visible');
	  if (currentIdx >= 0) {
	    slides.style.left = -currentIdx * (slideWidth + slideMargin) + 'px';
	    slides.style.transition = `${0.5}s ease-out`;
	  }
	  if (currentIdx === 1) {
		  $(".controller .prev").css('visibility','hidden');
	  }
	  currentIdx -= 1;
	});
});
</script>

<div class="main-page">
    <div class="feature f01">
		<h4><span class="color-point">먹고 싶은 요리의 레시피</span>를 검색 해보세요!</h4>
		<h2>오늘은 어떤 <span class="color-point">음식</span>이 끌리나요?</h2>
		<a href="${pageContext.request.contextPath}/recipe/feed" class="featureBtn">레시피 보러가기 ＞</a>
		<div class="items floating">
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/23.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/31.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/32.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/33.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/34.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/20.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/21.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/22.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/24.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/25.PNG">
			</div>
		</div>
		<div class="items floating">
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/65.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/66.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/67.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/68.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/69.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/70.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/71.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/72.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/73.PNG">
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/resources/images/ingredient/74.PNG">
			</div>
		</div>
    </div>
    
    <div class="feature f02">
    	<h2><span class="color-point">요리</span>가 어렵다면<br><span class="color-point">클래스를 수강</span>하세요!</h2>
    	<h4>먹고 싶은 음식이 있다면<br>요리 전문가들의 레시피와 조리법 활용!</h4>
    	<h4>요리를 하고 싶어도 망설여지고,<br>배달음식, 편의점음식 등에 질린<br>여러분들을 위해 <span class="color-point">클래스</span>를 제공합니다.</h4>
    	
    	<a href="${pageContext.request.contextPath}/class/list" class="featureBtn">클래스 보러가기 ＞</a>
    </div>
    
    <div class="feature f03">
    	<h2>특히 이런 분들께 추천드려요!</h2>
    	<h4>지금 바로 요리조리를 이용하세요!</h4>
	    <div id="slideShow">
	        <ul class="slides">
	            <li>
	                <img src="${pageContext.request.contextPath}/resources/images/f03_2.png" alt="" />
	                <div class="txt">
	                	<span>자취생</span>
	                	<p>요리를 잘 안해먹는<br><span class="color-point">자취생들에게 동기부여를</span></p>
	                </div>
	            </li>
	            <li>
	                <img src="${pageContext.request.contextPath}/resources/images/f03_4.png" alt="" />
	                <div class="txt">
	                	<span>직장인</span>
	                	<p>요리 학원 직접 가지마세요!<br><span class="color-point">요리조리 클래스를 이용 해보세요</span></p>
	                </div>
	            </li>
	            <li>
	                <img src="${pageContext.request.contextPath}/resources/images/f03_6.png" alt="" />
	                <div class="txt">
	                	<span>주부</span>
	                	<p>요리조리를 이용 하고나서<br><span class="color-point">주부 9단이 된거 같아요</span></p>
	                </div>	                
	            </li>
	            <li>
	                <img src="${pageContext.request.contextPath}/resources/images/f03_8.png" alt="" />
	                <div class="txt">
	                	<span>학생</span>
	                	<p>어머니의 손맛이 그리워<br><span class="color-point">요리조리 레시피를 참고했어요</span></p>
	                </div>	                
	             </li>
	            <li>
	                <img src="${pageContext.request.contextPath}/resources/images/f03_10.png" alt="" />
	                <div class="txt">
	                	<span>1인가구</span>
	                	<p>1인분 요리 레시피도 있고<br><span class="color-point">맛도 있는 1석 2조</span></p>
	                </div>	                
	            </li>
	        </ul>
	    </div>
	    <div class="controller">
	    	<span class="prev" style="visibility: hidden;">&lt;</span> 
      		<span class="next">&gt;</span>
	    </div>
    </div>
    
    <div class="feature f04 clearFix">
    	<div class="left">
    		<h4><span class="color-point">상세한 레시피 검색!</span></h4>
    		<h3>상황별, 나라별, 재료별 등<br>상세한 검색 기능!</h3>
    		<a href="${pageContext.request.contextPath}/category/list" class="featureBtn">검색 하러가기 ＞</a>
    	</div>
    	<div class="right">
    		<h4><span class="color-point">레시피, 쉐프의 랭킹!</span></h4>
    		<h3>좋아요 수가 높은 레시피와<br>팔로워 수가 높은 쉐프를<br> 확인하세요!</h3>
    		<a href="${pageContext.request.contextPath}/rank/recipe" class="featureBtn">랭킹 보러가기 ＞</a>
    	</div>
    	<div class="left">
    		<h4><span class="color-point">냉장고에 있는 재료로 요리하자!</span></h4>
    		<h3>냉장고에 있는 남은 재료로<br>맛있는 요리하러 가자!</h3>
    		<a href="${pageContext.request.contextPath}/frige/main" class="featureBtn">냉장고파먹기 ＞</a>
    	</div>
    	<div class="right">
    		<h4><span class="color-point">전국 지역축제 놀러가자!</span></h4>
    		<h3>전국 지역 특산물과<br>음식 축제 즐기러 가자!</h3>
    		<a href="${pageContext.request.contextPath}/festival/list" class="featureBtn">축제 보러가기 ＞</a>
    	</div>
    </div>
    
    <div class="feature f05">
    	<div class="txt">
    		<h3>쿠폰 받아가세요 !</h3>
    		<h4>각종 쿠폰이벤트와 공모전에 참여하셔서<br>쿠폰 받아가세요~</h4>
    		<a href="${pageContext.request.contextPath}/event/list" class="featureBtn">쿠폰</a>
    		<a href="${pageContext.request.contextPath}/contest/list" class="featureBtn">공모전</a>
    	</div>
    	<div class="txt">
    		<h3>요리조리 커뮤니티</h3>
    		<h4>열심히 요리해서<br>다른 쉐프들과 공유해요~</h4>
    		<a href="${pageContext.request.contextPath}/daily/list" class="featureBtn">데일리쿡</a>
    	</div>
    </div>
</div>