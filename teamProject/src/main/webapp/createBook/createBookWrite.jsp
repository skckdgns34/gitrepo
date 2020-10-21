<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layout/styles/content-styles.css"
	type="text/css">
<script
	src="https://cdn.ckeditor.com/ckeditor5/12.3.0/classic/ckeditor.js"></script>
<script>
$(function(){

	$("#cancel").on("click",function(){
		alert("취소했슴다")
		location.href="${pageContext.request.contextPath}/createBookMain.do";
	});
	$("#save").on("click",function(){
		alert("저장됐슴다.");
		$("form").attr("action", "${pageContext.request.contextPath}/createBookSave.do");
	});
	
	$("button[name=titleck]").on("click",function(){
		var my_title = $("#my_title").val();
		var titleList = '${titleList}';
		var n = titleList.includes(my_title);
		if(n){
			alert("중복되는 제목입니다.");
		}else{
			alert("사용가능 한 제목.");
		}
	});
	
	$("#submit").on("click",function(){
		var result = confirm("등록하실텨? 하면 못고쳐");
		if(result){
			alert("등록됐슴다.");
			$("form").attr("action", "${pageContext.request.contextPath}/eBookEpubCreate.do");
		}else{
			alert("취소했수다");
		}
	});
	
/* 	$("#my_title").on("keydown", function(){
		 $('#titlee').val($(this).val());
	});
	$("#my_title").on("change", function(){
		 $('#titlee').val($(this).val());
	}); */

	$("#chapter").on("change",function(){
		var chapter = $(this).val();
		var my_title = $("#my_title").val();

		$.ajax({
			url : "${pageContext.request.contextPath}/Ajax/createBookChapterChangeAjaxServ.do",
			type: "POST",
			dataType : "json",
			data : {chapter : chapter,
					my_title : my_title,
					chapter : chapter},
			success: function(data){
				$("#my_introduction").val(data.my_introduction);
				$("#my_summary").html(data.my_summary);
				ckeditor.data.set(data.my_contents);
				console.log(data.genre);
			 	//var option = $(".list").first().find('li[data-value='+data.genre+']')
			 	//option.prev().attr("class","option focus");
			 	//option.attr("class","option selected");
				//console.log(option)
			}
		});
	});
	/* $("#addChapter").on("click",function(){
		alert("추가")
		var my_title= $("#my_title").val();
		console.log(last_option+"aaaa")
		console.log(selected_option+"bbbb")
		$.ajax({
			url : "${pageContext.request.contextPath}/Ajax/createBookAddChapterAjax.do",
			type: "POST",
			dataType : "json",
			data : {my_title : my_title,
					},
			success: function(data){
				console.log(data)
                var option = $("<option>chapter"+data+"</option>");
				$("#chapter").append(option);
			}
		});
	}) */
	
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
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Menu</h4>
						<div class="breadcrumb__links">
							<a href="">나만의도서</a> <span>글쓰기</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Start Sample Area -->
	<div class="popular_courses section_gap_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5" style="height: 50px;">
					<div class="main_title">
						<h2 class="mb-3">My Book Writing</h2>
						<p>Make Your Own Book</p>
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

						<form method="POST"  enctype="multipart/form-data">
							<div class="form-group form-inline">
								<div class="form-group col-lg-8">
									<h2 style="margin-bottom: 0px;">작성자:</h2>
									<br> <input type="text" class="form-control"
										value="${sessionScope.nickname }" readonly>
								</div>
							
								<select name="genre" id="genre"  >
									<option <c:if test="${not empty chapterList}">disabled="disabled"</c:if> value="">장르 선택</option>
									<c:forEach items="${genreList }" var="genre">
										<option <c:if test="${not empty chapterList}">disabled="disabled"</c:if> value="${genre.code}">${genre.code_value }</option>
									</c:forEach>
								</select>
								<script>$("#genre").val("${chapterList[0].genre}")</script>
								<select name="chapter" id="chapter">
									<option value="">챕터</option>
									<c:if test="${not empty chapterList }">
										<c:forEach items="${chapterList}" var="chapter">
										<option value="${chapter.chapter}">${chapter.chapter}</option>
									</c:forEach>
									</c:if>
								</select>
								<div class="form-group col-lg-8">
									<h2 style="margin-bottom: 0px;">제목</h2>
									<br>
									<c:if test="${empty title }">
										<input style="width: 600px;" type="text"
											class="form-control" name="my_title"
											placeholder="제목을 입력 해 주세요."
											id="my_title">
										<button class="button button-login w-20" name="titleck">중복확인</button>
									</c:if>
									<c:if test="${not empty title }">
										<input style="width: 600px;" type="text"
											class="form-control" name="my_title"
											placeholder="제목을 입력 해 주세요."
											id="my_title" value="${title }" readonly>
										<button class="button button-login w-20" name="titleck">중복확인</button>
									</c:if>
								</div>
								<div class="form-group col-lg-8">
									<h2 style="margin-bottom: 0px;">책 표지</h2>
									<br>
									<input style="width: 600px;" type="file"
										class="form-control" name="image_uri"
										id="image_uri">
								</div>
							</div>
							<div class="form-group">
								<textarea id="content" name="editor1" rows="30"></textarea>
							</div>

							<div class="form-group">
								<c:if test="${empty intro }">
									<input type="text" class="form-control" id="my_introduction" name="my_introduction"
										placeholder="소개글" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '소개글'">
								</c:if>
								<c:if test="${not empty intro }">
									<input type="text" class="form-control" id="my_introduction" name="my_introduction"
										placeholder="소개글" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '소개글'" value="${param.intro }" <c:if test="${not empty param.intro }">readonly</c:if>>
								</c:if>
							</div>
							<c:if test="${empty summary }">
								<div class="form-group">
									<textarea class="form-control mb-10" rows="5" id="my_summary" name="my_summary"
										placeholder="줄거리" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '줄거리'" required=""></textarea>
								</div>
							</c:if>
							<c:if test="${not empty summary }">
								<div class="form-group">
									<textarea class="form-control mb-10" rows="5" id="my_summary" name="my_summary"
										placeholder="줄거리" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '줄거리'" required="" <c:if test="${not empty param.summary }">readonly</c:if>>${param.summary }</textarea>
								</div>
							</c:if>
							<button id="cancel" class="button button-login w-20">취소</button>
							<button id="save" class="button button-login w-20">저장</button>
							<button id="submit" class="button button-login w-20">등록</button>
							<input type="hidden" value="${sessionScope.nickname}" name="nicknamee"/>
							<input type="hidden" value="${sessionScope.member_no }" name="member_noo"/>
						</form>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Sample Area -->


	<script>
   	let ckeditor
	ClassicEditor
    .create( document.querySelector( '#content' ),{
    	ckfinder: {
            uploadUrl: '${pageContext.request.contextPath}/fileupload.do' // 내가 지정한 업로드 url (post로 요청감)
        }} )
    .then( editor => {
    	ckeditor = editor; // Save for later use.
    } )
    .catch( error => {
        console.error( error );
    } );
</script>
</body>
</html>