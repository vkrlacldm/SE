<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-main {
	max-width: 1000px;
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

function searchList() {
	const f = document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action="${pageContext.request.contextPath}/admin/chefManage/sales";
	f.submit();
}

function deleteOk(userId) {
	if(confirm("선택한 계정을 삭제 하시겠습니까 ?")) {

	}
	
	$('#member-dialog').dialog("close");
}

</script>

<main>
	<h1>쉐프 수익 내역/정산</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="icofont-money"></i> 쉐프 수익 내역/정산 </h2>
			
	    </div>
	    
	    <div class="body-main ms-30">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="icofont-money"></i> 쉐프 수익 내역/정산</li>
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
							<th class="wx-60">번호</th>
							<th class="wx-80">아이디</th>
							<th class="wx-80">닉네임</th>
							<th class="wx-110">전화번호</th>
							<th class="wx-110">등록레시피수</th>
							<th class="wx-110">팔로워수</th>
							<th class="wx-120">판매된 클래스수</th>
							<th class="wx-110">수익금</th>
							<th>이메일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}">
						<tr> 
							<td>1</td>
							<td>lee</td>
							<td>이자바</td>
							<td>010-1111-2222</td>
							<td>20개</td>
							<td>300명</td>
							<td>5개</td>
							<td>100,000원</td>
							<td>aaa@naver.com</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
						 
				<div class="page-box">
					${dataCount == 0 ? "등록된 자료가 없습니다." : paging}
				</div>
				
				<table class="table">
					<tr>
						<td align="left" width="100">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/chefManage/sales">새로고침</button>
						</td>
						<td align="center">
							<form name="searchForm" action="${pageContext.request.contextPath}/admin/chefManage/chefList" method="post">
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
					</tr>
				</table>
				
			</div>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>

