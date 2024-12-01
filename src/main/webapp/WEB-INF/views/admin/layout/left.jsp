<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 메뉴 활성화
$(function() {
    var url = window.location.pathname;
    var urlRegExp = new RegExp(url.replace(/\/$/, '') + "$");  
    $('nav>ul>li a').each(function() {
  	  if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
            $(this).addClass('active');
        }
    });
});
</script>

<nav>
	<header>
		<span></span>
		관리자
		<a href="${pageContext.request.contextPath}/"></a>
	</header>

	<ul>
		<li><a href="${pageContext.request.contextPath}/admin">Home</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/memberManage/memberList">회원리스트/관리</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/chefManage/chefList">쉐프리스트/관리</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/sales/list">쉐프 수익 내역/정산</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/faq/list">자주 묻는 질문</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/category/list">카테고리 관리</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/notify/list">신고 레시피/댓글</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/coupon/list">쿠폰 등록</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout">Logout</a></li>
	</ul>
</nav>
