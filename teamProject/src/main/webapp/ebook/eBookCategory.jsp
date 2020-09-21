<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>전자책</h3>
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
		<%-- <c:forEach items="${bookList }" var="book">
			<tr>
				<td>${book.book_no }</td>
				<td>${book.title }</td>
				<td>${book.book_img }</td>
			</tr>
		</c:forEach> --%>
	</tbody>
</table>
</body>
</html>