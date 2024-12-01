<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.share_on .lst_sns dd {
    width: 171px;
    height: 31px;
    border-top: 1px solid #e1e1e1;
    border-left: 1px solid #e1e1e1;
    border-right: 1px solid #e1e1e1;
    border-bottom: 1px solid #e1e1e1;
}


.lst_recipe :not(.home) .option>div {
    width: 122px;
    height: 100%;
    float: left;
    border-left: 1px solid #ddd;
}

.btn_search1 {
    font-family: Microsoft YaHei,'NSB';
    font-size: 18px;
    border: none;
    width: 130px;
    height: 50px;
    display: inline-block;
    color: black;
    border-radius: 5px;
    cursor: pointer;
    margin: 0 8px;
    border-style:solid;
    line-height: 60px\0;
}

.option1 :not(.home) {
    width: 244px;
    position: absolute;
    bottom: 0;
    height: 27px;
    border-top: 1px solid #e1e1e1;
    text-align: right;
}

.lst_recipe .option .like :not(.home){
    position: relative;
    background: url(${pageContext.request.contextPath}/resources/images/heart103.png) 9px center no-repeat;
	pointer-events: none;
}
</style>

<link rel="stylesheet" media="all" href="https://d1hk7gw6lgygff.cloudfront.net/assets/application-682cc53e75f30d25b8797c565d629fff63bb6f2c784b32e24dbf6e96aa387096.css" />

<style>
.finder li span {
    display: block;
    position: relative;
    cursor: pointer;
    font-size: 14px;
    color: #6f6e6e;
    font-family: Microsoft YaHei,'NS';
    box-sizing: border-box;
    font-size: 13px;
    border-top: 1px solid #e1e1e1;
    padding: 7px 0 9px 33px;
    padding: 8px 0 4px 33px\0;
    
}
</style>

<script>
var caseNumList=[];
$(function(){
	$(".lst_check input[name=caseNum]").click(function(){
		var caseNum = $(this).val();
		if($(this).is(":checked")) {
			var out = "<span data-caseNum='"+caseNum+"'>"+$(this).attr("data-name")+"</span>";
			
			$("#cat-result").append(out);

			caseNumList.push(caseNum);
		} else {
			$("#cat-result span").each(function(index, item){
				if(caseNum == $(this).attr("data-caseNum")) {
					$(this).remove();

					caseNumList.splice(caseNumList.indexOf(caseNum),1);
					return false;
				}
			});
		}
		
	});
});

$(function(){
	$(".lst_check input[name=countryNum]").click(function(){
		var countryNum = $(this).val();
		if($(this).is(":checked")) {
			var out = "<span data-countryNum='"+countryNum+"'>"+$(this).attr("data-name")+"</span>";
			
			$("#cat-result").append(out);
			
			countryNumList.push(countryNum);
		} else {
			$("#cat-result span").each(function(index, item){
				if(countryNum == $(this).attr("data-countryNum")) {
					$(this).remove();
					
					countryNumList.splice(countryNumList.indexOf(countryNum),1);
					return false;
				}
			});
		}
		
	});
});

$(function(){
	$(".lst_check input[name=parent]").click(function(){
		var parent = $(this).val();
		if($(this).is(":checked")) {
			var out = "<span data-parent='"+parent+"'>"+$(this).attr("data-name")+"</span>";
			
			$("#cat-result").append(out);
			
			parentList.push(parent);
		} else {
			$("#cat-result span").each(function(index, item){
				if(parent == $(this).attr("data-parent")) {
					$(this).remove();
					
					parentList.splice(parentList.indexOf(parent),1);
					return false;
				}
			});
		}
		
	});
});

$(function(){
	$(".lst_check input[name=recipeLevel]").click(function(){
		var recipeLevel = $(this).val();
		if($(this).is(":checked")) {
			var out = "<span data-recipeLevel='"+recipeLevel+"'>"+$(this).attr("data-name")+"</span>";
			
			$("#cat-result").append(out);
			
			recipeLevelList.push(recipeLevel);
		} else {
			$("#cat-result span").each(function(index, item){
				if(recipeLevel == $(this).attr("data-recipeLevel")) {
					$(this).remove();
					
					recipeLevelList.splice(recipeLevelList.indexOf(recipeLevel),1);
					return false;
				}
			});
		}
		
	});
});

