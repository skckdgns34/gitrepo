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
	${ errormsg}
	<form name="deleform"  method="post"
		onSubmit="retrun check(this)">
		<div class="col-sm-6 col-md-offset-3">
			<div class="form-group">
				<label for="id">아이디: ${member_id}</label>
			</div>
			<div>
				<label for="member_pw">Password:</label> <input type="password"
					class="pw" id="member_pw" name="member_pw">
				<button>확인</button>
			</div>
			<input type="button" value="닫기 " onclick="window.close();">
		</div>
	</form>
</body>
</html>