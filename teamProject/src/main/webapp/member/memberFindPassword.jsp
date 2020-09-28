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
		location.href = "${pageContext.request.contextPath }/memberFindemail.do?member_email=" + $("#email").val()
	})
});
$(function(){
	$("#btnOk").on("click", function(){
	
	})
});
</script>
</head>
<body>
<h3>비밀번호 변경</h3>
<form name="frm" id="frm" action="${pageContext.request.contextPath }/memberFindEmailServ.do">
<input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" required>
<button type="button" id="btnsend">인증번호 보내기</button>
${ errormsg}
<br>
<input type="text" placeholder="인증번호 입력" name="OK" id="OK">
<button>인증번호 확인</button>
${ msg}
<br>
<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						 id="member_pw" name="member_pw">
					<div class="eheck_font" id="pw_check"></div>
				</div>
				<div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						 id="member_pw2" name="member_pw2"
						placeholder="비밀번호 확인">
					<div class="eheck_font" id="pw2_check"></div>
				</div>
<button>변경</button>
</form>
</body>
</html>