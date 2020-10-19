<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script>
	function closeMe() {
		var win = window.open("", "_self");
		win.close();
	}
	
</script>
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
							<a href="${pageContext.request.contextPath}/main.do">문의사항</a> <span>확인</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row"> 
				<div class="col-lg-12">
					<input type="hidden" id="pop" value="${notice}">
					<label for="title">제목 ${notice.notice_title }</label> <label for="date">
						| 등록일 ${notice.notice_date }</label> <br> <br>
					<textarea readonly
						style="width: 50%; border: 1; overflow: visible; text-overflow: ellipsis; resize: none;"
						rows=30 id="notice_content" name="notice_date"> ${notice.notice_content }</textarea>
					<br> <input type="button" value="닫기 "
						onclick="window.close();">
				</div>
			</div>
		</div>
	</section>
</body>
</html>