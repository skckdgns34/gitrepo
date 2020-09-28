<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정-탈퇴</title>

<script type="text/javascript">
	function CheckForm(Join) {
		var chk1 = document.Join.member_pw.checked;
		if (chk1 == "") {
			alert('동의 후 다음단계로 진행합니다.');
			return false;
		} else {
			return true;
		}
	}

</script>
</head>
<body>

	<h4>===내용내용===</h4>

	<form name=Join action="${pageContext.request.contextPath }/MemberDeleteServ.do"
		onSubmit="return CheckForm(this)">
		<div>
			<label for="member_id" id="member_id" name="member_id"></label>
		</div>
		<input name="member_pw" type="checkbox" id="member_pw"
			class="inputCheck" onclick="window.open('/app/member/memberDeletePassword.jsp', '비밀번호 확인', 'width=#, height=#')" /> 위 내용을 확인하였으며, 탈퇴를 진행합니다. <br>
		<button >탈퇴</button>

	</form>
	<div>
		<button onclick="location='memberModify.jsp'">취소</button>
	</div>


</body>
</html>