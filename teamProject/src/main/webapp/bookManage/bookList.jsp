<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="page_title">도서 전체 조회</h3>
	<hr>
	<table id="books" border="1">
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
				<td>${books.book_no}</td>
				<td>${books.title}</td>
				<td>${books.writer}</td>
				<td>${books.publication_date}</td>
				<td>${books.company_code}</td>
				<td>${books.best_book}</td>
				<td>${books.genre}</td>
				<td>${books.registration_date}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>