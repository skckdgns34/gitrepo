<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<%@include file="/decorator/moveLoginForm.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="page_title">도서 등록</h1>
		<div class="regist">
			<form method="post" name="frm" id="frm" 
				  enctype="multipart/form-data"
				  action="${pageContext.request.contextPath }/bookRegister.ad"
				  >
				  <div>
					<label for="book_no">도서코드</label> <input id="book_no" name="book_no" type="hidden">
				</div>
				<div>
					<label for="title">제목</label> <input id="title" name="title" type="text">
				</div>
				<div>
					<label for="writer">지은이</label> <input id="writer" name="writer" type="text">
				</div>
				<div>
					<label for=company_code>출판사</label> <select name="company_code" id="company_code" size="4">
						<option value="">선택</option>
						<option value=1>예담</option>
						<option value=2>한양</option>
						<option value=3>창비</option>
						<option value=4>웅진</option>
						<option value=5>한빛</option>
						</select>
						</div>
				<div>
					<label for=genre>장르</label> <select name="genre" id="genre" size="4">
						<option value="">선택</option>
						<option value="d1">소설</option>
						<option value="d2">시/에세이</option>
						<option value="d3">무협/판타지</option>
						<option value="d4">인문</option>
						<option value="d5">로맨스</option>
						<option value="d6">자기계발</option>
						<option value="d7">경제/경영</option>
						<option value="d8">아동</option>
						<option value="d9">유아</option>
					</select>
				</div>
				<div>
					<label for="introduction">소개글</label>
					<textarea id="introduction" name="introduction"></textarea>
				</div>
				<div>
					<label for="summary">줄거리</label>
					<textarea id="summary" name="summary"></textarea>
				</div>
				<div>
				<label for="publication_date">발간일</label> 
				<input id="publication_date" name="publication_date" type="date">
			</div>
				<div>
					<label for="best_book">베스트셀러</label> 
					<input type="radio" name="best_book" value="y">Yes
					<input type="radio" name="best_book" value="n">No
				</div>
				<div>
					<label for="book_img">책 사진첨부</label> 
					<input type="file" name="book_img">
				</div>
				<div>
					<label for="epub_path">전자책 첨부</label> 
					<input type="file" name="epub_path">
				</div>
				<div>
					<label for="purchase_price">도서 구매 비용</label>
					<input type="text" name="purchase_price">
				</div>
				<div>
					<label for="purchase_date">도서 구매 날짜</label>
					<input type="date" name="purchase_date">
				</div>
				<div>
					<label for="purchase_content">비고</label>
					<textarea name="purchase_content"></textarea>
				</div>
				
				<div>
					<button type="reset">초기화</button>
					<button>등록</button>
				</div>
			</form>
		</div>
</body>
</html>