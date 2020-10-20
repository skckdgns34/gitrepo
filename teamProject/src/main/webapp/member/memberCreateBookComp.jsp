<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}

button {
  background-color: white; 
  color: black; 
  border: 2px solid 002347;
  padding: 7px 15px;
  font-size: 12px;
}

	#a{
	color: #002347;
	border-bottom: 1px solid;
	}
	#b{
	color: #002347;
	border-bottom: 1px solid;
	}
</style>
<script>
$(function(){
	$("#btnsend").on("click", function(){
		location.href = "${pageContext.request.contextPath }/eBookDetail.do?book_no=" + $("#book_no").val()
	});
})
</script>
</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Menu</h4>
						<div class="breadcrumb__links">
							<a href="${pageContext.request.contextPath}/main.do">내 정보</a> <span>나만의 도서 - 등록완료</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<br>
	<ul>
		<li><a id="a"
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">작성중</a>
		<li><a id="b"
			href="<%=application.getContextPath()%>/memberCreateBookComp.do">등록완료</a>
	</ul>
	<br><hr>
	<input type="hidden" name="member_no" id="member_no"
		value="${member_no }">
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<td>제목</td>
									<td>장르</td>
									<td>조회수</td>
									<td>등록일자</td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="bookcomp">
	<input type="hidden" id="book_no" value="${bookcomp.book_no }">
									<tr>
										<td>${bookcomp.title }</td>
										<td>${bookcomp.genre }</td>
										<td>${bookcomp.views }</td>
										<td>
											<fmt:parseDate value="${bookcomp.registration_date}" pattern="yyyy-MM-dd HH:mm:ss" var="registration_date" />
											<fmt:formatDate value="${registration_date}" pattern="yyyy/MM/dd" />
										</td>
										<td><button id="btnsend">바로가기</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript">
jQuery(function($){ 
	$("#dataTable").DataTable(); 
}); 

$("#dataTable").DataTable({
	
	// 표시 건수를 10건 단위로 설정
	lengthMenu: [ 10, 20, 30, 40, 50 ]
});
</script>
</body>
</html>