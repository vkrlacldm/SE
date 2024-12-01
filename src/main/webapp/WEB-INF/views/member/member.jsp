<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
.signUpBody * { font-family: 'Noto Sans KR', sans-serif; }
.signUpBody { width: 1200px; margin: 0 auto; }


label {
	padding: 15px;
    line-height: 1em;
    color: #000000;
    margin-bottom: 10px;
	text-align: center;
    font-weight: bold;
}

#nickName, #userPwd, #userPwd2, #birth, #userName {
	display: block;
    width: 600px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
}

#selectEmail {
	display: block;
    width: 166px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
    text-align: center;
}

#selectEmail1 {
	display: block;
    width: 200px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
}

#selectEmail2 {
	display: block;
    width: 200px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
}

#tel1 {
	display: block;
    width: 166px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
    text-align: center;
}

#tel2 {
	display: block;
    width: 196px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
    text-align: center;
}

#tel3 {
	display: block;
    width: 196px;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
    text-align: center;
}

#addr1 {
	display: block;
    width: 600px;
    height: 50px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
}

#addr2 {
	display: block;
    width: 600px;
    height: 50px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
}

#tel {
	width: 450%;
}

#zipSearch, #idcheck {
	float: left;
    display: block;
    width: 140px;
    height: 60px;
    padding: 0 10px;
    margin-left: 5px;
    margin-bottom: 10px;
    border-radius: 12px;
    background: #f44502;
    font-size: 1.2rem;
    font-weight: 400;
    line-height: 60px;
    color: #ffffff;
    text-align: center;
    float: none;
    display: inline-block;
}


#userId {
	display: block;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
    display: inline-block;
    width: 452px;
}

#zip {
 	display: block;
    height: 60px;
    padding: 0 20px;
    border: 0;
    border-radius: 12px;
    background: #f7f8fb;
    font-size: 1.6rem;
    font-weight: 400;
    color: #777777;
    box-sizing: border-box;
    display: inline-block;
    width: 457px;
 }



#agree {
	margin: 20px;
}

button {	
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
}

#food {
	font-size: 25px;
}

.check {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    display: flex;
    align-items: center;
    position: relative;
    font-size: 1.6rem;
    font-weight: 400;
    line-height: 1em;
    color: #777777;
    cursor: pointer;
    margin-bottom: 10px;
    margin-right: 0;
}

.comment-message {
    margin-bottom: 100px;
}

.label {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    font-weight: 400;
    line-height: 1em;
    color: #777777;
    cursor: pointer;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 16px;
    height: 16px;
    margin-right: 10px;
    vertical-align: middle;
    background: url(/portal/img/contents/ico_checkbox_off.png)50% 50% /16px 16px no-repeat;
    box-sizing: border-box;
}

.btn {
    margin: 0;
    border: 0;
    cursor: pointer;
    font-family: 'Noto Sans', sans-serif !important;
    display: block;
    width: 50%;
    padding: 20px 30px;
    border-radius: 9999px;
    box-sizing: border-box;
    background: #f44502;
    margin-left: 30%;
    font-size: 30px;
}

.btn1 {
    margin: 20px;
    border: 0;
    cursor: pointer;
    font-family: 'Noto Sans', sans-serif !important;
    display: inline-block;
    width: 200px;
    padding: 10px 0;
    border-radius: 9999px;
    box-sizing: border-box;
    background: #f44502;
    font-size: 28px;
}

.signUpTitle { text-align: center; margin: 40px 0 70px; }
.signUpTitle img { display: inline-block; width: 100px; }
.signUpTitle h3 { display: inline-block; font-size: 45px; font-weight: bold; vertical-align: middle; margin: 0 0 0 30px; }
.signUpBody .row > * { width: auto; }
.signUpBody .row > label { width: 300px; font-size: 28px; margin-left: 90px; }
.signUpBody .select label { font-size: 24px; }
.signUpBody .form-check-label { font-size: 24px; }
.signUpBody .btn-area { width: 100%; }
</style>

