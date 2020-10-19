<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style type="text/css">
	body {
	text-align: center;
	}
	
	#div1{
	background-color: #002347;
	}

	#h3{
	color: White;
	}
	
	#title{
	background-color: #002347;
	}
	
 	#titleL{
 	color: White;
 	}
 	
  input {
  background-color: white; 
  color: black; 
  border: 2px solid 002347;
  padding: 7px 15px;
  font-size: 12px;
}
</style>
<script>
	function closeMe() {
		var win = window.open("", "_self");
		win.close();
	}
	
</script>
</head>
<body>
	<!-- Breadcrumb Section End -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row"> 
				<div class="col-lg-12">
				<div id="div1"><h3 id="h3">공지사항</h3>
					<input type="hidden" id="pop" value="${notice}">
					<label for="title" id="titleL">제목: ${notice.notice_title }</label><br>
					<label for="date" id="titleL">등록일: ${notice.notice_date }</label> <br> <br> 
					<textarea readonly
						style="width: 50%; border: 1; overflow: visible; text-overflow: ellipsis; resize: none;"
						rows=30 id="notice_content" name="notice_date"> ${notice.notice_content }</textarea>
					<br> <br><input type="button" value="닫기 "
						onclick="window.close();"><br><br>
						</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>