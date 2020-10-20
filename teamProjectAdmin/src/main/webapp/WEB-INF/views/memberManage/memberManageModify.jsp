<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>

.form-label-group{
padding-bottom: 20px;
}
h5{
font-size: 22px;
}

</style>
<script>

function button_event(){
	if (confirm("수정하시겠습니까?") == true){    //확인
	    document.form.submit();
	}else{   //취소
	    return;
	}
	}

</script>
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
               <label for="inputMemberNo">회원번호</label>
                <input type="text" name="member_no" value="${member.member_no}" readonly="readonly" style="margin-left:10%;">
              </div> 
              <hr>
              
              <div class="form-label-group">
               <label for="inputMemberId" >회원아이디</label>
                <input type="text" name="member_id" value="${member.member_id}" style="margin-left:10%;">
              
               <label for="inputMemberPw" style="margin-left: 50px;">회원비밀번호</label>
                <input type="text" name="member_pw" value="${member.member_pw}">
              </div>
            
              
              <div class="form-label-group">
               <label for="inputMemberNicname">회원 닉네임</label>
                <input type="text" name="nickname" value="${member.nickname}" style="margin-left:10%;">
              </div>
              <div class="form-label-group">
               <label for="inputMemberTel">회원 전화번호</label>
                <input type="text" name="member_tel" value="${member.member_tel}" style="margin-left:10%;">
              </div>
              
              <div class="form-label-group">
               <label for="inputMemberEmail">회원 이메일</label>
                <input type="text" name="member_email" value="${member.member_email}" style="margin-left:10%;">
              </div>
              <div class="form-label-group">
               <label for="inputMemberSignup">회원 가입일</label>
                <input type="text" name="signup_date" value="${fn:substring(member.signup_date,0,10)}" style="margin-left:10%;"> 
              </div>
              <div class="form-label-group">
               <label for="inputlastAccess">최종접속일</label>
                <input type="text" name="last_access_date" value="${member.last_access_date}" style="margin-left:10%;">
              </div>  
              
              <div class="col-md-12 form-group">
				<label for="gender">성별:</label>
					<input type="radio" id="male"name="gender" value="male">
					<label for="male">남</label>
					<input type="radio" id="female" name="gender" value="female">
					<label for="female">여</label><br>
              </div>
              <div class="form-label-group">
               <label for="inputTicketCode">보유이용권</label>
                <input type="text" name="ticket_code" value="${member.ticket_code}" style="margin-left:10%;">
              </div> 
            

              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" onclick="button_event()">회원 수정</button>
             
              <hr class="my-4">
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>