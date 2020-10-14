<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
<script>
$(function(){
	$("#cancel").on("click",function(){
		alert("취소했슴다")
		location.href="${pageContext.request.contextPath}/createBookMain.do";
	});
	$("#save").on("click",function(){
		alert("저장되었습니다.")
		$("form").attr("action", "${pageContext.request.contextPath}/createBookSave.do");
	});
	$("#submit").on("click",function(){
		alert("등록되었습니다.")
		$("form").attr("action", "${pageContext.request.contextPath}/createBookInsert.do");
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
                            <a href="">나만의도서</a>
                            <span>글쓰기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
 <section class="section-margin--small mb-5">
	<form>
		<div class="container">
	      <div class="row">
	       <div class="col-lg-12">
				<h3>나만의 글쓰기 페이지</h3>
				<select name="genre" id="genre">
					<option value="">선택</option>
					<c:forEach items="${genreList }" var="genre">
						<option value="${genre.code}">${genre.code_value }</option>
					</c:forEach>
				</select>
				<br><br><br><br><br><br>
				
				작성자: <label>${sessionScope.nickname }</label><br>
				제목:<input name="my_title"><br>
				책표지:<input name="image_uri" type="file"><br>
				내용	<textarea name="editor1"></textarea><br><br><br><br><br>
				소개글<br><textarea name="my_introduction" cols="160" rows="5"></textarea><br>
				줄거리<br><textarea name="my_summary" cols="160" rows="10"></textarea><br>
				<button class="btn btn-primary" id="cancel">취소</button>
				<button class="btn btn-primary" id="save">임시저장</button>
				<button class="btn btn-primary" id="submit">등록</button>
			</div>
		  </div>
		</div>
	</form>
	
</section>
<script>CKEDITOR.replace( 'editor1' );</script>
</body>
</html>