<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function insertpage() //문의사항 등록 ㅡ
	{
		window.document.location.href = "${pageContext.request.contextPath}/clientHopeBookWriteForm.do"
		return;
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
							<a href="./index2.jsp">Home</a> <span>희망도서</span>
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
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>제목</th>
									<th>작가</th>
									<th>출판사</th>
								</tr>
							</thead>
							<tbody>
							<button type="button" id='btn_n'
						class="btn btn-outline btn-primary pull-" onclick="insertpage()">희망도서 신청하기</button>
								<c:forEach items="${list}" var="hopebooks">
									<tr>
										<td>${hopebooks.title}</td>
										<td>${hopebooks.writer}</td>
										<td>${hopebooks.company}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>