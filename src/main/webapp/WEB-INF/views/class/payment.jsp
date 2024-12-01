<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.paymentbtn {
	
}

</style>


<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">

function sendOk() {
	var f = document.payment;
	
	f.action="${pageContext.request.contextPath}/payment/pay";
	f.submit();
	
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
	$('.agree').on('click', function() {
		var valueCheck = $('.agree:checked').val();
		console.log(valueCheck);
		if ( valueCheck == 'yes' ) {
	        $('.paymentbtn').attr('disabled', false); 
	    } else {
	    	$('.paymentbtn').attr('disabled', true); 
	    }
		
	});
});

$(function() {
	$("form select[name=couponlist]").change(function() {
		let eventNum = $(this).val();
		
		$(".coupon").empty();
		$(".price").empty();
		
		if(eventNum == 0) {
			let price = ${dto.price};
			
			l = "<strong>" + price + "</strong>"
			l += "<input type='hidden' name='price' value='"+ (price) +"'>"
			
			$(".price").append(l);
			
			return false;
		}
		
		var url = "${pageContext.request.contextPath}/payment/coupon";
		var query = "eventNum=" + eventNum;
		
		const fn = function(data) {
			$(data.list).each(function(index, item) {
				let eventNum = item.eventNum;
				let couponName = item.couponName;
				let discountprice = item.discountprice;
				let price = ${dto.price};
				let totalprice = price - discountprice;
				
				console.log(eventNum);
				
				if(totalprice < 0) {
					totalprice = 0;
				}
				
				s = "<div class='text-success'><h6 class='my-0'>쿠폰</h6>";
				s += "<small>" + couponName + "</small></div>";
				s += "<span class='text-success'>" + discountprice + "원 할인 </span>";
				s += "<input type='hidden' name='eventNum' value='" + eventNum + "'>'";
				
				$(".coupon").append(s);
				
				l = "<strong>" + (totalprice) + "</strong>"
				l += "<input type='hidden' name='price' value='"+ (totalprice) +"'>"
				
				$(".price").append(l);
				
			});
		};

		ajaxFun(url, "get", query, "json", fn);
		
	});
});

</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<form method="post" name="payment">
    <div class="row g-5" style="width: 1000px; margin: 0 auto;">
    
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">주문한 클래스</span>
          <span class="badge bg-primary rounded-pill">1</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">${dto.classSubject}</h6>
              <small class="text-muted">${dto.classUser}</small>
            </div>
            <span class="text-muted">${dto.price}</span>
          </li>
          
          <!-- 쿠폰 -->
          <li class="list-group-item d-flex justify-content-between bg-light">
          	<div class="coupon">
          		
          	</div>
          </li>
          
          <li class="list-group-item d-flex justify-content-between">
            <span>총 금액</span>
            <div class="price">
            	<strong>${dto.price}</strong>
            </div>
          </li>
        </ul>

       
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">주문서</h4>
        
          
            <div class="col-12">
              <label for="userId" class="form-label">아이디</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="userId" id="userId" placeholder="${sessionScope.member.userId}" readonly="readonly">
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>
            
            <div class="my-4"></div>
            
            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="username" id="username" placeholder="${sessionScope.member.userName}" readonly="readonly">
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>
            
			<div class="my-4"></div>
            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" name="email" id="email" value="${sessionScope.member.email}">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>
          
	          <div class="my-4"></div>
	            
	            <div class="col-12">
	              <label for="username" class="form-label">쿠폰</label>
	              <div class="input-group has-validation">
	              	<select name="couponlist" class="form-select">
						<option value="0">:: 쿠폰목록 ::</option>
							<c:forEach var="vo" items="${list}">
								<option value="${vo.eventNum}">${vo.couponName}&nbsp;&nbsp;${vo.discountprice}원 할인</option>								
							</c:forEach>
					</select>
	              	<div class="invalid-feedback">
	                  Your username is required.
	                </div>
	              </div>
	            </div>
          
          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="agree" name="check-info" id="check-info" value="yes">
            <label class="form-check-label" for="save-info">주문에 동의하십니까?</label>
          </div>

          <div class="my-4"></div>
          
          <div>
         	 <input type="hidden" class="form-control" name="classCode" id="classCode" value="${dto.classCode}">
	         <button type="button" class="paymentbtn w-100 btn btn-primary btn-lg" onclick="sendOk();" disabled="disabled">결제하기</button>
		  	 
		  </div>
        
      </div>
     
    </div>
    </form>
    
    
    
