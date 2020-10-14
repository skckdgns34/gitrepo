<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(function() {
		$("#genre")
				.on(
						"change",
						function() {
							var genre = $(this).val();
							location.href = "${pageContext.request.contextPath}/createBookMain.do?genre="
									+ genre

						}) //장르 select 태그 바뀔때마다 페이지 새로 띄우는거.

		$("img")
				.on(
						"click",
						function() {
							var book_no = $(this).next().val()
							alert(book_no)
							location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="
									+ book_no;
						}).css('cursor', 'pointer');

		$("#write")
				.on(
						"click",
						function() {
							var m_no = "${sessionScope.member_no}";
							console.log(m_no + "a");
							if (m_no == "") {
								alert("로그인이 필요한 기능.")
								location.href = "${pageContext.request.contextPath}/memberLogin.do";
							} else {
								location.href = "${pageContext.request.contextPath}/createBookWrite.do";
							}
							//location.href="${sessionScope.member_no}"
						})

		//
		$(".tr").hover(function() {
			$(this).css("background-color", "lightgray");
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css("background-color", "");
		});

		//
		$(".tr")
				.on(
						"click",
						function() {
							var book_no = $(this).find('input[type=hidden]')
									.val();
							location.href = "${pageContext.request.contextPath}/eBookDetail.do?book_no="
									+ book_no;
						});

	});
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
							<a href="">Home</a> <span>나만의 도서</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->


	<!--================Blog Area =================-->
	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<select name="genre" id="genre">
				<option value="">전체</option>
				<c:forEach items="${genreList }" var="genre">
					<option value="${genre.code }">${genre.code_value }</option>
				</c:forEach>
			</select>
			<div class="row">
			
  <div class="col-lg-3">				
  <label>순위</label><br>
				<table class="table">
					<thead>
						<tr>
							<th>순위</th>
							<th>책 제목</th>
							<th>조회수</th>
							<th>닉네임(글쓴이)</th>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items="${userBookRank }" var="list">
							<tr class="tr">
								<td>
									<input type="hidden" value="${list.book_no }">
									${list.no }
								</td>
								<td>${list.title}</td>
								<td>${list.views}</td>
								<td>${list.writer}</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
				
			</div>
			                <div class="col-lg-9">
			
				<div class="col-lg-4 col-md-6 col-sm-6">
					<c:if test="${empty userBooks }">없다</c:if>
					<div class="blog__item">
					<button type="button" class="btn btn-primary" id="write">글쓰기</button>
						<c:forEach items="${userBooks }" var="userBook">
							<div class="blog__item__pic set-bg"
								data-setbg="img/blog/blog-1.jpg"></div>
							<div class="blog__item__text">
								<span><img
									src="filenameDownload.do?filename=${userBook.book_img}"></span>
								<h5>${userBook.title }</h5>
								<h5>${userBook.publication_date }</h5>
								<h5>${userBook.code_value} </h5>
								<h5>${userBook.writer }</h5>

								<a href="#">Read More</a> <!--   이 거 살려서 쓸거면 쓰기..ㅎ 필요없으면 지우고-->
							</div>
						</c:forEach>
					</div>

				</div>
</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->
</body>
</html>