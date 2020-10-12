<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내서재 - 찜목록</title>
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
							<a href="./index.html">내 서재</a> <span>찜 목록</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<li><a href="<%=application.getContextPath()%>/memberModify.do">내정보
			수정</a>
	<li><a href="<%=application.getContextPath()%>/memberBookMark.do">내
			서재</a>
	<li><a
		href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의
			도서 확인</a>
	<li><a href="<%=application.getContextPath()%>/memberLicense.do">이용권
			내용</a>
		</ul> <br> <br>
		<ul>
			<li><a
				href="<%=application.getContextPath()%>/memberBookMark.do">읽은 책</a>
			<li><a
				href="<%=application.getContextPath()%>/memberBookLuvList.do">찜
					목록</a>
		</ul> <br>
		<hr>
		<section class="section-margin--small mb-5">

			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<td>번호</td>
										<td>제목</td>
										<td>작가</td>
										<td>장르</td>
										<td>조회수</td>
										<td></td>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${list }" var="books">
										<tr>
											<td>${rownum }</td>
											<td>${books.title }</td>
											<td>${books.writer }</td>
											<td>${books.genre }</td>
											<td>${books.views }</td>
											<td><button>바로가기</button>
												<button>편집하기</button></td>
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