<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 추가</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</head>
<body style="padding-top: 70px;">

  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
             
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">직원 추가</h5>
            <form class="form-signin" method="post" name="frm" id="frm"
			action="/employeesInsertForm.ad"
			onsubmit="return inputCheck()">
              <div class="form-label-group">
               <label for="inputEmpId">사원번호</label><br>
                <input type="text" name="empid">
              </div>
              <div class="form-label-group">
               <label for="inputEmpFirstName">성</label><br>
                <input type="text" name="empFirst">
              </div>
              <div class="form-label-group">
               <label for="inputEmpLastName">이름</label><br>
                <input type="text" name="empLast">
              </div>
              <div class="form-label-group">
               <label for="inputEmpEmail">이메일</label><br>
                <input type="text" name="empemail">
              </div>
              <div class="form-label-group">
               <label for="inputEmpPhone">핸드폰번호</label><br>
                <input type="text" name="empPhone">
              </div>
              <div class="form-label-group">
               <label for="inputHiredate">입사일</label><br>
                <input type="text" name="empHiredate">
              </div>
              <div class="form-label-group">
               <label for="inputJobId">job_id</label><br>
                <input type="text" name="empJoid">
              </div>
              <div class="form-label-group">
               <label for="inputComm">Commission_pct</label><br>
                <input type="text" name="empComm">
              </div>
              <div class="form-label-group">
               <label for="inputManager">Manager_id</label><br>
                <input type="text" name="empManager">
              </div>
              <div class="form-label-group">
               <label for="inputId">아이디</label><br>
                <input type="text" name="id">
              </div>
              
              
              <div class="form-label-group">
               <label for="inputPassword">패스워드</label><br>
               <input type="password" id="password" class="form-control" name="password" placeholder="Password" required>
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