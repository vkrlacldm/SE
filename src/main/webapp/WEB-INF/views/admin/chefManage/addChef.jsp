<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-main {
	max-width: 850px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<main>
	<h1>쉐프승인</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="icofont-culinary"></i> 쉐프 승인 </h2>
	    </div>
	    
	    <div class="body-main ms-30">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="icofont-culinary"></i> 쉐프 승인</li>
				</ul>
			</div>
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
			
				<table class="table">
					<tr>
						<td align="left" width="50%">
							5개(1/2 페이지)
						</td>
						<td align="right">
							<select id="selectEnabled" class="form-select" onchange="searchList();">
								<option value="" >::승인상태::</option>
								<option value="0" >승인 완료</option>
								<option value="1" >승인 대기</option>
							</select>
						</td>
					</tr>
				</table>
					
				<table class="table table-border table-list">
					<thead>
						<tr> 
							<th class="wx-60">번호</th>
							<th class="wx-100">아이디</th>
							<th class="wx-100">닉네임</th>
							<th class="wx-100">생년월일</th>
							<th class="wx-120">전화번호</th>
							<th class="wx-100">등록레시피수</th>
							<th class="wx-100">팔로워수</th>
							<th class="wx-60">상태</th>
							<th>이메일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}">
						<tr class="hover" onclick=""> 
							<td>1</td>
							<td>lee</td>
							<td>이자바</td>
							<td>2002-11-11</td>
							<td>010-1111-2222</td>
							<td>20개</td>
							<td>300명</td>
							<td>승인 완료</td>
							<td>aaa@naver.com</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
						 
				<div class="page-box">
					1 2 3
				</div>
						
				<table class="table">
					<tr>
						<td align="left" width="100">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/">새로고침</button>
						</td>
						<td align="center">
							<form name="searchForm" action="${pageContext.request.contextPath}/admin/" method="post">
								<select name="condition" class="form-select">
									<option value="userId"     ${condition=="userId" ? "selected='selected'":""}>아이디</option>
									<option value="userNickname"   ${condition=="userNickname" ? "selected='selected'":""}>닉네임</option>
									<option value="email"      ${condition=="email" ? "selected='selected'":""}>이메일</option>
									<option value="tel"        ${condition=="tel" ? "selected='selected'":""}>전화번호</option>
								</select>
								<input type="text" name="keyword" class="form-control" value="">
								<input type="hidden" name="enabled" value="${enabled}">
								<input type="hidden" name="page" value="1">
								<button type="button" class="btn" onclick="searchList()">검색</button>
							</form>
						</td>
						<td align="right" width="100">&nbsp;</td>
					</tr>
				</table>
			
			</div>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>

