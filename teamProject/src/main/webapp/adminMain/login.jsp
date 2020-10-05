<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


</head>
<body>

	<form class="form-horizontal col-md-8 well"
		action="${pageContext.request.contextPath}/login.ad" method="POST">
		<fieldset>
			<div id="legend">
				<legend class="">Login</legend>
			</div>
			<div class="control-group">
				<!-- Username -->
				<label class="control-label" for="username">아이디</label>
				<div class="controls">
					<input type="text" id="emp_id" name="emp_id" placeholder=""
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<!-- Password-->
				<label class="control-label" for="password">비밀번호</label>
				<div class="controls">
					<input type="password" id="emp_pw" name="emp_pw" placeholder=""
						class="input-xlarge">
				</div>
			</div>
			<div class="control-group">
				<!-- Button -->
				<div class="controls">
					<button class="btn-primary">로그인</button>
				</div>
			</div>
		</fieldset>
	</form>

</body>
</html>