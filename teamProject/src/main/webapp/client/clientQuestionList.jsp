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
		window.document.location.href = "${pageContext.request.contextPath}/clientQuestionForm.do"
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
							<a href="./index.html">Home</a> <span>문의사항</span>
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
								<th>번호</th>
									<th>문의사항제목</th>
									<th>등록일자</th>
									<th>문의사항카테고리</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
							<button type="button" id='btn_n' class="btn btn-outline btn-primary pull-" onclick="insertpage()">문의사항 등록</button><br><br>
								<c:forEach items="${list}" var="questions">
									<tr>
										<td>${questions.question_no}</td>	
										<td><a href = "clientQuestionModifyForm.do?question_no=${questions.question_no}&&question_status=${questions.question_status}">${questions.question_title}</a></td>
										<td>${fn:substring(questions.question_date,0,10) }</td>
										<td>${questions.code_value}</td>
										<td>${questions.question_status}</td>
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