<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>아이디 찾기</h3>
	<form >
	<div class="row">
		<div class="col-md-10inputbb">
			<div class="form-group has-danger">
				<div class="input-gorup mb-2 mr-sm-2 mb-sm-0">
					<label for="id">아이디는 ${member_id } 입니다.</label>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10inputbb">
			<a href="/app/memberLogin.do">로그인하러가기</a>
			<a href="member/memberFindPassword.jsp">비밀번호 찾기</a>
		</div>
	</div>
	</form>
</body>
</html>