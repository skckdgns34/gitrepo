<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	function imgClick(book_no) {
		if(book_no != null){
			if(confirm("해당 책 상세페이지로 이동하시겠습니까?")){			
				location.href="${pageContext.request.contextPath}/eBookDetail.do?book_no="+book_no;
			}
		}
	}
</script>
</head>
<body>
	<br>


	<!-- Tab panes -->

	<div class="container">
		<h2>슬라이드</h2>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100"
					src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>TEST</h5>
					<p>testtesttest</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide">
			</div>
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<!-- <span>Previous</span> -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<!-- <span>Next</span> -->
			</a>
			<!-- / 화살표 버튼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>

		<table border="1">
			<thead>
				<tr>
					<th>book_no</th>
					<th>title</th>
					<th>book_img</th>
					<th>writer</th>
					<th>publication_date</th>
					<th>summary</th>
					<th>views</th>
					<th>score</th>
					<th>book_price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bookList }" var="book">
					<tr>
						<td>${book.book_no }</td>
						<td>${book.title }</td>
						<td><img onclick="imgClick(${book.book_no})"
							src="filenameDownload.do?filename=${book.book_img }"
							style="width: 50px" /></td>
						<td>${book.writer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>