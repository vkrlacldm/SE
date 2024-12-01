<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<style type="text/css">
.contents { 
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
    margin: 0 auto;
    word-break: keep-all;
}

.recipe_top {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
    padding: 60px 0 54px 0;
    background: #f7f8fb;
    box-sizing: border-box;
}

.recipe_btm {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
    padding: 60px 0 120px 0;
    background: #ffffff;
    box-sizing: border-box;
}   

.inwrap {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    width: 100%;
    max-width: 1320px;
    margin: 0 auto;
    box-sizing: border-box;
    padding: 0 14px;
    position: relative;
} 

.month_recipe_list {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
	min-height: 600px;    
}

.pager-wr recipe {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
    margin: 50px auto 0 auto;
}

.lazy loaded {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    list-style: none;
    text-align: center;
    color: #555555;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    outline: 0;
    font-size: 100%;
    border: 0px;
    vertical-align: middle;
    text-decoration: none;
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    max-width: 100%;
}

.recipe_list_txtbox {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    list-style: none;
    text-align: center;
    color: #555555;
    margin: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
    height: 100px;
    padding: 0 20px;
    background: #ffffff;
    box-sizing: border-box;
}

.nickName {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    list-style: none;
    text-align: center;
    margin: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    display: block;
    position: absolute;
    top: -2.2rem;
    left: 50%;
    transform: translateX(-50%);
    padding: 14px 20px;
    border-radius: 9999px;
    background: #f44502;
    font-size: 1.6rem;
    font-weight: 400;
    line-height: 100%;
    color: #ffffff;
    box-sizing: border-box;
}

.recipeSubject {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    list-style: none;
    text-align: center;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    display: block;
    font-size: 1.8rem;
    font-weight: 500;
    line-height: 100px;
    color: #000000;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.month_recipe_list li {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    list-style: none;
    float: left;
    position: relative;
    width: calc(50% - 30px);
    margin-bottom: 30px;
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 10px 17px 0 rgba(0,0,0,.04);
    transition: all 0.2s;
    text-align: center;
}

.recipe_list_thumb {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    word-break: keep-all;
    list-style: none;
    text-align: center;
    color: #555555;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    height: 0;
    padding-bottom: 100%;
}

.recipe_list_thumb img {
    vertical-align: middle;
    object-fit: cover;
    width: 578px;
    height: 600px;
    border-radius: 18px;
}

.recipe_box recipe_infotxt {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    float: left;
    position: relative;
    width: calc(100% - 640px);
    height: 640px;
    min-height: 360px;
    padding: 100px 50px 50px 50px;
    background: #ffffff;
    box-sizing: border-box;
    text-align: center;
}

.recipe_tit {
    letter-spacing: -0.03em;
    text-align: center;
    display: block;
    width: 235px;
    padding: 15px 20px;
    border: 1px solid #f44502;
    border-radius: 9999px;
    font-size: 1.8rem;
    line-height: 1em;
    color: #f44502;
    margin: 0 auto;
    box-sizing: border-box;
}

.btit {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    word-break: keep-all;
    text-align: center;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    margin-top: 30px;
    font-size: 4.4rem;
    font-weight: 700;
    line-height: 1.2em;
    color: #000000;
    letter-spacing: -1px;
}

.stxt {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    letter-spacing: -0.03em;
    text-align: center;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    margin-top: 30px;
    height: 124px;
    font-size: 1.8rem;
    font-weight: 400;
    line-height: 1.8em;
    color: #777777;
    overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
}

.recipe_top {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    position: relative;
    width: 100%;
    padding: 60px 0 54px 0;
    background: #f7f8fb;
    box-sizing: border-box;
}

.recipe_box recipe_thumb {
    -webkit-font-smoothing: antialiased;
    font-family: 'Noto Sans', sans-serif;
    color: #000000;
    letter-spacing: -0.03em;
    word-break: keep-all;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    border: 0;
    outline: 0;
    font-size: 100%;
    float: left;
    position: relative;
    width: 640px;
    background-color: #ffeee4;
}

.mainimg{
	border-radius: 20px;
	
}

</style>

<div class="contents">
			<div class="recipe_top">
				<div class="inwrap">
					<div class="month_recipe_box" style="display: -webkit-inline-box;">
					<div class="recipe_box recipe_thumb">
					
							<span><img class="mainimg" src="${pageContext.request.contextPath}/resources/images/frige-title.jpg" alt="20"></span>
						</div>
					 <div class="recipe_box recipe_infotxt" style="padding: 30px;">
							<div class="recipe_tit">이달의 레시피</div>
							
								<h3 class="btit">매콤한 닭볶음탕</h3>
								<div class="stxt"><p>스트레스 풀릴 땐 매운게 최고╰(*°▽°*)╯<br></p><p>양념에 푹 잠긴 닭다리를 한입에⭐<p><br></p></div>
						</div>					
					</div>
				</div>
			</div>
			<div class="recipe_btm">
				<div class="inwrap">
				<div><h3>조건에 맞는 레시피가 <strong>${dataCount}</strong>개 있습니다.</h3></div>
					<div class="month_recipe_list">
					<c:forEach var="dto" items="${list}">
						<ul>
								<li>
									<a href="${pageContext.request.contextPath}/recipe/article?page=1&recipeNum=${dto.recipeNum}" onclick="" title="레시피보기">
										<div class="recipe_list_thumb">
											<img class="lazy loaded" src="${pageContext.request.contextPath}/uploads/recipe/${dto.imageFilename}" data-ll-status="loaded">
										</div>
										<div class="recipe_list_txtbox">
											<span class="nickName">${dto.nickName}</span>
											<span class="recipeSubject">${dto.recipeSubject}</span>
										</div>
									</a>
								</li>			 
						</ul>
						</c:forEach>
						
					</div>
				
						</div>
					</div>
					
				</div>