<script type="text/javascript">
function memberOk() {
	const f = document.memberForm;
	let str;

	str = f.userId.value;
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("아이디를 다시 입력 하세요. ");
		f.userId.focus();
		return;
	}

	let mode = "${mode}";
	if(mode === "member" && f.userIdValid.value === "false") {
		str = "아이디 중복 검사가 실행되지 않았습니다.";
		$("#userId").parent().find(".help-block").html(str);
		f.userId.focus();
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
	
	
    str = f.userName.value;
    if( !/^[가-힣]{2,5}$/.test(str) ) {
        alert("이름을 다시 입력하세요. ");
        f.nickName.focus();
        return;
    }
    

    str = f.birth.value;
    if( !str ) {
        alert("생년월일를 입력하세요. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
    if( !str ) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
    if( !/^\d{3,4}$/.test(str) ) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
    if( !/^\d{4}$/.test(str) ) {
    	alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email1.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value.trim();
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

   	f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();
}

function changeEmail() {
    const f = document.memberForm;
	    
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

function userIdCheck() {
	// 아이디 중복 검사
	let userId = $("#userId").val();

	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
		var str = "아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.";
		$("#userId").focus();
		$("#userId").parent().find(".help-block").html(str);
		return false;
	}
	
	let url = "${pageContext.request.contextPath}/member/userIdCheck";
	let query = "userId=" + userId;
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			let passed = data.passed;

			if(passed === "true") {
				let str = "<span style='color:blue; font-weight: bold;'>" + userId + "</span> 아이디는 사용가능 합니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userIdValid").val("true");
			} else {
				let str = "<span style='color:red; font-weight: bold;'>" + userId + "</span> 아이디는 사용할수 없습니다.";
				$(".userId-box").find(".help-block").html(str);
				$("#userId").val("");
				$("#userIdValid").val("false");
				$("#userId").focus();
			}
		}
	});
}
</script>

