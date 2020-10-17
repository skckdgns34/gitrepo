<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).on(
			"click",
			"#excel",
			function() {

				var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
				var table_html = encodeURIComponent(document
						.getElementById('dataTable2').outerHTML);
				
				var a = document.createElement('a');
				a.href = data_type + ',%EF%BB%BF' + table_html;
				a.download = '도서목록' + '_excel' + '.xls';
				a.click();

	})
</script>
</head>
<body id="page-top">

	<div class="container-fluid">
		
	<h3 class="page_title">도서 전체 조회</h3>
	<hr>
	<div class="card-body">
		<div class="table-responsive">
			<button class="btn btn-primary" id="excel">엑셀</button>
			 <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
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
							<td><img src="/app/filenameDownload.do?filename=${books.book_img }" width="70" height="100">${books.title}</td>
							<td>${books.writer}</td>
							<td>${fn:substring(books.publication_date,0,10) }</td>
							<td>${books.company_name}</td>
							<td>${books.best_book}</td>
							<td>${books.code_value}</td>
							<td>${fn:substring(books.registration_date,0,10)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table table-bordered table-hover" id="dataTable2" width="100%" cellspacing="0" hidden="hidden">
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
							<td>${books.book_no}</a></td>
							<td>${books.title}</td>
							<td>${books.writer}</td>
							<td>${fn:substring(books.publication_date,0,10) }</td>
							<td>${books.company_name}</td>
							<td>${books.best_book}</td>
							<td>${books.code_value}</td>
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