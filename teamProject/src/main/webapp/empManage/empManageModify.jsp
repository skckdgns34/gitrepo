<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 수정</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->

					</div>
					<div class="card-body">
						<h5 class="card-title text-center">사원 정보 수정</h5>
						<form class="form-signin" method="post" name="frm" id="frm"
							action="${pageContext.request.contextPath}/empManageModify.ad"
							onsubmit="return inputCheck()">
							<div class="form-label-group">
								<label for="inputUserame">사원 번호</label><br> <input
									type="text" name="emp_no" value="${emp_no}" readonly="readonly">
							</div>
							<div class="form-label-group">
								<label for="inputUserame">사원 아이디</label><br> <input
									type="text" name="emp_id" value="${emp_id}">
							</div>

							<div class="form-label-group">
								<label for="inputPassword">사원 비밀번호</label><br> <input
									type="password" id="password" class="form-control"
									name="pw" value="${emp_pw}" placeholder="Password" required>
							</div>

							<div class="form-label-group">
								<label for="inputPhone_number">사원 이름</label><br> <input type="text"
									id="emp_name" name="emp_name" value="${emp_name}">
								</div>
								
								<div class="form-label-group">
								<label for="inputPhone_number">사원 생년월일</label><br> <input type="text"
									id="emp_birth" name="emp_birth" value="${emp_birth}">
								</div>
								
								<div class="form-label-group">
									<label for="inputAge">입사일</label><br> <input type="text"
										id="entereddate" name="entereddate" value="${entereddate}">
								</div>
								<div class="form-label-group">
									<label for="inputAge">부서 코드</label><br> <input type="text"
										id="dept_code" name="dept_code" value="${dept_code}">
								</div>
								<div class="form-label-group">
									<label for="inputAge">사원 주소</label><br> <input type="text"
										id="emp_address" name="emp_address" value="${emp_address}">
								</div>
								
								<div class="form-label-group">
									<label for="inputAge">rank_code</label><br> <input type="text"
										id="rank_code" name="rank_code" value="${rank_code}">
								</div>
								

								<hr>
								<div><a type="button" href="${pageContext.request.contextPath}/empManageList.ad" onclick="return alert()">되돌아가기</a></div>
								<button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">수정</button>
								<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>