<div class="signUp">
	<div class="signUpBody">
		<div class="signUpTitle">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png">	
			<h3>회원가입 </h3>
		</div>    		
		<div class="body-main">

			<form name="memberForm" method="post">
				<div class="row mb-3">
					<label class="col-form-label" for="userId">아이디</label>
					<div class="userId-box">
			            <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해주세요" value="${dto.userId}"
			            		${mode=="update" ? "readonly='readonly' ":""}
			            		placeholder="아이디">
			            <c:if test="${mode=='member'}">			 
							<button type="button" id="idcheck" class="btn btn-light" onclick="userIdCheck();">중복검사</button>
							<small class="form-control-plaintext help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</small>
						</c:if>
						<c:if test="${mode=='member'}">
						</c:if>	
				
					</div>
				</div>
				
				<div class="row mb-3">
					<label class="col-form-label" for="userName">이름</label>
					<div class="">
			            <input type="text" name="userName" id="userName" class="form-control" autocomplete="off" placeholder="이름을 입력해주세요." value="${dto.userName}">			 
			        </div>
			    </div>
			    
				<div class="row mb-3">
					<label class="col-form-label" for="nickName">닉네임</label>
					<div class="">
			            <input type="text" name="nickName" id="nickName" class="form-control" autocomplete="off" placeholder="닉네임을 입력해주세요." value="${dto.nickName}">			 
			        </div>
			    </div>
			 
				<div class="row mb-3">
					<label class="col-form-label" for="userPwd">패스워드</label>
					<div class="">
			            <input type="password" name="userPwd" id="userPwd" class="form-control" autocomplete="off" placeholder="패스워드를 입력해주세요.">			 
			        </div>
			    </div>
			    
			    <div class="row mb-3">
			        <label class="col-form-label" for="userPwd2">패스워드 확인</label>
			        <div class="">
			            <input type="password" name="userPwd2" id="userPwd2" class="form-control" autocomplete="off" placeholder="패스워드 확인 더 입력해주세요.">
			        </div>
			    </div>
			 
			    <div class="row mb-3">
			        <label class="col-form-label" for="birth">생년월일</label>
			        <div class="">
			            <input type="date" name="birth" id="birth" class="form-control" value="${dto.birth}" placeholder="생년월일">
			            <small class="form-control-plaintext">생년월일은 2000-01-01 형식으로 입력 합니다.</small>
			        </div>
			    </div>
			
			    <div class="row mb-3">
			        <label class="col-form-label" for="selectEmail">이메일</label>
						<div class="row">
						<div class="col-3 pe-0">
							<select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버</option>
								<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>구글</option>
								<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>다음</option>
								<option value="direct">직접입력</option>
							</select>
						</div>
						
						<div class="col input-group">
							<input type="text" id="selectEmail1" name="email1" class="form-control" maxlength="30" value="${dto.email1}" >
						    <span class="input-group-text p-1" style="border: none; background: none;">@</span>
							<input type="text" id="selectEmail2" name="email2" class="form-control" maxlength="30" value="${dto.email2}" readonly="readonly">
						</div>		
	
			        </div>
			    </div>
			    
			    <div class="row mb-3">
			        <label class="col-form-label" for="tel">전화번호</label>
			        <div class="row">
						<div class="col-sm-3 pe-1">
							<input type="text" name="tel1" id="tel1" class="form-control" value="${dto.tel1}" maxlength="3">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 px-1">
							<input type="text" name="tel2" id="tel2" class="form-control" value="${dto.tel2}" maxlength="4">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 ps-1">
							<input type="text" name="tel3" id="tel3" class="form-control" value="${dto.tel3}" maxlength="4">
						</div>
			        </div>
			    </div>
				<!-- 
			<form name="memberForm" method="post">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="userId">아이디</label>
					<div class="col-sm-10 userId-box">
			            <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해주세요" value="${dto.userId}"
			            		${mode=="update" ? "readonly='readonly' ":""}
			            		placeholder="아이디">
			            <c:if test="${mode=='member'}">			 
							<button type="button" id="idcheck" class="btn btn-light" onclick="userIdCheck();">중복검사</button>
							<small class="form-control-plaintext help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</small>
						</c:if>
						<c:if test="${mode=='member'}">
						</c:if>
				 -->
			    <div class="row mb-3">
			        <label class="col-form-label" for="zip">우편번호</label>
			        <div class="col-sm-6">
			       		<div class="input-group">
			           		<input type="text" name="zip" id="zip" class="form-control" placeholder="우편번호" value="${dto.zip}" readonly="readonly">
		           			<button class="btn btn-light" id="zipSearch" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
			           	</div>
					</div>
			    </div>
				<!-- 
					<button class="btn btn-light" id="zipSearch" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
				 -->
			    <div class="row mb-3">
			        <label class="col-form-label" for="addr1">주소</label>
			        <div class="">
			       		<div>
			           		<input type="text" name="addr1" id="addr1" class="form-control" placeholder="기본 주소" value="${dto.addr1}" readonly="readonly">
			           	</div>
			       		<div style="margin-top: 5px;">
			       			<input type="text" name="addr2" id="addr2" class="form-control" placeholder="상세 주소" value="${dto.addr2}">
						</div>
					</div>
			    </div>
			    
			     <div class="row mb-3">
			        <label class="col-form-label" for="countryNum">가장 선호하는 음식 ?</label>
			        <div class="col-sm-9">
			        <div class="select">
			        	<!-- 
     					<input type="radio" id="select1" name="korea"><label for="select1">한식</label>
    				    <input type="radio" id="select2" name="america"><label for="select2">양식</label>
    				    <input type="radio" id="select3" name="japan"><label for="select3">일식</label>
    				    <input type="radio" id="select4" name="china"><label for="select4">중식</label>
    				    <input type="radio" id="select5" name="else"><label for="select5">기타</label>
    				    <select name="selectEmail" id="selectEmail" class="form-select" onchange="changeEmail();">
								<option value="">선 택</option>
								<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
								<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
								<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
								<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
								<option value="direct">직접입력</option>
						</select>
						<br>
						-->
						<!--
						<input type="checkbox" id="select1" name="korea"><label for="select1">한식</label>
    				    <input type="checkbox" id="select2" name="america"><label for="select2">양식</label>
    				    <input type="checkbox" id="select3" name="japan"><label for="select3">일식</label>
    				    <input type="checkbox" id="select4" name="china"><label for="select4">중식</label>
    				    <input type="checkbox" id="select5" name="else"><label for="select5">기타</label>
    				    -->
    				    
				
						<input type="radio" id="select1" name="countryNum" value="1"><label for="select1">한식</label>
    				    <input type="radio" id="select2" name="countryNum" value="2"><label for="select2">중식</label>
    				    <input type="radio" id="select3" name="countryNum" value="3"><label for="select3">일식</label>
    				    <input type="radio" id="select4" name="countryNum" value="4"><label for="select4">양식</label>

    				    
    				    
					</div>
			       </div>
			    </div>
			    
		
			    <div class="row mb-3">
			        <label class="col-form-label" for="agree">약관 동의</label>
					<div class="col-sm-8">
						<input type="checkbox" id="agree" name="agree"
							class="form-check-input"
							checked="checked"
							style="margin-left: 0;"
							onchange="form.sendButton.disabled = !checked">
						<label class="form-check-label">
							<a href="https://www.linktoviatris.co.kr/user/services" class="text-decoration-none">이용약관</a>에 동의합니다.
						</label>
					</div>
			    </div>
			     
			    <div class="row mb-3">
			        <div class="text-center btn-area">
			            <button type="button" name="sendButton" class="btn1 btn-primary" onclick="memberOk();"> ${mode=="member"?"회원가입":"정보수정"} <i class="bi bi-check2"></i></button>
			            <button type="button" class="btn1 btn-danger" onclick="location.href='${pageContext.request.contextPath}/';"> ${mode=="member"?"가입취소":"수정취소"} <i class="bi bi-x"></i></button>
						<input type="hidden" name="userIdValid" id="userIdValid" value="false">
			        </div>
			    </div>
			
			    <div class="row">
					<p class="form-control-plaintext text-center">${message}</p>
			    </div>
			</form>

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

								   