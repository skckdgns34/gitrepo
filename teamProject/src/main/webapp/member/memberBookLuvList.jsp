<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내서재 - 찜목록</title>
<style>
	li {list-style-type: none; float: left; margin-left: 20px;}
	
	button {
  background-color: white; 
  color: black; 
  border: 2px solid 002347;
  padding: 7px 15px;
  font-size: 12px;
}

	#a{
	color: #002347;
	border-bottom: 1px solid;
	}
	#b{
	color: #002347;
	border-bottom: 1px solid;
	}
</style>
<script>
$(function(){
	$("#btnsend").on("click", function(){
		location.href = "${pageContext.request.contextPath }/eBookDetail.do?book_no=" + $("#book_no").val()
	});
})
</script>
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
							<a href="${pageContext.request.contextPath}/main.do">내 서재</a> <span>찜 목록</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		<section class="section-margin--small mb-5">

			<div class="container">
				<div class="row">
						<div class="table-responsive">
					<div class="col-lg-12">
						<ul>
							<li><a id="a"
							href="<%=application.getContextPath()%>/memberBookMark.do">읽은 책</a>
							<li><a id="b"
							href="<%=application.getContextPath()%>/memberBookLuvList.do">찜 목록</a>
						</ul> <br>
						<hr><br>
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작가</th>
										<th>장르</th>
										<th>조회수</th>
										<th></th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${list }" var="books">
										<tr>
											<input type="hidden" id="book_no" value="${books.book_no }">
											<td>${books.no }</td>
											<td>${books.title }</td>
											<td>${books.writer }</td>
											<td>${books.genre }</td>
											<td>${books.views }</td>
											<td><button id="btnsend">바로가기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
<script type="text/javascript">
jQuery(function($){ 
	$("#dataTable").DataTable(); 
}); 

$("#dataTable").DataTable({
	
	// 표시 건수를 10건 단위로 설정
	lengthMenu: [ 10, 20, 30, 40, 50 ]
});
</script>
</body>
</html>