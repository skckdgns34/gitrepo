<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="662871869650-sr2u8avlse3e6qfa7qo94h9r8r1c18st.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>독서가 어려운 당신을 위한</h4>
							<p>듬 북 담 북</p>
							<a class="button button-account"
								href="<%=application.getContextPath()%>/member/memberJoin.jsp">계정
								만들기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Login</h3>
						<form class="row login_form"
							action="${pageContext.request.contextPath }/memberLogin.do"
							method="post" id="contactForm">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="member_id"
									name="member_id" placeholder="id"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'member_id'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="member_pw"
									name="member_pw" placeholder="Password"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">로그인 상태 유지하기</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit"
									class="button button-login w-100">Log In</button>
									<br>
									<br>
								<div class="g-signin2" data-onsuccess="onSignIn"
									data-theme="dark">dfd</div>
								<script>
									function onSignIn(googleUser) {
										// Useful data for your client-side scripts:
										var profile = googleUser
												.getBasicProfile();
										console.log("ID: " + profile.getId()); // Don't send this directly to your server!
										console.log('Full Name: '
												+ profile.getName());
										console.log('Given Name: '
												+ profile.getGivenName());
										console.log('Family Name: '
												+ profile.getFamilyName());
										console.log("Image URL: "
												+ profile.getImageUrl());
										console.log("Email: "
												+ profile.getEmail());

										// The ID token you need to pass to your backend:
										var id_token = googleUser
												.getAuthResponse().id_token;
										console.log("ID Token: " + id_token);
									};
								</script>
									<a href="${pageContext.request.contextPath }/memberFind.do">아이디/비밀번호 찾기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
</body>
</html>