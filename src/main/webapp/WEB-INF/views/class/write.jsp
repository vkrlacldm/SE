<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.ck.ck-editor { margin-top: 20px; }
.ck-editor__editable {
    min-height: 250px;
}
.ck-content .image>figcaption {
	min-height: 25px;
}
.clearFix:after { content: ''; display: block; clear: both; }
.insertClass { background: #f1f1f2; padding: 20px 0; }
.insertClass * {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 0; margin: 0; box-sizing: border-box;
}

.insertClass .full { width: 1320px; background: #fff; border: 1px solid #e6e7e8; padding: 0 50px; margin: 0 auto; }
.insertClass .full > h3 { font-size: 30px; font-weight: 700; margin: 20px 0; }

.insertClass .full form .line { margin-top: 25px; }
.insertClass .full form .line > p { display: inline-block; width: 200px; font-size: 22px; font-weight: 700; vertical-align: middle; }
.insertClass .full form .line .sm-p { width: 100px; }
.insertClass .full form .line input { display: inline-block; width: 500px; font-size: 18px; height: 50px; vertical-align: middle; background: #f5f5f5; border: 1px solid #e1e1e1; padding: 6px 12px; margin-right: 60px;}
.insertClass .full form .line #price { width: 350px; }
.insertClass .full form .line #serving { width: 240px; }
.insertClass .full form .line .serving-txt { font-size: 22px; vertical-align: middle; margin: 0 60px 0 -50px; }
.insertClass .full form .line select { display: inline-block; font-size: 22px; padding: 8px 2px; border: 1px solid #e1e1e1; border-radius: 4px; background: #f5f5f5; vertical-align: bottom; }

.insertClass .full form .line .img-grid,
.insertClass .full form .line .preview-grid,
.insertClass .full form .line .video-grid { display: inline-block; margin-right: 60px; }
.insertClass .full form .line .videoLength { display: inline-block; width: 70px; height: 40px; margin-left: 20px; margin-right: 10px; }
.insertClass .full form .line input[name=previewFile],
.insertClass .full form .line input[name=videoFile] { padding-top: 8px; }

.insertClass .full form .btn-area { text-align: center; margin: 80px 0 40px; }
.insertClass .full form .btn-area button { display: inline-block; font-size: 24px; font-weight: 700; border-radius: 3px; color: #fff; background: #46ae4f; border: 1px solid #497725; padding: 12px 50px; margin: 0 4px; }
.insertClass .full form .btn-area button:last-child { background: #ff5d2c; }

.img-grid { position: relative; }
.img-grid img { cursor: pointer; }
.img-grid .img-item { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }

.img-box {
	max-width: 600px;

	box-sizing: border-box;
	display: flex; 
	flex-direction: row; 
	flex-wrap: nowrap;
	overflow-x: auto;
}
.img-box img {
	width: 65px; height: 65px;
	margin-right: 5px;
	flex: 0 0 auto;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/ckeditor5/ckeditor.js"></script>

<script type="text/javascript">
function sendOk() {
	var f = document.writeClass;
	var str;
	
	str = f.classSubject.value.trim();
	if(! str) {
		alert("클래스 제목을 입력 하세요.");
		f.classSubject.focus();
		return;
	}
	
	str = f.price.value.trim();
	if(! str) {
		alert("가격을 입력 하세요.");
		f.price.focus();
		return;
	}
	
	str = f.serving.value.trim();
	if(! str) {
		alert("인분 수를 입력 하세요.");
		f.serving.focus();
		return;
	}
	
	if(!f.imageFile.value) {
		alert("완성된 음식 사진을 추가 하세요.");
		f.imageFile.focus();
		return;
	}
	if(!f.previewFile.value) {
		alert("미리보기 영상을 추가 하세요.");
		f.imageFile.focus();
		return;
	}
	if(!f.videoFile.value) {
		alert("클래스 영상을 추가 하세요.");
		f.imageFile.focus();
		return;
	}
	
	str = window.editor.getData().trim();
    if(! str) {
        alert("클래스 상세내용을 입력 하세요. ");
        window.editor.focus();
        return;
    }
	f.classContent.value = str;
	
	f.action="${pageContext.request.contextPath}/class/write";
	f.submit();
}

$(function(){
	var sel_files = [];
	
	$("body").on("click", ".line .img-add", function(event){
		$("form[name=writeClass] input[name=imageFile]").trigger("click"); 
	});
	
	$("form[name=writeClass] input[name=imageFile]").change(function(){
		if(! this.files) {
			var dt = new DataTransfer();
			for(file of sel_files) {
				dt.items.add(file);
			}
			document.writeClass.imageFile.files = dt.files;
			
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
		document.writeClass.imageFile.files = dt.files;		
	    
	});
	
	$("body").on("click", ".line .img-item", function(event) {
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
		document.writeClass.imageFile.files = dt.files;
		
		$(this).remove();
	});
});
</script>

<div class="insertClass">
	<div class="full">
		<h3>클래스 등록</h3>
		<form name="writeClass" method="post" enctype="multipart/form-data">
			<div class="line">
				<p>클래스 제목</p>
				<input type="text" name="classSubject" placeholder="클래스 제목을 입력하세요.">
			</div>
			<div class="line">
				<p>가 격</p>
				<input type="text" name="price" id="price" placeholder="클래스 가격을 입력하세요. 예) 15000">
			</div>
			<div class="line">
				<p>인분 수</p>
				<input type="text" name="serving" id="serving" placeholder="인분 수를 입력하세요. 예) 3">
				<span class="serving-txt">인분</span>
				<p class="sm-p">카테고리</p>
				<select name="category">
					<option>카테고리 선택</option>
					<c:forEach var="vo" items="${category}">
						<option value="${vo.class_Category}" ${dto.category==vo.class_Category?"selected='selected'":""}>${vo.classCname}</option>
					</c:forEach>
				</select>				
			</div>
			<div class="line">
				<p>완성 된 음식 사진</p>
				<div class="img-grid">
					<img src="${pageContext.request.contextPath}/resources/images/file-attach.gif" class="item img-add">
				</div>
				<input type="file" name="imageFile" accept="image/*"  style="display: none;" class="form-control">
			</div>
			<div class="line">
				<p>미리보기 영상</p>
				<input type="file" name="previewFile" accept="video/*" >
			</div>
			<div class="line">
				<p>클래스 영상</p>
				<input type="file" name="videoFile" accept="video/*" id="fullVideo">
				<video id="hiddenArea" style="display: none;"></video>
				<span>동영상 길이  </span>
				<input type="text" name="videoTime" readonly="readonly" class="videoLength" value="">
				<span>분</span>
			</div>
			<div class="line">
				<p>클래스 상세내용</p>
				<div class="editor">
				
				</div>
				<input type="hidden" name="classContent">
			</div>
			
			<div class="btn-area">
				<button type="button" class="btn btn-submit" onclick="sendOk();">등록완료</button>
				<button type="button" class="btn btn-white" onclick="location.href='${pageContext.request.contextPath}/class/list';">등록취소</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
var videoFile = document.getElementById("fullVideo");
var videoArea = document.getElementById("hiddenArea");
videoFile.addEventListener("change", function(){
	var video = videoFile.files[0];
	var inputVideo = URL.createObjectURL(video);
	videoArea.setAttribute("src", inputVideo);
});

videoArea.addEventListener('loadedmetadata', function(){
	let length = videoArea.duration;
	let minute = Math.ceil(length / 60);
	document.querySelector('input[name=videoTime]').setAttribute('value',minute);
});
</script>

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


