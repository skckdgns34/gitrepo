<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li {list-style-type: none; float: left; margin-left: 20px;}
	
	button {
  background-color: white; 
  color: black; 
  border: 2px solid 002347;
  padding: 7px 15px;
  font-size: 12px;
}

	a {
	color: #002347;
	}
	
	table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
</style>
<script>
$(function(){
	$("#btnsend").on("click", function(){
		location.href = "${pageContext.request.contextPath }/.do?book_no=" + $("#book_no").val()
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
                            <a href="./index.html">내 정보</a>
                            <span>나만의 도서 - 작성중</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <br>
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberCreateBookCk.do">작성중</a>
		<li><a href="<%=application.getContextPath()%>/memberCreateBookComp.do">등록완료</a>
	</ul>
	<br><hr>
	
	
	<section class="section-margin--small mb-5">
	
	<div class="container">
      <div class="row">
       <div class="col-lg-12">
	<div class="table-responsive">
		<input type="hidden" name="member_no" id="member_no" value="${member_no }">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
			<tr>
				<th>제목</th>
				<th>장르</th>
				<th>조회수</th>
				<th>작성일자</th>
				<th></td>
			</tr>
			</thead>
			  <tbody>
			<c:forEach items="${list }" var="mywriting">
				<tr>
					<td>${mywriting.my_title }</td>
					<td>${mywriting.genre }</td>
					<td>${mywriting.views }</td>
					<td>${mywriting.my_write_date }</td>
					<td><button>편집하기</button></td>
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