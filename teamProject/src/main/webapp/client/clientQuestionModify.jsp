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
		<section class="blog_area single-post-area section_gap" style="padding: 20px;">
		<div class="container">
            <div class="row">
                <div class="col-lg-12 posts-list">
    				 <div class="comment-form">
		<form method="post" name="frm" id="frm"
			enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/clientQuestionModify.do">
			<div class="form-label-group">
				<label for="question_no">문의사항 번호</label> <input id="question_no"
					name="question_no" type="hidden" value="${result.question_no }">
			</div>
			
			<div class="form-group form-inline">
			<div class="form-group col-lg-8">
				<h2 style="margin-bottom: 0px;">제목</h2><br> 
				<input  style="width: 600px;" type="text" class="form-control" name="question_title" value="${result.question_title }" readonly>
			</div>
			
				<label for="form-group form-inline">내용</label>
				<textarea id="question_contents" name="question_contents">${result.question_contents}</textarea>
			<div class="form-label-group">
				<label for="form-group form-inline">등록일</label> <input id="question_date"
					name="question_date" type="date"
					value="${fn:substring(result.question_date,0,10) }">
			</div>
			<div class="form-group form-inline">
				<label for="question_kind">문의사항 카테고리</label> <select
					name="question_kind" id="question_kind" size="1"
					class="form-control">
					<option value="">선택</option>
					<option value="e1"
						<c:if test="${result.question_kind=='e1'}">selected="selected"</c:if>>회원정보문의</option>
					<option value="e2"
						<c:if test="${result.question_kind=='e2'}">selected="selected"</c:if>>결제/취소/환불문의</option>
					<option value="e3"
						<c:if test="${result.question_kind=='e3'}">selected="selected"</c:if>>구독/서비스이용문의</option>
					<option value="e4"
						<c:if test="${result.question_kind=='e4'}">selected="selected"</c:if>>기기관련
						문의</option>
					<option value="e5"
						<c:if test="${result.question_kind=='e5'}">selected="selected"</c:if>>도서관련
						문의</option>
					<option value="e6"
						<c:if test="${result.question_kind=='e6'}">selected="selected"</c:if>>기타/제휴
						문의</option>
				</select>
			</div>
			</div>
			
			
			<div class="form-label-group">
				<label for="question_status">답변상태</label> <input
					id="question_status" name="question_status" type="text"
					value="${result.question_status }">
			</div>
			<div class="form-label-group">
				<label for="answer_contents">답변내용</label>
				<textarea id="answer_contents" name="answer_contents">${result.answer_contents}</textarea>
			</div>
			<div class="form-label-group">
				<label for="answer_date">답변일자</label> <input id="answer_date"
					name="answer_date" type="date"
					value="${fn:substring(result.answer_date,0,10) }">
			</div>
			<div>
				<button type="reset">초기화</button>
				<button>등록</button>
			</div>
		</form>
		</div>
                    </div>
                    
      </div>
        </div>
    </section>
		<%-- <c:if test="${not empty result}">
				<form action="${pageContext.request.contextPath}/bookDelete.ad">
					<input type="hidden" name="book_no" value="${result.book_no}">
					<button>삭제</button>
				</form>
			</c:if> --%>
	</c:if>
</body>
</html>