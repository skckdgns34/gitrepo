<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<c:forEach items="list" var="list">
			<tr>
				<td>${list.book_no}</td>
				<td>${list.title}</td>
				<td>${list.writer}</td>
				<td>${list.publication_date}</td>
				<td>${list.book_img}</td>
				<td>${list.company_name}</td>
				<td>${list.introduction}</td>
				<td>${list.summary}</td>
				<td>${list.views}</td>
				<td>${list.score}</td>
				<td>${list.genre}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>