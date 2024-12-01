<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-container {
	height: 200px;
	text-align: center;
}
.e-container { background: #fff; border-radius: 24px; padding: 35px 0; width: 1000px; margin: 0 auto; }

.coupon {
	width: 150px; 
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
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.role==0}">
	function deleteOk() {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
	    	let query = "eventNum=${dto.eventNum}&${query}";
		    let url = "${pageContext.request.contextPath}/event/delete?" + query;
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

<div class="e-container">
	<div class="event-title">
		<h3><i class="icofont-sale-discount"></i>할인 이벤트</h3>
		
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
							${dto.startTime} ~ ${dto.expireTime}
						</td>
					</tr>
				</thead>
				
				<tbody>			
					<tr>
						<td colspan="2" style="text-align: center; font-size: 17px;">
							${dto.eventContent}
						</td>
						
					</tr>
					
					<tr>
						<td align="center">
							<c:forEach  var="item" items="${listFile}">
								<c:choose>
									<c:when test="${not empty item.fileName}">
										<img src="${pageContext.request.contextPath}/uploads/event/${item.fileName}">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/resources/images/noimage.png">
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${sessionScope.member.userId=dto.userId}">
									<button type="button" class="coupon">쿠폰 받기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="coupon" disabled="disabled">쿠폰 받기</button>
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
								<button class="btn btn-light" type="button" onclick="location.href='${pageContext.request.contextPath}/event/update?eventNum=${dto.eventNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.role == 0}">
								<button class="btn btn-light" type="button" onclick="deleteOk();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled="disabled">삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/event/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
		</div>
	</div>	
</div>
