<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>e-book Register</title>

<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<!-- <script>
	tinymce.init({
		selector : 'textarea'
	});
</script> -->
</head>
<body>
	<div class="container col-xs-12">

		<hr>
		<div class="panel-title text-center">
			<h3>문의사항 등록</h3>
		</div>

		<div id="signupbox" style="margin-top: 30px">
			<div class="panel panel-default">

				<div class="panel-body">
					<form method="post" name="frm" id="frm"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/clientQuestionWtrite.do">

						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="question_title" class="control-label col-md-4  requiredField">제목<span
									class="asteriskField">*</span>
								</label>
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control"
										id="question_title" name="question_title"
										placeholder="제목을 입력 해 주세요." style="margin-bottom: 10px"
										type="text" />
								</div>
							</div>
							<hr>
							<div class="col-md-12" style="margin-bottom: 30px;">
								<div  class="form-group required">
									<label for="question_contents"
										class="control-label col-md-2  requiredField">내용<span
										class="asteriskField"></span>
									</label>
									<div class="controls col-md-10 " style = "height:300px">
										<textarea style="height: 300px; width: 100%;" id="question_contents" name="question_contents"></textarea>
									</div>
								</div>
							</div>
							<hr>
						</div>
						
						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="question_file"
									class="control-label col-md-4  requiredField">첨부파일<span
									class="asteriskField"></span>
								</label>
								<div class="controls col-md-8 " style="margin-bottom: 10px">

									<input class="input-md emailinput form-control" id="book_img"
										name="question_file" placeholder="Enter Project Id"
										style="margin-bottom: 10px" type="file" />
								</div>
							</div>
							</div>
						
						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="question_kind"
									class="control-label col-md-4  requiredField">문의사항 종류<span
									class="asteriskField">*</span>
								</label>
								<div class="controls col-md-8 ">
									<select name="question_kind" id="question_kind"
										style="margin-bottom: 10px" class="form-control">
										<option value="">선택</option>
										<option value=e1>회원정보문의</option>
										<option value=e2>결제/최소/환불문의</option>
										<option value=e3>구독/서비스이용문의</option>
										<option value=e4>기기관련 문의</option>
										<option value=e5>도서관련 문의</option>
										<option value=e6>기타/제휴 문의</option>

									</select>
								</div>
							</div>
							</div>

						<div class="row">
							<div class="col-md-10 text-center">
								<button type='submit'
									class="btn btn-outline btn-primary pull-left">등록</button>
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