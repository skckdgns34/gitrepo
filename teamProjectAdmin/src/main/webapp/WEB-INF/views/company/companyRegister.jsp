<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!-- 로그인이 안 하면 접근을 못ㅎ하게 만들어 놓음! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyRegister</title>

<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>

</head>
<body>
	<div class="container col-xs-12">

		<hr>
		<div class="panel-title text-center">
			<h3>출판사 등록</h3>
		</div>
		
		<div id="signupbox" style="margin-top: 30px">
			<div class="panel panel-default">

				<div class="panel-body">
					<form method="post" name="frm" id="frm"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/companyRegister.ad">
						
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_name"
									class="control-label col-md-4  requiredField">출판사이름</label> 
									<div class="controls col-md-8 ">
									<input id="company_name" name="company_name" type="text" class="input-md emailinput form-control" >
							</div>
							</div>
							
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label  class="control-label col-md-4  requiredField"  for="company_addr">출판사주소</label> 
								<div class="controls col-md-8 ">
								<input id="company_addr" class="input-md emailinput form-control"
									name="company_addr" type="text">
									</div>
							</div>
							
								<div class="col-sm-6 col-md-6 col-xs-6">
								<label class="control-label col-md-4  requiredField" for="company_mgr">출판사담당자</label> 
								<div class="controls col-md-8 ">
								<input id="company_mgr" class="input-md emailinput form-control"
									name="company_mgr" type="text">
							</div>
							</div>
							
							
								<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_tel" class="control-label col-md-4  requiredField">출판사전화번호</label> 
																<div class="controls col-md-8 ">
								
								<input id="company_tel" class="input-md emailinput form-control"
									name="company_tel" type="text">
									</div>
							</div>
							
								<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_mgr_tel" class="control-label col-md-4  requiredField">담당자전화번호</label> 
																								<div class="controls col-md-8 ">
								
								<input id="company_mgr_tel" class="input-md emailinput form-control" name="company_mgr_tel" type="text">
							</div>
							</div>
							
							
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_bank" class="control-label col-md-4  requiredField">출판사은행정보</label> 
								<div class="col-sm-6 col-md-6 col-xs-6">
								<input
									id="company_bank"  class="input-md emailinput form-control" name="company_bank" type="text">
							</div>
							</div>
							
							<div class="col-sm-6 col-md-6 col-xs-6" style="margin-bottom: 70px">
								<label for="company_account" class="control-label col-md-4  requiredField">출판사계좌정보</label> 
								<div class="col-sm-6 col-md-6 col-xs-6">
								<input
									id="company_account"  class="input-md emailinput form-control" name="company_account" type="text">
							</div>
							</div>
							
							<div class="row">
							<div class="col-md-10 text-center">
								<button type='submit' class="btn btn-outline btn-primary pull-left" >등록</button>
								<button class="btn btn-danger btn-md" type="reset">초기화</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>