<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 수정</title>
</head>
<body style="padding-top: 70px;">

  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">블랙리스트 관리</h5>
            <form class="form-signin" method="post" name="frm" id="frm"
			action="memberManageModify.ad" onsubmit="return inputCheck()">
			
                <div class="form-label-group">
               <label for="inputMemberNo">번호</label><br>
                <input type="text" name="member_no" value="${black.blacklist_no}" readonly="readonly">
              </div> 
              
              <div class="form-label-group">
               <label for="inputMemberId" >사유</label><br>
                <input type="text" name="member_id" value="${black.blacklist_reason}">
              </div>
              <div class="form-label-group">
               <label for="inputMemberPw">회원번호</label><br>
                <input type="text" name="member_pw" value="${black.member_no}">
              </div>
              <div class="form-label-group">
               <label for="inputMemberNicname">등록 일자</label><br>
                <input type="text" name="nickname" value="${black.limit_date}">
              </div>
  
              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"> 수정</button>
             
              <hr class="my-4">
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>