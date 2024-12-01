<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<style type="text/css">
main {
	background-color: #f7f8fb;
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
}

.body-container {
	max-width: 800px; min-height: 700px; padding: 60px;
}

.login-container {
	margin: 0 auto; padding: 50px;
	width: 640px; height: 650px;
	border-radius: 32px;
	background-color: #ffffff;
}

.loginImage {
	width: 70px; 
	margin: 0 auto 30px auto;
	height: 70px;
}

.loginHeader {
	font-size: 44px; font-weight: 700; line-height: 1em;
}

.loginHeader2 {
	margin-top: 30px; font-size: 20px;
    font-weight: 500; line-height: 1.4em;
}

.signIn {
	margin-bottom: 30px;
}

.under-input {
	display: block; width: 100%; height: 60px;
    padding: 0 20px; border: 1px solid #dddddd;
    border-width: 0 0 1px 0; background: #ffffff;
    font-size: 16px; font-weight: 400; box-sizing: border-box;
}

.btn-login {
	color: #ffffff; background-color: #f44502;
	display: block; width: 100%; padding: 20px 30px;
    border-radius: 9999px; box-sizing: border-box;
}

.sign-info {
	margin: 60px auto 0 auto;
}

</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value;
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value;
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
    	<div class="login-container">
        	<form name="loginForm" action="" method="post" class="row g-3">
        		<div class="loginImage">
        			<img class="loginImage" src="${pageContext.request.contextPath}/resources/images/loginImage.png">
           		</div>
           		<h3 class="loginHeader text-center">오늘도 반갑습니다!</h3>
           		<h5 class="loginHeader2 text-center">로그인</h5>
           		<div class="signIn">
                	<div class="input-id">
                    	<input class="under-input" type="text" name="userId" class="form-control" placeholder="아이디">
                	</div>
                	<div class="input-pwd">
                    	<input class="under-input" type="password" name="userPwd" class="form-control" autocomplete="off" 
                            	placeholder="비밀번호">
                	</div>
                </div>
                <div class="col-12">
                	<button type="button" class="btn btn-login" onclick="sendLogin();">&nbsp;로그인&nbsp;</button>
                </div>
			</form>
            <div class="sign-info">
            	<p class="text-center mb-0">
                	<!-- <a href="#" class="text-decoration-none me-2">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
                	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
                	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
            	</p>
            </div>
		</div>

        <div class="d-grid">
			<p class="form-control-plaintext text-center text-primary">${message}</p>
        </div>
	</div>
</div>