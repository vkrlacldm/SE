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
	<h1>자주 묻는 질문</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="icofont-info-square"></i> 자주 묻는 질문 </h2>
	    </div>
	    
	    <div class="body-main ms-30">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="icofont-info-square"></i> 자주 묻는 질문 </li>
				</ul>
			</div>
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
			
				<table class="table table-border table-list">
					<thead>
						<tr> 
							<th class="wx-60">분류번호</th>
							<th>질문</th>
							<th>답변</th>
							<th>변경</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}">
						<tr class="hover" onclick=""> 
							<td>3</td>
							<td>쉐프 등록은 기준이 있나요?</td>
							<td>쉐프 등록은 무료 레시피 10개 이상 등록을 하고, 팔로우 100명이상인 회원만 클래스 등록이 가능합니다. </td>
							<td>
								<a>수정</a> | 
								<a>삭제</a>
							</td>
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
						
						<td align="right" width="100">&nbsp;</td>
					</tr>
				</table>
			
			</div>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>