$(function(){
	$(".dd_range input[name=recipeTime]").click(function(){
		var recipeTime = $(this).val();
		if($(this).is(":clicked")) {
			var out = "<span data-recipeTimeValue='"+recipeTimeValue+"'>"+$(this).attr("data-name")+"</span>";
			
			$("#cat-result").append(out);
			
			recipeTimeList.push(recipeTime);
		} else {
			$("#cat-result span").each(function(index, item){
				if(recipeTimeValue == $(this).attr("data-recipeTimeValue")) {
					$(this).remove();
					
					recipeTimeList.splice(recipeTimeList.indexOf(recipeTime),1);
					return false;
				}
			});
		}
		
	});
});

$(function(){
	var tmp="${recipeTime}";
	$("#recipeTimeRange").attr("title", tmp);
	$("#recipeTimeRange").val(tmp);
	$(".recipeTimeValue").html( tmp + "분");
	var out="";
	if(tmp!=null && tmp!=""){
		out = "<span>"+tmp+"분 이내</span>";
	}
	
	$("#tmp").html("");
	$("#tmp").append(out);
	
	
	$("#recipeTimeRange").change(function(){
		$("#recipeTimeRange").attr("title", $(this).val());
		$(".recipeTimeValue").html( $(this).val() + "분");
		var out = "<span>"+$(this).val()+"분 이내</span>";
		$("#tmp").html("");
		$("#tmp").append(out);
		
	});
});

$(function(){
	$("#sortCtl").change(function(){
		var s = $(this).val();
		document.searchForm.sortField.value = s;
		 searchList();
	});
});


function searchList() {
	var f = document.searchForm;
	f.submit();
}


$(function(){
	var caseNumList = "${caseNumList}";
	if(caseNumList) {
		caseNumList=caseNumList.replace(/\s/g, "");
		caseNumList=caseNumList.replace(/\[/g, "");
		caseNumList=caseNumList.replace(/\]/g, "");
		caseNumList = caseNumList.split(",");
		var out, caseNum;
		for(var i=0; i<caseNumList.length; i++) {
			$("input[name=caseNum]").each(function(){
				caseNum = $(this).val(); 
				if(caseNum == caseNumList[i]) {
					$(this).prop("checked", true);
					
					out = "<span data-caseNum='"+caseNum+"'>"+$(this).attr("data-name")+"</span>";
					$("#cat-result").append(out);
					
					return false;
				}
			});
		}
	}
});


$(function(){
	var countryNumList = "${countryNumList}";
	if(countryNumList) {
		countryNumList=countryNumList.replace(/\s/g, "");
		countryNumList=countryNumList.replace(/\[/g, "");
		countryNumList=countryNumList.replace(/\]/g, "");
		countryNumList = countryNumList.split(",");
		var out, countryNum;
		for(var i=0; i<countryNumList.length; i++) {
			$("input[name=countryNum]").each(function(){
				countryNum = $(this).val(); 
				if(countryNum == countryNumList[i]) {
					$(this).prop("checked", true);
							
					out = "<span data-countryNum='"+countryNum+"'>"+$(this).attr("data-name")+"</span>";
					$("#cat-result").append(out);
					return false;
				}
			});
		}
	}
});


$(function(){
	var parentList = "${parentList}";
	if(parentList) {
		parentList = parentList.replace(/\s/g, "");
		parentList = parentList.replace(/\[/g, "");
		parentList = parentList.replace(/\]/g, "");
		parentList = parentList.split(",");
		var out, parent;
		for(var i=0; i<parentList.length; i++) {
			$("input[name=parent]").each(function(){
				parent = $(this).val(); 
				if(parent == parentList[i]) {
					$(this).prop("checked", true);
								
					out = "<span data-parent='"+parent+"'>"+$(this).attr("data-name")+"</span>";
					$("#cat-result").append(out);
					return false;
				}
			});
		}
	}
});

$(function(){
	var recipeTimeList = "${recipeTimeList}";
	if(recipeTimeList) {
		recipeTimeList = recipeTimeList.replace(/\s/g, "");
		recipeTimeList = recipeTimeList.replace(/\[/g, "");
		recipeTimeList = recipeTimeList.replace(/\]/g, "");
		recipeTimeList = recipeTimeList.split(",");
		var out, recipeTime;
		for(var i=0; i<recipeTimeList.length; i++) {
			$("input[name=recipeTime]").each(function(){
				recipeTime = $(this).val(); 
				if(recipeTime == recipeTimeList[i]) {
					$(this).prop("clicked", true);
								
				
					$("#cat-result").append(out);
					return false;
				}
			});
		}
	}
});



