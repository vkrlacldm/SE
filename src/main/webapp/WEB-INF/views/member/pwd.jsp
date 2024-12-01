<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">
main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; }
.body-container { max-width: 800px; padding: 60px; }
.cancel-container { display: inline-table; margin: auto; padding: 50px; width: 640px; height: 400px; border-radius: 32px; background-color: #ffffff; }

.cancel { margin: 30px; }
.input-id { margin: 0 auto 10px auto; width: 400px; }
.input-pwd { margin: 0 auto; width: 400px; }

.under-input { 
	display: block; width: 100%; height: 60px;
    padding: 0 20px; border: 1px solid #dddddd;
    background: #ffffff; font-size: 16px; font-weight: 400; box-sizing: border-box;
}

.btn-div { width: 480px; margin: 0 30px; text-align: center; }
.btn-list { color: #ffffff; background-color: #0095f6; font-size: 14px; border-radius: 9999px; padding: 13px 50px; margin-right: 10px; }
.btn-white { color: #0095f6; background-color: #ffffff; font-size: 14px; border-radius: 9999px; padding: 13px 50px; border: 1px solid #0095f6; }
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.pwdForm;

	let str = f.userPwd.value;
	if(!str) {
		alert("비밀번호를 입력하세요. ");
		f.userPwd.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/pwd";
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
        <div class="cancel-container">
			<form name="pwdForm" method="post">
				<h3 class="text-center" style="font-weight: 700;">회원${mode=='update'?'정보수정':'탈퇴'}</h3>
                 
				<div class="d-grid">
					<p class="form-control-plaintext text-center">회원${mode=='update'?'정보수정':'탈퇴'}를 위해 비밀번호를 입력해주세요.</p>
           		</div>
                 
				<div class="cancel">
                	<div class="input-id">
                    	<input class="form-control under-input" type="text" name="userId" value="${sessionScope.member.userId}" readonly="readonly">
                	</div>
                	<div class="input-pwd">
                    	<input class="form-control under-input" type="password" name="userPwd" autocomplete="off" placeholder="비밀번호">
                	</div>
                </div>
                
                <div class="btn-div">
                	<button type="button" class="btn btn-list" onclick="sendOk();">확인</button>
                	<button type="button" class="btn btn-white" onclick="location.href='${pageContext.request.contextPath}/mypage/main?userId=${sessionScope.member.userId}'">취소</button>
               		<input type="hidden" name="mode" value="${mode}">
                </div>
			</form>

			<div class="d-grid">
				<p class="form-control-plaintext text-center">${message}</p>
			</div>
        </div>
	</div>
</div>