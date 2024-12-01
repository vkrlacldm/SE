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
	<h1>신고 레시피/댓글</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="icofont-comment"></i> 신고 레시피/댓글 </h2>
	    </div>
	    
	    <div class="body-main ms-30">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="icofont-comment"></i> 신고 레시피/댓글 </li>
				</ul>
			</div>
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
			
				<table class="table table-border table-list">
					<thead>
						<tr> 
							<th class="wx-60">번호</th>
							<th>분류</th>
							<th>신고 아이디</th>
							<th>신고 사유</th>
							<th>신고 날짜</th>
							<th>처리 내용</th>
							<th>처리 날짜</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}">
						<tr class="hover" onclick=""> 
							<td>2</td>
							<td>댓글</td>
							<td>aaa123</td>
							<td>타인 비방</td>
							<td>2022-06-01</td>
							<td>계정 30일 정지</td>
							<td>2022-06-03</td>
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

