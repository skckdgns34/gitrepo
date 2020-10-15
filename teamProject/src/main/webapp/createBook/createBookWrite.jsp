<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layout/styles/content-styles.css" type="text/css">
<script src="https://cdn.ckeditor.com/ckeditor5/11.1.1/classic/ckeditor.js"></script>
<script>
$(function(){
	$("#cancel").on("click",function(){
		alert("취소했슴다")
		location.href="${pageContext.request.contextPath}/createBookMain.do";
	});
	$("#save").on("click",function(){
		alert("저장됐슴다.")
		$("form").attr("action", "${pageContext.request.contextPath}/createBookSave.do");
	});
	$("#submit").on("click",function(){
		alert("등록됐슴다.")
		$("form").attr("action", "${pageContext.request.contextPath}/createBookInsert.do");
	});
})

</script>
<style>
.ck-editor__editable{
	min-height: 500px;
}

h2{
    font-size: 15px;
      padding-right: 30px;
      padding-b
}

.form-group{
    padding-bottom: 15px;
}
.popular_courses{
 padding-bottom: 0px;}
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
                            <a href="">나만의도서</a>
                            <span>글쓰기</span>
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
              <p> Make Your Own Book</p>
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
                       
                        <form>
                            <div class="form-group form-inline">
                                <div class="form-group col-lg-8">
                                	<h2 style="margin-bottom: 0px;">작성자: </h2><br>
                                	<input type="text" class="form-control" value="${sessionScope.nickname }" readonly>
                                </div>
                                
                                <select name="genre" id="genre">
									<option value="">장르 선택</option>
									<c:forEach items="${genreList }" var="genre">
										<option value="${genre.code}">${genre.code_value }</option>
									</c:forEach>
								</select>
                                
                                <div class="form-group col-lg-8">
                              <h2 style="margin-bottom: 0px;">제목 </h2><br>
                               <input  style="width: 600px;" type="text" class="form-control" name="my_title" placeholder="제목을 입력 해 주세요.">
                                </div>
                                
                              
                               
                               
                               
                            </div>
                            
                        
               <div class="form-group">              
                            <textarea id="content" name="editor1" rows="30"></textarea>
               </div>
               
                            <div class="form-group">
                                <input type="text" class="form-control" id="subject" placeholder="소개글" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = '소개글'">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control mb-10" rows="5" name="message" placeholder="줄거리"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = '줄거리'" required=""></textarea>
                            </div>
                            
                         		   <button id="cancel" class="button button-login w-20">취소</button>
									<button id="save" class="button button-login w-20">저장</button>
									<button id="submit" class="button button-login w-20">등록</button>
					                            
                        </form>
                        
                    	</div>
                    </div>
                    
      </div>
        </div>
    </section>
	<!-- End Sample Area -->
    

	<script>
    ClassicEditor
    .create( document.querySelector( '#content' ),{
    	ckfinder: {
            uploadUrl: '${pageContext.request.contextPath}/fileupload.do' // 내가 지정한 업로드 url (post로 요청감)
        }} )
    .catch( error => {
        console.error( error );
    } );
</script>
</body>
</html>