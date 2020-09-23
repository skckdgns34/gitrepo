<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
				  action="${pageContext.request.contextPath }/bookRegister.do"
				  >
				<div>
					<label for="title">제목</label> <input id="title" name="title" type="text">
				</div>
				<div>
					<label for="writer">지은이</label> <input id="writer" name="writer" type="text">
				</div>
				<div>
					<label for="company_code">출판사</label> <input id="company_code" name="company_code" type="text">
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
					<label for="audio_path">음성책 첨부</label> 
					<input type="file" name="audio_path">
				</div>
				<div>
					<label for="epub_audio">도서 종류</label>
					<input type="checkbox" name="epub_audio" value="epub">전자책
					<input type="checkbox" name="epub_audio" value="audio">음성책
				</div>
				<div>
					<button type="reset">초기화</button>
					<button>등록</button>
				</div>
			</form>
		</div>
</body>
</html>