$(function(){
	var recipeLevelList = "${recipeLevelList}";
	if(recipeLevelList) {
		recipeLevelList = recipeLevelList.replace(/\s/g, "");
		recipeLevelList = recipeLevelList.replace(/\[/g, "");
		recipeLevelList = recipeLevelList.replace(/\]/g, "");
		recipeLevelList = recipeLevelList.split(",");
		var out, recipeLevel;
		for(var i=0; i<recipeLevelList.length; i++) {
			$("input[name=recipeLevel]").each(function(){
				recipeLevel = $(this).val(); 
				if(recipeLevel == recipeLevelList[i]) {
					$(this).prop("checked", true);

					out = "<span data-recipeLevel='"+recipeLevel+"'>"+$(this).attr("data-name")+"</span>";
					$("#cat-result").append(out);
					return false;
				}
			});
		}
	}
});

</script>

</head>


<body>

<hr>

	<div id="container">
		


<div id="dialog-message" title="알림" class="haemuk-dialog-with-jquery-ui">
</div>

<div id="content">
	<section class="sec_finder">
		<h1>원하는 카테고리를 선택해주시면, 더 정확한 레시피 결과를 보실 수 있습니다.</h1>
		<!-- [D] 상단 검/탐색 영역 -->
	<form name="searchForm" class="result-filter" method="post" action="${pageContext.request.contextPath}/category/list">
	
		<input name="utf8" type="hidden" value="✓">
		<input id="likeCount" type="hidden" value="">
		<div class="finder">
			<dl class="dl_first">
				<dt> <h3>상황에 맞는 요리</h3> </dt>
				<dd>
					<ul class="lst_check">
						<li class="">
							<span>
								<input type="checkbox" name="caseNum" value="1" data-name='야식'> 야식  
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="caseNum" value="2" data-name='간식'> 간식 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="caseNum" value="3" data-name='반찬'> 반찬 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox" name="caseNum" value="4" data-name='메인'> 메인 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="caseNum" value="5" data-name='베이킹'> 베이킹
							</span>
						</li>
					</ul>
				</dd>
			</dl>
			
			
			<dl class="">
				<dt><h3>나라별 요리</h3></dt>
				<dd>
					<ul class="lst_check">
						<li class="">
							<span>
								<input type="checkbox" name="countryNum" value="1" data-name='한식'> 한식 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="countryNum" value="2" data-name='중식'> 중식 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="countryNum" value="3" data-name='일식'> 일식 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="countryNum" value="4" data-name='양식'> 양식 
							</span>
						</li>
					</ul>
				</dd>
			</dl>
			<dl class="">
				<dt><h3>재료별 요리</h3></dt>
				<dd>
					<ul class="lst_check">
						<li class="">
							<span>
								<input type="checkbox" name="parent" value="100" data-name='양념'> 양념
								<!--  
								<input type="checkbox" name="parent" value="100" data-name='고춧가루'> 고춧가루
								-->
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="1" data-name='육류'> 육류
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="2" data-name='채소'> 채소 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="3" data-name='해산물'> 해산물 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="4" data-name='과일'> 과일 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="5" data-name='가공/유제품'> 가공/유제품 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="6" data-name='면'> 면
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="parent" value="7" data-name='기타'> 기타 
							</span>
						</li>
					</ul>
				</dd>
				
			</dl>
			
			<dl class="">
				<dt><h3>조리시간별 요리</h3></dt>
				
				<dd class="dd_range">
					<div class="filter-module">
					    
					        레시피 조리시간 선택<br>
					        <input type="range" id="recipeTimeRange" name="recipeTime" min="10" max="120" step="1">
					        <span class="recipeTimeValue">10분</span> <br>
						
					</div>
				</dd>
			</dl>
			<dl>
				<dt><h3>난이도</h3></dt>
				
				<!-- [D] jQuery UI Slider -->
				<dd>
					<ul class="lst_check">
						<li class="">
							<span>
								<input type="checkbox" name="recipeLevel" value="하" data-name='하'> 초급요리 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="recipeLevel" value="중" data-name='중'> 중급요리 
							</span>
						</li>
						<li class="">
							<span>
								<input type="checkbox"  name="recipeLevel" value="상" data-name='상'> 고급요리 
							</span>
						</li>
					</ul>
				</dd>
					
          <div class="filter-module">
						<input type="hidden" id="filter-search" name="name" value="">
					</div>
					<div class="filter-module">
						<input type="hidden" id="filter-sort" name="sort">
					</div>
					<div class="filter-module">
					</div>
				</dd>
			</dl>
		</div>
		<!-- //상단 검/탐색 영역 -->
		
		<!-- [D] 검색 결과 바 -->
		<table class="bar_result">
			<tbody>
				<tr>
					<th scope="row">
						<button type="button" class="btn_search1" onclick="searchList()">검색하기</button>
					</th>
					<th scope="row">검색 조건</th>
					<td id="cat-result"><span id="tmp"></span>
						
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="sortField" value="date">
</form>
		<!-- [D] 로딩프로그레스 위치이동 150318 -->
		<div class="loading_progress" style="display: none;">
      <img alt="Loading..." src="https://d1hk7gw6lgygff.cloudfront.net/assets/_img/result/img_loading-753788afc4df57392b551424446da3f0eb50cd993ba5311a48c755368129032f.gif" />
		</div>
		<!-- //로딩프로그레스 -->
		<div class="recipes">
			<div class="inner result">
							
				<div class="tit_area">
					<h2>조건에 맞는 레시피가 <strong>${categolist.size()}</strong>개 있습니다.</h2>
					<div class="sort_area">
						<select class="sort-selector" id="sortCtl" name="sort">
							<option value="date" ${sortField=='date' ? 'selected="selected"':'' }>최신순 정렬</option>
							<option value="rnk" ${sortField=='rnk' ? 'selected="selected"':'' }>좋아요순 정렬</option>
						</select>
					</div>
				</div>
				
				<ul class="lst_recipe">	
