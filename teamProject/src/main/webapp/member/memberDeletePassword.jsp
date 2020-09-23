<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	/* function check() {
		if (!document.deleform.member_pw.value) {
			alert("비밀번호를 제대로 입력해주세요.");
			return true;
		}
	} */
	
</script>

<c:if test="${msg == '비밀번호를 제대로 입력해주세요' }">
	<script>
		alert("비밀번호를 제대로 입력해주세요.")
	</script>
</c:if>

<script>
function closeMe() {
    var win=window.open("","_self");
    win.close();
}
</script>

</head>
<body>
	<h3>비밀번호 확인</h3>
	<form name="deleform" action="${pageContext.request.contextPath }/MemberDeletePassword.do" method="post"
		onSubmit="retrun check(this)">
		<div class="col-sm-6 col-md-offset-3">
			<div class="form-group">
				<label for="id">아이디: ${member_id} <input type="hidden"
					name="member_id" value="${member_id}" />
				</label>
			</div>
			<div>
				<label for="member_pw">Password:</label> <input type="password"
					class="pw" id="member_pw" name="member_pw">
			</div>
			<input type="submit" onclick="location.href='session'" value="확인">
			<input type="button" value="취소 " onclick="window.close();">
		</div>
	</form>
</body>
</html>