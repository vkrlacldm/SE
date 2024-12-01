<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="icofont-chef"></i> 쉐프 정보</h3>
<table class="table td-border mx-auto my-10">
	<tr>
		<td class="wp-15 text-center bg-light">아이디</td>
		<td class="wp-35 ps-5">${dto.userId}</td>
		<td class="text-center bg-light">닉네임</td>
		<td class="ps-5">${dto.nickName}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">생년월일</td>
		<td class="ps-5">${dto.birth}</td>
		<td class="text-center bg-light">전화번호</td>
		<td class="ps-5">${dto.tel}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.email}</td>
		<td class="text-center bg-light">회원가입일</td>
		<td class="ps-5">${dto.register_date}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">소개</td>
		<td class="ps-5" colspan="2">${dto.intro}</td>
	</tr>
	
</table>

<form id="deteailedChefForm" name="deteailedChefForm" method="post">
	<h3 style="font-size: 15px; padding-top: 10px;"><i class="icofont-chef"></i> 쉐프 상태 변경</h3>
	
	<table class="table td-border mx-auto my-5">
		<tr>
			<td class="wp-15 text-center bg-light">승인상태</td>
			<td class="ps-5">
				<select class="form-select" name="accept" id="accept" onchange="selectStateChange()">
					<option value="">::승인상태::</option>
					<option value="1" ${dto.accept=="1"?"selected='selected'":""}>승인 대기</option>
					<option value="2" ${dto.accept=="2"?"selected='selected'":""}>승인 완료</option>
				</select>
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="userId" value="${dto.userId}">
	<input type="hidden" name="registerId" value="${sessionScope.member.userId}">
</form>


