<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<%@include file="/decorator/moveLoginForm.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">

	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">검색</h6>
			</div>
			<form
				class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
				method="post" action="bookList.ad">
				<div class="input-group">
					<select name='search_type'>
						<option value='BOOK_NO'
							<c:if test="${search_type == 'BOOK_NO'}">selected</c:if>>책
							번호</option>
						<option value='TITLE'
							<c:if test="${search_type == 'TITLE'}">selected</c:if>>책
							이름</option>
						<option value='COMPANY_NAME'
							<c:if test="${search_type == 'COMPANY_NAME'}">selected</c:if>>출판사
							이름</option>
						<option value='WRITER'
							<c:if test="${search_type == 'WRITER'}">selected</c:if>>작가
							이름</option>

					</select>
				</div>
				<div class="input-group-append">
					<input type="text" id='search_text' name='search_text'
						placeholder="회원번호 또는 회원아이디를 입력해주세요" value="${search_text }">
					<button class="btn btn-primary" id="btnOk" type="submit">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</form>
		</div>


	</div>
	<h3 class="page_title">도서 전체 조회</h3>
	<hr>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>책번호</th>
						<th>제목</th>
						<th>지은이</th>
						<th>발간일</th>
						<th>출판사</th>
						<th>베스트셀러</th>
						<th>장르</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="books">
						<tr>
							<td><a href="bookSelect.ad?book_no=${books.book_no}">${books.book_no}</a></td>
							<td>${books.title}</td>
							<td>${books.writer}</td>
							<td>${fn:substring(books.publication_date,0,10) }</td>
							<td>${books.company_code}</td>
							<td>${books.best_book}</td>
							<td>${books.genre}</td>
							<td>${fn:substring(books.registration_date,0,10)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
</body>
</html>