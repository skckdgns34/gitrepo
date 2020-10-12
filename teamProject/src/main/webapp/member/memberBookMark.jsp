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
</style>
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
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberModify.do">내정보
				수정</a>
		<li><a href="<%=application.getContextPath()%>/memberBookMark.do">내
				서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의
				도서 확인</a>
		<li><a href="<%=application.getContextPath()%>/memberLicense.do">이용권
				내용</a>
	</ul>
	<br>
	<br>
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberBookMark.do">읽은
				책</a>
		<li><a
			href="<%=application.getContextPath()%>/memberBookLuvList.do">찜
				목록</a>
	</ul>
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

						<h4>읽은 책</h4>

						<c:forEach items="${list }" var="book">
							<div>
								<ul>
									<li>${book.book_img }</li>
									<li><label>제목:</label> ${book.title }</li>
									<li><label>작가:</label>${book.writer }</li>
								</ul>
							</div>

						</c:forEach>



					</div>
				</div>
			</div>
	</section>

</body>
</html>