<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-container {
	height: 200px;
	text-align: center;
}
.c-container { background: #fff; border-radius: 24px; padding: 35px 0; width: 1000px; margin: 0 auto; }

.participation {
	width: 200px; 
	height: 60px;
	padding: 10px; 
	border-radius: 12px; 
	background: #f44502; 
	color: #fff; 
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	margin: auto;
	display: block;
}

main {
    background-color: #f7f8fb;
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    
}

h3 {
	margin-left: 30px;
	text-align: left;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
<c:if test="${sessionScope.member.role==0}">
	function deleteOk() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
	    	let query = "contestNum=${dto.contestNum}&${query}";
		    let url = "${pageContext.request.contextPath}/contest/delete?" + query;
	    	location.href = url;
		}
	}
</c:if>
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

</script>

<div class="c-container">
	<div class="contest-title">
		<h3><i class="icofont-chef"></i>공모전</h3>
		
		<div class="body-main">
				
			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center" style="font-size: 20px;">
							${dto.subject}
						</td>
					</tr>
					
					<tr>
						<td style="text-align: right;">
							${dto.start_date} ~ ${dto.end_date}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td align="center">
							${dto.posterName}
						</td>
					</tr>
					
					<tr>
						<td align="center" style="text-align: center; font-size: 17px;">
							${dto.contestContent}
						</td>
					</tr>
					
					<tr>
						<td align="center">
							<c:choose>
								<c:when test="${dto.fileName != null}">
									<img src="${pageContext.request.contextPath}/uploads/event/${dto.fileName}">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${sessionScope.member.userId=dto.userId}">
									<button type="button" class="participation" onclick="location.href='${pageContext.request.contextPath}/contest/user/write">공모전 참가하기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="participation" disabled="disabled">공모전 참가하기</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					
				</tbody>
			</table>
			
			
			
			<table class="table table-borderless">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.role == 0}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/contest/update?contestNum=${dto.contestNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.role == 0}">
				    			<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/contest/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
		</div>
	</div>	
</div>
