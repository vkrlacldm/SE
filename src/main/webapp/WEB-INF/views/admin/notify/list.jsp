<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.body-main {
	max-width: 1000px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status === 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패했습니다.");
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function detailedNotify() {
	var dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 삭제 " : function() {
		    	   deleteOk();
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 540,
		  width: 830,
		  title: "카테고리 정보",
		  close: function(event, ui) {
		  }
	});

	let url = "${pageContext.request.contextPath}/admin/notify/detaile";
	let query = "userId="+userId;
	
	const fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateOk() {
	const f = document.deteailedNotifyForm;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	if(! $.trim(f.memo.value)) {
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/notify/updateNotify";
	let query=$("#deteailedNotifyForm").serialize();

	const fn = function(data){
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFun(url, "post", query, "json", fn);
		
	$('#member-dialog').dialog("close");
}

function deleteOk(userId) {
	if(confirm("선택한 카테고리를 삭제 하시겠습니까 ?")) {

	}
	
	$('#member-dialog').dialog("close");
}

function notifyDetaileView() {
	$('#notifyDetaile').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '신고 레시피/댓글 상세',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
		  }
	  });	
}

</script>

<main>
	<h1>신고 레시피/댓글</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2><i class="icofont-comment"></i> 신고 레시피/댓글 </h2>
	    </div>
	    
	    <div class="body-main ms-30">
			<div>
				<ul class="tabs">
					<li id="tab-0" data-tab="0"><i class="icofont-comment"></i> 신고 레시피/댓글 </li>
				</ul>
			</div>
			<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
			
			<table class="table">
					<tr>
						<td align="left" width="50%">
							${dataCount}개(${page}/${total_page} 페이지)
						</td>
					</tr>
			</table>
			
				<table class="table table-border table-list">
					<thead>
						<tr> 
							<th class="wx-60">번호</th>
							<th class="wx-100">분류</th>
							<th class="wx-120">신고 아이디</th>
							<th class="wx-150">신고 사유</th>
							<th class="wx-120">신고 날짜</th>
							<th>처리 내용</th>
							<th class="wx-120">처리 날짜</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}">
						<tr style="height: 100px;" class="hover" onclick="detailedNotify('${dto}');"> 
							<td>2</td>
							<td>댓글</td>
							<td>aaa123</td>
							<td>타인 비방</td>
							<td>2022-06-01</td>
							<td>계정 30일 정지</td>
							<td>2022-06-03</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
						 
				<div class="page-box">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
				</div>
						
				<table class="table">
					<tr>
						<td align="left" width="100">
							<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/notify/list">새로고침</button>
						</td>
						
						<td align="right" width="100">&nbsp;</td>
					</tr>
				</table>
			
			</div>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>

