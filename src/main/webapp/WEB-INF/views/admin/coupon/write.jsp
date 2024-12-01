<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">

<style type="text/css">

main { background-color: #f7f8fb; font-family: 'Noto Sans KR', sans-serif; color: #000000; letter-spacing: -0.03em; }
.c-container { width: 1320px; margin: 0 auto; }
.write-container { background-color: #fff; border: 1px solid gray; border-radius: 10px; padding: 20px; }
.btn-container { text-align: center; margin-top: 30px; }

.write-title { text-align: center; font-size: 30px; font-weight: 700; }
.write-main { margin-top: 30px; }

table { width: 70%; margin: 0 auto; font-size: 18px; font-weight: 400; }
table tr { height: 70px; }
table tr td:first-child { width: 15%; text-align: center; }
textarea { width: 700px; height: 100px; }

.couponImage { width: 50px; border-radius: 9999px; }

.btn-search { border: 1px solid #eaeaea; }
.btn-submit { color: #ffffff; background-color: #f44502; font-size: 14px; border-radius: 9999px; padding: 13px 30px; margin: 0 10px; }
.btn-white { color: #f44502; background-color: #ffffff; font-size: 14px; border-radius: 9999px; padding: 13px 30px; border: 1px solid #f44502; }

.img-item { border-radius: 9999px; }
.img-grid { display: grid; grid-template-columns: repeat(auto-fill, 65px); grid-gap: 5px; }
.img-grid .item { object-fit: cover; width: 65px; height: 65px; cursor: pointer; }
.img-box { max-width: 600px; box-sizing: border-box; display: flex; flex-direction: row; flex-wrap: nowrap; }
.img-box img { width: 65px; height: 65px; margin-right: 5px; flex: 0 0 auto; cursor: pointer; border-radius: 9999px; }
</style>

<script type="text/javascript">
function sendOk() {
    var f = document.couponForm;
	var str;
	
    str = f.eventNum.value.trim();
    if(!str) {
        alert("이벤트번호를 입력하세요. ");
        f.eventNum.focus();
        return;
    }

    str = f.couponName.value.trim();
    if(!str) {
        alert("쿠폰이름을 입력하세요. ");
        f.couponName.focus();
        return;
    }
    
    str = f.couponContent.value.trim();
    if(!str) {
        alert("쿠폰내용을 입력하세요. ");
        f.couponContent.focus();
        return;
    }
    
    str = f.discountPrice.value.trim();
    if(!str) {
        alert("할인금액을 입력하세요. ");
        f.discountPrice.focus();
        return;
    }
    
    str = f.createTime.value.trim();
    if(!str) {
        alert("쿠폰 발급일을 입력하세요. ");
        f.createTime.focus();
        return;
    }

    str = f.expireTime.value.trim();
    if(!str) {
        alert("쿠폰 만료일을 입력하세요. ");
        f.expireTime.focus();
        return;
    }
    
    var mode = "${mode}";
    if( (mode === "write") && (!f.selectFile.value) ) {
        alert("쿠폰 사진을 추가 하세요.");
        f.selectFile.focus();
        return;
    }
    
    f.action = "${pageContext.request.contextPath}/admin/coupon/${mode}";
    f.submit();
}

<c:if test="${mode=='update'}">
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		var $img = $(this);
		var fileNum = $img.attr("data-fileNum");
		var url="${pageContext.request.contextPath}/admin/coupon/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$img.remove();
		}, "json");
	});
});
</c:if>

$(function(){
	var sel_files = [];
	
	$("body").on("click", ".write-form .img-add", function(coupon){
		$("form[name=couponForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=couponForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			var dt = new DataTransfer();
			for(file of sel_files) {
				dt.items.add(file);
			}
			document.couponForm.selectFile.files = dt.files;
			
	    	return false;
	    }
	    
		// 유사 배열을 배열로 변환
	    const fileArr = Array.from(this.files);
	
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
	        reader.onload = e => {
	        	$img.attr("src", e.target.result);
	        };
	        
	        reader.readAsDataURL(file);
	        
	        $(".img-grid").append($img);
	    });
		
		var dt = new DataTransfer();
		for(file of sel_files) {
			dt.items.add(file);
		}
		document.couponForm.selectFile.files = dt.files;		
	    
	});
	
	$("body").on("click", ".write-form .img-item", function(coupon) {
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		var filename = $(this).attr("data-filename");
		
	    for(var i = 0; i < sel_files.length; i++) {
	    	if(filename === sel_files[i].name){
	    		sel_files.splice(i, 1);
	    		break;
			}
	    }
	
		var dt = new DataTransfer();
		for(file of sel_files) {
			dt.items.add(file);
		}
		document.couponForm.selectFile.files = dt.files;
		
		$(this).remove();
	});
});
</script>

<div class="c-container">
	<div class="write-container">	
		<div class="write-title">
			<span>쿠폰 등록</span>
		</div>
		
		<div class="write-main">
			<form name="couponForm" method="post" enctype="multipart/form-data">
				<table class="write-form">
					<tr>
						<td>이벤트 번호</td>
						<td style="padding: 0 20px;">
							<input type="text" name="eventNum" class="form-control" value="${dto.eventNum}">
						</td>
					</tr>

					<tr>
						<td>쿠폰 이름</td>
						<td style="padding: 0 20px;">
							<textarea name="couponName" id="couponName" class="form-control">${dto.couponName}</textarea>
						</td>
					</tr>
					
					<tr>
						<td>쿠폰 내용</td>
						<td style="padding: 0 20px;">
							<textarea name="couponContent" id="couponContent" class="form-control">${dto.couponContent}</textarea>
						</td>
					</tr>
					
					<tr>
						<td>할인 금액</td>
						<td style="padding: 0 20px;">
							<input type="text" name="discountPrice" class="form-control" value="${dto.discountPrice}">
						</td>
					</tr>
					
					<tr>
						<td>쿠폰 발급일</td>
						<td style="padding: 0 450px 0 20px;">
							<input type="date" name="createTime" id="createTime" class="form-control" value="${dto.createTime}" placeholder="쿠폰 발급일">
						</td>
					</tr>
					
					<tr>
						<td>쿠폰 만료일</td>
						<td style="padding: 0 450px 0 20px;">
							<input type="date" name="expireTime" id="expireTime" class="form-control" value="${dto.expireTime}" placeholder="쿠폰 만료일">
						</td>
					</tr>
					
					<tr>
						<td>이미지</td>
						<td style="padding: 0 20px;">
							<div class="img-grid">
								<img class="item img-add festImage" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</div>
							<input type="file" name="selectFile" accept="image/*" multiple="multiple" style="display: none;" class="form-control">
						</td>
					</tr>

					<c:if test="${mode=='update'}">
						<tr>
							<td>등록이미지</td>
							<td style="padding: 0 20px;"> 
								<div class="img-box">
									<c:forEach var="vo" items="${listFile}">
										<img src="${pageContext.request.contextPath}/uploads/coupon/${vo.fileName}"
											class="delete-img"
											data-fileNum="${vo.fileNum}">
									</c:forEach>
								</div>
							</td>
						</tr>
					</c:if>

				</table>
				
				<div class="btn-container">
					<button type="button" class="btn btn-submit" onclick="sendOk();">${mode=='update'?'수정완료':'등록완료'}</button>
					<button type="button" class="btn btn-white" onclick="location.href='${pageContext.request.contextPath}/admin/coupon/list';">${mode=='update'?'수정취소':'등록취소'}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.eventnum}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</div>
			</form>
		
		</div>
	</div>
</div>