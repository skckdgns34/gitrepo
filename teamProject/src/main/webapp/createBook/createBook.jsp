<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>회원글 상세</h3>
		</div>
	</div>	
	<br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<label><img src="filenameDownload.do?filename=${bookDetail.book_img}"></label><br>
			</div>
			<div class="col-9">
				<label>제목 : ${bookDetail.title }</label><br>
				<label>저자 : ${bookDetail.writer}</label><br>
				<label>등록일 : ${bookDetail.publication_date }</label><br>
				<label>소개글 : ${bookDetail.summary}</label><br>
				<label>조회수 : ${bookDetail.views }</label><br>
				<label>장르 : ${bookDetail.genre }</label><br>	
			</div>
			
			
		</div>
	</div>
</body>
</html>