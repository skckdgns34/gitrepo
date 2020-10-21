<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정-탈퇴</title>
<style type="text/css">
body {
	text-align: center;
	}
	
	#btns {
	 background-color: white; 
  color: black; 
  border: 2px solid 002347;
  padding: 7px 15px;
  font-size: 12px;

	}
	
	#btndel {
	border: 1px solid white;
	padding: 9px 20px;
  	font-size: 12px;
}
	</style>
<script type="text/javascript">
$(function(){
		
	
	 function CheckForm(Join) {
		var chk1 = document.Join.member_pw.checked;
		if (chk1 == "") {
			alert('동의 후 다음단계로 진행합니다.');
			return false;
		} else {
			return true;
		}
	} 
	

	 $(document).ready(function(){
		$("#btndel").prop("disabled", true);
		
		$("#pwcheck").change(function(){
			ToggleButton();
		});
	});
	
});

	
	 function ToggleButton(){
		if($("#pwcheck").val() != "") {
			$("#btndel").prop("disabled", false);
			return true;
		} else {
			$("#btndel").prop("disabled", true);
			return false;
		} 
	}
	 
	 function Se() 
		{
			window.document.location.href = "${pageContext.request.contextPath}/memberDelete.do"
			alert("회원탈퇴가 완료되었습니다. ")
			return;
		}
</script>
</head>
<body>

<br>
<h2>회원탈퇴 유의사항</h2><br>
<h5>회원탈퇴 시 개인정보 및 DumBook&DamBook에서 만들어진 모든 데이터는 삭제됩니다.</h5><br>
	<textarea readonly
	style="width: 50%; border: 1; overflow: visible; text-overflow: ellipsis; resize: none;"
	rows=10 id="notice_content" name="notice_date" >
-탈퇴시 보유하고 계신 이용권은 즉시 소멸되며, 소멸이후에는 복구가 불가능합니다.
	
-이용권의 기간이 남아있더라도 탈퇴시 모두 소멸되며, 환불이 불가능합니다.
	
-탈퇴 후 이용 기록은 모두 삭제됩니다.
	
-탈퇴 후 재가입하셔도 아래 내용을 포함한 모든 데이터는 복구해드리지 않습니다.
(나만의 도서, 리뷰, 문의, 신고, 모든 이용권, 책갈피, 이용권 내역, 희망도서 신청 내역, 찜목록, 읽던책 등)
	</textarea><br><br>
<h6>탈퇴 후에는 해당 아이디로 다시 가입할 수 없으며, 아이디와 데이터는 복구할 수 없습니다.</h6>

	<form name=Join action="${pageContext.request.contextPath}/memberDelete.do" onSubmit="return CheckForm(this)">
		<div>
			<label for="member_id" id="member_id" name="member_id"></label>
		</div>
		<input name="member_pw" type="checkbox" id="member_pw"
			class="inputCheck" onclick="window.open('${pageContext.request.contextPath}/memberDeletePassword.do', '비밀번호 확인', 'width=300, height=200')" /> 위 내용을 확인하였으며, 탈퇴를 진행합니다. <br>
		
		<input type="hidden" name="pwcheck" id="pwcheck">
		<input type="hidden" name="member_id" id="member_id" value="${member_id }">
		
		<button id="btndel" onclick="Se()">탈퇴</button>

	</form>
		<button id="btns" onclick="location='memberModify.jsp'">취소</button>

</body>
</html>