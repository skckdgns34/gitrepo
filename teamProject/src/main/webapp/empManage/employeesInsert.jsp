<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 추가</title>
</head>
<body style="padding-top: 70px;">

  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">직원 추가</h5>
            <form class="form-signin" method="post" name="frm" id="frm"
			action="employeesInsert.ad" onsubmit="return inputCheck()">
              <!--  <div class="form-label-group">
               <label for="inputEmpNo">사원번호</label><br>
                <input type="text" name="empno">
              </div> -->
              <div class="form-label-group">
               <label for="inputEmpId">사원아이디</label><br>
                <input type="text" name="emp_id">
              </div>
              <div class="form-label-group">
               <label for="inputEmpPw">비밀번호</label><br>
                <input type="text" name="emp_pw">
              </div>
              <div class="form-label-group">
               <label for="inputEmpName">이름</label><br>
                <input type="text" name="emp_name">
              </div>
              <div class="form-label-group">
               <label for="inputEmpbirth">생년월일</label><br>
                <input type="text" name="emp_birth">
              </div>
              <div class="form-label-group">
               <label for="inputEntereddate">입사일</label><br>
                <input type="text" name="entereddate">
              </div>
              
              <div class="form-label-group">
               <label for="inputDeptCode">부서코드</label><br>
                <input type="text" name="dept_code">
              </div>
              <div class="form-label-group">
               <label for="inputAdress">사원주소</label><br>
                <input type="text" name="emp_address">
              </div>
              <div class="form-label-group">
               <label for="inputRankCode">RANK_CODE</label><br>
                <input type="text" name="rank_code">
              </div>  

              <hr>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">사원 추가</button>
             
              <hr class="my-4">
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>