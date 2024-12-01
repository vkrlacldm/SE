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

<style type="text/css">

.write-form .img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 45px;
	height: 45px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}

h3 img {
	width: 7%;
}

.btn {
    padding: 10px; border-radius: 12px;
    background: #FFFFCC;
    line-height: 1em;
    color: #808080;
    text-align: center;
    margin-right: 0;
    border: none;	
}


</style>

<script type="text/javascript">
function sendOk() {
    var f = document.noticeForm;
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

    f.action = "${pageContext.request.contextPath}/notice/${mode}";
    f.submit();
}

<c:if test="${mode=='update'}">
	function deleteFile(fileNum) {
		var url="${pageContext.request.contextPath}/notice/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
	}
</c:if>
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><img src="${pageContext.request.contextPath}/resources/images/notice2.png"> 공지사항 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="noticeForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">공지여부</td>
						<td class="py-3">
							<input type="checkbox" name="notice" id="notice" class="form-check-input" value="1" ${dto.notice==1 ? "checked='checked' ":"" } >
							<label class="form-check-label" for="notice"> 공지</label>
						</td>
					</tr>        
        
					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2" scope="row" style="background: #FFFFCC; color: #808080;">내 용</td>
						<td>
							<textarea name="content" id="content" class="form-control">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" style="background: #FFFFCC; color: #808080;">첨 부</td>
						<td> 
							<input type="file" name="selectFile" multiple="multiple" class="form-control">
						</td>
					</tr>
					
					<c:if test="${mode=='update'}">
						<c:forEach var="vo" items="${listFile}">
							<tr id="f${vo.fileNum}">
								<td class="table-light col-sm-2" scope="row">첨부된파일</td>
								<td> 
									<p class="form-control-plaintext">
										<a href="javascript:deleteFile('${vo.fileNum}');"><i class="bi bi-trash"></i></a>
										${vo.originalFilename}
									</p>
								</td>
							</tr>
						</c:forEach> 
					</c:if>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>