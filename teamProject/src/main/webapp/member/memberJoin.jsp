<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  
<!DOCTYPE html>
<html>
<head>
	<script
		src="<%=request.getContextPath()%>/mainresource/vendors/jquery/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
<script>

	
	function IdChk(){
		var member_id = $("#member_id").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/Ajax/memberIdCheck.do",
			type: "POST",
			data : {
				member_id : member_id
			},
			success: function(result){
				if(result == 1){
					alert("이미 존재하는 ID 입니다.");
				}else{
					alert("사용 가능한 ID 입니다.");
				}
			}
		})
	}
	
	function NiChk(){
		var nickname = $("#nickname").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/Ajax/memberIdCheck.do",
			type: "POST",
			data : {
				nickname : nickname
			},
			success: function(result){
				if(result == 1){
					alert("이미 존재하는 닉네임 입니다.");
				}else{
					alert("사용 가능한 닉네임 입니다.");
				}
			}
		})
	}
	
	function EmChk(){
		var member_eamil = $("#member_eamil").val();
		$.ajax({
			url: "${pageContext.request.contextPath}/Ajax/memberIdCheck.do",
			type: "POST",
			data : {
				member_eamil : member_eamil
			},
			success: function(result){
				if(result == 1){
					alert("이미 존재하는 e-mail 입니다.");
				}else{
					alert("사용 가능한 e-mail 입니다.");
				}
			}
		})
	}
	
</script>
</head>
<body>

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>이미 듬북담북 회원이라면?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="<%=application.getContextPath()%>/memberLogin.do">로그인 하러가기!</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>회원가입</h3>
						<form class="row login_form" action="/app/memberJoin.do"" id="frm" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="member_id" name="member_id" placeholder="id"
								required onfocus="this.placeholder = ''" onblur="this.placeholder = 'id'">
								<div class="eheck_font" id="id_check"></div>
							</div>
							<input type="hidden" name="idCheckh" value="idUnCheck"> 
							<button type="button" onclick="IdChk()" >체크</button>
              <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
              					<div class="eheck_font" id="pw_check"></div>
 				
              </div>
              <div class="col-md-12 form-group">
								<input type="password" class="form-control" id="member_pw2" name="member_pw2" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = 'PasswordCk'">
              					<div class="eheck_font" id="pw2_check"></div>
              </div>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="member_tel" name="member_tel" placeholder="전화번호 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = 'member_tel'">
              					<div class="eheck_font" id="member_tel_check"></div>
              </div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = 'nickname'">
              					<div class="eheck_font" id="nickname_check"></div>
              </div>
              <button type="button" onclick="NiChk()" >체크</button>
              <div class="col-md-12 form-group">
								<input type="text" class="form-control" id="member_email" name="member_email" placeholder="Email 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = 'member_email'">
              <div class="eheck_font" id="nickname_check"></div>
              </div>
              <button type="button" onclick="EmChk()" >체크</button>
               <div class="col-md-12 form-group">
				<label for="gender">성별:</label>
					<input type="radio" id="male"name="gender" value="male">
					<label for="male">남</label>
					<input type="radio" id="female" name="gender" value="female">
					<label for="female">여</label><br>
              </div>
							
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
		<script src="${pageContext.request.contextPath }/mainresource/js/login.js"></script>
	
</body>
</html>