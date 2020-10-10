<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답글 달기</title>
</head>
<body style="padding-top: 70px;">

  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">문의내용 </h5>
            <form class="form-signin" method="post" name="frm" id="frm"
			action="문의하기 답글url 적기" onsubmit="return inputCheck()">
			
                <div class="form-label-group">
               <label for="inputquestion_no">번호</label><br>
                <input type="text" name="question_no" value="${list.question_no}" readonly="readonly">
              </div> 
              
                <div class="form-label-group">
               <label for="inputquestion_no">회원번호</label><br>
                <input type="text" name="member_no" value="${list.member_no}" readonly="readonly">
              </div> 
              
              
              <div class="form-label-group">
               <label for="inputmember_id">회원 아이디</label><br>
                <input type="text" name="member_id" value="${list.member_id}" readonly="readonly">
              </div>
              
              <div class="form-label-group">
               <label for="inputnickname">닉네임</label><br>
                <input type="text" name="nickname" value="${list.nickname}" readonly="readonly">
              </div>
              
              <div class="form-label-group">
               <label for="inputquestion_title">제목</label><br>
                <input type="text" name="question_title" value="${list.question_title}" readonly="readonly">
              </div>
              
              <div class="form-label-group">
               <label for="inputquestion_contents">내용</label><br>
                <input type="text" name="question_contents" value="${list.question_title}" readonly="readonly">
              </div>
              
              <div class="form-label-group">
               <label for="inputquestion_date">등록 일자</label><br>
                <input type="text" name="question_date" value="${fn:substring(list.question_date,0,10)}" readonly="readonly">
              </div>
              
              <div class="form-label-group">
               <label for="inputquestion_title">첨부파일</label><br>
                <input type="text" name="question_title" value="${list.question_title}" readonly="readonly">
              </div>
              
              <div class="form-label-group">
               <label for="inputcode_value">질문유형</label><br>
                <input type="text" name="code_value" value="${list.code_value}" readonly="readonly">
              </div>
  
              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">답글달기</button>
             
              <hr class="my-4">
              
            </form>
            
             <form class="form-signin" method="post" name="frm" id="frm"
			action="memberManageAnswerInsert.ad" onsubmit="return inputCheck()">
			
			<div class="form-label-group">
                <input type="hidden" name="answer_writer" value="${login.emp_id}">
                <input type="hidden" name="question_no" value="${list.question_no}">                
              </div> 
			
    <div class="form-label-group">
               <label for="inputquestion_no">답글</label><br>
                <textarea type="text" name="answer_contents" ></textarea>
              </div> 
         
              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">제출하기</button>
             
              <hr class="my-4">
              
            </form>
            
            
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>