<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String member_id = request.getParameter("member_id");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<script type="text/javascript">
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	var birthJ = false;
	var address = $('#mem_detailaddress');

	$(document).ready(
			function() {
				var address = $('#mem_detailaddress');

				$('form').on(
						'submit',
						function() {
							var inval_Arr = new Array(8).fill(false);
							if (idJ.test($('#member_id').val())) {
								inval_Arr[0] = true;
							} else {
								inval_Arr[0] = false;
								alert('아이디를 확인하세요.');
								return false;
							}
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
							// 이름 정규식
							if (nameJ.test($('#nickname').val())) {
								inval_Arr[2] = true;
							} else {
								inval_Arr[2] = false;
								alert('이름을 확인하세요.');
								return false;
							}

							// 이메일 정규식
							if (mailJ.test($('#member_email').val())) {
								console.log(phoneJ.test($('#member_email')
										.val()));
								inval_Arr[4] = true;
							} else {
								inval_Arr[4] = false;
								alert('이메일을 확인하세요.');
								return false;
							}
							// 휴대폰번호 정규식
							if (phoneJ.test($('#member_tel').val())) {
								console
										.log(phoneJ
												.test($('#member_tel').val()));
								inval_Arr[5] = true;
							} else {
								inval_Arr[5] = false;
								alert('휴대폰 번호를 확인하세요.');
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
				//이름에 특수문자 들어가지 않도록 설정
				$("#nickname").blur(
						function() {
							if (nameJ.test($(this).val())) {
								console.log(nameJ.test($(this).val()));
								$("#nickname_check").text('');
							} else {
								$('#nickname_check').text(
										'한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
								$('#nickname_check').css('color', 'red');
							}
						});

				$("#member_email").blur(function() {
					if (mailJ.test($(this).val())) {
						$("#email_check").text('');
					} else {
						$('#email_check').text('이메일 양식을 확인해주세요.');
						$('#email_check').css('color', 'red');
					}
				});

				// 휴대전화 
				$('#member_tel').blur(function() {
					if (phoneJ.test($(this).val())) {
						console.log(nameJ.test($(this).val()));
						$("#pnum_check").text('');
					} else {
						$('#pnum_check').text('휴대폰번호를 확인해주세요 ');
						$('#pnum_check').css('color', 'red');
					}
				});
			});
</script>

<style>
li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>

</head>
<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Menu</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">내 정보</a> <span>수정</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberModify.do">내정보
				수정</a>
		<li><a href="<%=application.getContextPath()%>/memberBookMark.do">내
				서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의
				도서 확인</a>
		<li><a href="<%=application.getContextPath()%>/memberLicense.do">이용권
				내용</a>
	</ul>

	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<form method="post" name="frm" id="frm"
							action="${pageContext.request.contextPath }/memberModify.do">

									<div class="form-group">
										<label for="id">아이디 ${member_id }</label> <input type="hidden"
											name="member_id" id="member_id" value="${member_id }">
									</div>
									<div class="form-group">
										<label for="pw">비밀번호</label> <input type="password"
											class="form-control" id="member_pw" name="member_pw">
										<div class="eheck_font" id="pw_check"></div>
									</div>
									<div class="form-group">
										<label for="pw2">비밀번호 확인</label> <input type="password"
											class="form-control" id="member_pw2" name="member_pw2"
											placeholder="비밀번호 확인">
										<div class="eheck_font" id="pw2_check"></div>
									</div>
									<div class="form-group">
										<label for="nickname">닉네임</label> <input type="text"
											class="form-control" id="nickname" name="nickname"">
										<div class="eheck_font" id="nickname_check"></div>
									</div>
									<div class="form-group">
										<label for="member_email">이메일</label> <input type="text"
											class="form-control" id="member_email" name="member_email">
										<div class="eheck_font" id="nickname_check"></div>
									</div>
									<div class="form-group">
										<label for="member_tel">휴대폰 번호</label> <input type="tel"
											class="form-control" id="member_tel" name="member_tel"
											placeholder="('-'없이 번호만 입력해주세요)">
										<div class="eheck_font" id="pnum_check"></div>
									</div>
									<div class="form-group text-center">
										<button type="submit" class="btn btn-primary">수정</button>
										<input type="reset" value="초기화">
									</div>
						</form>
						</div>
						<hr>
						<a href="/app/member/memberDelete.jsp">탈퇴하기</a>
					</div>
				</div>
			</div>
	</section>
</body>
</html>