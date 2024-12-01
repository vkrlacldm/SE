<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<style type="text/css">
img {
	width: 10%;
}

.sort li a.selected img {
    opacity: 0.5;
}

.sort li a img {
    width: 60px;
    height: 60px;
    border-radius: 50%;
}

.sort li a strong {
    position: absolute;
    top: 65px;
    left: 5px;
    right: 5px;
    text-align: center;
    line-height: 1;
}

.body-container {
	max-width: 1300px;
} 

tr {
	border-bottom-style: solid;
}	

.field1 {
	width: 400px;
	float: left;
	padding-top: 0px;
	display: contents;
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


.field2 {
	width: 525px;
	float: right;
}

sort {
    -webkit-text-size-adjust: none;
    color: #2a2a2a;
    margin: 0;
    font-size: 100%;
    list-style: none;
    width: 396px;
    padding: 10px 13px;
    font-family: Microsoft YaHei,'NS';
    box-sizing: border-box;
    height: 270px;
    border: 1px solid #a73f40;
    background: #fff;
    float: left;
    overflow-x: hidden;
    overflow-y: visible;
  
}

.sort a {
    -webkit-text-size-adjust: none;
    list-style: none;
    border: 0;
    outline: none;
    text-decoration: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
    display: block;
    position: relative;
    width: 70px;
    height: 95px;
    text-align: center;
    color: #e66768;
    font-family: Microsoft YaHei,'NSL';
    font-size: 13px;  

}

.field2 dl {
    border: 1px solid #5d5758;
    background: #fff;
    position: relative;
}

.field2 dt {
    height: 57px;
    font-size: 20px;
    padding: 10px 15px;
    font-family: Microsoft YaHei,'NSL';
    box-sizing: border-box;
    color: #5d5758;
    border-bottom: 1px solid #5d5758;
    line-height: 40px\0;
}


.field2 dd ul {
    padding: 12px 0;
    overflow-x: hidden;
    overflow-y: visible;
    box-sizing: border-box;
}

.field2 dd {
    display: contents;
    height: 220px;
    border-radius: 5px;
    border: 1px solid #5d5758;
    background: #fff;
    color: #5d5758;
    font-size: 15px;
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
	display: flex;
	flex-wrap: wrap;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    list-style: none;
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

.field2 dd {
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


.body-title {
    font-size: 23px;
    min-width: 300px;
    font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    margin: 0 0 -5px 0;
    padding-bottom: 5px;
    display: inline-block;
    border-bottom: 3px solid #424951;
}

.btn btn-light {
    padding: 10px;
    border-radius: 12px;
    background: #f44502;
    line-height: 1em;
    color: #fff;
    text-align: center;
    margin-right: 0;
}	

</style>

<script type="text/javascript">
function sendOk() {
	var f = document.frigeForm;
	if(! f.ingredientCodes) {
		return;
	}

	f.action="${pageContext.request.contextPath}/frige/list";
	f.submit();
}
</script>

<script type="text/javascript">
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
	// 재료 클릭 -> 재료칸으로 이동
	$("body").on("click", ".sort li", function() {
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
	
});

</script>


<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h2><img src="${pageContext.request.contextPath}/resources/images/frige.png"> 냉장고 파먹기</h2>
			<h4>냉장고의 재료를 등록 후, 바로 만들 수 있는 레시피를 확인하세요 !</h4>
		</div>
		
		<div class="body-main">
		    
			<form name="frigeForm" method="post">
				<table class="table mt-5 write-form">
		
		           <tr>
						<td class="table-light col-sm-2" scope="row">재료 리스트</td>
						<td>
							<div class="row g-3">
 
						  	<input name="utf8" type="hidden">
								<fieldset class="field1" >	
							<ul class="sort">
								<c:forEach var="vo" items="${list}">
								<li data-id="${vo.ingredientCode}">
									<a ingre_id="71" href="javascript:;">
										<em></em>
										<img src="${pageContext.request.contextPath}/resources/images/ingredient/${vo.ingredientCode}.PNG" alt="">
										<span>
						                <strong><a class="selected">${vo.ingredientName}</a></strong>
						                </span>
									</a>
							 	</li>
  								</c:forEach> 
    						</ul>         
						    			     
					          	</fieldset> 
 
					        
					          <fieldset class="field2">
					            <dl>
					              <dt>
					            	 선택 된 재료
					              </dt>
					              <dd>
					                <ul class="selected-ingre">
					                	
					                </ul>
					              </dd>
					            </dl>
					          </fieldset>

							</div>
						</td>
						
					</tr>	
			
			</table>
			</form>
			
		<div class="col text-end">	
		<button type="button" class="btn btn-light" onclick="sendOk();" style="padding: 10px; border-radius: 12px; background: #f44502; line-height: 1em; color: #fff;">검색</button>
		<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/frige/main';" style="padding: 10px; border-radius: 12px; background: #f44502; line-height: 1em; color: #fff;">다시선택</button>
		</div>

	    </div>
	   

	</div>
 </div>

				