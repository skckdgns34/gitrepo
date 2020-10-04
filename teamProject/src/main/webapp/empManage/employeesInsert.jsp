<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<%@include file="/decorator/moveLoginForm.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 추가</title>

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>


</head>
<body style="padding-top: 70px;">

	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex"></div>
					<div class="card-body">
						<h5 class="card-title text-center">직원 추가</h5>
						<form class="form-signin" method="post" name="frm" id="frm"
							action="employeesInsert.ad" onsubmit="return inputCheck()">
							<!--  <div class="form-label-group">
               <label for="inputEmpNo">사원번호</label><br>
                <input type="text" name="empno">
              </div> -->
							<div class="form-label-group">
								<label for="inputEmpId">사원아이디</label><br> <input
									type="text" name="emp_id">
							</div>
							<div class="form-label-group">
								<label for="inputEmpPw">비밀번호</label><br> <input type="text"
									name="emp_pw">
							</div>
							<div class="form-label-group">
								<label for="inputEmpName">이름</label><br> <input type="text"
									name="emp_name">
							</div>
							<div class="form-label-group">
								<label for="inputEmpbirth">생년월일</label><br> <input
									name="emp_birth" type="date">
							</div>
							<div class="form-label-group">
								<label for="inputEntereddate">입사일</label><br> <input
									name="entereddate" type="date">
							</div>

							<div class="form-label-group">
								<label for="inputDeptCode">부서코드</label><br> <input
									type="text" name="dept_code">
							</div>
							<div class="form-label-group">
								<label for="inputEmpAddr">사원 주소</label><br> <input
									type="text" id="sample4_postcode" placeholder="우편번호" name="address1"> <input
									type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기"><br> <input type="text"
									id="sample4_roadAddress" placeholder="도로명주소" name="address2"> <input
									type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3">
								<span id="guide" style="color: #999; display: none"></span> <input
									type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="address5">
							</div>
							<div class="form-label-group">
								<label for="inputRankCode">RANK_CODE</label><br> <input
									type="text" name="rank_code">
							</div>

							<hr>

							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">사원 추가</button>

							<hr class="my-4">

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>