<!-- test start2 -->



<c:forEach var="dto" items="${categolist}">		
						<li>
							<!--  
							<a class="call_recipe thmb" href="${pageContext.request.contextPath}/category/article?recipeNum=${dto.recipeNum}">
							<img src="${pageContext.request.contextPath}/uploads/recipe/${dto.recipePhotoName}" />
							-->
							<a class="call_recipe thmb" href="${pageContext.request.contextPath}/recipe/article?page=4&recipeNum=${dto.recipeNum}">
							  <!--  
						      <img src="${pageContext.request.contextPath}/recipe/article?page=4&recipeNum=${dto.recipePhotoName}" />
						       -->
							  <img src="${pageContext.request.contextPath}/uploads/recipe/${dto.recipePhotoName}" />
							  
							</a>
							<span class="author">
									<a href="">
									<c:choose>
										<c:when test="${dto.memberImageName eq null}">
											<img class="profileImage" src="${pageContext.request.contextPath}/resources/images/profileImage.png" style="width: 50px; height: 60px;">
										</c:when>
										<c:otherwise>
											<img class="profileImage" src="${pageContext.request.contextPath}/uploads/photo/${dto.memberImageName}" style="width: 50px; height: 60px;">
										</c:otherwise>
									</c:choose>  
							</a>			
								<strong><a href="${pageContext.request.contextPath}/mypage/main?userId=${dto.userId}">${dto.nickName}</a></strong> 
							</span>
							<p>
						    <a class="call_recipe" href="${pageContext.request.contextPath}/recipe/article?page=4&recipeNum=${dto.recipeNum}">
						      
						      <strong>${dto.recipeSubject}</strong>
						    </a>
						  </p>
							<div class="option">
						      <div class="time"><a href="${pageContext.request.contextPath}/recipe/article?page=4&recipeNum=${dto.recipeNum}">${dto.recipeTime}분</a></div>
						          <div class="like">
						            <form class="create-like" action="/bookmarks" accept-charset="UTF-8" method="post">
						              <input name="utf8" type="hidden" value="&#x2713;" disabled="disabled"/>
						              <input type="hidden" name="authenticity_token" value="IKoL9u5XW1f2tht6YR5GynRDxKGSg/Jq4tArJZKxzbi1CP0D6amAO6CDxExwRRWkAbQ+85Pr2HYSQZNj2/so6g==" disabled="disabled" readonly/>
						              <input type="hidden" name="linked_model_type" value="Recipe" disabled="disabled" readonly/>
						              <input type="hidden" name="linked_model_id" value="5979" disabled="disabled" readonly/>
						              <button type="submit" class="btn_like" disabled="disabled">${dto.likeCount}명</button>

									</form>
						    </div>
						</form>          </div>
						<!--   
								<div class="share">
									<a href="javascript:;" class="call-share">공유</a>
								</div>
							</div>
							
							<div class="share_on">
								<a href="#" class="btn_close"></a>
								<dl class="lst_sns">
									<dt>공유하기</dt>
									<dd><a href="javascript:;" class="btn_link url-share" data-url="http://haemukja.com/recipes/5979">링크</a></dd>
								</dl>
							</div>
					
						-->
						
						</li>
</c:forEach>



<!-- test end2 -->





<!--  
<script type="text/javascript" charset='utf-8' src="${pageContext.request.contextPath}/resources/js/category4.js"></script>
-->
				</ul>
		

			</div>
		</div>
	</section>
</div>


	</div>

</body>
</html>
