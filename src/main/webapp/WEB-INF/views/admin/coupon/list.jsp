<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-main {
	max-width: 1100px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}
</script>

<main>
	<h1>쿠폰등록</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="icofont-sale-discount"></i> 쿠폰등록 </h2>
	    </div>
	    
	    <div class="body-main ms-30">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="icofont-sale-discount"></i> 쿠폰등록 </li>
				</ul>
			</div>
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
			
				<table class="table">
					<tr>
						<td align="left" width="50%">
							${dataCount}개(${page}/${total_page} 페이지)
						</td>
					</tr>
				</table>
					
				<table class="table table-border table-list">
					<thead>
						<tr> 
							<th class="wx-110">이벤트 번호</th>
							<th class="wx-120">쿠폰 이름</th>
							<th>쿠폰 내용</th>
							<th class="wx-100">할인 금액</th>
							<th class="wx-100">쿠폰 발급일</th>
							<th class="wx-100">쿠폰 만료일</th>
						</tr>
					</thead>
					
					<tbody>
						
						<tr> 
							<c:forEach var="dto" items="${list}">
							<td>${dto.eventNum}</td>
							<td>${dto.couponName}</td>
							<td>${dto.couponContent}</td>
							<td>${dto.discountPrice}</td>
							<td>${dto.createTime}</td>
							<td>${dto.expireTime}</td>
							</c:forEach>
						</tr>
						
					</tbody>
				</table>
						 
				<div class="page-box">
					${dataCount == 0 ? "등록된 쿠폰 없습니다." : paging}
				</div>
						
				<table class="table">
					<tr>
						<td align="left" width="100">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/coupon/list">새로고침</button>
						</td>
						
						<td align="right" width="150">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/coupon/write'">등록하기</button>
						</td>
					</tr>
				</table>
			
			</div>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>
