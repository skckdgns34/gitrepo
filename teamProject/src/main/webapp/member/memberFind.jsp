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
	<%=request.getAttribute("errormsg") %>
	<form action="/app/memberFind.do">
		<label>이메일 </label><input type="email" name="member_email" id="member_email" placeholder="이메일을 입력해주세요" required>
		<button >찾기</button>
	</form>
</body>
</html>