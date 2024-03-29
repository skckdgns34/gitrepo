<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

</head>
<body style="padding-top: 70px;">

  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">회원 수정</h5>
            <form class="form-signin" method="post" name="frm" id="frm"
			action="memberManageModify.ad" onsubmit="return inputCheck()">
			
                <div class="form-label-group">
               <label for="inputMemberNo">회원번호</label><br>
                <input type="text" name="member_no" value="${member.member_no}" readonly="readonly">
              </div> 
              
              <div class="form-label-group">
               <label for="inputMemberId" >회원아이디</label><br>
                <input type="text" name="member_id" value="${member.member_id}">
              </div>
              <div class="form-label-group">
               <label for="inputMemberPw">회원비밀번호</label><br>
                <input type="text" name="member_pw" value="${member.member_pw}">
              </div>
              <div class="form-label-group">
               <label for="inputMemberNicname">회원 닉네임</label><br>
                <input type="text" name="nickname" value="${member.nickname}">
              </div>
              <div class="form-label-group">
               <label for="inputMemberTel">회원 전화번호</label><br>
                <input type="text" name="member_tel" value="${member.member_tel}">
              </div>
              
              <div class="form-label-group">
               <label for="inputMemberEmail">회원 이메일</label><br>
                <input type="text" name="member_email" value="${member.member_email}">
              </div>
              <div class="form-label-group">
               <label for="inputMemberSignup">회원 가입일</label><br>
                <input type="text" name="signup_date" value="${member.signup_date}">
              </div>
              <div class="form-label-group">
               <label for="inputlastAccess">최종접속일</label><br>
                <input type="text" name="last_access_date" value="${member.last_access_date}">
              </div>  
              <div class="form-label-group">
               <label for="inputmemberGender">회원 성별</label><br>
                <input type="text" name="gender" value="${member.gender}">
              </div> 
              <div class="form-label-group">
               <label for="inputTicketCode">ticket_code</label><br>
                <input type="text" name="ticket_code" value="${member.ticket_code}">
              </div> 
            

              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">회원 수정</button>
             
              <hr class="my-4">
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>