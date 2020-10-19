<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">
body {
	text-align: center;
	}

	button {
 	background-color: #002347;
	color: white;
	border: 1px solid white;
	padding: 9px 20px;
  	font-size: 13px;
}
</style>
</head>
<body>
	<br>
	<h3>아이디/비밀번호 찾기</h3>
	<%=request.getAttribute("errormsg") %>
	<form method="post">
		<label>이메일 </label><input type="email" name="member_email" id="member_email" placeholder="이메일을 입력해주세요" required>
		<button type="submit">찾기</button>
	</form>
	<br>
</body>
</html>