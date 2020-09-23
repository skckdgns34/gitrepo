<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전자책</h3>
	<c:forEach begin="1" end="${genreList.size() }" var="i">
		<div>${genreList.get(i-1).code_value}</div>
		<table border="1">
			<thead>
				<tr>
					<th>book_no</th>
					<th>title</th>
					<th>book_img</th>
					<th>writer</th>
					<th>genre</th>
					<th>ebook_path</th>
					<th>publication_date</th>
					<th>summary</th>
					<th>views</th>
					<th>score</th>
					<th>book_price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="${books.size() }" var="j">
					<tr>
						<td>${books.get[i-1]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<hr>
	</c:forEach>

</body>
</html>