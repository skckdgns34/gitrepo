<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<audio controls="controls">
		<source src="filenameDownload.do?filename=${books.audio_path }" type="audio/ogg" />
		이 브라우저는 실행 불가
	</audio> 
<table border="1">
	<thead>
		<tr>
				<th>no</th>
				<th>poster</th>
				<th>subject</th>
				<th>contents</th>
		</tr>
	</thead>
	<tbody>		
<c:forEach items="${mylib }" var="list">
	<tr>
		<td>${list.mylibrary_no }</td>
		<td>${list.book_no }</td>
		<td>${list.wish}</td>
		<td>${list.last_read_index}</td>
	</tr>
</c:forEach>
	</tbody>
</table>

</body>
</html>