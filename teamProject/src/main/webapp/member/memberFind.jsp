<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
	<h3>아이디/비밀번호 찾기</h3>
	<form action="${pageContext.request.contextPath }/memberFind.do">
	<div class="row">
		<div class="col-md-10inputbb">
			<div class="form-group has-danger">
				<div class="input-gorup mb-2 mr-sm-2 mb-sm-0">
					<input type="email" name="email" class="form-control" id="email" placeholder="이메일을 입력해주세요" required>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10inputbb">
			<button class="btn btn-outline-secondary findbtn">찾기</button>
		</div>
	</div>
	</form>
</body>
</html>