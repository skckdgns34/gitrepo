<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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

	#a{
	color: #002347;
	border-bottom: 1px solid;
	}
	#b{
	color: #002347;
	border-bottom: 1px solid;
	}
	
	.div1{
		float: left;
	}
	
	h6{
	font-weight: bold
	}
</style>
<script>
$(function(){
	$("#btnsend").on("click", function(){
		location.href = "${pageContext.request.contextPath }/eBookDetail.do?book_no=" + $("#book_no").val()
	});
})

function imgClick(book_no) {
	if(book_no != null){
		if(confirm("해당 책 상세페이지로 이동하시겠습니까?")){			
			location.href="${pageContext.request.contextPath}/eBookDetail.do?book_no="+book_no;
		}
	}
}
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
							<a href="${pageContext.request.contextPath}/main.do">내 서재</a> <span>읽은 책</span>
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
		<div class="table-responsive">
			<ul>
				<li><a id="a" href="<%=application.getContextPath()%>/memberBookMark.do">읽은 책</a>
				<li><a id="b" href="<%=application.getContextPath()%>/memberBookLuvList.do">찜 목록</a>
			</ul>
			<br><hr>
			<c:forEach items="${list }" var="mylibrary">
			<input type="hidden" id="book_no" value="${mylibrary.book_no }">
				<div  class="col-md-6 col-lg-4" style="float: left;">
						<div  Class=" text-center card-product" style="width: 58%;" onclick="imgClick(${mylibrary.book_no})">
							<div class="card-product__img">
								<img class="card-img" alt="" src="">
							</div>
					<img src="filenameDownload.do?filename=${mylibrary.book_img}" style="width: 200px" >
							<br>
							<br>
							<h6>${mylibrary.title }</h6>
							${mylibrary.writer }
						</div>
				</div>
			</c:forEach>
		</div>
</div>
</div>
</div>
</section>
</body>
</html>