<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; }
.m-container { max-width: 1100px; min-height: 700px; padding: 15px 0 60px 0; margin: auto; }
.modify-container { margin: 0 auto; padding: 50px 200px; width: 1000px; min-height: 650px; border-radius: 32px; background-color: #ffffff; }
.div-canvas { margin: 0 auto; width: 1000px; padding: 0 0 10px 25px; }
.form-container { display: inline-block; width: 100%; margin-top: 40px; font-size: 16px; }
.form-container > form { display: inline; margin: 0; }
.form-container > form > div { margin: 0 0 30px 0; padding: 0; display: flex; width: 100%; }
.form-container > form > div > label { width: 150px; font-weight: 500; }
.form-container > form > div > div { width: 550px; }
.form-container > form > div > .div-flex { display: flex; }

.form-container > form > div > .img-viewer {
	cursor: pointer; border: 1px solid #ccc; width: 128px; height: 128px;
	border-radius: 9999px; background-image: url("${pageContext.request.contextPath}/resources/images/profileImage.png");
	position: relative; z-index: 9999; background-repeat : no-repeat; background-size : cover;
}

.form-container > form > div > .userId { width: 472px; font-size: 25px; font-weight: 700; padding-left: 40px; padding-top: 40px; }

#userId { width: 275px; }
#nickName { width: 275px; }
#userName { width: 275px; }
#birth { width: 275px; }
#selectEmail1 { width: 200px; }
#selectEmail2 { width: 120px; }
.email-select { width: 120px; margin-left: auto; }
#tel1 { width: 100px; }
#tel2 { width: 130px; }
#tel3 { width: 130px; }
.tel-hyphen { width: 20px; }
#zip { width: 150px; border-radius: 0.25rem; }
.zip-search { margin-left: 5px; }
#addr1 { margin-bottom: 3px; }
.category-select { height: 48px; line-height: 48px; }
.category-select > label { margin-left: 7px; margin-right: 14px; }

.input-group > .form-control { flex: none; }
.input-group { width: auto; }
.input-group>:not(:first-child):not(.dropdown-menu):not(.valid-tooltip):not(.valid-feedback):not(.invalid-tooltip):not(.invalid-feedback), 
.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3), .input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu) {
	border-radius: 0.25rem;	
}

