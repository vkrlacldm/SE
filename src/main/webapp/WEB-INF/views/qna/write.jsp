<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
main {
    background-color: #f7f8fb;
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
}

</style>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function sendOk() {
    var f = document.qnaForm;
	var str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/qna/${mode}";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><img src="${pageContext.request.contextPath}/resources/images/qna2.png"></i> 질문과 답변 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="qnaForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">유&nbsp;&nbsp;&nbsp;&nbsp;형</td>
						<td> 
							<select name="categoryNum" class="form-select" ${(mode=="update" && not empty dto.parent) || mode=="answer" ? "disabled='disabled'":"" }>
								<c:forEach var="vo" items="${listCategory}">
									<option value="${vo.categoryNum}" ${vo.categoryNum==dto.categoryNum?"selected='selected'":""}>${vo.category}</option>
								</c:forEach>
							</select>
		        
							<c:if test="${(mode=='update' && not empty dto.parent) || mode=='answer'}">
								<input type="hidden" name="categoryNum" value="${dto.categoryNum}">
							</c:if>
						</td>
					</tr>
				
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}"
								${(mode=="update" && not empty dto.parent) || mode=="answer" ? "readonly='readonly'":"" }>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>
		
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">공개여부</td>
						<td class="py-3"> 
							<input type="radio" name="questionPrivate" id="questionPrivate1" class="form-check-input" 
								value="0" ${empty dto || dto.questionPrivate==0?"checked='checked'":"" }>
							<label class="form-check-label" for="questionPrivate1">공개</label>
							<input type="radio" name="questionPrivate" id="questionPrivate2" class="form-check-input"
								value="1" ${dto.questionPrivate==1?"checked='checked'":"" }>
							<label class="form-check-label" for="questionPrivate2">비공개</label>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">내 용</td>
						<td>
							<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light" style="background: #FFFFCC; color: #808080;">다시입력</button>
							<button type="button" class="btn btn-light" style="background: #FFFFCC; color: #808080;" onclick="location.href='${pageContext.request.contextPath}/qna/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
							<c:if test="${mode=='answer'}">
								<input type="hidden" name="parent" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>					
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>