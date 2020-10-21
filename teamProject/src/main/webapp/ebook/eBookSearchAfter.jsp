<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function imgClick(book_no) {
		if(book_no != null){
			if(confirm("해당 책 상세페이지로 이동하시겠습니까?")){			
				location.href="${pageContext.request.contextPath}/eBookDetail.do?book_no="+book_no;
			}
		}
	}
</script>
<style>
table{
text-align: center;
}
thead{
  max-width: 90px;
 

  }
  tbody{
   max-width: 90px;

  }
  td{
 overflow: hidden;
  text-overflow: ellipsis !important;
  white-space: nowrap;
  max-width: 90px;
  height: 20px;
  }
</style>
</head>
<body>
	

<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Menu</h4>
						<div class="breadcrumb__links">
							<a href="${pageContext.request.contextPath}/main.do">Home</a> <span>검색결과</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Breadcrumb Section End -->
<section class="section-margin--small mb-5">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">

	<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">

					<thead>
			<tr>
				<td>책이미지</td>
				<td>북넘버</td>
				<td>제목</td>
				<td>저자</td>
				<td>출판일</td>
				<td>출판사</td>
				<td>조회수</td>
				<td>장르</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="book">
					<tr>
						<c:if test="${not empty book.book_img}">
						<td style="margin-left: 30px;">
							<img onclick="imgClick(${book.book_no})" src="filenameDownload.do?filename=${book.book_img}" style="width:100px">
						</td>
						</c:if>
						<td>${book.book_no}</td>
						<td>${book.title}</td>
						<td>${book.writer}</td>
						<td><fmt:parseDate value="${book.publication_date}" pattern="yyyy-MM-dd HH:mm:ss" var="publication_date"/>
							<fmt:formatDate value="${publication_date}"  pattern="yyyy/MM/dd"/> </td>
						<td>${book.company_name}</td>
						<td>${book.views}</td>
						<td>${book.genre}</td>
					</tr>
				
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	</section>
</body>
</html>