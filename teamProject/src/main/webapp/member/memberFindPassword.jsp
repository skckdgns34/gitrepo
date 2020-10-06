<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	
	$(document).ready(
			function() {

				$('form').on(
						'submit',
						function() {
							var inval_Arr = new Array(8).fill(false);
							
							// 비밀번호가 같은 경우 && 비밀번호 정규식
							if (($('#member_pw').val() == ($('#member_pw2')
									.val()))
									&& pwJ.test($('#member_pw').val())) {
								inval_Arr[1] = true;
							} else {
								inval_Arr[1] = false;
								alert('비밀번호를 확인하세요.');
								return false;
							}
						});
	
			$('#member_pw').blur(function() {
				if (pwJ.test($('#member_pw').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
					$('#pw_check').css('color', 'red');
				}
			});

			//1~2 패스워드 일치 확인
			$('#member_pw2').blur(function() {
				if ($('#member_pw').val() != $(this).val()) {
					$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
					$('#pw2_check').css('color', 'red');
				} else {
					$('#pw2_check').text('');
				}
			});
		});
</script>
<script>
$(function(){

	$("#btnsend").on("click", function(){
		location.href = "${pageContext.request.contextPath }/memberFindemail.do?member_email=" + $("#member_email").val()
	});
	
	
	$("#btncheck").on("click", function(){
	var check = $("#check").val();
	var url = "${pageContext.request.contextPath }/memberFindCheck.do?AuthenticationUser=" +check;
	$.ajax(
		url,{
		
		success: function(result){
			console.log(result)
			if(result == "true"){
				alert("인증번호 확인완료.");
			} else {
				alert("인증번호가 틀렸습니다.");
			}
		}
	})
	});
	
	$("#btnupdate").on("click", function(){
		location.href = "${pageContext.request.contextPath }/memberFindPassword.do?member_pw=" + $("#member_pw").val()
	});
	
	
	$(document).ready(function(){
		$("#btnupdate").prop("disabled", true);
		
		$("#member_pw").keyup(function(){
			ToggleButton();
		})
		$("#member_pw2").keyup(function(){
			ToggleButton();
		});
	});
	
	function ToggleButton(){
		if(($("#member_pw").val() != "") && ($("#member_pw2").val() != "")){
			$("#btnupdate").prop("disabled", false);
			return true;
		} else {
			$("#btnupdate").prop("disabled", true);
			return false;
		}
	}
	
	/* 
	$(document).ready(function(){
		
		$("#btnupdate").prop('disabled', true);

		$("#member_pw, member_pw2").keyup(function(){
			if ($("#member_pw2").val() != "" && $("#member_pw").val() != ""){
				$("#btnupdate").prop("disabled", false);
			} else {
				$("#btnupdate").prop("disabled", true);
			}
		});
	}); */
	
});
</script>
</head>
<body>
<h3>비밀번호 변경</h3>
<form name="frm" id="frm">
<input type="email" name="member_email" id="member_email" placeholder="이메일을 입력해주세요" value="${param.member_email }" required>
<button type="button" id="btnsend">인증번호 보내기</button>
${ errormsg}
<br>
<input type="text" placeholder="인증번호 입력" id="check">
<button type="button" id="btncheck">인증번호 확인</button>
${ msg}
<br>
		<label for="pw">비밀번호</label> <input type="password"
			 id="member_pw" name="member_pw">
		<div class="eheck_font" id="pw_check"></div>
	<div class="form-group">
		<label for="pw2">비밀번호 확인</label> <input type="password"
			 id="member_pw2" name="member_pw2"
			placeholder="비밀번호 확인">
	</div>
		<div class="eheck_font" id="pw2_check"></div>
<button id="btnupdate">변경</button>
</form>
</body>
</html>