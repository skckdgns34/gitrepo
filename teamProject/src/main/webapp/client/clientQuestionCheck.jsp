<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layout/styles/content-styles.css"
	type="text/css">
<script
	src="https://cdn.ckeditor.com/ckeditor5/11.1.1/classic/ckeditor.js"></script>
<style>
.ck-editor__editable {
	min-height: 500px;
}

h2 {
	font-size: 15px;
	padding-right: 30px;
	padding-b
}

.form-group {
	padding-bottom: 15px;
}

.popular_courses {
	padding-bottom: 0px;
}
</style>
</head>
<body>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Menu</h4>
						<div class="breadcrumb__links">
							<a href="">문의사항</a> <span>답변확인</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<c:if test="${not empty result}">
		<div class="popular_courses section_gap_top">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5" style="height: 50px;">
						<div class="main_title">
							<h2 class="mb-3">답변 확인</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<section class="blog_area single-post-area section_gap"
			style="padding: 20px;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 posts-list">
						<div class="comment-form">

							<form method="post" name="frm" id="frm"
								enctype="multipart/form-data">

								<div class="form-group form-inline">
									<div class="form-group col-lg-8">
										<h2 style="margin-bottom: 0px;">제목</h2>
										<br> <input style="width: 600px;" type="text"
											class="form-control" name="question_title"
											value="${result.question_title }" readonly>
									</div>
									<h2 style="margin-bottom: 0px;">문의사항</h2>
									 <input id="code_value" name="code_value" type="text" class="form-control" 
									readonly value="${result.code_value}" >

									<div class="form-group col-lg-8"></div>

									<div class="form-group col-lg-8" style="width: 1000px">
										<h2 style="margin-bottom: 0px;">문의내용</h2>
										<br>
										<br>
										<textarea class="form-control mb-10" name="question_contents"
											style="width: 100%" readonly>${result.question_contents }</textarea>
									</div>
									<h2 style="margin-bottom: 0px;">문의등록일</h2>
									<input id="question_date" name="question_date" type="text" class="form-control" readonly
										value="${fn:substring(result.question_date,0,10) }">
									<div class="form-group col-lg-8" style="width: 1000px">
										<h2 style="margin-bottom: 0px;">답변내용</h2>
										<br>
										<br>
										<textarea class="form-control mb-10" id="answer_contents"
											name="answer_contents" style="width: 100%" readonly>${result.answer_contents}</textarea>
									</div>
									<h2 style="margin-bottom: 0px;">답변등록일</h2>
									<input id="answer_date" name="answer_date" type="text" class="form-control" readonly
										value="${fn:substring(result.answer_date,0,10) }">


								</div>


								<div>
									<button id="btnPage" type="button">돌아가기</button>
									<script>
										btnPage.addEventListener("click",
												goPage);
										function goPage() {
											history.back(); //이전페이지

										}
									</script>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</section>
		<%-- <c:if test="${not empty result}">
				<form action="${pageContext.request.contextPath}/clientQuestion.do">
					<input type="hidden" name="member_no" value="${result.book_no}">
					<button>삭제</button>
				</form>
			</c:if> --%>
	</c:if>
</body>
</html>