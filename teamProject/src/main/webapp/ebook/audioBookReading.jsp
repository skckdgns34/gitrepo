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
	<%--  --%>
	<div class="container">

		<div class="row">
			<div class="col">
				<label>book_no: ${book[0].book_no}</label><br>
				<label>title: ${book[0].title}</label><br>
				<label>writer: ${book[0].writer}</label><br>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<img src="filenameDownload.do?filename=${book[0].book_img}"/>
			</div>
			<div class="col" style="border-left:1px solid gray">
				<table border="1">
					<thead>
						<tr>
							<th>mylib_no</th>
							<th>책 제목</th>
							<th>찜 여부</th>
							<th>last index</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mylib }" var="list">
							<tr>
								<td><a href="audioBookReading.do?book_no=${list.book_no}">${list.mylibrary_no }</td>
								<td>${list.title }</td>
								<td>${list.wish}</td>
								<td>${list.last_read_index}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>

		<div class="row">
			<div class="col">
				<audio controls="controls" id="audio">
					<source
						src="filenameDownload.do?filename=a.mp3<%-- ${book.audio_path } --%>"
						type="audio/ogg" />
				</audio>
				<button type="button" onclick="playSound()">오디오버튼</button>
			</div>
		</div>
	</div>

</body>
</html>