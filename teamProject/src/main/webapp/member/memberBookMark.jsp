<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li {list-style-type: none; float: left; margin-left: 20px;}
	
	button {
  background-color: white; 
  color: black; 
  border: 2px solid 002347;
  padding: 7px 15px;
  font-size: 12px;
}

	a {
	color: #002347;
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
							<a href="./index.html">내 서재</a> <span>읽은 책</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<br>
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberBookMark.do">읽은
				책</a>
		<li><a
			href="<%=application.getContextPath()%>/memberBookLuvList.do">찜
				목록</a>
	</ul>
	<br><hr>
	<section class="section-margin--small mb-5">
	
	<div class="container">
      <div class="row">
       <div class="col-lg-12">
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<td>제목</td>
				<td>작가</td>
				<td></td>
			</tr>
			</thead>
			  <tbody>
			<c:forEach items="${list }" var="mylibrary">
			<input type="hidden" id="book_no" value="${mylibrary.book_no }">
				<tr>
					<td><img src="filenameDownload.do?filename=${mylibrary.book_img}" style="width: 200px">
							${mylibrary.title }</td>
					<td>${mylibrary.writer }</td>
					<td><button id="btnsend">바로가기</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
</div>
</div>
</div>
</section>
</body>
</html>