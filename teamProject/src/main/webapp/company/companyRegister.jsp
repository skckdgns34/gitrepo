<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="page_title">출판사 등록</h1>
		<div class="regist">
			<form method="post" name="frm" id="frm" 
				  enctype="multipart/form-data"
				  action="${pageContext.request.contextPath }/companyRegister.ad"
				  >
				<div>
					<label for="company_name">출판사이름</label> <input id="company_name" name="company_name" type="text">
				</div>
				<div>
					<label for="company_addr">출판사주소</label> <input id="company_addr" name="company_addr" type="text">
				</div>
				<div>
					<label for="company_mgr">출판사담당자</label> <input id="company_mgr" name="company_mgr" type="text">
				</div>
				<div>
					<label for="company_tel">출판사전화번호</label> <input id="company_tel" name="company_tel" type="text">
				</div>
				<div>
					<label for="company_mgr_tel">담당자전화번호</label> <input id="company_mgr_tel" name="company_mgr_tel" type="text">
				</div>
				<div>
					<label for="company_account">출판사계좌정보</label> <input id="company_account" name="company_account" type="text">
				</div>
				<div>
					<button type="reset">초기화</button>
					<button>등록</button>
				</div>
			</form>
		</div>
</body>
</html>