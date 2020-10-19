<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
</head>
<body>
	<div class="container col-xs-12">
		<hr>
		<h3 class="page_title">출판사 정보 수정</h3>
		<div id="signupbox" style="margin-top: 30px">
			<div class="panel panel-default">

				<div class="panel-body">
					<form method="post" name="frm" id="frm"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath }/companyPop.ad">
						<div>
							<label for="company_code">출판사코드</label> <input id="company_code"
								name="company_code" type="hidden"
								value="${result.company_code }">
						</div>


						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<div>
									<label for="company_name"
										class="control-label col-md-4  requiredField">출판사이름</label>
									<div class="controls col-md-8 ">
										<input class="input-md emailinput form-control"
											style="margin-bottom: 10px" id="company_name"
											name="company_name" type="text"
											value="${result.company_name }">
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_addr"
									class="control-label col-md-4  requiredField">출판사주소</label>
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control"
										id="company_addr" name="company_addr"
										style="margin-bottom: 10px" type="text"
										value="${result.company_addr }">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_mgr"
									class="control-label col-md-4  requiredField">출판사담당자</label>
								<div class="controls col-md-8 ">
									<input class="input-md emailinput form-control"
										id="company_mgr" style="margin-bottom: 10px"
										name="company_mgr" type="text" value="${result.company_mgr }">
								</div>
							</div>
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_tel" class="control-label col-md-4  requiredField">출판사전화번호</label> 
								<div class="controls col-md-8 ">
								<input class="input-md emailinput form-control" id="company_tel"
									style="margin-bottom: 10px" name="company_tel" type="text" value="${result.company_tel }">
							</div>
							</div>
							</div>
							
							
							<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label class="control-label col-md-4  requiredField" for="company_bank">출판사은행정보</label> 
								<div class="controls col-md-8 ">
								<input class="input-md emailinput form-control" style="margin-bottom: 10px"
									id="company_bank" name="company_bank" type="text"
									value="${result.company_bank }">
							</div>
							</div>
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label class="control-label col-md-4  requiredField" for="company_mgr_tel">담당자전화번호</label> 
								<div class="controls col-md-8 ">
								<input class="input-md emailinput form-control" style="margin-bottom: 10px"
									id="company_mgr_tel" name="company_mgr_tel" type="text"
									value="${result.company_mgr_tel }">
							</div>
							</div>
							</div>
							
							<div class="row">
							<div class="col-sm-6 col-md-6 col-xs-6">
								<label for="company_account" class="control-label col-md-4  requiredField">출판사계좌정보</label> 
								<div class="controls col-md-8 ">
								<input  class="input-md emailinput form-control" style="margin-bottom: 10px"
									id="company_account" name="company_account" type="text"
									value="${result.company_account }">
							</div>
							</div>
							</div>
							<div class="row" style="margin-bottom: 10px">
							<div class="col-md-10 text-center">
								<button type='submit'
									class="btn btn-outline btn-primary pull-left">수정하기</button>
								<button class="btn btn-danger btn-md" type="reset">초기화</button>
							</div>
						</div>
					</form>
					<div class="row">
					<div class="col-md-10 text-center">
					<c:if test="${not empty result}">
						<form action="${pageContext.request.contextPath}/companyDelete.ad">
							<input type="hidden" name="company_code"
								value="${result.company_code}">
							<button class="btn btn-danger btn-md">삭제</button>
						</form>
					</c:if>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>