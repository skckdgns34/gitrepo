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
	<script>
$(function(){
	$("#delete").on("click",function(){
		$("form").attr("action", "${pageContext.request.contextPath}/clientQuestionDelete.do");
	});
})

</script>
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
							<a href="">문의사항</a> <span>수정하기</span>
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
							<h2 class="mb-3">문의사항 수정</h2>
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
								enctype="multipart/form-data"
								action="${pageContext.request.contextPath}/clientQuestionModify.do">
								<div class="form-group form-inline">
								<input type="text" name="question_no" value="${result.question_no }" hidden="hidden">
									<div class="form-group col-lg-8">
										<h2 style="margin-bottom: 0px;">제목</h2>
										<br> <input style="width: 600px;" type="text"
											class="form-control" name="question_title"
											value="${result.question_title }">
									</div>
									<h2 style="margin-bottom: 0px;">문의사항</h2>
									<select name="question_kind" id="question_kind" size="1">
										<option value="">선택</option>
										<option value="e1"
											<c:if test="${result.question_kind=='e1'}">selected="selected"</c:if>>회원정보문의</option>
										<option value="e2"
											<c:if test="${result.question_kind=='e2'}">selected="selected"</c:if>>결제/취소/환불문의</option>
										<option value="e3"
											<c:if test="${result.question_kind=='e3'}">selected="selected"</c:if>>구독/서비스이용문의</option>
										<option value="e4"
											<c:if test="${result.question_kind=='e4'}">selected="selected"</c:if>>기기관련 문의</option>
										<option value="e5"
											<c:if test="${result.question_kind=='e5'}">selected="selected"</c:if>>도서관련 문의</option>
										<option value="e6"
											<c:if test="${result.question_kind=='e6'}">selected="selected"</c:if>>기타/제휴 문의</option>
									</select> 

									<div class="form-group col-lg-8"></div>

									<div class="form-group col-lg-8" style="width: 1000px">
										<h2 style="margin-bottom: 0px;">문의내용</h2>
										<br> <br>
										<textarea class="form-control mb-10" name="question_contents"
											style="width: 100%">${result.question_contents }</textarea>
									</div>
									
										<div class="form-group col-lg-8">
											<h2 style="margin-bottom: 0px;">첨부파일</h2>
											<input id="question_file" name="question_file" type="file"
										class="form-control"
										value="${result.question_file}">
										</div>
								</div>


								<div>
								<button>수정하기</button>
										<button id="delete">삭제</button>
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
	</c:if>
</body>
</html>