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
	<%-- <label>no: ${book.book_no}</label><br>
<label>title: ${book.title}</label><br>
<label>writer: ${book.writer}</label><br> --%>
	<div class="container">
		<div class="row">
		<audio controls="controls">
			<source
				src="filenameDownload.do?filename=a.mp3<%-- ${book.audio_path } --%>"
				type="audio/ogg" />
			이 브라우저는 실행 불가
		</audio>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>mylib_no</th>
					<th>book_no</th>
					<th>wish</th>
					<th>last_read_index</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mylib }" var="list">
					<tr>
						<td><a href="audioBookReading.do?book_no=${list.book_no}">${list.mylibrary_no }</td>
						<td>${list.book_no }</td>
						<td>${list.wish}</td>
						<td>${list.last_read_index}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>