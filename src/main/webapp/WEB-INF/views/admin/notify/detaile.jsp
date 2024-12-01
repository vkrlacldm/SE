<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 style="font-size: 15px; padding-top: 10px;"><i class="icofont-users"></i> 회원 정보</h3>
<table class="table td-border mx-auto my-10">
	<tr>
		<td class="wp-15 text-center bg-light">카테고리 이름</td>
		<td class="wp-35 ps-5">${dto}</td>
		<td class="text-center bg-light">닉네임</td>
		<td class="ps-5">${dto.nickName}</td>
	</tr>
	
</table>

<form id="deteailedNotifyForm" name="deteailedNotifyForm" method="post">
	<h3 style="font-size: 15px; padding-top: 10px;"><i class="icofont-users"></i> 카테고리 상태 변경</h3>
	
	<table class="table td-border mx-auto my-5">
		<tr>
			<td class="wp-15 text-center bg-light">계정상태</td>
			<td class="ps-5">
				<select class="form-select" name="stateCode" id="stateCode" onchange="selectStateChange()">
					<option value="">::상태코드::</option>
					<option value="1">추가</option>
					<option value="2">수정</option>
					<option value="3">삭제</option>
				</select>
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="" value="${dto.}">
	<input type="hidden" name="" value="${sessionScope..}">
</form>

<div id="NotifyDetaile" style="display: none;">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr class="bg-light">
				<th>내용</th>
				<th width="130"></th>
				<th width="200"></th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listState}">
				<tr>
					<td class="ps-5">${vo.memo} (${vo.stateCode})</td>
					<td class="text-center">관리자</td>
					<td class="text-center">${vo.reg_date}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listState.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>  
</div>
