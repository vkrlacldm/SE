<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-container {
	max-width: 800px;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.role==0}">
	function deleteOk(num, mode) {
	    if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
	    	let query = "num="+num+"&mode="+mode+"&${query}";
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

$(function(){
	$(".btnSendContestLike").click(function(){
		let userContestLiked = "${userContestLiked}";
		
		let url = "${pageContext.request.contextPath}/contest/insertContestLike";
		let num = "${dto.num}";
		let query = "num=" + num + "&userContestLiked=" + userContestLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === "true") {
				location.href="${pageContext.request.contextPath}/contest/article?${query}&num=${dto.num}";
				
			} else if(state === "false") {
				alert("관심 등록 처리를 실패했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});
</script>

<body>
	<div class="contest">
	<h2>공모전</h2>
	</div>
</body>

<div class="c-container">
	<div class="contest-title">
		<div class="body-container">
			<h3><i class="icofont-chef"></i>공모전</h3>
		</div>
		<div class="body-main">
				
			<table class="table mb-0">
				<thead>
					<tr>
						<td colspan="2" align="center">
							${dto.subject}
						</td>
					</tr>
					
					<tr>
						<td style="text-align: center;">
							${dto.start_date} ~ ${dto.end_date}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td align="right">
							닉네임 : ${dto.nickName}		
						</td>
						<td align="right">
							작성일 : ${dto.reg_date}
						</td>		
					</tr>
					<tr>
						<td align="center">
							${dto.posterName}
						</td>
					</tr>
					<tr>
						<td align="center">
							${dto.partContent}
						</td>
					</tr>
					
				</tbody>
			</table>
			
			<button type="button" class="btn btn_star btnSendContestLike">
				<span class="ico" style="background-image: url('${pageContext.request.contextPath}/resources/images/${userContestLiked?'fill-star':'star'}.png');">좋아요</span>
				<span class="num" id="ContestLikeCount">${dto.ContestLikeCount}</span>
			</button>
			
			<table class="table table-borderless">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/contest/user/update?contestNum=${dto.contestNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled="disabled">수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.member.userId==dto.userId}">
				    			<button type="button" class="btn btn-light" onclick="deleteOk();">삭제</button>
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
