<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
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
    margin: 0 0 16px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 16px;
    margin-left: 0px;
    list-style: none;
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
	height: 277px;
	box-sizing: border-box;
}

.field2 dd ul {
    height: 205px;
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


</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">
function sendOk() {
	var f = document.boardForm;
	var str;
	
	if(! f.groupCategoryNum.value) {
		alert("분류 명을 선택하세요. ");
		f.groupCategoryNum.focus();
		return;
	}

	if(! f.categoryNum.value) {
		alert("과목 명을 선택하세요. ");
		f.categoryNum.focus();
		return;
	}
        
	if(! f.subject.value.trim()) {
		alert("제목을 입력하세요. ");
		f.subject.focus();
		return;
	}

	// 값 가져오기
	// window.editor.getData();
	// 값 셋팅
	    // window.editor.setData('<p>example</p>');
	
	str = window.editor.getData().trim();
    if(! str) {
        alert("내용을 입력하세요. ");
        window.editor.focus();
        return;
    }
	f.content.value = str;

	f.action="${pageContext.request.contextPath}/sbbs/${mode}";
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

$(function(){
	$("form select[name=groupCategoryNum]").change(function(){
		var groupCategoryNum = $(this).val();
		$("form select[name=categoryNum]").find('option').remove().end()
				.append("<option value=''>:: 과목 선택 ::</option>");
		
		if(! groupCategoryNum) {
			return false;
		}
		
		var url="${pageContext.request.contextPath}/sbbs/subclass";
		var query="categoryNum="+groupCategoryNum;
		
		var fn=function(data) {
			$.each(data.subclassList, function(index, item){
				var categoryNum = item.categoryNum;
				var category = item.category;
				var s = "<option value='"+categoryNum+"'>"+category+"</option>";
				$("form select[name=categoryNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h2><i class="bi bi-book-half"></i> 레시피 등록하기 </h2>
		</div>
		
		<div class="body-main">
		    
			<form name="boardForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="table-light col-sm-2" scope="row">분 류 (1)</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1">
									<select name="groupCategoryNum" class="form-select">
										<option value="">:상황에 맞는 요리:</option>
										<option value="1">간식/야식</option>
										<option value="2">술안주</option>
										<option value="3">해장요리</option>
										<option value="4">손님 접대 요리</option>
										<option value="5">파티/명절 요리</option>
									</select>
								</div>
								<div class="col-sm-4 ps-1">
									<select name="categoryNum" class="form-select">
										<option value="">:: 선택 목록 ::</option>
										<c:forEach var="vo" items="${subclassList}">
											<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.category}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">분 류 (2)</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1">
									<select name="groupCategoryNum" class="form-select">
										<option value="">:나라별 요리:</option>
										<option value="1">한식 요리</option>
										<option value="2">중식 요리</option>
										<option value="3">양식 요리</option>
										<option value="4">인도/동남아 요리</option>
										<option value="5">멕시칸 요리</option>
										<option value="6">퓨전 요리</option>
									</select>
								</div>
								<div class="col-sm-4 ps-1">
									<select name="categoryNum" class="form-select">
										<option value="">:: 선택 목록 ::</option>
										<c:forEach var="vo" items="${subclassList}">
											<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.category}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">제 목 입 력</td>
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
						<td class="table-light col-sm-2" scope="row">요 리 내 용</td>
						<td>
							<div class="editor">${dto.content}</div>
							<input type="hidden" name="content">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">음 식 정 보</td>
						<td>
							<div class="row g-3">
							  <div class="col-sm-7" style="float: left; width:60%;">
							    <input type="text" class="form-control" placeholder="음식명을 입력하세요.">
							  </div>
							  <div class="col-sm-3" style="float: left; width:30%;">
							    <input type="text" class="form-control" placeholder="조리분량">
							  </div>
							  <div style="float:left; width:9%; padding-top: 10px; padding-left: 0px;">
							  	<h6>인분</h6>
							  </div>
<!-- 주의 문구탓에 주석, 나중에 작업할때 풀고 작업할것. -->
<!-- 
							  <form action="" accept-charset="UTF-8" method="get">
							  	<input name="utf8" type="hidden" value="✓">
							  	<input type="hidden" name="sort" value="rlv">
								<fieldset class="field1">
					            <input type="text" class="search-ingre ui-autocomplete-input" placeholder="재료명으로 검색해보세요." autocomplete="off">
					            <button class="btn_search">검색</button>
					            <ul class="big_sort">
					                  <li><a class="selected" data-id="1" href="javascript:;">곡류</a></li>
					                  <li><a class="" data-id="2" href="javascript:;">면/만두류</a></li>
					                  <li><a class="" data-id="3" href="javascript:;">빵류</a></li>
					                  <li><a class="" data-id="4" href="javascript:;">과자류</a></li>
					                  <li><a class="" data-id="5" href="javascript:;">떡류</a></li>
					                  <li><a class="" data-id="6" href="javascript:;">감자/고구마류</a></li>
					                  <li><a class="" data-id="7" href="javascript:;">묵/두부</a></li>
					                  <li><a class="" data-id="8" href="javascript:;">콩/견과류</a></li>
					                  <li><a class="" data-id="9" href="javascript:;">채소류</a></li>
					                  <li><a class="" data-id="10" href="javascript:;">과일류</a></li>
					                  <li><a class="" data-id="11" href="javascript:;">고기류</a></li>
					                  <li><a class="" data-id="12" href="javascript:;">햄/소시지</a></li>
					                  <li><a class="" data-id="13" href="javascript:;">계란류</a></li>
					                  <li><a class="" data-id="14" href="javascript:;">어패류</a></li>
					                  <li><a class="" data-id="15" href="javascript:;">해조류</a></li>
					                  <li><a class="" data-id="16" href="javascript:;">유제품/치즈류</a></li>
					                  <li><a class="" data-id="17" href="javascript:;">양념류</a></li>
					                  <li><a class="" data-id="18" href="javascript:;">초콜렛/사탕</a></li>
					                  <li><a class="" data-id="19" href="javascript:;">음료/주류</a></li>
					            </ul>
					            
					            <ul class="small_sort">
					             
					            	<li><a href="javascript:;" ingre_id="2"><em></em><img src="${pageContext.request.contextPath}/resources/images/rice.jpg"><strong>귀리</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="3"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>귀리가루</strong></a></li>
					                <li><a href="javascript:;" ingre_id="4323"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>누룽지</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="4317"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>머핀믹스</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="14"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>메밀가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="20"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>밀가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="144"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>백미</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="39"><em></em><img src="${pageContext.request.contextPath}//resources/images/rice.jpg"><strong>보리</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="49"><em></em><img src="../resources/images/rice.jpg"><strong>보리밥</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="42"><em></em><img src="../resources/images/rice.jpg"><strong>보리쌀</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="30"><em></em><img src="../resources/images/rice.jpg"><strong>부침가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="4318"><em></em><img src="../resources/images/rice.jpg"><strong>브라우니믹스</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="31"><em></em><img src="../resources/images/rice.jpg"><strong>빵가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="4416"><em></em><img src="../resources/images/rice.jpg"><strong>식빵믹스</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="150"><em></em><img src="../resources/images/rice.jpg"><strong>쌀가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="169"><em></em><img src="../resources/images/rice.jpg"><strong>쌀밥</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="178"><em></em><img src="../resources/images/rice.jpg"><strong>쌀죽</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="62"><em></em><img src="../resources/images/rice.jpg"><strong>옥수수가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="70"><em></em><img src="../resources/images/rice.jpg"><strong>옥수수전분</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="73"><em></em><img src="../resources/images/rice.jpg"><strong>옥수수통조림</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="118"><em></em><img src="../resources/images/rice.jpg"><strong>율무</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="23"><em></em><img src="../resources/images/rice.jpg"><strong>제과용밀가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="22"><em></em><img src="../resources/images/rice.jpg"><strong>제빵용밀가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="174"><em></em><img src="../resources/images/rice.jpg"><strong>즉석밥</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="55"><em></em><img src="../resources/images/rice.jpg"><strong>찐옥수수</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="53"><em></em><img src="../resources/images/rice.jpg"><strong>찰옥수수</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="183"><em></em><img src="../resources/images/rice.jpg"><strong>참치죽</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="165"><em></em><img src="../resources/images/rice.jpg"><strong>찹쌀</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="167"><em></em><img src="../resources/images/rice.jpg"><strong>찹쌀가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="4324"><em></em><img src="../resources/images/rice.jpg"><strong>찹쌀풀</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="26"><em></em><img src="../resources/images/rice.jpg"><strong>치킨가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="134"><em></em><img src="../resources/images/rice.jpg"><strong>쿠스쿠스</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="138"><em></em><img src="../resources/images/rice.jpg"><strong>퀴노아</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="35"><em></em><img src="../resources/images/rice.jpg"><strong>통밀</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="25"><em></em><img src="../resources/images/rice.jpg"><strong>튀김가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="27"><em></em><img src="../resources/images/rice.jpg"><strong>핫케익가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="175"><em></em><img src="../resources/images/rice.jpg"><strong>햇반</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="154"><em></em><img src="../resources/images/rice.jpg"><strong>현미</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="157"><em></em><img src="../resources/images/rice.jpg"><strong>현미가루</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="173"><em></em><img src="../resources/images/rice.jpg"><strong>현미밥</strong></a></li>
					            	<li><a href="javascript:;" ingre_id="158"><em></em><img src="../resources/images/rice.jpg"><strong>흑미</strong></a></li></ul>
					         
					          </fieldset>
					          <fieldset class="field2">
					            <dl>
					              <dt>
					              <h3>내가 선택한 재료목록</h3>
					              </dt>
					              <dd>
					                <ul class="selected-ingre">
					                  <li class="no-content">재료를 선택해주세요.</li>
					                </ul>
					                <div class="btn">
					                  <button type="submit">재료등록확정</button>
					                </div>
					              </dd>
					            </dl>
					          </fieldset>
          					</form>
-->
							</div>
						</td>
					</tr>				
					<tr>
						<td class="table-light col-sm-2" scope="row">조리시간</td>
						<td>
							<input type="text" style="width:23%" name="" class="form-control" value=""
							 placeholder="총 분소요를 숫자만 써주세요.">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">태 그</td>
						<td>
							<input type="text" style="width:45%" name="" class="form-control" value=""
							 placeholder="주재료,목적 등을 태그로 남겨주세요. 예) 돼지고기, 술안주">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2" scope="row">난 이 도</td>
						<td>
							<div class="row">
								<div class="col-sm-4 pe-1" style="width:15%;">
									<select name="groupCategoryNum" class="form-select">
										<option value="">:요리 난이도:</option>
										<option value="1">쉬운요리</option>
										<option value="2">보통요리</option>
										<option value="3">어려운 요리</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/sbbs/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="group" value="${group}">
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