.btn-div { margin-top: 30px; }
.btn-list { color: #ffffff; background-color: #f44502; font-size: 14px; border-radius: 9999px; padding: 13px 30px; margin-right: 10px; }
.btn-white { color: #f44502; background-color: #ffffff; font-size: 14px; border-radius: 9999px; padding: 13px 30px; border: 1px solid #f44502; }

.offcanvas-title { cursor: pointer; }
.offcanvas-title:hover, .offcanvas-title:active { color: #0d6efd; }
.offcanvas-start { width: 300px; border-right: none; }
.offcanvas-backdrop.show { opacity: .1; }

.accordion-button { padding: 10px 15px; font-size: 14px; }
.accordion-button:not(.collapsed) { color: #212529; }
.accordion-button:focus { box-shadow: inset 0 -1px 0 rgb(0 0 0 / 13%); }
.accordion-body { display: grid; padding: 10px 20px; }
.accordion-body > a { padding: 5px 0; text-decoration: none; font-size: 13px; }
.accordion-body > a:hover, a:active { color: #0d6efd; }
.btn-primary { padding: 3px 10px; font-size: 20px; background-color: #0095f6; border-color: #0095f6; }
.btn-primary:focus, .btn-primary:hover { background-color: #0095f6; border-color: #0095f6; box-shadow: 0 0 0 0; }
</style>

<script type="text/javascript">
function modifyOk() {
	const f = document.modifyForm;
	let str;
	
	str = f.nickName.value;
    if( !str ) {
        alert("닉네임을 입력하세요.");
        f.nickName.focus();
        return;
    }
	
    str = f.userName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력하세요.");
        f.userName.focus();
        return;
    }

    str = f.userPwd.value;
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드를 다시 입력 하세요. ");
		f.userPwd.focus();
		return;
	}

	if( str !== f.userPwd2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd.focus();
        return;
	}
    
    str = f.birth.value;
    if( !str ) {
        alert("생년월일을 입력하세요.");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
    if( !str ) {
        alert("전화번호를 입력하세요.");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다.");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다.");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요.");
        f.email1.focus();
        return;
    }

    str = f.email2.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요.");
        f.email2.focus();
        return;
    }

   	f.action = "${pageContext.request.contextPath}/member/update";
    f.submit();
}

function changeEmail() {
    const f = document.modifyForm;
	    
    let str = f.selectEmail.value;
    if(str !== "direct") {
        f.email2.value = str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value = "";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

$(function() {
	var img = "${dto.imageFilename}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/photo/" + img;
		$(".img-viewer").empty();
		$(".img-viewer").css("background-image", "url("+img+")");
	}
	
	$(".img-viewer").click(function(){
		$("form[name=modifyForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=modifyForm] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/" + img;
				$(".img-viewer").css("background-image", "url("+img+")");
			} else {
				img = "${pageContext.request.contextPath}/resources/images/profileImage.png";
				$(".img-viewer").css("background-image", "url("+img+")");
			}
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".img-viewer").empty();
			$(".img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});

</script>

<div class="modify">
	<div class="m-container">
		<div class="div-canvas">
			<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">
				<i class="bi bi-list"></i>
			</button>
		</div>
    	<div class="modify-container">
    		<h3 class="text-center" style="font-weight: 700;">회원정보수정</h3>
    		
    		<div class="form-container">
	        	<form name="modifyForm" method="post" class="row" enctype="multipart/form-data">
	        		<div>
	        			<div class="img-viewer"></div>
						<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						<div class="userId">
				            ${sessionScope.member.userId}
						</div>	        		
	        		</div>
	        		<div style="display: none;">
						<label for="userId">아이디</label>
						<div>
				            <input type="text" name="userId" id="userId" class="form-control" value="${sessionScope.member.userId}" readonly="readonly">
						</div>
					</div>
				    
				    <div>
						<label for="nickName">닉네임</label>
						<div>
				            <input type="text" name="nickName" id="nickName" class="form-control" autocomplete="off" placeholder="닉네임을 입력하세요." value="${dto.nickName}">			 
				        </div>
				    </div>
				    
				    <div>
						<label for="userName">이름</label>
						<div>
				            <input type="text" name="userName" id="userName" class="form-control" autocomplete="off" placeholder="이름을 입력하세요." value="${dto.userName}">			 
				        </div>
				    </div>
				 	
				 	<div>
						<label for="userPwd">비밀번호</label>
						<div>
				            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="비밀번호를 입력하세요.">			 
				        </div>
				    </div>
				 	
				 	<div>
						<label for="userPwd2">비밀번호</label>
						<div>
				            <input type="password" name="userPwd2" id="userPwd2" class="form-control" autocomplete="off" placeholder="비밀번호를 다시 입력하세요.">			 
				        </div>
				    </div>
				 	
				    <div>
				        <label for="birth">생년월일</label>
				        <div>
				            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}">
				        </div>
				    </div>
				
					<div>
				        <label for="selectEmail">이메일</label>
						<div class="div-flex">				
							<div class="input-group">
								<input type="text" id="selectEmail1" name="email1" class="form-control" maxlength="30" value="${dto.email1}" >
							    <span class="input-group-text p-1" style="border: none; background: none;">@</span>
								<input type="text" id="selectEmail2" name="email2" class="form-control" maxlength="30" value="${dto.email2}" readonly="readonly">
							</div>
							
							<div class="email-select">
								<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
									<option value="">선 택</option>
									<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버</option>
									<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>구글</option>
									<option value="daum.net" ${dto.email2=="daum.net" ? "selected='selected'" : ""}>다음</option>
									<option value="direct">직접입력</option>
								</select>
							</div>	
				        </div>
				    </div>
				    
				    <div>
				        <label for="tel">전화번호</label>
				        <div class="div-flex">
							<div>
								<input type="text" name="tel1" id="tel1" class="form-control" value="${dto.tel1}" maxlength="3">
							</div>
							<div class="tel-hyphen">
								<p class="form-control-plaintext text-center">-</p>
							</div>
							<div>
								<input type="text" name="tel2" id="tel2" class="form-control" value="${dto.tel2}" maxlength="4">
							</div>
							<div class="tel-hyphen">
								<p class="form-control-plaintext text-center">-</p>
							</div>
							<div>
								<input type="text" name="tel3" id="tel3" class="form-control" value="${dto.tel3}" maxlength="4">
							</div>
				        </div>
				    </div>
		
				    <div>
				        <label for="zip">우편번호</label>
				        <div>
				       		<div class="input-group">
				           		<input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" value="${dto.zip}" readonly="readonly">
			           			<button class="btn btn-light" id="zipSearch" type="button" style="margin-left: 3px; border: 1px solid #ced4da;" onclick="daumPostcode();"><i class="bi bi-search"></i></button>
				           	</div>
						</div>
				    </div>
				    
				    <div>
				        <label for="addr1">주소</label>
				        <div>
				       		<div>
				           		<input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="${dto.addr1}" readonly="readonly">
				           	</div>
				       		<div>
				       			<input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="${dto.addr2}">
							</div>
						</div>
				    </div>
				    
					<div>
						<label for="countryNum">가장 선호하는<br>음식 카테고리</label>
				        <div>
					        <div class="select category-select">
								<input type="radio" id="select1" name="countryNum" value="1" ${dto.countryNum==1?"checked='checked'":""}><label for="select1">한식</label>
		    				    <input type="radio" id="select2" name="countryNum" value="2" ${dto.countryNum==2?"checked='checked'":""}><label for="select2">중식</label>
		    				    <input type="radio" id="select3" name="countryNum" value="3" ${dto.countryNum==3?"checked='checked'":""}><label for="select3">일식</label>
		    				    <input type="radio" id="select4" name="countryNum" value="4" ${dto.countryNum==4?"checked='checked'":""}><label for="select4">양식</label> 
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="btn-div">
		        <div class="text-center">
		            <button type="button" name="sendButton" class="btn btn-list" onclick="modifyOk();">수정</button>
		            <button type="button" class="btn btn-white" onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${sessionScope.member.userId}';">취소</button>
		        </div>
		    </div>

        	<div class="d-grid">
				<p class="form-control-plaintext text-center text-primary">${message}</p>
        	</div>
		</div>
		
		<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel" onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${sessionScope.member.userId}'">마이페이지</h5>
				<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			
			<div class="offcanvas-body">
		    	<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					      		내 정보
					    	</button>
					  	</h2>
					  	<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					    	<div class="accordion-body">
					      		<a href="${pageContext.request.contextPath}/member/pwd">회원정보수정</a>
				      		<a href="${pageContext.request.contextPath}/member/pwd?dropout">회원탈퇴</a>
					    	</div>
					  	</div>
					</div>
					<div class="accordion-item">
					  	<h2 class="accordion-header" id="headingTwo">
					    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					      		내 관심사
					    	</button>
					  	</h2>
					  	<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					    	<div class="accordion-body">
					      		<a href="${pageContext.request.contextPath}/mypage/like">내가 좋아요한 레시피</a>
					      		<a href="${pageContext.request.contextPath}/mypage/wish">내가 찜한 클래스</a>
					      		<a href="${pageContext.request.contextPath}/mypage/favorite">내가 관심 등록한 축제</a>
					      	</div>
					  	</div>
					</div>
					<div class="accordion-item">
					  	<h2 class="accordion-header" id="headingThree">
					    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					      		클래스
					    	</button>
					  	</h2>
					  	<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					    	<div class="accordion-body">
					    		<a href="${pageContext.request.contextPath}/mypage/order">주문 내역</a>
					    		<a href="${pageContext.request.contextPath}/mypage/refund">환불 내역</a>
					      		
					      		<a href="${pageContext.request.contextPath}/mypage/sell">판매 내역</a>
					      		
					      	</div>
					    </div>
					</div>
					<div class="accordion-item">
					  	<h2 class="accordion-header" id="headingFour">
					    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					      		이벤트
					    	</button>
					  	</h2>
					  	<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					    	<div class="accordion-body">
					      		<a href="${pageContext.request.contextPath}/mypage/contest">내가 참여한 공모전</a>
					      		<a href="${pageContext.request.contextPath}/mypage/coupon">쿠폰함 </a>
					      	</div>
					    </div>
					</div>
					<div class="accordion-item">
					  	<h2 class="accordion-header" id="headingFive">
					    	<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					      		문의 내역
					    	</button>
					  	</h2>
					  	<div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					    	<div class="accordion-body">
					      		<a href="${pageContext.request.contextPath}/mypage/qna">1:1 문의</a>
					      	</div>
					    </div>
					</div>
				</div>
		  	</div>
		</div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>
								   