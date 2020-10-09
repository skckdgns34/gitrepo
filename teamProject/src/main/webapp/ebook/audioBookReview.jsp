<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<style>
.pagination li {
	display: inline-block;
	border: 15px solid white;
}

.pagination .active {
	color: black;
	float: center;
	padding: 8px 10px;
	text-decoration: none;
}
</style>

<div>
	<c:forEach items="${review}" var="reviews">
		<div class="review_item">
			<div class="media" id="review_no" data-review_no="${reviews.review_no}">
				<div class="d-flex"></div>
				<div class="media-body" >
					<h4>${reviews.nickname}</h4>
				</div >
				<p>${reviews.review_date}</p> 
				<c:if test="${reviews.member_no == member_no}">
					<button id="reUpBtn" onclick="reviewUpdateBefore()" class="btn btn-link">수정</button> 
					<button id="reDelBtn" onclick="reviewDelete()" class="btn btn-link" >삭제</button>
				</c:if>
			</div>		
				<p id="review_contents">${reviews.contents}</p>
		</div>
	</c:forEach>
</div>
<p>
	<my:paging paging="${paging}" jsfunc="reviewAllList"  />

</p>
