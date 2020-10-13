<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script>
/* 	function pValue(){
		document.getElementById("userId"),value = opener.document.userInfo.id.value;
	}
	
	function idCheck(){
		var id = document.getElementById("userId").value;
		if(!id){
			text("아이디를 입력해 주세요.");
			return false;
		} else {
			var param="id="+id
			httpRequset = getXMLHttpRequest();
			httpRe
		}
	} */
</script>
</head>
<body>
	<h4>아이디 중복 체크</h4>
	<br>
	<hr>
	<br>
	<div>
		<form id="checkform">
			<input type="text" name="iddinput" id="userId">
			<input type="button" value="중복확인" oncheck="idCheck()">
		</form>
		<div id="msg"></div>
		<br>
		<input id="cancelBtn" type="button"value="취소" onclick="window.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
	</div>
</body>
</html>