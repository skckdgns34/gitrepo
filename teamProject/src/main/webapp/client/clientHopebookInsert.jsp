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
			<h3>희망도서 신청</h3>
		</div>

		<div id="signupbox" style="margin-top: 30px">
			<div class="panel panel-default">

				<div class="panel-body">
					<form method="post" name="frm" id="frm"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/clientHopeBookWrite.do">

						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="question_title" class="control-label col-md-4  requiredField">제목<span
									class="asteriskField">*</span>
								</label>
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control"
										id="title" name="title"
										placeholder="제목을 입력 해 주세요." style="margin-bottom: 10px"
										type="text" />
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="question_title" class="control-label col-md-4  requiredField">작가<span
									class="asteriskField">*</span>
								</label>
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control"
										id="writer" name="writer"
										placeholder="작가를 입력 해 주세요." style="margin-bottom: 10px"
										type="text" />
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="question_title" class="control-label col-md-4  requiredField">출판사<span
									class="asteriskField">*</span>
								</label>
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control"
										id="company" name="company"
										placeholder="출판사를 입력 해 주세요." style="margin-bottom: 10px"
										type="text" />
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