<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<body>
<h3>로그인</h3>
${ errormsg}
	<form action="${pageContext.request.contextPath }/memberLogin.do" method="post">
		<div>
			<label for="member_id">ID:</label>
			<input type="text" id="member_id" name="member_id">
		</div>
		<div>
			<label for="member_pw">Password:</label>
			<input type="password"id="member_pw" name="member_pw">
		</div>
		<button>로그인</button>
		<input type="reset" value="초기화">
	</form>
	<br><hr><br>
	<a href="/app/memberFind.do">아이디/비밀번호찾기</a>
</body>
</html>