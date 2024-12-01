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
    background: #f44502;
    line-height: 1em;
    color: #fff;
    text-align: center;
    margin-right: 0;
    border: none;	
}


</style>

<script type="text/javascript">
function sendOk() {
    var f = document.dailyForm;
	var str;
	
	str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }
    
    str = f.dailyLink.value.trim();
    if(!str) {
        alert("참고링크를 입력하세요. ");
        f.dailyLink.focus();
        return;
    }

    str = f.dailyContent.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.dailyContent.focus();
        return;
    }
    
    var mode = "${mode}";
    if( (mode === "write") && (!f.selectFile.value) ) {
        alert("이미지 파일을 추가 하세요. ");
        f.selectFile.focus();
        return;
	}    

    f.action = "${pageContext.request.contextPath}/daily/${mode}";
    f.submit();
}	

$(function() {
	var img = "${dto.dailyPhotoName}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/daily/" + img;
		$(".write-form .img-viewer").empty();
		$(".write-form .img-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .img-viewer").click(function(){
		$("form[name=dailyForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=dailyForm] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".write-form .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/daily/" + img;
				$(".write-form .img-viewer").css("background-image", "url("+img+")");
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
				$(".write-form .img-viewer").css("background-image", "url("+img+")");
			}
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".write-form .img-viewer").empty();
			$(".write-form .img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><img src="${pageContext.request.contextPath}/resources/images/dailywrite.png"> 오늘의 한 끼를 작성해주세요 ! </h3>
		</div>
		
		<div class="body-main">
		
			<form name="dailyForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="${dto.subject}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row">참고 링크</td>
						<td>
							<input type="text" name="dailyLink" class="form-control" value="${dto.dailyLink}">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="dailyContent" id="dailyContent" class="form-control">${dto.dailyContent}</textarea>
						</td>
					</tr>
					
					
					<tr>
						<td class="table-light col-sm-2" scope="row">이미지</td>
						<td>
							<div class="img-viewer"></div>
							<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					

				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/daily/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="dailyNum" value="${dto.dailyNum}">
								<input type="hidden" name="dailyPhotoNum" value="${dto.dailyPhotoNum}">
								<input type="hidden" name="dailyPhotoName" value="${dto.dailyPhotoName}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
