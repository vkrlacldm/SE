<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
main {
    font-family: 'Noto Sans KR', sans-serif;
    color: #000000; letter-spacing: -0.03em;
}

.body-container {
	max-width: 1300px;
}

.ck.ck-editor {
	max-width: 97%;
}
.ck-editor__editable {
    min-height: 250px;
}
.ck-content .image>figcaption {
	min-height: 25px;
}

.body-title h3 {
	color: #5d5758;
	border-bottom: 3px solid #5d5758;
}

.write-form tr .td1 {
	border-top: 2px solid #5d5758;
}

.table-light {
	--bs-table-bg: #F8EFFB;
	color: #5d5758;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

tbody, tr {
	border-bottom-style: solid;

}

.btn-dark {
	color: #5d5758;
	background-color: #faf7e1;
	border-color: #777071;
}
.btn-dark:hover, .btn-dark:focus, .btn-dark:active {
	color: #5d5758;
	background-color: #faf7e1;
	border-color: #777071;
}
.btn-light {
	color: #5d5758;
	background-color: #faf7e1;
	border-color: #777071;
}
.btn-light:hover, .btn-light:focus, .btn-light:active {
	color: #5d5758;
	background-color: #faf7e1;
	border-color: #777071;
}

.form-check-input:checked {
	background-color: #faf7e1;
	border-color: #5d5758;
}

.field1 {
	width: 400px;
	float: left;
	padding-top: 0px;
}

.field1 {
	position: relative;
}

fieldset {
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}
.sec_recommend form {
	width: 770px;
	overflow: hidden;
	margin: 25px auto;
}

.field1 input {
    box-sizing: border-box;
    width: 595px;
    height: 59px;
    background: #fff;
    border: #5d5758 solid 1px;
    float: left;
    padding-left: 20px;
    font-size: 20px;
    color: #000;
    margin-bottom: 9px;
    outline: none;
}

.field1 .btn_search {
	display: none;
}

input, button, img {
	vertical-align: middle;
}

button, a {
    outline: none;
    text-decoration: none;
    color: #444;
    padding: 0;
    margin: 0;
    cursor: pointer;
}

button {
    font-family: Microsoft YaHei,'NS','돋움',Dotum,'굴림',Gulim,Helvetica,sans-serif;
    font-size: 12px;
}

.btn-list {
	color: #ffffff; background-color: #f44502; font-size: 14px;
	border-radius: 9999px; padding: 13px 40px; margin: 0 10px;
}
.btn-white {
	color: #f44502; background-color: #ffffff; font-size: 14px;
	border-radius: 9999px; padding: 13px 30px; border: 1px solid #f44502;
}

.field1 input {
	box-sizing: border-box;
    width: 500px;
    height: 59px;
    background: #fff;
    border: #5d5758 solid 1px;
    float: left;
    padding-left: 20px;
    font-size: 20px;
    color: #000;
    margin-bottom: 9px;
    outline: none;
    line-height: 64px\0;
}

.field1>ul {
	height: 270px;
    border: 1px solid #5d5758;
    background: #fff;
    float: left;
    overflow-x: hidden;
    overflow-y: visible;
}

.field2 {
	width: 525px;
	float: right;
	padding-top: 0px;
	margin-top: 0px;
}

.big_sort {
	width: 190px;
    margin-right: 9px;
    box-sizing: border-box;
    padding-left: 0px;
}

.big_sort li a {
    color: #5d5758;
    display: block;
    line-height: 44px;
    padding-left: 18px;
}

.big_sort li {
    font-size: 15px;
    border-bottom: 1px solid #5d5758;
    list-style: none;
}

.small_sort {
	width: 300px;
    height: 270px;
    float: left;
    padding: 10px 13px;
    box-sizing: border-box;
    font-family: Microsoft YaHei,'NS';
    box-sizing: border-box;
}

.small_sort li {
    float: left;
    margin-top: 0px;
    margin-right: 8px;
    margin-bottom: 16px;
    margin-left: 8px;
    list-style: none;
    cursor: pointer;
    width: 47px;
}

.field2 dl {
    border: 1px solid #5d5758;
    background: #fff;
    position: relative;
}

.field2 dt {
    height: 59px;
    font-size: 20px;
    padding: 10px 15px;
    font-family: Microsoft YaHei,'NSL';
    box-sizing: border-box;
    color: #5d5758;
    border-bottom: 1px solid #5d5758;
    line-height: 40px\0;
}

dt {
	display: block;
}

.field2 dd {
	height: 270px;
	box-sizing: border-box;
}

.field2 dd ul {
    height: 270px;
    padding: 12px 0;
    overflow-x: hidden;
    overflow-y: visible;
    box-sizing: border-box;
}

.field2 dd .btn {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 12px 16px;
    background-color: #fff;
}

ol, ul {
	list-style: none;
}

.inner {
	position: relative;
    width: 1024px;
    margin: auto;

}


ul {
	display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.field2 dd ul li.no-content {
    float: none;
    font-size: 13px;
    color: #5d5758;
    text-align: center;
    margin-top: 80px;
    padding: 0;
}

.field2 dd ul li {
    float: left;
    margin-bottom: 9px;
}

.no-content {
    text-align: center; 
    color: #b7b7b7;
    font-size: 20px; 
    padding-top: 100px; 
}

.no-content {
    color: #b7b7b7;
    text-align: center; 
}

.field2 dd .btn button {
    width: 150px;
    height: 48px;
    border-radius: 5px;
    border: 1px solid #5d5758;
    background: #fff;
    color: #5d5758;
    font-size: 15px;
    line-height: 54px\0;
}

.content {
	list-style: none;
	margin: 0 5px;
}

.close { display:inline-block; *display:inline; cursor: pointer;  }
.close:after { display: inline-block; content: "\00d7"; font-size:15pt; }

.inimage {
	width: 40px;
	height: 45px;
	object-fit: cover;
}

.write-form p  {
	font-size: 12px;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<style type="text/css">
.write-form .img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 45px;
	height: 45px;
	border-radius: 45px;
	background-image: url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat : no-repeat;
	background-size : cover;
}
</style>

<script type="text/javascript">

function sendOk() {
	var f = document.recipeForm;
	var str;

	// 값 가져오기
	// window.editor.getData();
	// 값 셋팅
	    // window.editor.setData('<p>example</p>');
	
	if(! f.caseNum.value) {
		
		f.caseNum.focus();
		return;
	}
	
	if(! f.countryNum.value) {
		
		f.countryNum.focus();
		return;
	}
	
	if(! f.recipeSubject.value) {
		
		f.recipeSubject.focus();
		return;
	}
	
	var mode = "${mode}";
	if(mode != "update" && f.selectFile.value == "") {
		
		f.selectFile.focus();
		return;
	}
	
	if(! f.recipeServing.value) {
		
		f.recipeServing.focus();
		return;
	}
	
	if(! f.ingredientCodes) {
		
		return;
	}
	
	if(! f.recipeLevel.value) {
		
		f.recipeLevel.focus();
		return;
	}
	
	str = window.editor.getData().trim();
    if(! str) {
        window.editor.focus();
        return;
    }
	f.recipeContent.value = str;

	f.action="${pageContext.request.contextPath}/recipe/${mode}";
	f.submit();
}

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
				alert("요청 처리가 실패했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function() {
	var img = "${dto.imageFilename}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/recipe/" + img;
		$(".write-form .img-viewer").empty();
		$(".write-form .img-viewer").css("background-image", "url("+img+")");
	}
	
	$(".write-form .img-viewer").click(function(){
		$("form[name=recipeForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=recipeForm] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".write-form .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/recipe/" + img;
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

$(function() {
	$("body").on("click", ".big_sort .selected", function() {
		$(".big_sort .selected").css({"color":"black","background":"#fff", "font-weight":"100"});
		
		$(this).css("background-color", "#f8f9fa");
		$(this).css({"font-weight":"700"});
		
		$(".small_sort").empty();
		
		var ingredientCode = $(this).attr("data-id");
		
		var url = "${pageContext.request.contextPath}/recipe/ingredient";
		var query = "ingredientCode=" + ingredientCode;
		var s;
		
		const fn = function(data) {
			$(data.list).each(function(index, item) {
				let ingredientCode = item.ingredientCode;
				let ingredientName = item.ingredientName;
				
				s = "<li data-id='"+ ingredientCode +"'><img class='inimage' src='${pageContext.request.contextPath}/resources/images/ingredient/" + ingredientCode + ".PNG'";
				s += " style='disply:block;'><p style='text-align:center'>" + ingredientName +"</p>";
				s += "</li>";
				
				$(".small_sort").append(s);
			})	
		};
		
		ajaxFun(url, "get", query, "json", fn);
		
	});
	
});

$(function() {
	// 재료 클릭 -> 선택된 재료칸으로 이동
	$("body").on("click", ".small_sort li", function() {
		var ingredientCode = $(this).attr("data-id");
		var ingredientName = $(this).text();
		var s;
		
		var flag = false;
		$(".selected-ingre").find("input[name=ingredientCodes]").each(function(){
			if($(this).val() == ingredientCode) {
				flag = true;
				return false;
			}
		});
		
		if( flag ) {
			return false;
		}
		
		s = "<div class='ingredient'><li class='content' data-id='" + ingredientCode + "'>" + ingredientName + " <span class='close'></span></li>"
		s += "<input type='hidden' name='ingredientCodes' value='"+ ingredientCode +"'></div>";
		
		$(".selected-ingre").append(s);
		
	});
	
	// x 누르면 해당 값 사라짐
	$("body").on("click", ".close", function() {
		var ingredientCode = $(this).parent().attr("data-id");
		var ingredientName = $(this).parent().text();
		
		$(this).parent().parent().remove();
	});
});


</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h2><i class="bi bi-book-half"></i> 레시피 등록하기 </h2>
		</div>
		
		<div class="body-main">
		    
			<form name="recipeForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">상황별</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1">
									<select name="caseNum" class="form-select">
										<option value="">:: 상황별 요리 ::</option>
										<c:forEach var="vo" items="${caseCategory}">
											<option value="${vo.caseNum}"  ${dto.caseNum==vo.caseNum?"selected='selected'":""}>${vo.caseName}</option>									
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">나라별</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1">
									<select name="countryNum" class="form-select">
										<option value="">:: 나라별 요리 ::</option>
										<c:forEach var="vo" items="${countryCategory}">
											<option value="${vo.countryNum}"  ${dto.countryNum==vo.countryNum?"selected='selected'":""}>${vo.countryName}</option>									
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목 입 력</td>
						<td>
							<input type="text" name="recipeSubject" class="form-control" value="${dto.recipeSubject}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.nickName}</p>
						</td>
					</tr>
					
					<tr>
						<td  class="table-light col-sm-2" scope="row"> 메인 사진 </td>
						<td>
							<div class="img-viewer"></div>
							<input type="file" name="selectFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row">음 식 정 보</td>
						<td>
							<div class="row g-3">
							  <div class="col-sm-7" style="float: left; width:60%;">
							    <input type="number" name="recipeServing" class="form-control" value="${dto.recipeServing}" placeholder="조리분량">
							  </div>
							  
							  <div style="float:left; width:9%; padding-top: 10px; padding-left: 0px;">
							  	<h6>인분</h6>
							  </div>

							
						  	<input name="utf8" type="hidden">
								<fieldset class="field1">
						            <input type="text" class="search-ingre ui-autocomplete-input" placeholder="재료리스트" disabled="disabled">
						            
						            <ul class="big_sort">
						            	<c:forEach var="vo" items="${ingredientCategory}">
						                 	<li><a class="selected" data-id="${vo.ingredientCode}">${vo.ingredientName}</a></li>
						                 </c:forEach>
						            </ul>
						            
						            <ul class="small_sort"> </ul>
						            
					          	</fieldset>
					          <fieldset class="field2">
					            <dl>
					              <dt>
					            	 선택 된 재료
					              </dt>
					              <dd>
					                <ul class="selected-ingre">
					                	<c:forEach var="dto" items="${list}">
					                		<div class='ingredient'>
					                			<li class='content' data-id='${dto.ingredientCode}'> ${dto.ingredientName}
					                				<span class='close'></span>
					                			</li>
												<input type="hidden" name='ingredientCodes' value='${dto.ingredientCode}'>
											</div>
					                	</c:forEach>
					                </ul>
					              </dd>
					            </dl>
					          </fieldset>

							</div>
						</td>
						
					</tr>	
					<tr>
						<td class="table-light col-sm-2" scope="row">조리시간</td>
						<td>
							<input type="number" style="width:23%" name="recipeTime" class="form-control" value="${dto.recipeTime}"
							 placeholder="ex) 30분 -> 30">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">난 이 도</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1" style="width:15%;">
									<select name="recipeLevel" class="form-select">
										<option value="">:: 난이도 ::</option>
										<option value="상" ${dto.recipeLevel=="상"?"selected='selected'":""}>상</option>
										<option value="중" ${dto.recipeLevel=="중"?"selected='selected'":""}>중</option>
										<option value="하" ${dto.recipeLevel=="하"?"selected='selected'":""}>하</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2" scope="row">요 리 내 용</td>
						<td>
							<div class="editor">
								${dto.recipeContent}
							</div>
							<input type="hidden" name="recipeContent">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode == 'update'?'수정':'등록'}완료&nbsp;<i class="bi bi-check2"></i></button>	
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/recipe/feed';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="recipeNum" value="${dto.recipeNum}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="imageFilename" value="${dto.imageFilename}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>

<script type="text/javascript">
	ClassicEditor
		.create( document.querySelector( '.editor' ), {
			fontFamily: {
	            options: [
	                'default',
	                '맑은 고딕, Malgun Gothic, 돋움, sans-serif',
	                '나눔고딕, NanumGothic, Arial'
	            ]
	        },
	        fontSize: {
	            options: [
	                9, 11, 13, 'default', 17, 19, 21
	            ]
	        },
			toolbar: {
				items: [
					'heading','|',
					'fontFamily','fontSize','bold','italic','fontColor','|',
					'alignment','bulletedList','numberedList','|',
					'imageUpload','insertTable','sourceEditing','blockQuote','mediaEmbed','|',
					'undo','redo','|',
					'link','outdent','indent','|',
				]
			},
			image: {
	            toolbar: [
	                'imageStyle:full',
	                'imageStyle:side',
	                '|',
	                'imageTextAlternative'
	            ],
	
	            // The default value.
	            styles: [
	                'full',
	                'side'
	            ]
	        },
			language: 'ko',
			ckfinder: {
		        uploadUrl: '${pageContext.request.contextPath}/image/upload' // 업로드 url (post로 요청 감)
		    }
		})
		.then( editor => {
			window.editor = editor;
		})
		.catch( err => { 
			console.error( err.stack );
		});
</script>
