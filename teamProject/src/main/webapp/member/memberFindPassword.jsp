<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$("#btnsend").on("click", function(){
			location.href = "${pageContext.request.contextPath }/memberFindemail.do?member_email=" + $("#email").val()
		})
	})
</script>
</head>
<body>
<h3>비밀번호 변경</h3>
${ errormsg}
<form action="${pageContext.request.contextPath }/memberFindEmailServ.do">
<input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" required>
<button type="button" id="btnsend">인증번호 보내기</button><br>
<input type="text" placeholder="인증번호 입력">
<button >인증번호 확인</button><br>
${ msg}
<input type="password" placeholder="새 비밀번호"><br>
<input type="password" placeholder="새 비밀번호 확인"><br>
<button>변경</button>
</form>
</body>
</html>