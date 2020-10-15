<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<c:if test="${not empty result}">
		<h1 class="page_title">문의사항상세정보</h1>
		<form method="post" name="frm" id="frm"
		enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/clientQuestionModify.do">
			<div>
				<label for="question_no">문의사항 번호</label> <input id="question_no" name="question_no"
					type="hidden" value="${result.question_no }" >
			</div>
			<div>
				<label for="question_title">제목</label> <input id="question_title" name="question_title"
					type="text" value="${result.question_title }">
			</div>
			<div>
				<label for="question_contents">내용</label> <textarea id="question_contents" name="question_contents"
					>${result.question_contents}</textarea>
			</div>
			<div>
				<label for="question_date">등록일</label> <input id="question_date"
					name="question_date" type="date" value="${fn:substring(result.question_date,0,10) }">
			</div>
			<div>
				<label for="genre">장르</label> <select name="genre" id="genre"
					size="4">
					<option value="">선택</option>
					<option value="d1"
						<c:if test="${result.genre=='d1'}">selected="selected"</c:if>>소설</option>
					<option value="d2"
						<c:if test="${result.genre=='d2'}">selected="selected"</c:if>>시/에세이</option>
					<option value="d3"
						<c:if test="${result.genre=='d3'}">selected="selected"</c:if>>무협/판타지</option>
					<option value="d4"
						<c:if test="${result.genre=='d4'}">selected="selected"</c:if>>인문</option>
					<option value="d5"
						<c:if test="${result.genre=='d5'}">selected="selected"</c:if>>로맨스</option>
					<option value="d6"
						<c:if test="${result.genre=='d6'}">selected="selected"</c:if>>자기계발</option>
					<option value="d7"
						<c:if test="${result.genre=='d7'}">selected="selected"</c:if>>경제/경영</option>
					<option value="d8"
						<c:if test="${result.genre=='d8'}">selected="selected"</c:if>>아동</option>
					<option value="d9"
						<c:if test="${result.genre=='d9'}">selected="selected"</c:if>>유아</option>
				</select>
			</div>
			<div>
				<label for="introduction">소개글</label>
				<textarea id="introduction" name="introduction">${result.introduction}</textarea>
			</div>
			<div>
				<label for="summary">줄거리</label>
				<textarea id="summary" name="summary">${result.summary}</textarea>
			</div>
			<div>
				<label for="publication_date">발간일</label> <input
					id="publication_date" name="publication_date" 
					type="date" value="${fn:substring(result.publication_date,0,10) }">
			</div>
			<div>
				<label for="best_book">베스트셀러</label> <input type="radio"
					name="best_book" value="y"
					<c:if test="${result.best_book=='y'}">checked="checked"</c:if>>Yes
				<input type="radio" name="best_book" value="n"
					<c:if test="${result.best_book=='n'}">checked="checked"</c:if>>No
			</div>
			<div>
				<label for="book_img">책 사진첨부</label><input type="file"
					name="book_img">${result.book_img }
			</div>
			<%-- <div>
				<label for="epub_path">전자책 첨부</label><input type="file"
					name="epub_path"> ${result.epub_path }
			</div> --%>
			<div>
				<button type="reset">초기화</button>
				<button>등록</button>
			</div>
		</form>
			<c:if test="${not empty result}">
				<form action="${pageContext.request.contextPath}/bookDelete.ad">
					<input type="hidden" name="book_no" value="${result.book_no}">
					<button>삭제</button>
				</form>
			</c:if>
	</c:if>
</body>
</html>