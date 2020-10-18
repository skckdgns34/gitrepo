<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>


</head>
<body>
	<div class="container col-xs-12">

		<hr>
		<div class="panel-title text-center">
			<h3>공지사항 수정</h3>
		</div>

		<div id="signupbox" style="margin-top: 30px">
			<div class="panel panel-default">

				<div class="panel-body">
					<form method="post" name="frm" id="frm"
						enctype="multipart/form-data" action="memberManageNoticeModify.ad">

						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<div id="div_id_downloads" class="form-group required">
									<label for="notice_no"
										class="control-label col-md-4  requiredField">번호<span
										class="asteriskField"></span>
									</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control"
											id="notice_no" name="notice_no"
											value="${notice.notice_no}" type="text" />
									</div>
								</div>
							</div>

						</div>
						<hr>
						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<div id="div_id_downloads" class="form-group required">
									<label for="notice_title"
										class="control-label col-md-4  requiredField">제목<span
										class="asteriskField"></span>
									</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control"
											id="notice_title" name="notice_title"
											value="${notice.notice_title}" style="width: 1000px;"
											type="text" />
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-bottom: 30px;">
							<div id="div_description" class="form-group required">
								<label for="notice_content"
									class="control-label col-md-2  requiredField">내용<span
									class="asteriskField"></span>
								</label>
								<div class="controls col-md-10 ">
									<textarea style="height: 450px; width: 1000px;"
										id="notice_content" name="notice_content" >${notice.notice_content}</textarea>
								</div>
							</div>
						</div>

						<hr>


						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="notice_img"
									class="control-label col-md-4  requiredField">파일 첨부<span
									class="asteriskField"></span>
								</label>
								<div class="controls col-md-8 " style="margin-bottom: 10px">

									<input class="input-md emailinput form-control" id=notice_img
										name="notice_img1"
										style="margin-bottom: 10px; width: 600px" type="file" />
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control" id="emp_no"
										name="emp_no" style="margin-bottom: 10px" type="hidden"
										value="${login.emp_no}" />
								</div>
							</div>

							<div class="col-sm-6 col-md-6 col-xs-6">
								
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control" id="emp_name"
										name="emp_name" style="margin-bottom: 10px" type="hidden"
										value="${login.emp_name}" />
								</div>
							</div>
						</div>


						<hr />

						<div class="row">
							<div class="col-md-12 text-center">
								<button type='submit'
									class="btn btn-outline btn-primary pull-left" style="margin-right: 30px;" >등록</button>
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