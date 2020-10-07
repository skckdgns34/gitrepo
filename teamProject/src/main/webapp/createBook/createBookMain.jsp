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
	<div class="container">
		<div class="row">
			<h3>나만의도서 메인</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<c:forEach items="${userBooks }" var="userBook">
					<div class="row">
						<div class="col-xs3">
							<img src="filenameDownload.do?filename=${userBook.book_img }">
						</div>
						<div class="col-xs9"  >
							<label>제목: ${userBook.title }</label><br>
							<label>발행일: ${userBook.publication_date }</label><br>
							<label>장르: ${userBook.code_value }</label><br>
							<label>저자: ${userBook.writer }</label><br>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-4" >
				<label>순위</label><br>
				<table class="table">
					<thead>
						<tr>
							<th>순위</th>
							<th>책 제목</th>
							<th>조회수</th>
							<th>닉네임(글쓴이)</th>
						</tr>
					</thead>
					<tbody>
						 <c:forEach items="${userBookRank }" var="list">
							<tr>
								<td><a href="">${list.no }</a></td>
								<td>${list.title}</td>
								<td>${list.views}</td>
								<td>${list.writer}</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>