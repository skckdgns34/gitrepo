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
		if (book_no != null) {
			if (confirm("해당 책 상세페이지로 이동하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="
						+ book_no;
			}
		}
	}
</script>
<style>
</style>
<link rel="stylesheet" href="layout/styles/slider.css">
</head>
<body>
	<br>
	<section>
		<div id="slider-animation" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#slider-animation" data-slide-to="0" class="active"></li>
				<li data-target="#slider-animation" data-slide-to="1"></li>
				<li data-target="#slider-animation" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="★해당 배너클릭시 이동시킬 페이지 적기~"> <img src="${pageContext.request.contextPath}/images/a.jpg"
						alt="슬라이드1">
						<div class="text-box">
							<h2 class="wow slideInRight" data-wow-duration="1s"></h2>
							<p class="wow slideInLeft" data-wow-duration="2s"></p>
						</div>
				</div>

				<div class="carousel-item">
					<a href="★해당 배너클릭시 이동시킬 페이지 적기~"> <img src="${pageContext.request.contextPath}/images/b.jpg"
						alt="슬라이드2">
						<div class="text-box">
							<h2 class="wow slideInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInDown" data-wow-duration="2s"></p>
						</div>
					</a>
				</div>

				<div class="carousel-item">
					<a href="★해당 배너클릭시 이동시킬 페이지 적기~"> <img src="${pageContext.request.contextPath}/images/c.jpg">
						<div class="text-box">

							<h2 class="wow fadeInUp" data-wow-duration="1s"></h2>
							<p class="wow fadeInUp" data-wow-duration="2s"></p>
						</div>
					</a>
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#slider-animation"
				data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#slider-animation"
				data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>

		</div>
	</section>


	<div class="wrapper-slider">
		<div class="arrow-left"></div>
		<div class="arrow-right"></div>
		<div class="items">
			<div class="item item1">
				<a href="${pageContext.request.contextPath}/ebook/eBookDetail.jsp"><img class="item item1"
					src="${pageContext.request.contextPath}/resourse/img/쟈.jpg"></a>
			</div>
			<div class="item item1">
				<a href="${pageContext.request.contextPath}/ebook/eBookDetail.jsp"><img class="item item1"
					src="${pageContext.request.contextPath}/resourse/img/쟈.jpg"></a>
			</div>
			<div class="item item1">
				<a href="${pageContext.request.contextPath}/ebook/eBookDetail.jsp"><img class="item item1"
					src="${pageContext.request.contextPath}/resourse/img/쟈.jpg"></a>
			</div>
			<div class="item item1">
				<a href="${pageContext.request.contextPath}/ebook/eBookDetail.jsp"><img class="item item1"
					src="${pageContext.request.contextPath}/resourse/img/쟈.jpg"></a>
			</div>
			<div class="item item1">
				<a href="${pageContext.request.contextPath}/ebook/eBookDetail.jsp"><img class="item item1"
					src="${pageContext.request.contextPath}/resourse/img/쟈.jpg"></a>
			</div>
			<div class="item item1">
				<a href="${pageContext.request.contextPath}/ebook/eBookDetail.jsp"><img class="item item1"
					src="${pageContext.request.contextPath}/resourse/img/쟈.jpg"></a>
			</div>

		</div>
	</div>


	<%-- <table border="1">
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
		</table> --%>
	<script src="layout/styles/slider.js"></script>
</body>
</html>